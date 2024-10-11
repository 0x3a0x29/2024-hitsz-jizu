`timescale 1ns / 1ps

module rv_cpu_core(
    input  wire         cpu_rst,
    input  wire         cpu_clk,

    // Instruction Fetch Interface
    output wire         if_rreq,
    output wire [31:0]  if_addr,
    input  wire         if_valid,
    input  wire [31:0]  if_inst,
    
    // Data Access Interface
    output wire [ 3:0]  da_ren,
    output wire [31:0]  da_addr,
    input  wire         da_valid,
    input  wire [31:0]  da_rdata,
    output wire [ 3:0]  da_wen,
    output wire [31:0]  da_wdata,
    input  wire         da_wresp
);

    // PC and NPC
    wire [31:0] pc;
    wire [31:0] npc;
    wire [31:0] pc4;
    wire        inst_vld;
    wire [31:0] inst_r;

    // Register File
    reg  [31:0] rf_wd;
    wire [31:0] rf_rd1;
    wire [31:0] rf_rd2;

    // Signed Extension
    wire [31:0] ext;

    // ALU
    reg  [31:0] alu_a;
    reg  [31:0] alu_b;
    wire [31:0] alu_c;
    reg  [31:0] alu_c_r;
    wire        lt_0;       // Less than zero
    wire        eq_0;       // Equal to zero
    wire        mul_div_busy;
    
    // Controller
    wire        npc_op;
    wire        rf_we;
    wire [ 1:0] wd_sel;
    wire [ 2:0] sext_op;
    wire [ 3:0] alu_op;
    wire        alua_sel;
    wire        alub_sel;
    wire [ 2:0] branch;
    wire        ram_we;
    wire        Branch;
    wire        mul_div;
    reg         mul_div_r;

    reg         load_flag;      // A flag indicating Load inst.
    reg  [ 4:0] rf_wR_r;
    wire        rf_we1;
    reg         inst_finished;  // A flag indicating if an inst. is finished or not



    PC U_PC (
        .clk_i      (cpu_clk),
        .rst_i      (cpu_rst),
        .npc_i      (npc),
        .ivalid     (inst_vld),
        .fetch      (inst_finished),
        .pc_o       (pc)
    );
    
    // assign inst_addr = pc[15:2];

    if_wrap U_ifwrap (
        .clk_i      (cpu_clk),
        .rst_i      (cpu_rst),
        .finish_i   (inst_finished),
        .pc_i       (pc),
        .valid_o    (inst_vld),
        .inst_o     (inst_r),
        .inst_rreq  (if_rreq),
        .inst_addr  (if_addr),
        .inst_valid (if_valid),
        .inst_i     (if_inst)
    );

    Ctrl U_Ctrl (
        .funct7     (inst_r[31:25]),
        .funct3     (inst_r[14:12]),
        .opcode     (inst_r[6:0]),
        .npc_op     (npc_op),
        .rf_we      (rf_we),
        .wd_sel     (wd_sel),
        .sext_op    (sext_op),
        .alu_op     (alu_op),
        .alua_sel   (alua_sel),
        .alub_sel   (alub_sel),
        .branch     (branch),
        .dram_we    (ram_we),
        .mul_div    (mul_div)
    );

    always @(posedge cpu_clk or posedge cpu_rst) begin
        if (cpu_rst)
            load_flag <= 1'b0;
        else begin
            if (wd_sel == 2'b01) begin
                load_flag <= 1'b1;
                rf_wR_r   <= inst_r[11:7];
            end else if (mul_div) begin
                rf_wR_r   <= inst_r[11:7];
            end
            if (da_valid)
                load_flag <= 1'b0;
        end
    end

    // Write back should wait for memory access if there's a Load inst.
    assign rf_we1 = load_flag ? da_valid : (
                        (mul_div | mul_div_r) ? !mul_div_busy : rf_we & inst_vld
                    );

    always @(posedge cpu_clk or posedge cpu_rst) begin
        if (cpu_rst)
            mul_div_r <= 1'b0;
        else begin
            if (mul_div)
                mul_div_r <= 1'b1;
            else if (!mul_div_busy)
                mul_div_r <= 1'b0;
        end
    end

    always @(posedge cpu_clk or posedge cpu_rst) begin
        if (cpu_rst) begin
            inst_finished <= 1'b0;
        end else if (!inst_finished) begin
            inst_finished <= (  (rf_we1 & (wd_sel != 2'b01) & !mul_div) || 
                                (/*ram_we &&*/ da_wresp) ||     // S-Type
                                (sext_op == 3'b010) ||          // B-Type
                                (mul_div_r & !mul_div_busy)     // multiply and divide
                             ) ? 1'b1 : 1'b0;
        end else
            inst_finished <= 1'b0;
    end
 
    RF U_RF (
        .clk_i      (cpu_clk),
    
        .rR1_i      (inst_r[19:15]),
        .rR2_i      (inst_r[24:20]),
        .wR_i       (load_flag | mul_div_r ? rf_wR_r : inst_r[11:7]),
        .wD_i       (load_flag ? da_rdata : rf_wd),
        .rf_we_i    (rf_we1),
    
        .rD1_o      (rf_rd1),
        .rD2_o      (rf_rd2)
    );

    always @(*) begin
        case (wd_sel)
            2'b00:   rf_wd = alu_c;
            2'b01:   rf_wd = da_rdata;
            2'b10:   rf_wd = pc4;
            2'b11:   rf_wd = ext;
            default: rf_wd = 32'h0;
        endcase
    end

    SEXT U_SEXT (
        .ins_i      (inst_r[31:7]),
        .sext_op    (sext_op),
        .ext        (ext)
    );
    
    always @(*) begin
        alu_a = (alua_sel == 1'b0) ? rf_rd1 : pc;
    end

    always @(*) begin
        alu_b = (alub_sel == 1'b0) ? rf_rd2 : ext;
    end
    
    ALU U_ALU (
        .rst_i      (cpu_rst),
        .clk_i      (cpu_clk),
        .A_i        (alu_a),
        .B_i        (alu_b),
        .alu_op     (alu_op),
        .lt_0_o     (lt_0),
        .eq_0_o     (eq_0),
        .C_o        (alu_c),
        .busy       (mul_div_busy)
    );
    
    assign Branch = branch[0] & ((branch[1] & (branch[2] ^ lt_0)) | (~branch[1] & (branch[2] ^ eq_0)));
    
    NPC U_NPC (
        .pc_i       (pc),
        .imm_i      (ext),
        .alu_c_i    (alu_c),
        .npc_op_i   (npc_op),
        .Branch_i   (Branch),
        .npc_o      (npc),
        .pc4_o      (pc4)
    );
    
    // Interface to Bridge
    always @ (posedge cpu_clk)
        alu_c_r <= (alu_c != 32'h0) ? alu_c : alu_c_r;

    assign da_addr  = (alu_c != 32'h0) ? alu_c : alu_c_r;
    assign da_ren   = {4{(wd_sel == 2'b01)}};
    assign da_wen   = {4{ram_we}};
    assign da_wdata = rf_rd2;

endmodule
