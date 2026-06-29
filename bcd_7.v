module bcd_7(in,y);
input [3:0]in;
output reg [0:6]y;
always @(*)
begin
case(in)
0:y=7'b1111110;
1:y=7'b0110000;
2:y=7'b1101101;
3:y=7'b1111001;
4:y=7'b0110011;
5:y=7'b1011011;
6:y=7'b1011111;
7:y=7'b1110000;
8:y=7'b1111111;
9:y=7'b1110011;
default:y=7'b0000000;
endcase
end
endmodule

module bcd_7_tb;
reg [3:0]in;
wire [0:6]y;
bcd_7 dut(.in(in),.y(y));
initial begin
in=4'd1;
#10 in=4'd9;
#10 in=4'd0;
#10 in=4'd2;
#10 in=4'd3;
#10 in=4'd4;
#10 in=4'd5;
#10 in=4'd6;
#10 in=4'd7;
#10 in=4'd8;
#35 $finish;
end
endmodule
