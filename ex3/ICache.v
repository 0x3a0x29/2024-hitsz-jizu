`timescale 1ns / 1ps

 `define BLK_LEN  4
 `define BLK_SIZE (`BLK_LEN*32)

module ICache(
    input  wire         cpu_clk,
    input  wire         cpu_rst,        // high active
    // Interface to CPU
    input  wire         inst_rreq,      // ����CPU��ȡָ����
    input  wire [31:0]  inst_addr,      // ����CPU��ȡָ��ַ
    output reg          inst_valid,     // �����CPU��ָ����Ч�źţ���ָ�����У�
    output reg  [31:0]  inst_out,       // �����CPU��ָ��
    // Interface to Read Bus
    input  wire         mem_rrdy,       // ��������źţ��ߵ�ƽ��ʾ����ɽ���ICache�Ķ�����
    output reg  [ 3:0]  mem_ren,        // ���������Ķ�ʹ���ź�
    output reg  [31:0]  mem_raddr,      // ���������Ķ���ַ
    input  wire         mem_rvalid,     // ���������������Ч�ź�
    input  wire [`BLK_SIZE-1:0] mem_rdata   // ��������Ķ�����
);

`ifdef ENABLE_ICACHE    /******** ��Ҫ�޸Ĵ��д��� ********/

    wire [4:0] tag_from_cpu   = inst_addr[14:10];    // �����ַ��TAG
    wire [3:0] offset         = inst_addr[3:0];    // 32λ��ƫ����
    wire       valid_bit      = cache_line_r[133];    // Cache�е���Чλ
    wire [4:0] tag_from_cache = cache_line_r[132:128];    // Cache�е�TAG

    // TODO: ����ICache״̬����״̬����
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

    wire cache_we=mem_rvalid;     // ICache�洢���дʹ���ź�
    wire [5:0] cache_index=inst_addr[9:4];     // �����ַ��Cache���� / ICache�洢��ĵ�ַ
    wire [133:0] cache_line_w={mem_rvalid,inst_addr[14:10],mem_rdata};     // ��д��ICache��Cache��
    wire [133:0] cache_line_r;                  // ��ICache������Cache��

    // ICache�洢�壺Block MEM IP��
    blk_mem_gen_1 U_isram (
        .clka   (cpu_clk),
        .wea    (cache_we),
        .addra  (cache_index),
        .dina   (cache_line_w),
        .douta  (cache_line_r)
    );

    // TODO: ��д״̬����̬�ĸ����߼�
    always @(posedge cpu_clk or posedge cpu_rst) begin
        state<=cpu_rst?IDLE:state_n;
    end

    // TODO: ��д״̬����״̬ת���߼�
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

    // TODO: ����״̬��������ź�
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

    /******** ��Ҫ�޸����´��� ********/
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
