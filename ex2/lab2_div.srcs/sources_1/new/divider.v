`timescale 1ns / 1ps

module divider (
    input  wire         clk,
    input  wire         rst,        // high active
    input  wire [7:0]  x,          // dividend
    input  wire [7:0]  y,          // divisor
    input  wire         start,      // 1 - division should begin
    output reg  [7:0]  z,          // quotient
    output reg  [7:0]  r,          // remainder
    output reg          busy        // 1 - performing division; 0 - division ends
);
    reg [13:0] num;
    reg [2:0] count;
    reg [13:0] y_save;
    always @(*) begin
        r[6:0]=num[12:6];
    end
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            num<=14'd0;
            count<=3'd0;
            z<=8'd0;
            busy<=1'b0;
            r<=1'b0;
        end else begin
            if(start&~busy) begin
                busy<=1'b1;
                num[13:0]<={7'd0,x[6:0]}-{1'b0,y[6:0],6'd0};
                y_save<={1'b0,y[6:0],6'd0};
                z[7]<=x[7]^y[7];
                z[6:0]<=7'd0;
                r[7]<=x[7];
                count<=3'h6;
            end
            if (busy)begin
                if(~(|count)) begin
                    z[6:0]<={z[6:1],~num[13]};
                    if (num[13]) begin
                        num<=num+y_save;
                    end
                    busy<=1'b0;
                end else begin
                    z[6:0]<={z[5:1],~num[13],1'b0};
                    if (num[13]) begin
                        num<=(num<<1)+y_save;
                    end else begin
                        num<=(num<<1)-y_save;
                    end
                    count<=count-1'b1;
                end
            end
        end
    end
endmodule