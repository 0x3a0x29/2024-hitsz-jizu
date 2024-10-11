`timescale 1ns / 1ps

module ALU (
    input  wire         rst_i,
    input  wire         clk_i,
    input  wire [31:0]  A_i,
    input  wire [31:0]  B_i,
    input  wire [ 3:0]  alu_op,
    
    output reg          lt_0_o,
    output reg          eq_0_o,
    output reg [31:0]   C_o,
    output wire         busy
);
    wire        mul_flag;
    wire        mul_busy;
    wire [63:0] mul_res;
    wire        div_flag;
    wire        div_busy;
    wire [31:0] div_quo;    // quotient
    wire [31:0] div_rem;    // remainder
    reg  [ 3:0] alu_op_r;

    always @(*) begin
        case (alu_op | alu_op_r)
            `OP_ADD:  C_o = A_i + B_i;
            `OP_SUB:  C_o = A_i + ~B_i + 32'b1;
            `OP_AND:  C_o = A_i & B_i;
            `OP_OR:   C_o = A_i | B_i;
            `OP_XOR:  C_o = A_i ^ B_i;
            `OP_SLL:  C_o = A_i << B_i[4:0];
            `OP_SRL:  C_o = A_i >> B_i[4:0];
            `OP_SRA:  C_o = $signed(A_i) >>> B_i[4:0];
            `OP_MUL:  C_o = mul_res[31:0];
            `OP_MULH: C_o = mul_res[63:32];
            `OP_DIV:  C_o = div_quo[31] ? {1'b1, ~div_quo[30:0] + 31'h1} : div_quo;
            `OP_REM:  C_o = div_rem[31] ? {1'b1, ~div_rem[30:0] + 31'h1} : div_rem;
            default:  C_o = 32'h0;
        endcase
    end
    
    always @(*) begin
        lt_0_o = (C_o[31] == 1'b1) ? 1'b1 : 1'b0;
    end

    always @(*) begin
        eq_0_o = (C_o == 0) ? 1'b1 : 1'b0;
    end

    assign mul_flag = (alu_op == `OP_MUL) || (alu_op == `OP_MULH);
    assign div_flag = (alu_op == `OP_DIV) || (alu_op == `OP_REM);
    assign busy     = mul_busy | div_busy;

    always @(posedge clk_i) begin
        if (mul_flag | div_flag)
            alu_op_r <= alu_op;
        else if (!busy)
            alu_op_r <= 4'h0;
    end

    multiplier U_mul (
        .clk    (clk_i),
        .rst    (rst_i),
        .x      (A_i),
        .y      (B_i),
        .start  (mul_flag),
        .z      (mul_res),
        .busy   (mul_busy)
    );

    divider U_div (
        .clk    (clk_i),
        .rst    (rst_i),
        .x      (A_i[31] ? {1'b1, ~A_i[30:0] + 31'h1} : A_i),
        .y      (B_i[31] ? {1'b1, ~B_i[30:0] + 31'h1} : B_i),
        .start  (div_flag),
        .z      (div_quo),
        .r      (div_rem),
        .busy   (div_busy)
    );

endmodule
