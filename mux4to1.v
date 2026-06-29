module mux4to1(s,I,Y);
input[1:0]s;
input[3:0]I;
output reg Y;
always @(s)
begin
case (s)
2'b00:Y=I[0];
2'b01:Y=I[1];
2'b10:Y=I[2];
2'b11:Y=I[3];
default Y=1'bZ;
endcase
end
endmodule

module mux4to1_tb;
reg[1:0]s;
reg[3:0]I;
wire Y;

mux4to1 DUT(.s(s),.I(I),.Y(Y));
initial begin
I=4'b1101;
$monitor($time,"s=%b,Y=%b,I=%b",s,Y,I);
#20 s=2'b00;
#20 s=2'b11;
#20 s=2'b10;#20 s=2'b01;
#20 $finish;
end
endmodule

