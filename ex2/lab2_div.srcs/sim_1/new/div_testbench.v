`timescale 1ns / 1ps
`define TEST_NUM 8

/* 8 Tests:
    0.  14 /   3 =   4 ...  2
    1. 111 /  31 =   3 ... 18
    2. -73 /   6 = -12 ... -1
    3. -49 /  11 =  -4 ... -5
    4. 120 / -33 =  -3 ... 21
    5.  23 / -15 =  -1 ...  8
    6. -19 / -10 =   1 ... -9
    7. -53 / -25 =   2 ... -3
*/

module div_testbench();

    reg         tb_clk = 0;
    reg         tb_rst = 1;
    reg         dut_start;
    wire [ 7:0] dut_x;
    wire [ 7:0] dut_y;
    wire        dut_busy;
    wire [ 7:0] dut_z;
    wire [ 7:0] dut_r;

    reg  [ 7:0] tb_i;
    reg  [31:0] tb_data [`TEST_NUM-1:0];

    wire [ 7:0] tb_dat1  = tb_data[tb_i][31:24];
    wire [ 7:0] tb_dat2  = tb_data[tb_i][23:16];
    wire [ 7:0] tb_ans_z = tb_data[tb_i][15: 8];
    wire [ 7:0] tb_ans_r = tb_data[tb_i][ 7: 0];

    assign dut_x = tb_dat1;
    assign dut_y = tb_dat2;
    
    localparam S0 = 3'b000;
    localparam S1 = 3'b001;
    localparam S2 = 3'b010;
    localparam S3 = 3'b100;
    reg [2:0] tb_state, tb_nstat;

    wire tb_z_err = (tb_state == S3) && (dut_z != tb_ans_z) ? 1'b1 : 1'b0;
    wire tb_r_err = (tb_state == S3) && (dut_r != tb_ans_r) ? 1'b1 : 1'b0;

    initial begin
        $readmemh("data.txt", tb_data);
        #12 tb_rst = 0;
    end

    always #5 tb_clk = !tb_clk;

    always @(posedge tb_clk or posedge tb_rst) begin
        tb_state <= tb_rst ? S0 : tb_nstat;
    end

    always @(*) begin
        case (tb_state)
            S0: tb_nstat = tb_i < `TEST_NUM ? S1 : S0;
            S1: tb_nstat = S2;
            S2: tb_nstat = dut_busy ? S2 : S3;
            S3: tb_nstat = S0;
            default: tb_nstat = S0;
        endcase
    end

    always @(posedge tb_clk or posedge tb_rst) begin
        if (tb_rst) begin
            dut_start <= 1'b0;
            tb_i      <= 8'h0;
        end else begin
            case (tb_state)
                S0: begin
                    if (!dut_busy)
                        dut_start <= 1'b1;
                end
                S3: begin
                    tb_i <= tb_i + 8'h1;
                    
                    if (!tb_z_err & !tb_r_err)
                        $display("Test %0d passed", tb_i);

                    if (tb_i == `TEST_NUM - 8'h1) begin
                        $display("All tests passed! Congratulations! Good job!");
                        $finish;
                    end

                    if (tb_z_err) begin
                        $display("Test %0d failed: z should be 0x%02x, but yours: 0x%02x", tb_i, tb_ans_z, dut_z);
                        $stop;
                    end

                    if (tb_r_err) begin
                        $display("Test %0d failed: r should be 0x%02x, but yours: 0x%02x", tb_i, tb_ans_r, dut_r);
                        $stop;
                    end
                end
                default: begin
                    dut_start <= 1'b0;
                end
            endcase
        end
    end

    divider DUT (
        .clk    (tb_clk),
        .rst    (tb_rst),
        .x      (dut_x),
        .y      (dut_y),
        .start  (dut_start),
        .z      (dut_z),
        .r      (dut_r),
        .busy   (dut_busy)
    );

endmodule
