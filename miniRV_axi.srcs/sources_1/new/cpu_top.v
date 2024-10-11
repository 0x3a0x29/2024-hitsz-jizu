`timescale 1ns / 1ps

module cpu_top(
    input  wire         cpu_clk,
    input  wire         cpu_rst,        // high active

    // AXI4 Master Interface
    // write address channel
    output wire [31:0]  m_axi_awaddr,
    output wire [ 7:0]  m_axi_awlen,
    output wire [ 2:0]  m_axi_awsize,
    output wire [ 1:0]  m_axi_awburst,
    input  wire         m_axi_awready,
    output wire         m_axi_awvalid,
    // write data channel
    output wire [31:0]  m_axi_wdata,
    input  wire         m_axi_wready,
    output wire [ 3:0]  m_axi_wstrb,
    output wire         m_axi_wlast,
    output wire         m_axi_wvalid,
    // write response channel
    output wire         m_axi_bready,
    input  wire [ 1:0]  m_axi_bresp,
    input  wire         m_axi_bvalid,
    // read address channel
    output wire [31:0]  m_axi_araddr,
    output wire [ 7:0]  m_axi_arlen,
    output wire [ 2:0]  m_axi_arsize,
    output wire [ 1:0]  m_axi_arburst,
    input  wire         m_axi_arready,
    output wire         m_axi_arvalid,
    // read data channel
    input  wire [31:0]  m_axi_rdata,
    output wire         m_axi_rready,
    input  wire [ 1:0]  m_axi_rresp,
    input  wire         m_axi_rlast,
    input  wire         m_axi_rvalid
);

    // ICache Interface
    wire        dev2ic_rrdy;
    wire [ 3:0] ic2dev_ren;
    wire [31:0] ic2dev_raddr;
    wire        dev2ic_rvalid;
    wire [`BLK_SIZE-1:0] dev2ic_rdata;
    // DCache Interface
    wire        dev2dc_wrdy;
    wire [ 3:0] dc2dev_wen;
    wire [31:0] dc2dev_waddr;
    wire [31:0] dc2dev_wdata;
    wire        dev2dc_rrdy;
    wire [ 3:0] dc2dev_ren;
    wire [31:0] dc2dev_raddr;
    wire        dev2dc_rvalid;
    wire [`BLK_SIZE-1:0] dev2dc_rdata;

    // cpu_top U_cpu (
    //     .cpu_clk        (clk_i),
    //     .cpu_rst        (rst_i),
    //     // ICache Interface
    //     .ic_dev_rrdy    (dev2ic_rrdy),
    //     .ic_cpu_ren     (ic2dev_ren),
    //     .ic_cpu_raddr   (ic2dev_raddr),
    //     .ic_dev_rvalid  (dev2ic_rvalid),
    //     .ic_dev_rdata   (dev2ic_rdata),
    //     // DCache Interface
    //     .dc_dev_wrdy    (dev2dc_wrdy),
    //     .dc_cpu_wen     (dc2dev_wen),
    //     .dc_cpu_waddr   (dc2dev_waddr),
    //     .dc_cpu_wdata   (dc2dev_wdata),
    //     .dc_dev_rrdy    (dev2dc_rrdy),
    //     .dc_cpu_ren     (dc2dev_ren),
    //     .dc_cpu_raddr   (dc2dev_raddr),
    //     .dc_dev_rvalid  (dev2dc_rvalid),
    //     .dc_dev_rdata   (dev2dc_rdata)
    // );

    wire        cpu2ic_rreq;
    wire [31:0] cpu2ic_addr;
    wire        ic2cpu_valid;
    wire [31:0] ic2cpu_inst;

    wire [ 3:0] cpu2dc_ren;
    wire [31:0] cpu2dc_addr;
    wire        dc2cpu_valid;
    wire [31:0] dc2cpu_rdata;
    wire [ 3:0] cpu2dc_wen;
    wire [31:0] cpu2dc_wdata;
    wire        dc2cpu_wresp;

    rv_cpu_core U_core (
        .cpu_clk        (cpu_clk),
        .cpu_rst        (cpu_rst),
        // Instruction Fetch Interface
        .if_rreq        (cpu2ic_rreq),
        .if_addr        (cpu2ic_addr),
        .if_valid       (ic2cpu_valid),
        .if_inst        (ic2cpu_inst),
        // Data Access Interface
        .da_ren         (cpu2dc_ren),
        .da_addr        (cpu2dc_addr),
        .da_valid       (dc2cpu_valid),
        .da_rdata       (dc2cpu_rdata),
        .da_wen         (cpu2dc_wen),
        .da_wdata       (cpu2dc_wdata),
        .da_wresp       (dc2cpu_wresp)
    );

    ICache U_icache (
        .cpu_clk        (cpu_clk),
        .cpu_rst        (cpu_rst),
        // Interface to CPU
        .inst_rreq      (cpu2ic_rreq),
        .inst_addr      (cpu2ic_addr),
        .inst_valid     (ic2cpu_valid),
        .inst_out       (ic2cpu_inst),
        // Interface to Bus
        .mem_rrdy       (dev2ic_rrdy),
        .mem_ren        (ic2dev_ren),
        .mem_raddr      (ic2dev_raddr),
        .mem_rvalid     (dev2ic_rvalid),
        .mem_rdata      (dev2ic_rdata)
    );

    DCache U_dcache (
        .cpu_clk        (cpu_clk),
        .cpu_rst        (cpu_rst),
        // Interface to CPU
        .data_ren       (cpu2dc_ren),
        .data_addr      (cpu2dc_addr),
        .data_valid     (dc2cpu_valid),
        .data_rdata     (dc2cpu_rdata),
        .data_wen       (cpu2dc_wen),
        .data_wdata     (cpu2dc_wdata),
        .data_wresp     (dc2cpu_wresp),
        // Interface to Bus
        .dev_wrdy       (dev2dc_wrdy),
        .dev_wen        (dc2dev_wen),
        .dev_waddr      (dc2dev_waddr),
        .dev_wdata      (dc2dev_wdata),
        .dev_rrdy       (dev2dc_rrdy),
        .dev_ren        (dc2dev_ren),
        .dev_raddr      (dc2dev_raddr),
        .dev_rvalid     (dev2dc_rvalid),
        .dev_rdata      (dev2dc_rdata)
    );

    axi_master U_aximaster (
        .aclk           (cpu_clk),
        .areset         (cpu_rst),

        // ICache Interface
        .ic_dev_rrdy    (dev2ic_rrdy),
        .ic_cpu_ren     (|ic2dev_ren),
        .ic_cpu_raddr   (ic2dev_raddr),
        .ic_dev_rvalid  (dev2ic_rvalid),
        .ic_dev_rdata   (dev2ic_rdata),
        // DCache Interface
        .dc_dev_wrdy    (dev2dc_wrdy),
        .dc_cpu_wen     (dc2dev_wen),
        .dc_cpu_waddr   (dc2dev_waddr),
        .dc_cpu_wdata   (dc2dev_wdata),
        .dc_dev_rrdy    (dev2dc_rrdy),
        .dc_cpu_ren     (|dc2dev_ren),
        .dc_cpu_raddr   (dc2dev_raddr),
        .dc_dev_rvalid  (dev2dc_rvalid),
        .dc_dev_rdata   (dev2dc_rdata),

        // AXI4-Lite Master Interface
        // write address channel
        .m_axi_awaddr   (m_axi_awaddr),
        .m_axi_awlen    (m_axi_awlen),
        .m_axi_awsize   (m_axi_awsize),
        .m_axi_awburst  (m_axi_awburst),
        .m_axi_awready  (m_axi_awready),
        .m_axi_awvalid  (m_axi_awvalid),
        // write data channel
        .m_axi_wdata    (m_axi_wdata),
        .m_axi_wready   (m_axi_wready),
        .m_axi_wstrb    (m_axi_wstrb),
        .m_axi_wlast    (m_axi_wlast),
        .m_axi_wvalid   (m_axi_wvalid),
        // write response channel
        .m_axi_bready   (m_axi_bready),
        .m_axi_bresp    (m_axi_bresp),
        .m_axi_bvalid   (m_axi_bvalid),
        // read address channel
        .m_axi_araddr   (m_axi_araddr),
        .m_axi_arlen    (m_axi_arlen),
        .m_axi_arsize   (m_axi_arsize),
        .m_axi_arburst  (m_axi_arburst),
        .m_axi_arready  (m_axi_arready),
        .m_axi_arvalid  (m_axi_arvalid),
        // read data channel
        .m_axi_rdata    (m_axi_rdata),
        .m_axi_rready   (m_axi_rready),
        .m_axi_rresp    (m_axi_rresp),
        .m_axi_rlast    (m_axi_rlast),
        .m_axi_rvalid   (m_axi_rvalid)
    );

endmodule
