 `define RANDOM_DELAY
 //`define ENABLE_ICACHE
//`define ENABLE_DCACHE

`define BLK_LEN  4
`define BLK_SIZE (`BLK_LEN*32)

// Instruction opcode
`define R_Typ   7'b0110011
`define I_Typ   7'b0010011
`define LOAD    7'b0000011
`define JALR    7'b1100111
`define S_Typ   7'b0100011
`define B_Typ   7'b1100011
`define LUI     7'b0110111
`define JAL     7'b1101111

// ALU OP
`define OP_ADD  4'h0
`define OP_SUB  4'h1
`define OP_AND  4'h2
`define OP_OR   4'h3
`define OP_XOR  4'h4
`define OP_SLL  4'h5
`define OP_SRL  4'h6
`define OP_SRA  4'h7
`define OP_MUL  4'h8
`define OP_MULH 4'h9
`define OP_DIV  4'hA
`define OP_REM  4'hB

// Peripheral Address
// `define PERI_ADDR_SW    32'hFFFF_0000
// `define PERI_ADDR_LED   32'hFFFF_1000
