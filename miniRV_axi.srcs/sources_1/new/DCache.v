`timescale 1ns / 1ps

`define BLK_LEN  4
`define BLK_SIZE (`BLK_LEN*32)

module DCache(
    input  wire         cpu_clk,
    input  wire         cpu_rst,        // high active
    // Interface to CPU
    input  wire [ 3:0]  data_ren,       // ����CPU�Ķ�ʹ���ź�
    input  wire [31:0]  data_addr,      // ����CPU�ĵ�ַ������д���ã�
    output reg          data_valid,     // �����CPU��������Ч�ź�
    output reg  [31:0]  data_rdata,     // �����CPU�Ķ�����
    input  wire [ 3:0]  data_wen,       // ����CPU��дʹ���ź�
    input  wire [31:0]  data_wdata,     // ����CPU��д����
    output reg          data_wresp,     // �����CPU��д��Ӧ���ߵ�ƽ��ʾDCache�����д������
    // Interface to Write Bus
    input  wire         dev_wrdy,       // �����д�����źţ��ߵ�ƽ��ʾ����ɽ���DCache��д����
    output reg  [ 3:0]  dev_wen,        // ����������дʹ���ź�
    output reg  [31:0]  dev_waddr,      // ����������д��ַ
    output reg  [31:0]  dev_wdata,      // ����������д����
    // Interface to Read Bus
    input  wire         dev_rrdy,       // ����Ķ������źţ��ߵ�ƽ��ʾ����ɽ���DCache�Ķ�����
    output reg  [ 3:0]  dev_ren,        // ���������Ķ�ʹ���ź�
    output reg  [31:0]  dev_raddr,      // ���������Ķ���ַ
    input  wire         dev_rvalid,     // ���������������Ч�ź�
    input  wire [`BLK_SIZE-1:0] dev_rdata   // ��������Ķ�����
);

    // Peripherals access should be uncached.
    wire uncached = (data_addr[31:16] == 16'hFFFF) & (data_ren != 4'h0 | data_wen != 4'h0) ? 1'b1 : 1'b0;

`ifdef ENABLE_DCACHE    /******** ��Ҫ�޸Ĵ��д��� ********/

    wire [4:0] tag_from_cpu   = inst_addr[14:10];    // �����ַ��TAG
    wire [3:0] offset         = inst_addr[3:0];    // 32λ��ƫ����
    wire       valid_bit      = cache_line_r[133];    // Cache�е���Чλ
    wire [4:0] tag_from_cache = cache_line_r[132:128];    // Cache�е�TAG

    // TODO: ����DCache��״̬����״̬����
    localparam IDLE_r=2'b00;
    localparam TAG_CHK_r=2'b01;
    localparam REFILL_r=2'b10;
    localparam UNCACHED_r=2'b11;
    reg [1:0] rstate,rstate_n;

    wire hit_r = valid_bit&(&(tag_from_cpu^~tag_from_cache))&
     (&(state^~TAG_CHK));       // ������
    wire hit_w = /* TODO */;        // д����

    always @(*) begin
        data_valid = hit_r;
        data_rdata = offset>= 8?(offset>=12?cache_line_r[127:96]:cache_line_r[95:64]):
        (offset>=4?cache_line_r[63:32]:cache_line_r[31:0]);
    end

    wire cache_we=mem_rvalid;     // ICache�洢���дʹ���ź�
    wire [5:0] cache_index=inst_addr[9:4];     // �����ַ��Cache���� / ICache�洢��ĵ�ַ
    wire [133:0] cache_line_w={mem_rvalid,inst_addr[14:10],mem_rdata};     // ��д��ICache��Cache��
    wire [133:0] cache_line_r;                  // ��ICache������Cache��

    // DCache�洢�壺Block RAM IP��
    blk_mem_gen_1 U_dsram (
        .clka   (cpu_clk),
        .wea    (cache_we),
        .addra  (cache_index),
        .dina   (cache_line_w),
        .douta  (cache_line_r)
    );

    // TODO: ��дDCache��״̬����̬�ĸ����߼�
    always @(posedge cpu_clk or posedge cpu_rst) begin
        rstate<=cpu_rst?IDLE_r:rstate_n;
    end

    // TODO: ��дDCache��״̬����״̬ת���߼���ע�⴦��uncached���ʣ�
    always @(*) begin
        case (rstate)
            IDLE:    rstate_n=inst_rreq?TAG_CHK_r:IDLE_r;
            TAG_CHK:begin
                    if(mem_rrdy)rstate_n=hit?IDLE_r:REFILL_r;
                    else rstate_n=TAG_CHK_r;
                end
            REFILL:rstate_n=mem_rvalid?TAG_CHK_r:REFILL_r;
            default: rstate_n=IDLE_r;
        endcase
    end

    // TODO: ����DCache��״̬��������ź�





    ///////////////////////////////////////////////////////////
    // TODO: ����DCacheд״̬����״̬����


    // TODO: ��дDCacheд״̬������̬�����߼�


    // TODO: ��дDCacheд״̬����״̬ת���߼���ע�⴦��uncached���ʣ�


    // TODO: ����DCacheд״̬��������ź�


    // TODO: д����ʱ��ֻ���޸�Cache���е�����һ���֡����ڴ�ʵ��֮��


    /******** ��Ҫ�޸����´��� ********/
`else

    localparam R_IDLE  = 2'b00;
    localparam R_STAT0 = 2'b01;
    localparam R_STAT1 = 2'b11;
    reg [1:0] r_state, r_nstat;
    reg [3:0] ren_r;

    always @(posedge cpu_clk or posedge cpu_rst) begin
        r_state <= cpu_rst ? R_IDLE : r_nstat;
    end

    always @(*) begin
        case (r_state)
            R_IDLE:  r_nstat = (|data_ren) ? (dev_rrdy ? R_STAT1 : R_STAT0) : R_IDLE;
            R_STAT0: r_nstat = dev_rrdy ? R_STAT1 : R_STAT0;
            R_STAT1: r_nstat = dev_rvalid ? R_IDLE : R_STAT1;
            default: r_nstat = R_IDLE;
        endcase
    end

    always @(posedge cpu_clk or posedge cpu_rst) begin
        if (cpu_rst) begin
            data_valid <= 1'b0;
            dev_ren    <= 4'h0;
        end else begin
            case (r_state)
                R_IDLE: begin
                    data_valid <= 1'b0;

                    if (|data_ren) begin
                        if (dev_rrdy)
                            dev_ren <= data_ren;
                        else
                            ren_r   <= data_ren;

                        dev_raddr <= data_addr;
                    end else
                        dev_ren   <= 4'h0;
                end
                R_STAT0: begin
                    dev_ren    <= dev_rrdy ? ren_r : 4'h0;
                end   
                R_STAT1: begin
                    dev_ren    <= 4'h0;
                    data_valid <= dev_rvalid ? 1'b1 : 1'b0;
                    data_rdata <= dev_rvalid ? dev_rdata : 32'h0;
                end
                default: begin
                    data_valid <= 1'b0;
                    dev_ren    <= 4'h0;
                end 
            endcase
        end
    end

    localparam W_IDLE  = 2'b00;
    localparam W_STAT0 = 2'b01;
    localparam W_STAT1 = 2'b11;
    reg  [1:0] w_state, w_nstat;
    reg  [3:0] wen_r;
    wire       wr_resp = dev_wrdy & (dev_wen == 4'h0) ? 1'b1 : 1'b0;

    always @(posedge cpu_clk or posedge cpu_rst) begin
        w_state <= cpu_rst ? W_IDLE : w_nstat;
    end

    always @(*) begin
        case (w_state)
            W_IDLE:  w_nstat = (|data_wen) ? (dev_wrdy ? W_STAT1 : W_STAT0) : W_IDLE;
            W_STAT0: w_nstat = dev_wrdy ? W_STAT1 : W_STAT0;
            W_STAT1: w_nstat = wr_resp ? W_IDLE : W_STAT1;
            default: w_nstat = W_IDLE;
        endcase
    end

    always @(posedge cpu_clk or posedge cpu_rst) begin
        if (cpu_rst) begin
            data_wresp <= 1'b0;
            dev_wen    <= 4'h0;
        end else begin
            case (w_state)
                W_IDLE: begin
                    data_wresp <= 1'b0;

                    if (|data_wen) begin
                        if (dev_wrdy)
                            dev_wen <= data_wen;
                        else
                            wen_r   <= data_wen;

                        dev_waddr  <= data_addr;
                        dev_wdata  <= data_wdata;
                    end else
                        dev_wen    <= 4'h0;
                end
                W_STAT0: begin
                    dev_wen    <= dev_wrdy ? wen_r : 4'h0;
                end
                W_STAT1: begin
                    dev_wen    <= 4'h0;
                    data_wresp <= wr_resp ? 1'b1 : 1'b0;
                end
                default: begin
                    data_wresp <= 1'b0;
                    dev_wen    <= 4'h0;
                end
            endcase
        end
    end

`endif

endmodule

