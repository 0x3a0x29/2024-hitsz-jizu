`timescale 1ns / 1ps

module mul_div_simu();

    reg         clock  = 1;
    reg         reset  = 1;
    reg  [23:0] switch = 24'h123456;
    wire [31:0] led;
    reg  [31:0] led_r  = 32'h0;
    reg  [31:0] ans [16:0];
    reg  [ 4:0] index  = 5'h0;
    wire [31:0] answer;
    wire        error;

    initial begin
        $readmemh("answers.txt", ans);
        #12 reset = 0;
    end

    always #5 clock = !clock;

    soc DUT (
        .clk_i  (clock),
        .rst_i  (reset),
        .sw_i   (switch),
        .led_o  (led)
    );

    always @(*) begin
        if (led != led_r) begin
            led_r = led;
            index = index + 5'h1;
        end
    end

    always @(posedge clock) begin
        if (index == 5'h10) begin
            #1800
            $display("*****************************************");
            $display("* Congratulations! All tests passed!    *");
            $display("*****************************************");
            $finish;
        end

        if (error) begin
            $display("*********************************************");
            $display("* Error occurs at %.03fus!\t\t\t\t\t*", $realtime/1000);
            $display("* Reference: 0x%08h | yours: 0x%08h\t*", ans[index], led);
            $display("*********************************************");
            $stop;
        end
    end

    assign answer = ans[index];
    assign error = (answer != led);

endmodule
