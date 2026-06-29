module alu(a,b,s,c,op);
input [7:0]a,b;
input [1:0]op;
output reg[7:0]s;
output reg c;
parameter add=2'b00,sub=2'b01,mul=2'b10,div=2'b11;
always @(*)
begin
case(op)
add:{c,s}=a+b;
sub:{c,s}=a-b;
mul:{c,s}=a*b;
div:{c,s}=a/b;
endcase
end 
endmodule

module alu_tb;
reg [7:0]a,b;
reg [1:0]op;
wire [7:0]s;wire c;
alu dut(.a(a),.b(b),.op(op),.s(s),.c(c));
initial begin
a=8'h01;b=8'h0E;op=2'b00;
#5 a=8'h11;b=8'h00;op=2'b10;
#10 a=8'h0A;b=8'h02;op=2'b11;
10 $finish;
end
endmodule
