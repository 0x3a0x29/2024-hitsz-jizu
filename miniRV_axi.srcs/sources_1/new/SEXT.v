// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Apr 18 17:15:49 2024
// Host        : 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim E:/miniRV_axi/miniRV_axi.srcs/sources_1/new/SEXT.v
// Design      : SEXT
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module SEXT
   (ins_i,
    sext_op,
    ext);
  input [24:0]ins_i;
  input [2:0]sext_op;
  output [31:0]ext;

  wire [31:0]ext;
  wire [24:0]ins_i;
  wire [2:0]sext_op;

  LUT5 #(
    .INIT(32'h000000E2)) 
    \ext[0]_INST_0 
       (.I0(ins_i[13]),
        .I1(sext_op[0]),
        .I2(ins_i[0]),
        .I3(sext_op[1]),
        .I4(sext_op[2]),
        .O(ext[0]));
  LUT4 #(
    .INIT(16'h1070)) 
    \ext[10]_INST_0 
       (.I0(sext_op[1]),
        .I1(sext_op[2]),
        .I2(ins_i[23]),
        .I3(sext_op[0]),
        .O(ext[10]));
  LUT6 #(
    .INIT(64'h000A000A0FCA00CA)) 
    \ext[11]_INST_0 
       (.I0(ins_i[24]),
        .I1(ins_i[0]),
        .I2(sext_op[1]),
        .I3(sext_op[2]),
        .I4(ins_i[13]),
        .I5(sext_op[0]),
        .O(ext[11]));
  LUT5 #(
    .INIT(32'h0E023A0A)) 
    \ext[12]_INST_0 
       (.I0(ins_i[24]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[5]),
        .I4(sext_op[0]),
        .O(ext[12]));
  LUT5 #(
    .INIT(32'h0E023A0A)) 
    \ext[13]_INST_0 
       (.I0(ins_i[24]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[6]),
        .I4(sext_op[0]),
        .O(ext[13]));
  LUT5 #(
    .INIT(32'h0E023A0A)) 
    \ext[14]_INST_0 
       (.I0(ins_i[24]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[7]),
        .I4(sext_op[0]),
        .O(ext[14]));
  LUT5 #(
    .INIT(32'h0E023A0A)) 
    \ext[15]_INST_0 
       (.I0(ins_i[24]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[8]),
        .I4(sext_op[0]),
        .O(ext[15]));
  LUT5 #(
    .INIT(32'h0E023A0A)) 
    \ext[16]_INST_0 
       (.I0(ins_i[24]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[9]),
        .I4(sext_op[0]),
        .O(ext[16]));
  LUT5 #(
    .INIT(32'h0E023A0A)) 
    \ext[17]_INST_0 
       (.I0(ins_i[24]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[10]),
        .I4(sext_op[0]),
        .O(ext[17]));
  LUT5 #(
    .INIT(32'h0E023A0A)) 
    \ext[18]_INST_0 
       (.I0(ins_i[24]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[11]),
        .I4(sext_op[0]),
        .O(ext[18]));
  LUT5 #(
    .INIT(32'h0E023A0A)) 
    \ext[19]_INST_0 
       (.I0(ins_i[24]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[12]),
        .I4(sext_op[0]),
        .O(ext[19]));
  LUT5 #(
    .INIT(32'h02023B08)) 
    \ext[1]_INST_0 
       (.I0(ins_i[1]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[14]),
        .I4(sext_op[0]),
        .O(ext[1]));
  LUT5 #(
    .INIT(32'h0B083F00)) 
    \ext[20]_INST_0 
       (.I0(ins_i[13]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[24]),
        .I4(sext_op[0]),
        .O(ext[20]));
  LUT5 #(
    .INIT(32'h0B083F00)) 
    \ext[21]_INST_0 
       (.I0(ins_i[14]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[24]),
        .I4(sext_op[0]),
        .O(ext[21]));
  LUT5 #(
    .INIT(32'h0B083F00)) 
    \ext[22]_INST_0 
       (.I0(ins_i[15]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[24]),
        .I4(sext_op[0]),
        .O(ext[22]));
  LUT5 #(
    .INIT(32'h0B083F00)) 
    \ext[23]_INST_0 
       (.I0(ins_i[16]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[24]),
        .I4(sext_op[0]),
        .O(ext[23]));
  LUT5 #(
    .INIT(32'h0B083F00)) 
    \ext[24]_INST_0 
       (.I0(ins_i[17]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[24]),
        .I4(sext_op[0]),
        .O(ext[24]));
  LUT5 #(
    .INIT(32'h0B083F00)) 
    \ext[25]_INST_0 
       (.I0(ins_i[18]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[24]),
        .I4(sext_op[0]),
        .O(ext[25]));
  LUT5 #(
    .INIT(32'h0B083F00)) 
    \ext[26]_INST_0 
       (.I0(ins_i[19]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[24]),
        .I4(sext_op[0]),
        .O(ext[26]));
  LUT5 #(
    .INIT(32'h0B083F00)) 
    \ext[27]_INST_0 
       (.I0(ins_i[20]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[24]),
        .I4(sext_op[0]),
        .O(ext[27]));
  LUT5 #(
    .INIT(32'h0B083F00)) 
    \ext[28]_INST_0 
       (.I0(ins_i[21]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[24]),
        .I4(sext_op[0]),
        .O(ext[28]));
  LUT5 #(
    .INIT(32'h0B083F00)) 
    \ext[29]_INST_0 
       (.I0(ins_i[22]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[24]),
        .I4(sext_op[0]),
        .O(ext[29]));
  LUT5 #(
    .INIT(32'h02023B08)) 
    \ext[2]_INST_0 
       (.I0(ins_i[2]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[15]),
        .I4(sext_op[0]),
        .O(ext[2]));
  LUT5 #(
    .INIT(32'h0B083F00)) 
    \ext[30]_INST_0 
       (.I0(ins_i[23]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[24]),
        .I4(sext_op[0]),
        .O(ext[30]));
  LUT4 #(
    .INIT(16'h3070)) 
    \ext[31]_INST_0 
       (.I0(sext_op[1]),
        .I1(sext_op[2]),
        .I2(ins_i[24]),
        .I3(sext_op[0]),
        .O(ext[31]));
  LUT5 #(
    .INIT(32'h02023B08)) 
    \ext[3]_INST_0 
       (.I0(ins_i[3]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[16]),
        .I4(sext_op[0]),
        .O(ext[3]));
  LUT5 #(
    .INIT(32'h02023B08)) 
    \ext[4]_INST_0 
       (.I0(ins_i[4]),
        .I1(sext_op[1]),
        .I2(sext_op[2]),
        .I3(ins_i[17]),
        .I4(sext_op[0]),
        .O(ext[4]));
  LUT4 #(
    .INIT(16'h1070)) 
    \ext[5]_INST_0 
       (.I0(sext_op[1]),
        .I1(sext_op[2]),
        .I2(ins_i[18]),
        .I3(sext_op[0]),
        .O(ext[5]));
  LUT4 #(
    .INIT(16'h1070)) 
    \ext[6]_INST_0 
       (.I0(sext_op[1]),
        .I1(sext_op[2]),
        .I2(ins_i[19]),
        .I3(sext_op[0]),
        .O(ext[6]));
  LUT4 #(
    .INIT(16'h1070)) 
    \ext[7]_INST_0 
       (.I0(sext_op[1]),
        .I1(sext_op[2]),
        .I2(ins_i[20]),
        .I3(sext_op[0]),
        .O(ext[7]));
  LUT4 #(
    .INIT(16'h1070)) 
    \ext[8]_INST_0 
       (.I0(sext_op[1]),
        .I1(sext_op[2]),
        .I2(ins_i[21]),
        .I3(sext_op[0]),
        .O(ext[8]));
  LUT4 #(
    .INIT(16'h1070)) 
    \ext[9]_INST_0 
       (.I0(sext_op[1]),
        .I1(sext_op[2]),
        .I2(ins_i[22]),
        .I3(sext_op[0]),
        .O(ext[9]));
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
