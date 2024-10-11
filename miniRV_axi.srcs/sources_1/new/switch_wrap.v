`timescale 1ns / 1ps

module switch_wrap(
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

    input  wire [23:0]  sw_i
);

    wire [31:0] sw_awaddr;
    wire        sw_awready;
    wire        sw_awvalid;
    wire [31:0] sw_wdata;
    wire        sw_wready;
    wire [ 3:0] sw_wstrb;
    wire        sw_wvalid;
    wire        sw_bready;
    wire [ 1:0] sw_bresp;
    wire        sw_bvalid;
    wire [31:0] sw_araddr;
    wire        sw_arready;
    wire        sw_arvalid;
    wire [31:0] sw_rdata;
    wire        sw_rready;
    wire [ 1:0] sw_rresp;
    wire        sw_rvalid;

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
        .m_axi_awaddr       (sw_awaddr),
        .m_axi_awprot       (),
        .m_axi_awvalid      (sw_awvalid),
        .m_axi_awready      (sw_awready),
        .m_axi_wdata        (sw_wdata),
        .m_axi_wstrb        (sw_wstrb),
        .m_axi_wvalid       (sw_wvalid),
        .m_axi_wready       (sw_wready),
        .m_axi_bresp        (sw_bresp),
        .m_axi_bvalid       (sw_bvalid),
        .m_axi_bready       (sw_bready),
        .m_axi_araddr       (sw_araddr),
        .m_axi_arprot       (),
        .m_axi_arvalid      (sw_arvalid),
        .m_axi_arready      (sw_arready),
        .m_axi_rdata        (sw_rdata),
        .m_axi_rresp        (sw_rresp),
        .m_axi_rvalid       (sw_rvalid),
        .m_axi_rready       (sw_rready)
    );

    axi_gpio_0 U_switch (
        .s_axi_aclk         (aclk),
        .s_axi_aresetn      (aresetn),
        .s_axi_awaddr       (sw_awaddr),
        .s_axi_awready      (sw_awready),
        .s_axi_awvalid      (sw_awvalid),
        .s_axi_wdata        (sw_wdata),
        .s_axi_wready       (sw_wready),
        .s_axi_wstrb        (sw_wstrb),
        .s_axi_wvalid       (sw_wvalid),
        .s_axi_bready       (sw_bready),
        .s_axi_bresp        (sw_bresp),
        .s_axi_bvalid       (sw_bvalid),
        .s_axi_araddr       (sw_araddr),
        .s_axi_arready      (sw_arready),
        .s_axi_arvalid      (sw_arvalid),
        .s_axi_rdata        (sw_rdata),
        .s_axi_rready       (sw_rready),
        .s_axi_rresp        (sw_rresp),
        .s_axi_rvalid       (sw_rvalid),

        .gpio_io_i          (sw_i)
    );

endmodule
