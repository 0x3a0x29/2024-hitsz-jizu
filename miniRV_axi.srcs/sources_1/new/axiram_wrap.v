`timescale 1ns / 1ps

module axiram_wrap(
    input  wire         s_aclk,
    input  wire         s_aresetn,
    input  wire [31:0]  s_axi_awaddr,
    input  wire [ 7:0]  s_axi_awlen,
    input  wire [ 2:0]  s_axi_awsize,
    input  wire [ 1:0]  s_axi_awburst,
    input  wire         s_axi_awvalid,
    output wire         s_axi_awready,
    input  wire [31:0]  s_axi_wdata,
    input  wire [ 3:0]  s_axi_wstrb,
    input  wire         s_axi_wlast,
    input  wire         s_axi_wvalid,
    output wire         s_axi_wready,
    output wire [ 1:0]  s_axi_bresp,
    output wire         s_axi_bvalid,
    input  wire         s_axi_bready,
    input  wire [31:0]  s_axi_araddr,
    input  wire [ 7:0]  s_axi_arlen,
    input  wire [ 2:0]  s_axi_arsize,
    input  wire [ 1:0]  s_axi_arburst,
    input  wire         s_axi_arvalid,
    output wire         s_axi_arready,
    output wire [31:0]  s_axi_rdata,
    output wire         s_axi_rvalid,
    output wire         s_axi_rlast,
    output wire [ 1:0]  s_axi_rresp,
    input  wire         s_axi_rready
);

`ifdef RANDOM_DELAY

    localparam [7:0] MIN_DELAY = 8'd90;
    localparam [7:0] MAX_DELAY = 8'd120;

    reg  [22:0] pseudo_random_23;
    reg  [ 7:0] random_delay;
    reg         rd_delay_begin;
    reg  [ 7:0] rd_delay_cnt;
    wire        rd_delay_end;
    reg         rd_delay_end_r;
    reg         wr_delay_begin;
    reg  [ 7:0] wr_delay_cnt;
    wire        wr_delay_end;

    wire        bram_rvalid;
    reg         bram_rvalid_r;
    wire        bram_rlast;
    wire [31:0] bram_rdata;

    wire        rfifo_wen;
    wire        rfifo_ren;
    reg         rfifo_ren_r;

    reg         s_axi_wvalid_r;
    wire        bram_wvalid;
    wire        bram_wlast;
    wire [ 3:0] bram_wstrb;
    wire [31:0] bram_wdata;

    wire        wfifo_wen;
    wire        wfifo_ren;
    reg         wfifo_ren_r;

    // Generate random numbers
    always @(posedge s_aclk or negedge s_aresetn) begin
        if (!s_aresetn) begin
            pseudo_random_23 <= {7'b1010101, 16'h1B3D};
        end else begin
            pseudo_random_23 <= {pseudo_random_23[21:0], pseudo_random_23[22]^pseudo_random_23[17]};
            if (s_axi_arvalid | s_axi_awvalid)
                random_delay <= MIN_DELAY + pseudo_random_23 % (MAX_DELAY - MIN_DELAY + 1);
        end
    end

    // Read operation delay counter
    assign rd_delay_end = rd_delay_cnt >= random_delay ? 1'b1 : 1'b0;
    always @(posedge s_aclk or negedge s_aresetn) begin
        if (!s_aresetn) begin
            rd_delay_begin <= 1'b0;
            rd_delay_cnt   <= 8'h0;
        end else begin
            if (bram_rvalid)
                rd_delay_begin <= 1'b1;
            if (s_axi_rvalid)
                rd_delay_begin <= 1'b0;

            if (rd_delay_end)
                rd_delay_cnt <= 8'h0;
            else if (rd_delay_begin)
                rd_delay_cnt <= rd_delay_cnt + 8'h1;
        end
    end

    // Write operation delay counter
    assign wr_delay_end = wr_delay_cnt >= random_delay ? 1'b1 : 1'b0;
    always @(posedge s_aclk or negedge s_aresetn) begin
        if (!s_aresetn) begin
            wr_delay_begin <= 1'b0;
            wr_delay_cnt   <= 8'h0;
        end else begin
            if (s_axi_wvalid)
                wr_delay_begin <= 1'b1;
            if (bram_wvalid)
                wr_delay_begin <= 1'b0;

            if (wr_delay_end)
                wr_delay_cnt <= 8'h0;
            else if (wr_delay_begin)
                wr_delay_cnt <= wr_delay_cnt + 8'h1;
        end
    end

    // Delay R-channel transaction (rvalid, rlast, rdata).
    always @(posedge s_aclk or negedge s_aresetn) begin
        bram_rvalid_r <= s_aresetn ? (bram_rvalid & s_axi_rready) : 1'b0;

        if (!s_aresetn) begin
            rfifo_ren_r <= 1'b0;
        end else begin
            if (s_axi_rlast)
                rfifo_ren_r <= 1'b0;
            else if (rd_delay_end)
                rfifo_ren_r <= 1'b1;
        end
    end

    assign rfifo_wen = (bram_rvalid & s_axi_rready) | bram_rvalid_r;
    assign rfifo_ren = rd_delay_end | rfifo_ren_r;

    fifo_generator_0 U_rfifo (
        .clk    (s_aclk),
        .wr_en  (rfifo_wen),
        .din    ({bram_rvalid, bram_rlast, bram_rdata}),
        .rd_en  (rfifo_ren),
        .dout   ({s_axi_rvalid, s_axi_rlast, s_axi_rdata})
    );

    // Delay W-channel transaction (wvalid, wstrb, wlast, wdata).
    always @(posedge s_aclk or negedge s_aresetn) begin
        s_axi_wvalid_r  <= s_aresetn ? (s_axi_wvalid & s_axi_wready) : 1'b0;

        if (!s_aresetn) begin
            wfifo_ren_r <= 1'b0;
        end else begin
            if (bram_wlast)
                wfifo_ren_r <= 1'b0;
            else if (wr_delay_end)
                wfifo_ren_r <= 1'b1;
        end
    end

    assign wfifo_wen = (s_axi_wvalid & s_axi_wready) | s_axi_wvalid_r;
    assign wfifo_ren = wr_delay_end | wfifo_ren_r;

    fifo_generator_1 U_wfifo (
        .clk    (s_aclk),
        .wr_en  (wfifo_wen),
        .din    ({s_axi_wvalid, s_axi_wstrb, s_axi_wlast, s_axi_wdata}),
        .rd_en  (wfifo_ren),
        .dout   ({bram_wvalid, bram_wstrb, bram_wlast, bram_wdata})
    );

`endif

    blk_mem_gen_0 U_bram (
        .s_aclk         (s_aclk),
        .s_aresetn      (s_aresetn),
        .s_axi_awid     (4'h6),
        .s_axi_awaddr   (s_axi_awaddr),
        .s_axi_awlen    (s_axi_awlen),
        .s_axi_awsize   (s_axi_awsize),
        .s_axi_awburst  (s_axi_awburst),
        .s_axi_awready  (s_axi_awready),
        .s_axi_awvalid  (s_axi_awvalid),
`ifdef RANDOM_DELAY
        .s_axi_wdata    (bram_wdata),
        .s_axi_wstrb    (bram_wstrb),
        .s_axi_wvalid   (bram_wvalid),
        .s_axi_wlast    (bram_wlast),
`else
        .s_axi_wdata    (s_axi_wdata),
        .s_axi_wstrb    (s_axi_wstrb),
        .s_axi_wvalid   (s_axi_wvalid),
        .s_axi_wlast    (s_axi_wlast),
`endif
        .s_axi_wready   (s_axi_wready),
        .s_axi_bready   (s_axi_bready),
        .s_axi_bid      (s_axi_bid),
        .s_axi_bresp    (s_axi_bresp),
        .s_axi_bvalid   (s_axi_bvalid),
        .s_axi_arid     (4'hF),
        .s_axi_araddr   (s_axi_araddr),
        .s_axi_arlen    (s_axi_arlen),
        .s_axi_arsize   (s_axi_arsize),
        .s_axi_arburst  (s_axi_arburst),
        .s_axi_arready  (s_axi_arready),
        .s_axi_arvalid  (s_axi_arvalid),
        .s_axi_rid      (s_axi_rid),
`ifdef RANDOM_DELAY
        .s_axi_rdata    (bram_rdata),
        .s_axi_rvalid   (bram_rvalid),
        .s_axi_rlast    (bram_rlast),
`else
        .s_axi_rdata    (s_axi_rdata),
        .s_axi_rvalid   (s_axi_rvalid),
        .s_axi_rlast    (s_axi_rlast),
`endif
        .s_axi_rready   (s_axi_rready),
        .s_axi_rresp    (s_axi_rresp)
    );

endmodule
