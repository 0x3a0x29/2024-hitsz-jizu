// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Apr 18 17:05:18 2024
// Host        : 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim E:/miniRV_axi/miniRV_axi.srcs/sources_1/new/PC.v
// Design      : PC
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module PC
   (clk_i,
    rst_i,
    npc_i,
    ivalid,
    fetch,
    pc_o);
  input clk_i;
  input rst_i;
  input [31:0]npc_i;
  input ivalid;
  input fetch;
  output [31:0]pc_o;

  wire clk_i;
  wire fetch;
  wire ivalid;
  wire [31:0]npc_i;
  wire [31:0]npc_r;
  wire [31:0]pc_o;
  wire rst_i;

  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[0] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[0]),
        .Q(npc_r[0]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[10] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[10]),
        .Q(npc_r[10]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[11] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[11]),
        .Q(npc_r[11]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[12] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[12]),
        .Q(npc_r[12]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[13] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[13]),
        .Q(npc_r[13]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[14] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[14]),
        .Q(npc_r[14]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[15] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[15]),
        .Q(npc_r[15]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[16] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[16]),
        .Q(npc_r[16]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[17] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[17]),
        .Q(npc_r[17]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[18] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[18]),
        .Q(npc_r[18]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[19] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[19]),
        .Q(npc_r[19]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[1] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[1]),
        .Q(npc_r[1]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[20] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[20]),
        .Q(npc_r[20]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[21] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[21]),
        .Q(npc_r[21]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[22] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[22]),
        .Q(npc_r[22]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[23] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[23]),
        .Q(npc_r[23]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[24] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[24]),
        .Q(npc_r[24]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[25] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[25]),
        .Q(npc_r[25]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[26] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[26]),
        .Q(npc_r[26]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[27] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[27]),
        .Q(npc_r[27]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[28] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[28]),
        .Q(npc_r[28]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[29] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[29]),
        .Q(npc_r[29]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[2] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[2]),
        .Q(npc_r[2]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[30] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[30]),
        .Q(npc_r[30]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[31] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[31]),
        .Q(npc_r[31]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[3] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[3]),
        .Q(npc_r[3]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[4] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[4]),
        .Q(npc_r[4]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[5] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[5]),
        .Q(npc_r[5]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[6] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[6]),
        .Q(npc_r[6]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[7] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[7]),
        .Q(npc_r[7]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[8] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[8]),
        .Q(npc_r[8]));
  FDCE #(
    .INIT(1'b0)) 
    \npc_r_reg[9] 
       (.C(clk_i),
        .CE(ivalid),
        .CLR(rst_i),
        .D(npc_i[9]),
        .Q(npc_r[9]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[0] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[0]),
        .Q(pc_o[0]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[10] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[10]),
        .Q(pc_o[10]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[11] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[11]),
        .Q(pc_o[11]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[12] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[12]),
        .Q(pc_o[12]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[13] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[13]),
        .Q(pc_o[13]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[14] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[14]),
        .Q(pc_o[14]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[15] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[15]),
        .Q(pc_o[15]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[16] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[16]),
        .Q(pc_o[16]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[17] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[17]),
        .Q(pc_o[17]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[18] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[18]),
        .Q(pc_o[18]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[19] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[19]),
        .Q(pc_o[19]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[1] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[1]),
        .Q(pc_o[1]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[20] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[20]),
        .Q(pc_o[20]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[21] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[21]),
        .Q(pc_o[21]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[22] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[22]),
        .Q(pc_o[22]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[23] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[23]),
        .Q(pc_o[23]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[24] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[24]),
        .Q(pc_o[24]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[25] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[25]),
        .Q(pc_o[25]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[26] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[26]),
        .Q(pc_o[26]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[27] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[27]),
        .Q(pc_o[27]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[28] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[28]),
        .Q(pc_o[28]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[29] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[29]),
        .Q(pc_o[29]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[2] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[2]),
        .Q(pc_o[2]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[30] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[30]),
        .Q(pc_o[30]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[31] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[31]),
        .Q(pc_o[31]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[3] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[3]),
        .Q(pc_o[3]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[4] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[4]),
        .Q(pc_o[4]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[5] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[5]),
        .Q(pc_o[5]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[6] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[6]),
        .Q(pc_o[6]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[7] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[7]),
        .Q(pc_o[7]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[8] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[8]),
        .Q(pc_o[8]));
  FDCE #(
    .INIT(1'b0)) 
    \pc_o_reg[9] 
       (.C(clk_i),
        .CE(fetch),
        .CLR(rst_i),
        .D(npc_r[9]),
        .Q(pc_o[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
