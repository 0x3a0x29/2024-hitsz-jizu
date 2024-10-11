`timescale 1ns / 1ps

module led_wrap(
    input  wire         aclk,
    input  wire         aresetn,
    input  wire [31:0]  s_axi_awaddr,
    input  wire [ 7:0]  s_axi_awlen,
    input  wire [ 2:0]  s_axi_awsize,
    input  wire [ 1:0]  s_axi_awburst,
    input  wire [ 0:0]  s_axi_awlock,
    input  wire [ 3:0]  s_axi_awcache,
    input  wire [ 2:0]  s_axi_awprot,
    input  wire [ 3:0]  s_axi_awregion,
    input  wire [ 3:0]  s_axi_awqos,
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
    input  wire [ 0:0]  s_axi_arlock,
    input  wire [ 3:0]  s_axi_arcache,
    input  wire [ 2:0]  s_axi_arprot,
    input  wire [ 3:0]  s_axi_arregion,
    input  wire [ 3:0]  s_axi_arqos,
    input  wire         s_axi_arvalid,
    output wire         s_axi_arready,
    output wire [31:0]  s_axi_rdata,
    output wire [ 1:0]  s_axi_rresp,
    output wire         s_axi_rlast,
    output wire         s_axi_rvalid,
    input  wire         s_axi_rready,

    output wire [31:0]  led_o
);

    wire [31:0] led_awaddr;
    wire        led_awready;
    wire        led_awvalid;
    wire [31:0] led_wdata;
    wire        led_wready;
    wire [ 3:0] led_wstrb;
    wire        led_wvalid;
    wire        led_bready;
    wire [ 1:0] led_bresp;
    wire        led_bvalid;
    wire [31:0] led_araddr;
    wire        led_arready;
    wire        led_arvalid;
    wire [31:0] led_rdata;
    wire        led_rready;
    wire [ 1:0] led_rresp;
    wire        led_rvalid;

    axi_protocol_converter_0 U_sw_converter (
        .aclk               (aclk),
        .aresetn            (aresetn),
        .s_axi_awaddr       (s_axi_awaddr),
        .s_axi_awlen        (s_axi_awlen),
        .s_axi_awsize       (s_axi_awsize),
        .s_axi_awburst      (s_axi_awburst),
        .s_axi_awlock       (s_axi_awlock),
        .s_axi_awcache      (s_axi_awcache),
        .s_axi_awprot       (s_axi_awprot),
        .s_axi_awregion     (s_axi_awregion),
        .s_axi_awqos        (s_axi_awqos),
        .s_axi_awvalid      (s_axi_awvalid),
        .s_axi_awready      (s_axi_awready),
        .s_axi_wdata        (s_axi_wdata),
        .s_axi_wstrb        (s_axi_wstrb),
        .s_axi_wlast        (s_axi_wlast),
        .s_axi_wvalid       (s_axi_wvalid),
        .s_axi_wready       (s_axi_wready),
        .s_axi_bresp        (s_axi_bresp),
        .s_axi_bvalid       (s_axi_bvalid),
        .s_axi_bready       (s_axi_bready),
        .s_axi_araddr       (s_axi_araddr),
        .s_axi_arlen        (s_axi_arlen),
        .s_axi_arsize       (s_axi_arsize),
        .s_axi_arburst      (s_axi_arburst),
        .s_axi_arlock       (s_axi_arlock),
        .s_axi_arcache      (s_axi_arcache),
        .s_axi_arprot       (s_axi_arprot),
        .s_axi_arregion     (s_axi_arregion),
        .s_axi_arqos        (s_axi_arqos),
        .s_axi_arvalid      (s_axi_arvalid),
        .s_axi_arready      (s_axi_arready),
        .s_axi_rdata        (s_axi_rdata),
        .s_axi_rresp        (s_axi_rresp),
        .s_axi_rlast        (s_axi_rlast),
        .s_axi_rvalid       (s_axi_rvalid),
        .s_axi_rready       (s_axi_rready),
        .m_axi_awaddr       (led_awaddr),
        .m_axi_awprot       (),
        .m_axi_awvalid      (led_awvalid),
        .m_axi_awready      (led_awready),
        .m_axi_wdata        (led_wdata),
        .m_axi_wstrb        (led_wstrb),
        .m_axi_wvalid       (led_wvalid),
        .m_axi_wready       (led_wready),
        .m_axi_bresp        (led_bresp),
        .m_axi_bvalid       (led_bvalid),
        .m_axi_bready       (led_bready),
        .m_axi_araddr       (led_araddr),
        .m_axi_arprot       (),
        .m_axi_arvalid      (led_arvalid),
        .m_axi_arready      (led_arready),
        .m_axi_rdata        (led_rdata),
        .m_axi_rresp        (led_rresp),
        .m_axi_rvalid       (led_rvalid),
        .m_axi_rready       (led_rready)
    );

    axi_gpio_1 U_led (
        .s_axi_aclk         (aclk),
        .s_axi_aresetn      (aresetn),
        .s_axi_awaddr       (led_awaddr),
        .s_axi_awready      (led_awready),
        .s_axi_awvalid      (led_awvalid),
        .s_axi_wdata        (led_wdata),
        .s_axi_wready       (led_wready),
        .s_axi_wstrb        (led_wstrb),
        .s_axi_wvalid       (led_wvalid),
        .s_axi_bready       (led_bready),
        .s_axi_bresp        (led_bresp),
        .s_axi_bvalid       (led_bvalid),
        .s_axi_araddr       (led_araddr),
        .s_axi_arready      (led_arready),
        .s_axi_arvalid      (led_arvalid),
        .s_axi_rdata        (led_rdata),
        .s_axi_rready       (led_rready),
        .s_axi_rresp        (led_rresp),
        .s_axi_rvalid       (led_rvalid),

        .gpio_io_o          (led_o)
    );

endmodule
