// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Apr 18 17:16:29 2024
// Host        : 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim E:/miniRV_axi/miniRV_axi.srcs/sources_1/new/NPC.v
// Design      : NPC
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module NPC
   (pc_i,
    imm_i,
    alu_c_i,
    npc_op_i,
    Branch_i,
    npc_o,
    pc4_o);
  input [31:0]pc_i;
  input [31:0]imm_i;
  input [31:0]alu_c_i;
  input npc_op_i;
  input Branch_i;
  output [31:0]npc_o;
  output [31:0]pc4_o;

  wire Branch_i;
  wire [31:0]alu_c_i;
  wire [31:0]imm_i;
  wire [31:0]npc_o;
  wire npc_op_i;
  wire [31:0]pc4_o;
  wire \pc4_o[0]_INST_0_i_1_n_0 ;
  wire \pc4_o[0]_INST_0_i_2_n_0 ;
  wire \pc4_o[0]_INST_0_i_3_n_0 ;
  wire \pc4_o[0]_INST_0_i_4_n_0 ;
  wire \pc4_o[0]_INST_0_n_0 ;
  wire \pc4_o[0]_INST_0_n_1 ;
  wire \pc4_o[0]_INST_0_n_2 ;
  wire \pc4_o[0]_INST_0_n_3 ;
  wire \pc4_o[12]_INST_0_i_1_n_0 ;
  wire \pc4_o[12]_INST_0_i_2_n_0 ;
  wire \pc4_o[12]_INST_0_i_3_n_0 ;
  wire \pc4_o[12]_INST_0_i_4_n_0 ;
  wire \pc4_o[12]_INST_0_n_0 ;
  wire \pc4_o[12]_INST_0_n_1 ;
  wire \pc4_o[12]_INST_0_n_2 ;
  wire \pc4_o[12]_INST_0_n_3 ;
  wire \pc4_o[16]_INST_0_i_1_n_0 ;
  wire \pc4_o[16]_INST_0_i_2_n_0 ;
  wire \pc4_o[16]_INST_0_i_3_n_0 ;
  wire \pc4_o[16]_INST_0_i_4_n_0 ;
  wire \pc4_o[16]_INST_0_n_0 ;
  wire \pc4_o[16]_INST_0_n_1 ;
  wire \pc4_o[16]_INST_0_n_2 ;
  wire \pc4_o[16]_INST_0_n_3 ;
  wire \pc4_o[20]_INST_0_i_1_n_0 ;
  wire \pc4_o[20]_INST_0_i_2_n_0 ;
  wire \pc4_o[20]_INST_0_i_3_n_0 ;
  wire \pc4_o[20]_INST_0_i_4_n_0 ;
  wire \pc4_o[20]_INST_0_n_0 ;
  wire \pc4_o[20]_INST_0_n_1 ;
  wire \pc4_o[20]_INST_0_n_2 ;
  wire \pc4_o[20]_INST_0_n_3 ;
  wire \pc4_o[24]_INST_0_i_1_n_0 ;
  wire \pc4_o[24]_INST_0_i_2_n_0 ;
  wire \pc4_o[24]_INST_0_i_3_n_0 ;
  wire \pc4_o[24]_INST_0_i_4_n_0 ;
  wire \pc4_o[24]_INST_0_n_0 ;
  wire \pc4_o[24]_INST_0_n_1 ;
  wire \pc4_o[24]_INST_0_n_2 ;
  wire \pc4_o[24]_INST_0_n_3 ;
  wire \pc4_o[28]_INST_0_i_1_n_0 ;
  wire \pc4_o[28]_INST_0_i_2_n_0 ;
  wire \pc4_o[28]_INST_0_i_3_n_0 ;
  wire \pc4_o[28]_INST_0_i_4_n_0 ;
  wire \pc4_o[28]_INST_0_n_1 ;
  wire \pc4_o[28]_INST_0_n_2 ;
  wire \pc4_o[28]_INST_0_n_3 ;
  wire \pc4_o[4]_INST_0_i_1_n_0 ;
  wire \pc4_o[4]_INST_0_i_2_n_0 ;
  wire \pc4_o[4]_INST_0_i_3_n_0 ;
  wire \pc4_o[4]_INST_0_i_4_n_0 ;
  wire \pc4_o[4]_INST_0_n_0 ;
  wire \pc4_o[4]_INST_0_n_1 ;
  wire \pc4_o[4]_INST_0_n_2 ;
  wire \pc4_o[4]_INST_0_n_3 ;
  wire \pc4_o[8]_INST_0_i_1_n_0 ;
  wire \pc4_o[8]_INST_0_i_2_n_0 ;
  wire \pc4_o[8]_INST_0_i_3_n_0 ;
  wire \pc4_o[8]_INST_0_i_4_n_0 ;
  wire \pc4_o[8]_INST_0_n_0 ;
  wire \pc4_o[8]_INST_0_n_1 ;
  wire \pc4_o[8]_INST_0_n_2 ;
  wire \pc4_o[8]_INST_0_n_3 ;
  wire [31:0]pc_i;
  wire [3:3]\NLW_pc4_o[28]_INST_0_CO_UNCONNECTED ;

  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[0]_INST_0 
       (.I0(alu_c_i[0]),
        .I1(pc4_o[0]),
        .I2(npc_op_i),
        .O(npc_o[0]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[10]_INST_0 
       (.I0(alu_c_i[10]),
        .I1(pc4_o[10]),
        .I2(npc_op_i),
        .O(npc_o[10]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[11]_INST_0 
       (.I0(alu_c_i[11]),
        .I1(pc4_o[11]),
        .I2(npc_op_i),
        .O(npc_o[11]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[12]_INST_0 
       (.I0(alu_c_i[12]),
        .I1(pc4_o[12]),
        .I2(npc_op_i),
        .O(npc_o[12]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[13]_INST_0 
       (.I0(alu_c_i[13]),
        .I1(pc4_o[13]),
        .I2(npc_op_i),
        .O(npc_o[13]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[14]_INST_0 
       (.I0(alu_c_i[14]),
        .I1(pc4_o[14]),
        .I2(npc_op_i),
        .O(npc_o[14]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[15]_INST_0 
       (.I0(alu_c_i[15]),
        .I1(pc4_o[15]),
        .I2(npc_op_i),
        .O(npc_o[15]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[16]_INST_0 
       (.I0(alu_c_i[16]),
        .I1(pc4_o[16]),
        .I2(npc_op_i),
        .O(npc_o[16]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[17]_INST_0 
       (.I0(alu_c_i[17]),
        .I1(pc4_o[17]),
        .I2(npc_op_i),
        .O(npc_o[17]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[18]_INST_0 
       (.I0(alu_c_i[18]),
        .I1(pc4_o[18]),
        .I2(npc_op_i),
        .O(npc_o[18]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[19]_INST_0 
       (.I0(alu_c_i[19]),
        .I1(pc4_o[19]),
        .I2(npc_op_i),
        .O(npc_o[19]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[1]_INST_0 
       (.I0(alu_c_i[1]),
        .I1(pc4_o[1]),
        .I2(npc_op_i),
        .O(npc_o[1]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[20]_INST_0 
       (.I0(alu_c_i[20]),
        .I1(pc4_o[20]),
        .I2(npc_op_i),
        .O(npc_o[20]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[21]_INST_0 
       (.I0(alu_c_i[21]),
        .I1(pc4_o[21]),
        .I2(npc_op_i),
        .O(npc_o[21]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[22]_INST_0 
       (.I0(alu_c_i[22]),
        .I1(pc4_o[22]),
        .I2(npc_op_i),
        .O(npc_o[22]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[23]_INST_0 
       (.I0(alu_c_i[23]),
        .I1(pc4_o[23]),
        .I2(npc_op_i),
        .O(npc_o[23]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[24]_INST_0 
       (.I0(alu_c_i[24]),
        .I1(pc4_o[24]),
        .I2(npc_op_i),
        .O(npc_o[24]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[25]_INST_0 
       (.I0(alu_c_i[25]),
        .I1(pc4_o[25]),
        .I2(npc_op_i),
        .O(npc_o[25]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[26]_INST_0 
       (.I0(alu_c_i[26]),
        .I1(pc4_o[26]),
        .I2(npc_op_i),
        .O(npc_o[26]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[27]_INST_0 
       (.I0(alu_c_i[27]),
        .I1(pc4_o[27]),
        .I2(npc_op_i),
        .O(npc_o[27]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[28]_INST_0 
       (.I0(alu_c_i[28]),
        .I1(pc4_o[28]),
        .I2(npc_op_i),
        .O(npc_o[28]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[29]_INST_0 
       (.I0(alu_c_i[29]),
        .I1(pc4_o[29]),
        .I2(npc_op_i),
        .O(npc_o[29]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[2]_INST_0 
       (.I0(alu_c_i[2]),
        .I1(pc4_o[2]),
        .I2(npc_op_i),
        .O(npc_o[2]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[30]_INST_0 
       (.I0(alu_c_i[30]),
        .I1(pc4_o[30]),
        .I2(npc_op_i),
        .O(npc_o[30]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[31]_INST_0 
       (.I0(alu_c_i[31]),
        .I1(pc4_o[31]),
        .I2(npc_op_i),
        .O(npc_o[31]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[3]_INST_0 
       (.I0(alu_c_i[3]),
        .I1(pc4_o[3]),
        .I2(npc_op_i),
        .O(npc_o[3]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[4]_INST_0 
       (.I0(alu_c_i[4]),
        .I1(pc4_o[4]),
        .I2(npc_op_i),
        .O(npc_o[4]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[5]_INST_0 
       (.I0(alu_c_i[5]),
        .I1(pc4_o[5]),
        .I2(npc_op_i),
        .O(npc_o[5]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[6]_INST_0 
       (.I0(alu_c_i[6]),
        .I1(pc4_o[6]),
        .I2(npc_op_i),
        .O(npc_o[6]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[7]_INST_0 
       (.I0(alu_c_i[7]),
        .I1(pc4_o[7]),
        .I2(npc_op_i),
        .O(npc_o[7]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[8]_INST_0 
       (.I0(alu_c_i[8]),
        .I1(pc4_o[8]),
        .I2(npc_op_i),
        .O(npc_o[8]));
  LUT3 #(
    .INIT(8'hAC)) 
    \npc_o[9]_INST_0 
       (.I0(alu_c_i[9]),
        .I1(pc4_o[9]),
        .I2(npc_op_i),
        .O(npc_o[9]));
  CARRY4 \pc4_o[0]_INST_0 
       (.CI(1'b0),
        .CO({\pc4_o[0]_INST_0_n_0 ,\pc4_o[0]_INST_0_n_1 ,\pc4_o[0]_INST_0_n_2 ,\pc4_o[0]_INST_0_n_3 }),
        .CYINIT(1'b0),
        .DI(pc_i[3:0]),
        .O(pc4_o[3:0]),
        .S({\pc4_o[0]_INST_0_i_1_n_0 ,\pc4_o[0]_INST_0_i_2_n_0 ,\pc4_o[0]_INST_0_i_3_n_0 ,\pc4_o[0]_INST_0_i_4_n_0 }));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[0]_INST_0_i_1 
       (.I0(pc_i[3]),
        .I1(imm_i[3]),
        .I2(Branch_i),
        .O(\pc4_o[0]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h59)) 
    \pc4_o[0]_INST_0_i_2 
       (.I0(pc_i[2]),
        .I1(Branch_i),
        .I2(imm_i[2]),
        .O(\pc4_o[0]_INST_0_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[0]_INST_0_i_3 
       (.I0(pc_i[1]),
        .I1(imm_i[1]),
        .I2(Branch_i),
        .O(\pc4_o[0]_INST_0_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[0]_INST_0_i_4 
       (.I0(pc_i[0]),
        .I1(imm_i[0]),
        .I2(Branch_i),
        .O(\pc4_o[0]_INST_0_i_4_n_0 ));
  CARRY4 \pc4_o[12]_INST_0 
       (.CI(\pc4_o[8]_INST_0_n_0 ),
        .CO({\pc4_o[12]_INST_0_n_0 ,\pc4_o[12]_INST_0_n_1 ,\pc4_o[12]_INST_0_n_2 ,\pc4_o[12]_INST_0_n_3 }),
        .CYINIT(1'b0),
        .DI(pc_i[15:12]),
        .O(pc4_o[15:12]),
        .S({\pc4_o[12]_INST_0_i_1_n_0 ,\pc4_o[12]_INST_0_i_2_n_0 ,\pc4_o[12]_INST_0_i_3_n_0 ,\pc4_o[12]_INST_0_i_4_n_0 }));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[12]_INST_0_i_1 
       (.I0(pc_i[15]),
        .I1(imm_i[15]),
        .I2(Branch_i),
        .O(\pc4_o[12]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[12]_INST_0_i_2 
       (.I0(pc_i[14]),
        .I1(imm_i[14]),
        .I2(Branch_i),
        .O(\pc4_o[12]_INST_0_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[12]_INST_0_i_3 
       (.I0(pc_i[13]),
        .I1(imm_i[13]),
        .I2(Branch_i),
        .O(\pc4_o[12]_INST_0_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[12]_INST_0_i_4 
       (.I0(pc_i[12]),
        .I1(imm_i[12]),
        .I2(Branch_i),
        .O(\pc4_o[12]_INST_0_i_4_n_0 ));
  CARRY4 \pc4_o[16]_INST_0 
       (.CI(\pc4_o[12]_INST_0_n_0 ),
        .CO({\pc4_o[16]_INST_0_n_0 ,\pc4_o[16]_INST_0_n_1 ,\pc4_o[16]_INST_0_n_2 ,\pc4_o[16]_INST_0_n_3 }),
        .CYINIT(1'b0),
        .DI(pc_i[19:16]),
        .O(pc4_o[19:16]),
        .S({\pc4_o[16]_INST_0_i_1_n_0 ,\pc4_o[16]_INST_0_i_2_n_0 ,\pc4_o[16]_INST_0_i_3_n_0 ,\pc4_o[16]_INST_0_i_4_n_0 }));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[16]_INST_0_i_1 
       (.I0(pc_i[19]),
        .I1(imm_i[19]),
        .I2(Branch_i),
        .O(\pc4_o[16]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[16]_INST_0_i_2 
       (.I0(pc_i[18]),
        .I1(imm_i[18]),
        .I2(Branch_i),
        .O(\pc4_o[16]_INST_0_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[16]_INST_0_i_3 
       (.I0(pc_i[17]),
        .I1(imm_i[17]),
        .I2(Branch_i),
        .O(\pc4_o[16]_INST_0_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[16]_INST_0_i_4 
       (.I0(pc_i[16]),
        .I1(imm_i[16]),
        .I2(Branch_i),
        .O(\pc4_o[16]_INST_0_i_4_n_0 ));
  CARRY4 \pc4_o[20]_INST_0 
       (.CI(\pc4_o[16]_INST_0_n_0 ),
        .CO({\pc4_o[20]_INST_0_n_0 ,\pc4_o[20]_INST_0_n_1 ,\pc4_o[20]_INST_0_n_2 ,\pc4_o[20]_INST_0_n_3 }),
        .CYINIT(1'b0),
        .DI(pc_i[23:20]),
        .O(pc4_o[23:20]),
        .S({\pc4_o[20]_INST_0_i_1_n_0 ,\pc4_o[20]_INST_0_i_2_n_0 ,\pc4_o[20]_INST_0_i_3_n_0 ,\pc4_o[20]_INST_0_i_4_n_0 }));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[20]_INST_0_i_1 
       (.I0(pc_i[23]),
        .I1(imm_i[23]),
        .I2(Branch_i),
        .O(\pc4_o[20]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[20]_INST_0_i_2 
       (.I0(pc_i[22]),
        .I1(imm_i[22]),
        .I2(Branch_i),
        .O(\pc4_o[20]_INST_0_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[20]_INST_0_i_3 
       (.I0(pc_i[21]),
        .I1(imm_i[21]),
        .I2(Branch_i),
        .O(\pc4_o[20]_INST_0_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[20]_INST_0_i_4 
       (.I0(pc_i[20]),
        .I1(imm_i[20]),
        .I2(Branch_i),
        .O(\pc4_o[20]_INST_0_i_4_n_0 ));
  CARRY4 \pc4_o[24]_INST_0 
       (.CI(\pc4_o[20]_INST_0_n_0 ),
        .CO({\pc4_o[24]_INST_0_n_0 ,\pc4_o[24]_INST_0_n_1 ,\pc4_o[24]_INST_0_n_2 ,\pc4_o[24]_INST_0_n_3 }),
        .CYINIT(1'b0),
        .DI(pc_i[27:24]),
        .O(pc4_o[27:24]),
        .S({\pc4_o[24]_INST_0_i_1_n_0 ,\pc4_o[24]_INST_0_i_2_n_0 ,\pc4_o[24]_INST_0_i_3_n_0 ,\pc4_o[24]_INST_0_i_4_n_0 }));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[24]_INST_0_i_1 
       (.I0(pc_i[27]),
        .I1(imm_i[27]),
        .I2(Branch_i),
        .O(\pc4_o[24]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[24]_INST_0_i_2 
       (.I0(pc_i[26]),
        .I1(imm_i[26]),
        .I2(Branch_i),
        .O(\pc4_o[24]_INST_0_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[24]_INST_0_i_3 
       (.I0(pc_i[25]),
        .I1(imm_i[25]),
        .I2(Branch_i),
        .O(\pc4_o[24]_INST_0_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[24]_INST_0_i_4 
       (.I0(pc_i[24]),
        .I1(imm_i[24]),
        .I2(Branch_i),
        .O(\pc4_o[24]_INST_0_i_4_n_0 ));
  CARRY4 \pc4_o[28]_INST_0 
       (.CI(\pc4_o[24]_INST_0_n_0 ),
        .CO({\NLW_pc4_o[28]_INST_0_CO_UNCONNECTED [3],\pc4_o[28]_INST_0_n_1 ,\pc4_o[28]_INST_0_n_2 ,\pc4_o[28]_INST_0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,pc_i[30:28]}),
        .O(pc4_o[31:28]),
        .S({\pc4_o[28]_INST_0_i_1_n_0 ,\pc4_o[28]_INST_0_i_2_n_0 ,\pc4_o[28]_INST_0_i_3_n_0 ,\pc4_o[28]_INST_0_i_4_n_0 }));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[28]_INST_0_i_1 
       (.I0(pc_i[31]),
        .I1(imm_i[31]),
        .I2(Branch_i),
        .O(\pc4_o[28]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[28]_INST_0_i_2 
       (.I0(pc_i[30]),
        .I1(imm_i[30]),
        .I2(Branch_i),
        .O(\pc4_o[28]_INST_0_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[28]_INST_0_i_3 
       (.I0(pc_i[29]),
        .I1(imm_i[29]),
        .I2(Branch_i),
        .O(\pc4_o[28]_INST_0_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[28]_INST_0_i_4 
       (.I0(pc_i[28]),
        .I1(imm_i[28]),
        .I2(Branch_i),
        .O(\pc4_o[28]_INST_0_i_4_n_0 ));
  CARRY4 \pc4_o[4]_INST_0 
       (.CI(\pc4_o[0]_INST_0_n_0 ),
        .CO({\pc4_o[4]_INST_0_n_0 ,\pc4_o[4]_INST_0_n_1 ,\pc4_o[4]_INST_0_n_2 ,\pc4_o[4]_INST_0_n_3 }),
        .CYINIT(1'b0),
        .DI(pc_i[7:4]),
        .O(pc4_o[7:4]),
        .S({\pc4_o[4]_INST_0_i_1_n_0 ,\pc4_o[4]_INST_0_i_2_n_0 ,\pc4_o[4]_INST_0_i_3_n_0 ,\pc4_o[4]_INST_0_i_4_n_0 }));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[4]_INST_0_i_1 
       (.I0(pc_i[7]),
        .I1(imm_i[7]),
        .I2(Branch_i),
        .O(\pc4_o[4]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[4]_INST_0_i_2 
       (.I0(pc_i[6]),
        .I1(imm_i[6]),
        .I2(Branch_i),
        .O(\pc4_o[4]_INST_0_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[4]_INST_0_i_3 
       (.I0(pc_i[5]),
        .I1(imm_i[5]),
        .I2(Branch_i),
        .O(\pc4_o[4]_INST_0_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[4]_INST_0_i_4 
       (.I0(pc_i[4]),
        .I1(imm_i[4]),
        .I2(Branch_i),
        .O(\pc4_o[4]_INST_0_i_4_n_0 ));
  CARRY4 \pc4_o[8]_INST_0 
       (.CI(\pc4_o[4]_INST_0_n_0 ),
        .CO({\pc4_o[8]_INST_0_n_0 ,\pc4_o[8]_INST_0_n_1 ,\pc4_o[8]_INST_0_n_2 ,\pc4_o[8]_INST_0_n_3 }),
        .CYINIT(1'b0),
        .DI(pc_i[11:8]),
        .O(pc4_o[11:8]),
        .S({\pc4_o[8]_INST_0_i_1_n_0 ,\pc4_o[8]_INST_0_i_2_n_0 ,\pc4_o[8]_INST_0_i_3_n_0 ,\pc4_o[8]_INST_0_i_4_n_0 }));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[8]_INST_0_i_1 
       (.I0(pc_i[11]),
        .I1(imm_i[11]),
        .I2(Branch_i),
        .O(\pc4_o[8]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[8]_INST_0_i_2 
       (.I0(pc_i[10]),
        .I1(imm_i[10]),
        .I2(Branch_i),
        .O(\pc4_o[8]_INST_0_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[8]_INST_0_i_3 
       (.I0(pc_i[9]),
        .I1(imm_i[9]),
        .I2(Branch_i),
        .O(\pc4_o[8]_INST_0_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h6A)) 
    \pc4_o[8]_INST_0_i_4 
       (.I0(pc_i[8]),
        .I1(imm_i[8]),
        .I2(Branch_i),
        .O(\pc4_o[8]_INST_0_i_4_n_0 ));
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
