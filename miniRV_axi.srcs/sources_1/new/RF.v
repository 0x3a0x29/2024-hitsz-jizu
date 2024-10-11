// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Apr 18 17:15:17 2024
// Host        : 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim E:/miniRV_axi/miniRV_axi.srcs/sources_1/new/RF.v
// Design      : RF
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module RF
   (clk_i,
    rR1_i,
    rR2_i,
    wR_i,
    wD_i,
    rf_we_i,
    rD1_o,
    rD2_o);
  input clk_i;
  input [4:0]rR1_i;
  input [4:0]rR2_i;
  input [4:0]wR_i;
  input [31:0]wD_i;
  input rf_we_i;
  output [31:0]rD1_o;
  output [31:0]rD2_o;

  wire clk_i;
  wire p_0_in;
  wire [31:0]rD1_o;
  wire [31:0]rD1_o1;
  wire [31:0]rD2_o;
  wire [31:0]rD2_o1;
  wire [4:0]rR1_i;
  wire [4:0]rR2_i;
  wire rf_we_i;
  wire [31:0]wD_i;
  wire [4:0]wR_i;
  wire [1:0]NLW_regs_reg_r1_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_regs_reg_r1_0_31_12_17_DOD_UNCONNECTED;
  wire [1:0]NLW_regs_reg_r1_0_31_18_23_DOD_UNCONNECTED;
  wire [1:0]NLW_regs_reg_r1_0_31_24_29_DOD_UNCONNECTED;
  wire [1:0]NLW_regs_reg_r1_0_31_30_31_DOB_UNCONNECTED;
  wire [1:0]NLW_regs_reg_r1_0_31_30_31_DOC_UNCONNECTED;
  wire [1:0]NLW_regs_reg_r1_0_31_30_31_DOD_UNCONNECTED;
  wire [1:0]NLW_regs_reg_r1_0_31_6_11_DOD_UNCONNECTED;
  wire [1:0]NLW_regs_reg_r2_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_regs_reg_r2_0_31_12_17_DOD_UNCONNECTED;
  wire [1:0]NLW_regs_reg_r2_0_31_18_23_DOD_UNCONNECTED;
  wire [1:0]NLW_regs_reg_r2_0_31_24_29_DOD_UNCONNECTED;
  wire [1:0]NLW_regs_reg_r2_0_31_30_31_DOB_UNCONNECTED;
  wire [1:0]NLW_regs_reg_r2_0_31_30_31_DOC_UNCONNECTED;
  wire [1:0]NLW_regs_reg_r2_0_31_30_31_DOD_UNCONNECTED;
  wire [1:0]NLW_regs_reg_r2_0_31_6_11_DOD_UNCONNECTED;

  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[0]_INST_0 
       (.I0(rD1_o1[0]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[0]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[10]_INST_0 
       (.I0(rD1_o1[10]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[10]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[11]_INST_0 
       (.I0(rD1_o1[11]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[11]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[12]_INST_0 
       (.I0(rD1_o1[12]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[12]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[13]_INST_0 
       (.I0(rD1_o1[13]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[13]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[14]_INST_0 
       (.I0(rD1_o1[14]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[14]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[15]_INST_0 
       (.I0(rD1_o1[15]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[15]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[16]_INST_0 
       (.I0(rD1_o1[16]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[16]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[17]_INST_0 
       (.I0(rD1_o1[17]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[17]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[18]_INST_0 
       (.I0(rD1_o1[18]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[18]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[19]_INST_0 
       (.I0(rD1_o1[19]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[19]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[1]_INST_0 
       (.I0(rD1_o1[1]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[1]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[20]_INST_0 
       (.I0(rD1_o1[20]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[20]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[21]_INST_0 
       (.I0(rD1_o1[21]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[21]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[22]_INST_0 
       (.I0(rD1_o1[22]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[22]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[23]_INST_0 
       (.I0(rD1_o1[23]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[23]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[24]_INST_0 
       (.I0(rD1_o1[24]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[24]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[25]_INST_0 
       (.I0(rD1_o1[25]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[25]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[26]_INST_0 
       (.I0(rD1_o1[26]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[26]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[27]_INST_0 
       (.I0(rD1_o1[27]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[27]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[28]_INST_0 
       (.I0(rD1_o1[28]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[28]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[29]_INST_0 
       (.I0(rD1_o1[29]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[29]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[2]_INST_0 
       (.I0(rD1_o1[2]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[2]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[30]_INST_0 
       (.I0(rD1_o1[30]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[30]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[31]_INST_0 
       (.I0(rD1_o1[31]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[31]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[3]_INST_0 
       (.I0(rD1_o1[3]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[3]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[4]_INST_0 
       (.I0(rD1_o1[4]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[4]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[5]_INST_0 
       (.I0(rD1_o1[5]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[5]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[6]_INST_0 
       (.I0(rD1_o1[6]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[6]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[7]_INST_0 
       (.I0(rD1_o1[7]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[7]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[8]_INST_0 
       (.I0(rD1_o1[8]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[8]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD1_o[9]_INST_0 
       (.I0(rD1_o1[9]),
        .I1(rR1_i[2]),
        .I2(rR1_i[1]),
        .I3(rR1_i[0]),
        .I4(rR1_i[4]),
        .I5(rR1_i[3]),
        .O(rD1_o[9]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[0]_INST_0 
       (.I0(rD2_o1[0]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[0]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[10]_INST_0 
       (.I0(rD2_o1[10]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[10]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[11]_INST_0 
       (.I0(rD2_o1[11]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[11]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[12]_INST_0 
       (.I0(rD2_o1[12]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[12]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[13]_INST_0 
       (.I0(rD2_o1[13]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[13]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[14]_INST_0 
       (.I0(rD2_o1[14]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[14]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[15]_INST_0 
       (.I0(rD2_o1[15]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[15]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[16]_INST_0 
       (.I0(rD2_o1[16]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[16]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[17]_INST_0 
       (.I0(rD2_o1[17]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[17]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[18]_INST_0 
       (.I0(rD2_o1[18]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[18]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[19]_INST_0 
       (.I0(rD2_o1[19]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[19]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[1]_INST_0 
       (.I0(rD2_o1[1]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[1]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[20]_INST_0 
       (.I0(rD2_o1[20]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[20]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[21]_INST_0 
       (.I0(rD2_o1[21]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[21]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[22]_INST_0 
       (.I0(rD2_o1[22]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[22]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[23]_INST_0 
       (.I0(rD2_o1[23]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[23]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[24]_INST_0 
       (.I0(rD2_o1[24]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[24]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[25]_INST_0 
       (.I0(rD2_o1[25]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[25]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[26]_INST_0 
       (.I0(rD2_o1[26]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[26]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[27]_INST_0 
       (.I0(rD2_o1[27]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[27]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[28]_INST_0 
       (.I0(rD2_o1[28]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[28]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[29]_INST_0 
       (.I0(rD2_o1[29]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[29]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[2]_INST_0 
       (.I0(rD2_o1[2]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[2]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[30]_INST_0 
       (.I0(rD2_o1[30]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[30]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[31]_INST_0 
       (.I0(rD2_o1[31]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[31]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[3]_INST_0 
       (.I0(rD2_o1[3]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[3]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[4]_INST_0 
       (.I0(rD2_o1[4]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[4]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[5]_INST_0 
       (.I0(rD2_o1[5]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[5]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[6]_INST_0 
       (.I0(rD2_o1[6]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[6]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[7]_INST_0 
       (.I0(rD2_o1[7]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[7]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[8]_INST_0 
       (.I0(rD2_o1[8]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[8]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \rD2_o[9]_INST_0 
       (.I0(rD2_o1[9]),
        .I1(rR2_i[2]),
        .I2(rR2_i[1]),
        .I3(rR2_i[0]),
        .I4(rR2_i[4]),
        .I5(rR2_i[3]),
        .O(rD2_o[9]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "1" *) 
  (* ram_addr_end = "31" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    regs_reg_r1_0_31_0_5
       (.ADDRA(rR1_i),
        .ADDRB(rR1_i),
        .ADDRC(rR1_i),
        .ADDRD(wR_i),
        .DIA(wD_i[1:0]),
        .DIB(wD_i[3:2]),
        .DIC(wD_i[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(rD1_o1[1:0]),
        .DOB(rD1_o1[3:2]),
        .DOC(rD1_o1[5:4]),
        .DOD(NLW_regs_reg_r1_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i),
        .WE(p_0_in));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    regs_reg_r1_0_31_0_5_i_1
       (.I0(rf_we_i),
        .I1(wR_i[2]),
        .I2(wR_i[4]),
        .I3(wR_i[0]),
        .I4(wR_i[1]),
        .I5(wR_i[3]),
        .O(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "1" *) 
  (* ram_addr_end = "31" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "17" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    regs_reg_r1_0_31_12_17
       (.ADDRA(rR1_i),
        .ADDRB(rR1_i),
        .ADDRC(rR1_i),
        .ADDRD(wR_i),
        .DIA(wD_i[13:12]),
        .DIB(wD_i[15:14]),
        .DIC(wD_i[17:16]),
        .DID({1'b0,1'b0}),
        .DOA(rD1_o1[13:12]),
        .DOB(rD1_o1[15:14]),
        .DOC(rD1_o1[17:16]),
        .DOD(NLW_regs_reg_r1_0_31_12_17_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "1" *) 
  (* ram_addr_end = "31" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "23" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    regs_reg_r1_0_31_18_23
       (.ADDRA(rR1_i),
        .ADDRB(rR1_i),
        .ADDRC(rR1_i),
        .ADDRD(wR_i),
        .DIA(wD_i[19:18]),
        .DIB(wD_i[21:20]),
        .DIC(wD_i[23:22]),
        .DID({1'b0,1'b0}),
        .DOA(rD1_o1[19:18]),
        .DOB(rD1_o1[21:20]),
        .DOC(rD1_o1[23:22]),
        .DOD(NLW_regs_reg_r1_0_31_18_23_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "1" *) 
  (* ram_addr_end = "31" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "29" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    regs_reg_r1_0_31_24_29
       (.ADDRA(rR1_i),
        .ADDRB(rR1_i),
        .ADDRC(rR1_i),
        .ADDRD(wR_i),
        .DIA(wD_i[25:24]),
        .DIB(wD_i[27:26]),
        .DIC(wD_i[29:28]),
        .DID({1'b0,1'b0}),
        .DOA(rD1_o1[25:24]),
        .DOB(rD1_o1[27:26]),
        .DOC(rD1_o1[29:28]),
        .DOD(NLW_regs_reg_r1_0_31_24_29_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "1" *) 
  (* ram_addr_end = "31" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    regs_reg_r1_0_31_30_31
       (.ADDRA(rR1_i),
        .ADDRB(rR1_i),
        .ADDRC(rR1_i),
        .ADDRD(wR_i),
        .DIA(wD_i[31:30]),
        .DIB({1'b0,1'b0}),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA(rD1_o1[31:30]),
        .DOB(NLW_regs_reg_r1_0_31_30_31_DOB_UNCONNECTED[1:0]),
        .DOC(NLW_regs_reg_r1_0_31_30_31_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_regs_reg_r1_0_31_30_31_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "1" *) 
  (* ram_addr_end = "31" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "11" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    regs_reg_r1_0_31_6_11
       (.ADDRA(rR1_i),
        .ADDRB(rR1_i),
        .ADDRC(rR1_i),
        .ADDRD(wR_i),
        .DIA(wD_i[7:6]),
        .DIB(wD_i[9:8]),
        .DIC(wD_i[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(rD1_o1[7:6]),
        .DOB(rD1_o1[9:8]),
        .DOC(rD1_o1[11:10]),
        .DOD(NLW_regs_reg_r1_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "1" *) 
  (* ram_addr_end = "31" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    regs_reg_r2_0_31_0_5
       (.ADDRA(rR2_i),
        .ADDRB(rR2_i),
        .ADDRC(rR2_i),
        .ADDRD(wR_i),
        .DIA(wD_i[1:0]),
        .DIB(wD_i[3:2]),
        .DIC(wD_i[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(rD2_o1[1:0]),
        .DOB(rD2_o1[3:2]),
        .DOC(rD2_o1[5:4]),
        .DOD(NLW_regs_reg_r2_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "1" *) 
  (* ram_addr_end = "31" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "17" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    regs_reg_r2_0_31_12_17
       (.ADDRA(rR2_i),
        .ADDRB(rR2_i),
        .ADDRC(rR2_i),
        .ADDRD(wR_i),
        .DIA(wD_i[13:12]),
        .DIB(wD_i[15:14]),
        .DIC(wD_i[17:16]),
        .DID({1'b0,1'b0}),
        .DOA(rD2_o1[13:12]),
        .DOB(rD2_o1[15:14]),
        .DOC(rD2_o1[17:16]),
        .DOD(NLW_regs_reg_r2_0_31_12_17_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "1" *) 
  (* ram_addr_end = "31" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "23" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    regs_reg_r2_0_31_18_23
       (.ADDRA(rR2_i),
        .ADDRB(rR2_i),
        .ADDRC(rR2_i),
        .ADDRD(wR_i),
        .DIA(wD_i[19:18]),
        .DIB(wD_i[21:20]),
        .DIC(wD_i[23:22]),
        .DID({1'b0,1'b0}),
        .DOA(rD2_o1[19:18]),
        .DOB(rD2_o1[21:20]),
        .DOC(rD2_o1[23:22]),
        .DOD(NLW_regs_reg_r2_0_31_18_23_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "1" *) 
  (* ram_addr_end = "31" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "29" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    regs_reg_r2_0_31_24_29
       (.ADDRA(rR2_i),
        .ADDRB(rR2_i),
        .ADDRC(rR2_i),
        .ADDRD(wR_i),
        .DIA(wD_i[25:24]),
        .DIB(wD_i[27:26]),
        .DIC(wD_i[29:28]),
        .DID({1'b0,1'b0}),
        .DOA(rD2_o1[25:24]),
        .DOB(rD2_o1[27:26]),
        .DOC(rD2_o1[29:28]),
        .DOD(NLW_regs_reg_r2_0_31_24_29_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "1" *) 
  (* ram_addr_end = "31" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    regs_reg_r2_0_31_30_31
       (.ADDRA(rR2_i),
        .ADDRB(rR2_i),
        .ADDRC(rR2_i),
        .ADDRD(wR_i),
        .DIA(wD_i[31:30]),
        .DIB({1'b0,1'b0}),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA(rD2_o1[31:30]),
        .DOB(NLW_regs_reg_r2_0_31_30_31_DOB_UNCONNECTED[1:0]),
        .DOC(NLW_regs_reg_r2_0_31_30_31_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_regs_reg_r2_0_31_30_31_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "1" *) 
  (* ram_addr_end = "31" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "11" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    regs_reg_r2_0_31_6_11
       (.ADDRA(rR2_i),
        .ADDRB(rR2_i),
        .ADDRC(rR2_i),
        .ADDRD(wR_i),
        .DIA(wD_i[7:6]),
        .DIB(wD_i[9:8]),
        .DIC(wD_i[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(rD2_o1[7:6]),
        .DOB(rD2_o1[9:8]),
        .DOC(rD2_o1[11:10]),
        .DOD(NLW_regs_reg_r2_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i),
        .WE(p_0_in));
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
