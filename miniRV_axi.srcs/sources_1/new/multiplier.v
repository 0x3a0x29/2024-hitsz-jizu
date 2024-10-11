`timescale 1ns / 1ps

module multiplier (
    input  wire         clk,
	input  wire         rst,        // high active
	input  wire [31:0]  x,          // multiplicand
	input  wire [31:0]  y,          // multiplier
	input  wire         start,      // 1 - multiplication should begin
	output reg  [63:0]  z,          // product
	output reg          busy        // 1 - performing multiplication; 0 - multiplication ends
);
    wire [63:0] z_move={z[63],z[63:1]};
    reg [31:0] x_save;
    wire [63:0] x_add={x_save[31:0],32'd0};
    reg [4:0] count;
    always @(posedge clk or posedge rst)begin
        if (rst)begin
            busy<=1'b0;
            count<=5'd0;
            z<=64'd0;
            x_save<=32'd0;
        end
        else begin
            if(start&~busy) begin
                busy<=1'b1;
                z<=y[0]?{-x[31:0],y[31:0]}:{32'd0,y[31:0]};
                count<=5'h1f;
                x_save<=x;
            end
            if (busy)begin
                if ((|count))begin
                    count<=count-1'b1;
                    case(z[1:0])
                        2'b01:begin
                            z<=z_move+x_add;
                        end
                        2'b10:begin
                            z<=z_move-x_add;               
                        end
                        default:begin
                            z<=z_move;
                        end
                    endcase
                end
                else begin
                    z<=z_move;
                    busy<=1'b0;
                end
            end
        end
    end
endmodule
