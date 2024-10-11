// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Apr 25 11:08:01 2024
// Host        : ZMJ-miniPC running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim Ctrl.v
// Design      : Ctrl
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module Ctrl
   (funct7,
    funct3,
    opcode,
    npc_op,
    rf_we,
    wd_sel,
    sext_op,
    alu_op,
    alua_sel,
    alub_sel,
    branch,
    dram_we,
    mul_div);
  input [6:0]funct7;
  input [2:0]funct3;
  input [6:0]opcode;
  output npc_op;
  output rf_we;
  output [1:0]wd_sel;
  output [2:0]sext_op;
  output [3:0]alu_op;
  output alua_sel;
  output alub_sel;
  output [2:0]branch;
  output dram_we;
  output mul_div;

  wire [3:0]alu_op;
  wire \alu_op[0]_INST_0_i_1_n_0 ;
  wire \alu_op[0]_INST_0_i_2_n_0 ;
  wire \alu_op[0]_INST_0_i_3_n_0 ;
  wire \alu_op[0]_INST_0_i_4_n_0 ;
  wire \alu_op[1]_INST_0_i_1_n_0 ;
  wire \alu_op[1]_INST_0_i_2_n_0 ;
  wire \alu_op[1]_INST_0_i_3_n_0 ;
  wire \alu_op[2]_INST_0_i_1_n_0 ;
  wire \alu_op[3]_INST_0_i_1_n_0 ;
  wire \alu_op[3]_INST_0_i_2_n_0 ;
  wire \alu_op[3]_INST_0_i_4_n_0 ;
  wire alub_sel;
  wire [2:0]branch;
  wire [2:2]data3;
  wire dram_we;
  wire [2:0]funct3;
  wire [6:0]funct7;
  wire mul_div;
  wire npc_op;
  wire [6:0]opcode;
  wire rf_we;
  wire [2:0]sext_op;
  wire [1:0]wd_sel;
  wire \wd_sel[1]_INST_0_i_1_n_0 ;

  assign alua_sel = sext_op[2];
  LUT6 #(
    .INIT(64'hFFFFFFFF55450000)) 
    \alu_op[0]_INST_0 
       (.I0(\alu_op[0]_INST_0_i_1_n_0 ),
        .I1(\alu_op[0]_INST_0_i_2_n_0 ),
        .I2(opcode[5]),
        .I3(opcode[2]),
        .I4(\alu_op[1]_INST_0_i_1_n_0 ),
        .I5(\alu_op[0]_INST_0_i_3_n_0 ),
        .O(alu_op[0]));
  LUT6 #(
    .INIT(64'h00000000FAFFBFAF)) 
    \alu_op[0]_INST_0_i_1 
       (.I0(opcode[2]),
        .I1(funct7[5]),
        .I2(funct3[0]),
        .I3(funct3[2]),
        .I4(funct3[1]),
        .I5(opcode[5]),
        .O(\alu_op[0]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000FEFFFF000002)) 
    \alu_op[0]_INST_0_i_2 
       (.I0(funct7[5]),
        .I1(\alu_op[0]_INST_0_i_4_n_0 ),
        .I2(funct7[0]),
        .I3(funct3[2]),
        .I4(funct3[1]),
        .I5(funct3[0]),
        .O(\alu_op[0]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000020000)) 
    \alu_op[0]_INST_0_i_3 
       (.I0(opcode[5]),
        .I1(opcode[3]),
        .I2(opcode[2]),
        .I3(opcode[4]),
        .I4(opcode[6]),
        .I5(\wd_sel[1]_INST_0_i_1_n_0 ),
        .O(\alu_op[0]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \alu_op[0]_INST_0_i_4 
       (.I0(funct7[2]),
        .I1(funct7[3]),
        .I2(funct7[6]),
        .I3(funct7[4]),
        .I4(funct7[1]),
        .O(\alu_op[0]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA88888808)) 
    \alu_op[1]_INST_0 
       (.I0(\alu_op[1]_INST_0_i_1_n_0 ),
        .I1(\alu_op[1]_INST_0_i_2_n_0 ),
        .I2(data3),
        .I3(funct3[0]),
        .I4(funct3[1]),
        .I5(\alu_op[1]_INST_0_i_3_n_0 ),
        .O(alu_op[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000800)) 
    \alu_op[1]_INST_0_i_1 
       (.I0(opcode[1]),
        .I1(opcode[0]),
        .I2(opcode[6]),
        .I3(opcode[4]),
        .I4(opcode[3]),
        .O(\alu_op[1]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \alu_op[1]_INST_0_i_2 
       (.I0(opcode[5]),
        .I1(funct3[2]),
        .O(\alu_op[1]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFF0000E0)) 
    \alu_op[1]_INST_0_i_3 
       (.I0(funct3[1]),
        .I1(funct3[0]),
        .I2(funct3[2]),
        .I3(opcode[5]),
        .I4(opcode[2]),
        .O(\alu_op[1]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000AA8800008A08)) 
    \alu_op[2]_INST_0 
       (.I0(\alu_op[2]_INST_0_i_1_n_0 ),
        .I1(funct3[2]),
        .I2(opcode[5]),
        .I3(funct3[0]),
        .I4(funct3[1]),
        .I5(data3),
        .O(alu_op[2]));
  LUT6 #(
    .INIT(64'h0000100000000000)) 
    \alu_op[2]_INST_0_i_1 
       (.I0(opcode[3]),
        .I1(opcode[2]),
        .I2(opcode[1]),
        .I3(opcode[0]),
        .I4(opcode[6]),
        .I5(opcode[4]),
        .O(\alu_op[2]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000044404)) 
    \alu_op[3]_INST_0 
       (.I0(\alu_op[3]_INST_0_i_1_n_0 ),
        .I1(\alu_op[3]_INST_0_i_2_n_0 ),
        .I2(funct3[1]),
        .I3(funct3[2]),
        .I4(funct3[0]),
        .I5(data3),
        .O(alu_op[3]));
  LUT3 #(
    .INIT(8'hFD)) 
    \alu_op[3]_INST_0_i_1 
       (.I0(opcode[5]),
        .I1(opcode[3]),
        .I2(opcode[2]),
        .O(\alu_op[3]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \alu_op[3]_INST_0_i_2 
       (.I0(opcode[4]),
        .I1(opcode[6]),
        .I2(opcode[0]),
        .I3(opcode[1]),
        .O(\alu_op[3]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \alu_op[3]_INST_0_i_3 
       (.I0(\alu_op[3]_INST_0_i_4_n_0 ),
        .I1(funct7[0]),
        .O(data3));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \alu_op[3]_INST_0_i_4 
       (.I0(funct7[1]),
        .I1(funct7[4]),
        .I2(funct7[6]),
        .I3(funct7[3]),
        .I4(funct7[2]),
        .I5(funct7[5]),
        .O(\alu_op[3]_INST_0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    alua_sel_INST_0
       (.I0(opcode[2]),
        .I1(opcode[5]),
        .I2(opcode[3]),
        .I3(opcode[6]),
        .I4(opcode[4]),
        .I5(\wd_sel[1]_INST_0_i_1_n_0 ),
        .O(sext_op[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFDFFFDFFFF)) 
    alub_sel_INST_0
       (.I0(opcode[5]),
        .I1(opcode[3]),
        .I2(opcode[2]),
        .I3(\wd_sel[1]_INST_0_i_1_n_0 ),
        .I4(opcode[4]),
        .I5(opcode[6]),
        .O(alub_sel));
  LUT2 #(
    .INIT(4'h2)) 
    \branch[0]_INST_0 
       (.I0(\alu_op[0]_INST_0_i_3_n_0 ),
        .I1(funct3[1]),
        .O(branch[0]));
  LUT3 #(
    .INIT(8'h40)) 
    \branch[1]_INST_0 
       (.I0(funct3[1]),
        .I1(funct3[2]),
        .I2(\alu_op[0]_INST_0_i_3_n_0 ),
        .O(branch[1]));
  LUT3 #(
    .INIT(8'h20)) 
    \branch[2]_INST_0 
       (.I0(\alu_op[0]_INST_0_i_3_n_0 ),
        .I1(funct3[1]),
        .I2(funct3[0]),
        .O(branch[2]));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    dram_we_INST_0
       (.I0(opcode[4]),
        .I1(\wd_sel[1]_INST_0_i_1_n_0 ),
        .I2(opcode[2]),
        .I3(opcode[3]),
        .I4(opcode[5]),
        .I5(opcode[6]),
        .O(dram_we));
  LUT6 #(
    .INIT(64'h000000000000202A)) 
    mul_div_INST_0
       (.I0(\alu_op[3]_INST_0_i_2_n_0 ),
        .I1(funct3[0]),
        .I2(funct3[2]),
        .I3(funct3[1]),
        .I4(\alu_op[3]_INST_0_i_1_n_0 ),
        .I5(data3),
        .O(mul_div));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    npc_op_INST_0
       (.I0(opcode[4]),
        .I1(opcode[6]),
        .I2(opcode[1]),
        .I3(opcode[0]),
        .I4(opcode[5]),
        .I5(opcode[2]),
        .O(npc_op));
  LUT6 #(
    .INIT(64'hFFFFFFFFFDFFFFFF)) 
    rf_we_INST_0
       (.I0(opcode[5]),
        .I1(opcode[3]),
        .I2(opcode[2]),
        .I3(opcode[1]),
        .I4(opcode[0]),
        .I5(opcode[4]),
        .O(rf_we));
  LUT6 #(
    .INIT(64'h0000040000000004)) 
    \sext_op[0]_INST_0 
       (.I0(opcode[6]),
        .I1(opcode[5]),
        .I2(opcode[3]),
        .I3(opcode[2]),
        .I4(\wd_sel[1]_INST_0_i_1_n_0 ),
        .I5(opcode[4]),
        .O(sext_op[0]));
  LUT6 #(
    .INIT(64'h0000100400000000)) 
    \sext_op[1]_INST_0 
       (.I0(\wd_sel[1]_INST_0_i_1_n_0 ),
        .I1(opcode[6]),
        .I2(opcode[4]),
        .I3(opcode[2]),
        .I4(opcode[3]),
        .I5(opcode[5]),
        .O(sext_op[1]));
  LUT6 #(
    .INIT(64'h0000040000000001)) 
    \wd_sel[0]_INST_0 
       (.I0(\wd_sel[1]_INST_0_i_1_n_0 ),
        .I1(opcode[2]),
        .I2(opcode[3]),
        .I3(opcode[4]),
        .I4(opcode[6]),
        .I5(opcode[5]),
        .O(wd_sel[0]));
  LUT6 #(
    .INIT(64'h0400000006000000)) 
    \wd_sel[1]_INST_0 
       (.I0(opcode[4]),
        .I1(opcode[6]),
        .I2(\wd_sel[1]_INST_0_i_1_n_0 ),
        .I3(opcode[2]),
        .I4(opcode[5]),
        .I5(opcode[3]),
        .O(wd_sel[1]));
  LUT2 #(
    .INIT(4'h7)) 
    \wd_sel[1]_INST_0_i_1 
       (.I0(opcode[1]),
        .I1(opcode[0]),
        .O(\wd_sel[1]_INST_0_i_1_n_0 ));
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
