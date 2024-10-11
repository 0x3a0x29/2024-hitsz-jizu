`timescale 1ns / 1ps

 `define BLK_LEN  4
 `define BLK_SIZE (`BLK_LEN*32)

module ICache(
    input  wire         cpu_clk,
    input  wire         cpu_rst,        // high active
    // Interface to CPU
    input  wire         inst_rreq,      // 来自CPU的取指请求
    input  wire [31:0]  inst_addr,      // 来自CPU的取指地址
    output reg          inst_valid,     // 输出给CPU的指令有效信号（读指令命中）
    output reg  [31:0]  inst_out,       // 输出给CPU的指令
    // Interface to Read Bus
    input  wire         mem_rrdy,       // 主存就绪信号（高电平表示主存可接收ICache的读请求）
    output reg  [ 3:0]  mem_ren,        // 输出给主存的读使能信号
    output reg  [31:0]  mem_raddr,      // 输出给主存的读地址
    input  wire         mem_rvalid,     // 来自主存的数据有效信号
    input  wire [`BLK_SIZE-1:0] mem_rdata   // 来自主存的读数据
);

`ifdef ENABLE_ICACHE    /******** 不要修改此行代码 ********/

    wire [4:0] tag_from_cpu   = inst_addr[14:10];    // 主存地址的TAG
    wire [3:0] offset         = inst_addr[3:0];    // 32位字偏移量
    wire       valid_bit      = cache_line_r[133];    // Cache行的有效位
    wire [4:0] tag_from_cache = cache_line_r[132:128];    // Cache行的TAG

    // TODO: 定义ICache状态机的状态变量
    localparam IDLE=2'b00;
    localparam TAG_CHK=2'b01;
    localparam REFILL=2'b10;
    reg [1:0] state,state_n;

    wire hit=valid_bit&(&(tag_from_cpu^~tag_from_cache))&
     (&(state^~TAG_CHK));

    always @(*) begin
        inst_valid = hit;
        inst_out=offset>= 8?(offset>=12?cache_line_r[127:96]:cache_line_r[95:64]):
        (offset>=4?cache_line_r[63:32]:cache_line_r[31:0]);
    end

    wire cache_we=mem_rvalid;     // ICache存储体的写使能信号
    wire [5:0] cache_index=inst_addr[9:4];     // 主存地址的Cache索引 / ICache存储体的地址
    wire [133:0] cache_line_w={mem_rvalid,inst_addr[14:10],mem_rdata};     // 待写入ICache的Cache行
    wire [133:0] cache_line_r;                  // 从ICache读出的Cache行

    // ICache存储体：Block MEM IP核
    blk_mem_gen_1 U_isram (
        .clka   (cpu_clk),
        .wea    (cache_we),
        .addra  (cache_index),
        .dina   (cache_line_w),
        .douta  (cache_line_r)
    );

    // TODO: 编写状态机现态的更新逻辑
    always @(posedge cpu_clk or posedge cpu_rst) begin
        state<=cpu_rst?IDLE:state_n;
    end

    // TODO: 编写状态机的状态转移逻辑
    always @(*) begin
        case (state)
            IDLE:    state_n=inst_rreq?TAG_CHK:IDLE;
            TAG_CHK:begin
                    if(mem_rrdy)state_n=hit?IDLE:REFILL;
                    else state_n=TAG_CHK;
                end
            REFILL:state_n=mem_rvalid?TAG_CHK:REFILL;
            default: state_n=IDLE;
        endcase
    end

    // TODO: 生成状态机的输出信号
    always @(posedge cpu_clk or posedge cpu_rst) begin
        if (cpu_rst) begin
            mem_ren<=4'h0;
            mem_raddr<=32'd0;
        end else begin
            case (state)
                IDLE:begin
                    mem_ren<=4'h0;
                    mem_raddr<=mem_raddr;
                end
                TAG_CHK:begin
                if(mem_rrdy) begin
                    mem_ren<={4{~inst_valid}};
                    mem_raddr<=inst_valid? mem_raddr:{inst_addr[31:4],4'h0};
                    end
                else begin
                    mem_ren<=4'h0;
                    mem_raddr<=mem_raddr;
                end
                end
                REFILL:begin
                    mem_ren<=4'h0;
                    mem_raddr<=mem_raddr;
                end
                default: begin
                    mem_ren<=4'h0;
                    mem_raddr<=mem_raddr;
                end
            endcase
        end
    end

    /******** 不要修改以下代码 ********/
`else

    localparam IDLE  = 2'b00;
    localparam STAT0 = 2'b01;
    localparam STAT1 = 2'b11;
    reg [1:0] state, nstat;

    always @(posedge cpu_clk or posedge cpu_rst) begin
        state <= cpu_rst ? IDLE : nstat;
    end

    always @(*) begin
        case (state)
            IDLE:    nstat = inst_rreq ? (mem_rrdy ? STAT1 : STAT0) : IDLE;
            STAT0:   nstat = mem_rrdy ? STAT1 : STAT0;
            STAT1:   nstat = mem_rvalid ? IDLE : STAT1;
            default: nstat = IDLE;
        endcase
    end

    always @(posedge cpu_clk or posedge cpu_rst) begin
        if (cpu_rst) begin
            inst_valid <= 1'b0;
            mem_ren    <= 4'h0;
        end else begin
            case (state)
                IDLE: begin
                    inst_valid <= 1'b0;
                    mem_ren    <= (inst_rreq & mem_rrdy) ? 4'hF : 4'h0;
                    mem_raddr  <= inst_rreq ? inst_addr : 32'h0;
                end
                STAT0: begin
                    mem_ren    <= mem_rrdy ? 4'hF : 4'h0;
                end
                STAT1: begin
                    mem_ren    <= 4'h0;
                    inst_valid <= mem_rvalid ? 1'b1 : 1'b0;
                    inst_out   <= mem_rvalid ? mem_rdata[31:0] : 32'h0;
                end
                default: begin
                    inst_valid <= 1'b0;
                    mem_ren    <= 4'h0;
                end
            endcase
        end
    end

`endif

endmodule
