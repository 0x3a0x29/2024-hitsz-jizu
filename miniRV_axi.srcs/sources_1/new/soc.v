`timescale 1ns / 1ps

module soc(
    input  wire         clk_i,
    input  wire         rst_i,
    input  wire [23:0]  sw_i,
    output wire [31:0]  led_o
);

    wire [31:0] cpu_awaddr;
    wire [ 7:0] cpu_awlen;
    wire [ 2:0] cpu_awsize;
    wire [ 1:0] cpu_awburst;
    wire        cpu_awvalid;
    wire        cpu_awready;
    wire [31:0] cpu_wdata;
    wire [ 3:0] cpu_wstrb;
    wire        cpu_wlast;
    wire        cpu_wvalid;
    wire        cpu_wready;
    wire        cpu_bready;
    wire [ 1:0] cpu_bresp;
    wire        cpu_bvalid;
    wire [31:0] cpu_araddr;
    wire [ 7:0] cpu_arlen;
    wire [ 2:0] cpu_arsize;
    wire [ 1:0] cpu_arburst;
    wire        cpu_arvalid;
    wire        cpu_arready;
    wire        cpu_rready;
    wire [31:0] cpu_rdata;
    wire [ 1:0] cpu_rresp;
    wire        cpu_rlast;
    wire        cpu_rvalid;

    wire [31:0] bram_awaddr;
    wire [ 7:0] bram_awlen;
    wire [ 2:0] bram_awsize;
    wire [ 1:0] bram_awburst;
    wire        bram_awvalid;
    wire        bram_awready;
    wire [31:0] bram_wdata;
    wire [ 3:0] bram_wstrb;
    wire        bram_wlast;
    wire        bram_wvalid;
    wire        bram_wready;
    wire [ 1:0] bram_bresp;
    wire        bram_bvalid;
    wire        bram_bready;
    wire [31:0] bram_araddr;
    wire [ 7:0] bram_arlen;
    wire [ 2:0] bram_arsize;
    wire [ 1:0] bram_arburst;
    wire        bram_arvalid;
    wire        bram_arready;
    wire [31:0] bram_rdata;
    wire [ 1:0] bram_rresp;
    wire        bram_rlast;
    wire        bram_rvalid;
    wire        bram_rready;

    wire [31:0] sw_awaddr;
    wire [ 7:0] sw_awlen;
    wire [ 2:0] sw_awsize;
    wire [ 1:0] sw_awburst;
    wire        sw_awvalid;
    wire        sw_awready;
    wire [31:0] sw_wdata;
    wire [ 3:0] sw_wstrb;
    wire        sw_wlast;
    wire        sw_wvalid;
    wire        sw_wready;
    wire [ 1:0] sw_bresp;
    wire        sw_bvalid;
    wire        sw_bready;
    wire [31:0] sw_araddr;
    wire [ 7:0] sw_arlen;
    wire [ 2:0] sw_arsize;
    wire [ 1:0] sw_arburst;
    wire        sw_arvalid;
    wire        sw_arready;
    wire [31:0] sw_rdata;
    wire [ 1:0] sw_rresp;
    wire        sw_rlast;
    wire        sw_rvalid;
    wire        sw_rready;

    wire [31:0] led_awaddr;
    wire [ 7:0] led_awlen;
    wire [ 2:0] led_awsize;
    wire [ 1:0] led_awburst;
    wire        led_awvalid;
    wire        led_awready;
    wire [31:0] led_wdata;
    wire [ 3:0] led_wstrb;
    wire        led_wlast;
    wire        led_wvalid;
    wire        led_wready;
    wire [ 1:0] led_bresp;
    wire        led_bvalid;
    wire        led_bready;
    wire [31:0] led_araddr;
    wire [ 7:0] led_arlen;
    wire [ 2:0] led_arsize;
    wire [ 1:0] led_arburst;
    wire        led_arvalid;
    wire        led_arready;
    wire [31:0] led_rdata;
    wire [ 1:0] led_rresp;
    wire        led_rlast;
    wire        led_rvalid;
    wire        led_rready;

    cpu_top U_cpu (
        .cpu_clk        (clk_i),
        .cpu_rst        (rst_i),

        // AXI4 Master Interface
        // write address channel
        .m_axi_awaddr   (cpu_awaddr),
        .m_axi_awlen    (cpu_awlen),
        .m_axi_awsize   (cpu_awsize),
        .m_axi_awburst  (cpu_awburst),
        .m_axi_awvalid  (cpu_awvalid),
        .m_axi_awready  (cpu_awready),
        // write data channel
        .m_axi_wdata    (cpu_wdata),
        .m_axi_wstrb    (cpu_wstrb),
        .m_axi_wlast    (cpu_wlast),
        .m_axi_wvalid   (cpu_wvalid),
        .m_axi_wready   (cpu_wready),
        // write response channel
        .m_axi_bready   (cpu_bready),
        .m_axi_bresp    (cpu_bresp),
        .m_axi_bvalid   (cpu_bvalid),
        // read address channel
        .m_axi_araddr   (cpu_araddr),
        .m_axi_arlen    (cpu_arlen),
        .m_axi_arsize   (cpu_arsize),
        .m_axi_arburst  (cpu_arburst),
        .m_axi_arvalid  (cpu_arvalid),
        .m_axi_arready  (cpu_arready),
        // read data channel
        .m_axi_rready   (cpu_rready),
        .m_axi_rdata    (cpu_rdata),
        .m_axi_rresp    (cpu_rresp),
        .m_axi_rlast    (cpu_rlast),
        .m_axi_rvalid   (cpu_rvalid)
    );

    axi_crossbar_0 U_bridge (
        .aclk               (clk_i),
        .aresetn            (!rst_i),
        .s_axi_awaddr       (cpu_awaddr),
        .s_axi_awlen        (cpu_awlen),
        .s_axi_awsize       (cpu_awsize),
        .s_axi_awburst      (cpu_awburst),
        .s_axi_awvalid      (cpu_awvalid),
        .s_axi_awready      (cpu_awready),
        .s_axi_wdata        (cpu_wdata),
        .s_axi_wstrb        (cpu_wstrb),
        .s_axi_wlast        (cpu_wlast),
        .s_axi_wvalid       (cpu_wvalid),
        .s_axi_wready       (cpu_wready),
        .s_axi_bresp        (cpu_bresp),
        .s_axi_bvalid       (cpu_bvalid),
        .s_axi_bready       (cpu_bready),
        .s_axi_araddr       (cpu_araddr),
        .s_axi_arlen        (cpu_arlen),
        .s_axi_arsize       (cpu_arsize),
        .s_axi_arburst      (cpu_arburst),
        .s_axi_arvalid      (cpu_arvalid),
        .s_axi_arready      (cpu_arready),
        .s_axi_rdata        (cpu_rdata),
        .s_axi_rresp        (cpu_rresp),
        .s_axi_rlast        (cpu_rlast),
        .s_axi_rvalid       (cpu_rvalid),
        .s_axi_rready       (cpu_rready),
        .m_axi_awaddr       ({led_awaddr,  sw_awaddr,  bram_awaddr }),
        .m_axi_awlen        ({led_awlen,   sw_awlen,   bram_awlen  }),
        .m_axi_awsize       ({led_awsize,  sw_awsize,  bram_awsize }),
        .m_axi_awburst      ({led_awburst, sw_awburst, bram_awburst}),
        .m_axi_awvalid      ({led_awvalid, sw_awvalid, bram_awvalid}),
        .m_axi_awready      ({led_awready, sw_awready, bram_awready}),
        .m_axi_wdata        ({led_wdata,   sw_wdata,   bram_wdata  }),
        .m_axi_wstrb        ({led_wstrb,   sw_wstrb,   bram_wstrb  }),
        .m_axi_wlast        ({led_wlast,   sw_wlast,   bram_wlast  }),
        .m_axi_wvalid       ({led_wvalid,  sw_wvalid,  bram_wvalid }),
        .m_axi_wready       ({led_wready,  sw_wready,  bram_wready }),
        .m_axi_bresp        ({led_bresp,   sw_bresp,   bram_bresp  }),
        .m_axi_bvalid       ({led_bvalid,  sw_bvalid,  bram_bvalid }),
        .m_axi_bready       ({led_bready,  sw_bready,  bram_bready }),
        .m_axi_araddr       ({led_araddr,  sw_araddr,  bram_araddr }),
        .m_axi_arlen        ({led_arlen,   sw_arlen,   bram_arlen  }),
        .m_axi_arsize       ({led_arsize,  sw_arsize,  bram_arsize }),
        .m_axi_arburst      ({led_arburst, sw_arburst, bram_arburst}),
        .m_axi_arvalid      ({led_arvalid, sw_arvalid, bram_arvalid}),
        .m_axi_arready      ({led_arready, sw_arready, bram_arready}),
        .m_axi_rdata        ({led_rdata,   sw_rdata,   bram_rdata  }),
        .m_axi_rresp        ({led_rresp,   sw_rresp,   bram_rresp  }),
        .m_axi_rlast        ({led_rlast,   sw_rlast,   bram_rlast  }),
        .m_axi_rvalid       ({led_rvalid,  sw_rvalid,  bram_rvalid }),
        .m_axi_rready       ({led_rready,  sw_rready,  bram_rready })
    );

    axiram_wrap U_mem (
        .s_aclk         (clk_i),
        .s_aresetn      (!rst_i),
        .s_axi_awaddr   (bram_awaddr),
        .s_axi_awlen    (bram_awlen),
        .s_axi_awsize   (bram_awsize),
        .s_axi_awburst  (bram_awburst),
        .s_axi_awvalid  (bram_awvalid),
        .s_axi_awready  (bram_awready),
        .s_axi_wdata    (bram_wdata),
        .s_axi_wstrb    (bram_wstrb),
        .s_axi_wlast    (bram_wlast),
        .s_axi_wvalid   (bram_wvalid),
        .s_axi_wready   (bram_wready),
        .s_axi_bresp    (bram_bresp),
        .s_axi_bvalid   (bram_bvalid),
        .s_axi_bready   (bram_bready),
        .s_axi_araddr   (bram_araddr),
        .s_axi_arlen    (bram_arlen),
        .s_axi_arsize   (bram_arsize),
        .s_axi_arburst  (bram_arburst),
        .s_axi_arvalid  (bram_arvalid),
        .s_axi_arready  (bram_arready),
        .s_axi_rdata    (bram_rdata),
        .s_axi_rresp    (bram_rresp),
        .s_axi_rlast    (bram_rlast),
        .s_axi_rvalid   (bram_rvalid),
        .s_axi_rready   (bram_rready)
    );

    switch_wrap U_switch (
        .aclk           (clk_i),
        .aresetn        (!rst_i),
        .s_axi_awaddr   (sw_awaddr),
        .s_axi_awlen    (sw_awlen),
        .s_axi_awsize   (sw_awsize),
        .s_axi_awburst  (sw_awburst),
        .s_axi_awvalid  (sw_awvalid),
        .s_axi_awready  (sw_awready),
        .s_axi_wdata    (sw_wdata),
        .s_axi_wstrb    (sw_wstrb),
        .s_axi_wlast    (sw_wlast),
        .s_axi_wvalid   (sw_wvalid),
        .s_axi_wready   (sw_wready),
        .s_axi_bresp    (sw_bresp),
        .s_axi_bvalid   (sw_bvalid),
        .s_axi_bready   (sw_bready),
        .s_axi_araddr   (sw_araddr),
        .s_axi_arlen    (sw_arlen),
        .s_axi_arsize   (sw_arsize),
        .s_axi_arburst  (sw_arburst),
        .s_axi_arvalid  (sw_arvalid),
        .s_axi_arready  (sw_arready),
        .s_axi_rdata    (sw_rdata),
        .s_axi_rresp    (sw_rresp),
        .s_axi_rlast    (sw_rlast),
        .s_axi_rvalid   (sw_rvalid),
        .s_axi_rready   (sw_rready),

        .sw_i           (sw_i)
    );

    led_wrap U_led (
        .aclk           (clk_i),
        .aresetn        (!rst_i),
        .s_axi_awaddr   (led_awaddr),
        .s_axi_awlen    (led_awlen),
        .s_axi_awsize   (led_awsize),
        .s_axi_awburst  (led_awburst),
        .s_axi_awvalid  (led_awvalid),
        .s_axi_awready  (led_awready),
        .s_axi_wdata    (led_wdata),
        .s_axi_wstrb    (led_wstrb),
        .s_axi_wlast    (led_wlast),
        .s_axi_wvalid   (led_wvalid),
        .s_axi_wready   (led_wready),
        .s_axi_bresp    (led_bresp),
        .s_axi_bvalid   (led_bvalid),
        .s_axi_bready   (led_bready),
        .s_axi_araddr   (led_araddr),
        .s_axi_arlen    (led_arlen),
        .s_axi_arsize   (led_arsize),
        .s_axi_arburst  (led_arburst),
        .s_axi_arvalid  (led_arvalid),
        .s_axi_arready  (led_arready),
        .s_axi_rdata    (led_rdata),
        .s_axi_rresp    (led_rresp),
        .s_axi_rlast    (led_rlast),
        .s_axi_rvalid   (led_rvalid),
        .s_axi_rready   (led_rready),

        .led_o          (led_o)
    );

endmodule
