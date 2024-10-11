// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Apr 18 17:13:28 2024
// Host        : 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim E:/miniRV_axi/miniRV_axi.srcs/sources_1/new/if_wrap.v
// Design      : if_wrap
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* IF_IDLE = "2'b01" *) (* IF_READ = "2'b10" *) 
(* NotValidForBitStream *)
module if_wrap
   (clk_i,
    rst_i,
    finish_i,
    pc_i,
    valid_o,
    inst_o,
    inst_rreq,
    inst_addr,
    inst_valid,
    inst_i);
  input clk_i;
  input rst_i;
  input finish_i;
  input [31:0]pc_i;
  output valid_o;
  output [31:0]inst_o;
  output inst_rreq;
  output [31:0]inst_addr;
  input inst_valid;
  input [31:0]inst_i;

  wire clk_i;
  wire finish_i;
  wire [1:0]if_nstat;
  wire [1:0]if_state;
  wire [31:0]inst_addr;
  wire [31:0]inst_addr0_in;
  wire \inst_addr[31]_i_1_n_0 ;
  wire [31:0]inst_i;
  wire [31:0]inst_o;
  wire [31:0]inst_o0_in;
  wire \inst_o[31]_i_1_n_0 ;
  wire inst_rreq;
  wire inst_rreq_i_1_n_0;
  wire inst_valid;
  wire [31:0]pc_i;
  wire rst_i;
  wire valid_o;
  wire valid_o_i_1_n_0;

  LUT3 #(
    .INIT(8'h40)) 
    \if_state[0]_i_1 
       (.I0(if_state[0]),
        .I1(finish_i),
        .I2(if_state[1]),
        .O(if_nstat[0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \if_state[1]_i_1 
       (.I0(if_state[1]),
        .I1(if_state[0]),
        .I2(finish_i),
        .O(if_nstat[1]));
  (* FSM_ENCODED_STATES = "IF_READ:10,IF_IDLE:01" *) 
  FDPE #(
    .INIT(1'b1)) 
    \if_state_reg[0] 
       (.C(clk_i),
        .CE(1'b1),
        .D(if_nstat[0]),
        .PRE(rst_i),
        .Q(if_state[0]));
  (* FSM_ENCODED_STATES = "IF_READ:10,IF_IDLE:01" *) 
  FDCE #(
    .INIT(1'b0)) 
    \if_state_reg[1] 
       (.C(clk_i),
        .CE(1'b1),
        .CLR(rst_i),
        .D(if_nstat[1]),
        .Q(if_state[1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[0]_i_1 
       (.I0(pc_i[0]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[10]_i_1 
       (.I0(pc_i[10]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[11]_i_1 
       (.I0(pc_i[11]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[12]_i_1 
       (.I0(pc_i[12]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[13]_i_1 
       (.I0(pc_i[13]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[14]_i_1 
       (.I0(pc_i[14]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[15]_i_1 
       (.I0(pc_i[15]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[16]_i_1 
       (.I0(pc_i[16]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[17]_i_1 
       (.I0(pc_i[17]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[18]_i_1 
       (.I0(pc_i[18]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[19]_i_1 
       (.I0(pc_i[19]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[19]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[1]_i_1 
       (.I0(pc_i[1]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[20]_i_1 
       (.I0(pc_i[20]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[21]_i_1 
       (.I0(pc_i[21]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[22]_i_1 
       (.I0(pc_i[22]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[22]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[23]_i_1 
       (.I0(pc_i[23]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[23]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[24]_i_1 
       (.I0(pc_i[24]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[25]_i_1 
       (.I0(pc_i[25]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[25]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[26]_i_1 
       (.I0(pc_i[26]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[26]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[27]_i_1 
       (.I0(pc_i[27]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[27]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[28]_i_1 
       (.I0(pc_i[28]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[28]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[29]_i_1 
       (.I0(pc_i[29]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[29]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[2]_i_1 
       (.I0(pc_i[2]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[30]_i_1 
       (.I0(pc_i[30]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[30]));
  LUT2 #(
    .INIT(4'hB)) 
    \inst_addr[31]_i_1 
       (.I0(if_state[0]),
        .I1(if_state[1]),
        .O(\inst_addr[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[31]_i_2 
       (.I0(pc_i[31]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[31]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[3]_i_1 
       (.I0(pc_i[3]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[4]_i_1 
       (.I0(pc_i[4]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[5]_i_1 
       (.I0(pc_i[5]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[6]_i_1 
       (.I0(pc_i[6]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[7]_i_1 
       (.I0(pc_i[7]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[8]_i_1 
       (.I0(pc_i[8]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \inst_addr[9]_i_1 
       (.I0(pc_i[9]),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .O(inst_addr0_in[9]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[0] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[0]),
        .Q(inst_addr[0]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[10] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[10]),
        .Q(inst_addr[10]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[11] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[11]),
        .Q(inst_addr[11]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[12] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[12]),
        .Q(inst_addr[12]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[13] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[13]),
        .Q(inst_addr[13]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[14] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[14]),
        .Q(inst_addr[14]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[15] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[15]),
        .Q(inst_addr[15]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[16] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[16]),
        .Q(inst_addr[16]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[17] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[17]),
        .Q(inst_addr[17]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[18] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[18]),
        .Q(inst_addr[18]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[19] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[19]),
        .Q(inst_addr[19]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[1] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[1]),
        .Q(inst_addr[1]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[20] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[20]),
        .Q(inst_addr[20]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[21] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[21]),
        .Q(inst_addr[21]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[22] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[22]),
        .Q(inst_addr[22]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[23] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[23]),
        .Q(inst_addr[23]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[24] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[24]),
        .Q(inst_addr[24]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[25] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[25]),
        .Q(inst_addr[25]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[26] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[26]),
        .Q(inst_addr[26]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[27] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[27]),
        .Q(inst_addr[27]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[28] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[28]),
        .Q(inst_addr[28]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[29] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[29]),
        .Q(inst_addr[29]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[2] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[2]),
        .Q(inst_addr[2]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[30] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[30]),
        .Q(inst_addr[30]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[31] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[31]),
        .Q(inst_addr[31]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[3] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[3]),
        .Q(inst_addr[3]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[4] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[4]),
        .Q(inst_addr[4]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[5] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[5]),
        .Q(inst_addr[5]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[6] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[6]),
        .Q(inst_addr[6]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[7] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[7]),
        .Q(inst_addr[7]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[8] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[8]),
        .Q(inst_addr[8]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_addr_reg[9] 
       (.C(clk_i),
        .CE(\inst_addr[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_addr0_in[9]),
        .Q(inst_addr[9]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFDFF)) 
    \inst_o[0]_i_1 
       (.I0(if_state[1]),
        .I1(if_state[0]),
        .I2(inst_i[0]),
        .I3(inst_valid),
        .O(inst_o0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[10]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[10]),
        .I3(if_state[1]),
        .O(inst_o0_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[11]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[11]),
        .I3(if_state[1]),
        .O(inst_o0_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[12]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[12]),
        .I3(if_state[1]),
        .O(inst_o0_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[13]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[13]),
        .I3(if_state[1]),
        .O(inst_o0_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[14]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[14]),
        .I3(if_state[1]),
        .O(inst_o0_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[15]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[15]),
        .I3(if_state[1]),
        .O(inst_o0_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[16]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[16]),
        .I3(if_state[1]),
        .O(inst_o0_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[17]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[17]),
        .I3(if_state[1]),
        .O(inst_o0_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[18]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[18]),
        .I3(if_state[1]),
        .O(inst_o0_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[19]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[19]),
        .I3(if_state[1]),
        .O(inst_o0_in[19]));
  LUT4 #(
    .INIT(16'hFDFF)) 
    \inst_o[1]_i_1 
       (.I0(if_state[1]),
        .I1(if_state[0]),
        .I2(inst_i[1]),
        .I3(inst_valid),
        .O(inst_o0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[20]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[20]),
        .I3(if_state[1]),
        .O(inst_o0_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[21]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[21]),
        .I3(if_state[1]),
        .O(inst_o0_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[22]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[22]),
        .I3(if_state[1]),
        .O(inst_o0_in[22]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[23]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[23]),
        .I3(if_state[1]),
        .O(inst_o0_in[23]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[24]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[24]),
        .I3(if_state[1]),
        .O(inst_o0_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[25]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[25]),
        .I3(if_state[1]),
        .O(inst_o0_in[25]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[26]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[26]),
        .I3(if_state[1]),
        .O(inst_o0_in[26]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[27]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[27]),
        .I3(if_state[1]),
        .O(inst_o0_in[27]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[28]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[28]),
        .I3(if_state[1]),
        .O(inst_o0_in[28]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[29]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[29]),
        .I3(if_state[1]),
        .O(inst_o0_in[29]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[2]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[2]),
        .I3(if_state[1]),
        .O(inst_o0_in[2]));
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[30]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[30]),
        .I3(if_state[1]),
        .O(inst_o0_in[30]));
  LUT2 #(
    .INIT(4'hB)) 
    \inst_o[31]_i_1 
       (.I0(if_state[1]),
        .I1(if_state[0]),
        .O(\inst_o[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[31]_i_2 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[31]),
        .I3(if_state[1]),
        .O(inst_o0_in[31]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[3]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[3]),
        .I3(if_state[1]),
        .O(inst_o0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFDFF)) 
    \inst_o[4]_i_1 
       (.I0(if_state[1]),
        .I1(if_state[0]),
        .I2(inst_i[4]),
        .I3(inst_valid),
        .O(inst_o0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[5]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[5]),
        .I3(if_state[1]),
        .O(inst_o0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[6]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[6]),
        .I3(if_state[1]),
        .O(inst_o0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[7]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[7]),
        .I3(if_state[1]),
        .O(inst_o0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[8]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[8]),
        .I3(if_state[1]),
        .O(inst_o0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \inst_o[9]_i_1 
       (.I0(if_state[0]),
        .I1(inst_valid),
        .I2(inst_i[9]),
        .I3(if_state[1]),
        .O(inst_o0_in[9]));
  FDPE #(
    .INIT(1'b1)) 
    \inst_o_reg[0] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .D(inst_o0_in[0]),
        .PRE(rst_i),
        .Q(inst_o[0]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[10] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[10]),
        .Q(inst_o[10]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[11] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[11]),
        .Q(inst_o[11]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[12] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[12]),
        .Q(inst_o[12]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[13] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[13]),
        .Q(inst_o[13]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[14] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[14]),
        .Q(inst_o[14]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[15] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[15]),
        .Q(inst_o[15]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[16] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[16]),
        .Q(inst_o[16]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[17] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[17]),
        .Q(inst_o[17]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[18] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[18]),
        .Q(inst_o[18]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[19] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[19]),
        .Q(inst_o[19]));
  FDPE #(
    .INIT(1'b1)) 
    \inst_o_reg[1] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .D(inst_o0_in[1]),
        .PRE(rst_i),
        .Q(inst_o[1]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[20] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[20]),
        .Q(inst_o[20]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[21] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[21]),
        .Q(inst_o[21]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[22] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[22]),
        .Q(inst_o[22]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[23] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[23]),
        .Q(inst_o[23]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[24] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[24]),
        .Q(inst_o[24]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[25] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[25]),
        .Q(inst_o[25]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[26] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[26]),
        .Q(inst_o[26]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[27] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[27]),
        .Q(inst_o[27]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[28] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[28]),
        .Q(inst_o[28]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[29] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[29]),
        .Q(inst_o[29]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[2] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[2]),
        .Q(inst_o[2]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[30] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[30]),
        .Q(inst_o[30]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[31] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[31]),
        .Q(inst_o[31]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[3] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[3]),
        .Q(inst_o[3]));
  FDPE #(
    .INIT(1'b1)) 
    \inst_o_reg[4] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .D(inst_o0_in[4]),
        .PRE(rst_i),
        .Q(inst_o[4]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[5] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[5]),
        .Q(inst_o[5]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[6] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[6]),
        .Q(inst_o[6]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[7] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[7]),
        .Q(inst_o[7]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[8] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[8]),
        .Q(inst_o[8]));
  FDCE #(
    .INIT(1'b0)) 
    \inst_o_reg[9] 
       (.C(clk_i),
        .CE(\inst_o[31]_i_1_n_0 ),
        .CLR(rst_i),
        .D(inst_o0_in[9]),
        .Q(inst_o[9]));
  LUT2 #(
    .INIT(4'h2)) 
    inst_rreq_i_1
       (.I0(if_state[0]),
        .I1(if_state[1]),
        .O(inst_rreq_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    inst_rreq_reg
       (.C(clk_i),
        .CE(1'b1),
        .CLR(rst_i),
        .D(inst_rreq_i_1_n_0),
        .Q(inst_rreq));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hE320)) 
    valid_o_i_1
       (.I0(inst_valid),
        .I1(if_state[0]),
        .I2(if_state[1]),
        .I3(valid_o),
        .O(valid_o_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    valid_o_reg
       (.C(clk_i),
        .CE(1'b1),
        .CLR(rst_i),
        .D(valid_o_i_1_n_0),
        .Q(valid_o));
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
