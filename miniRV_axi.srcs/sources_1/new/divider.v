`timescale 1ns / 1ps

module divider (
    input  wire         clk,
    input  wire         rst,        // high active
    input  wire [31:0]  x,          // dividend
    input  wire [31:0]  y,          // divisor
    input  wire         start,      // 1 - division should begin
    output reg  [31:0]  z,          // quotient
    output reg  [31:0]  r,          // remainder
    output reg          busy        // 1 - performing division; 0 - division ends
);
    reg [61:0] num;
    reg [4:0] count;
    reg [30:0] y_save;
    always @(*) begin
        r[30:0]=num[60:30];
    end
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            num<=62'd0;
            count<=5'd0;
            z<=32'd0;
            busy<=1'b0;
            r[31]<=1'b0;
            y_save<=31'd0;
        end else begin
            if(start&~busy) begin
                busy<=1'b1;
                num[61:0]<={31'd0,x[30:0]}-{1'b0,y[30:0],30'd0};
                y_save<=y[30:0];
                z[31]<=x[31]^y[31];
                z[30:0]<=31'd0;
                r[31]<=x[31];
                count<=5'h1e;
            end
            if (busy)begin
                if(~(|count)) begin
                    z[30:0]<={z[30:1],~num[61]};
                    if (num[61]) begin
                        num<=num+{1'b0,y_save[30:0],30'd0};
                    end
                    busy<=1'b0;
                end else begin
                    z[30:0]<={z[29:1],~num[61],1'b0};
                    if (num[61]) begin
                        num<=(num<<1)+{1'b0,y_save[30:0],30'd0};
                    end else begin
                        num<=(num<<1)-{1'b0,y_save[30:0],30'd0};
                    end
                    count<=count-1'b1;
                end
            end
        end
    end
endmodule
