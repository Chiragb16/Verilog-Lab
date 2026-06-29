module alu2(a,b,code,aluout);
input [3:0]a,b;
input [2:0]code;
output reg[7:0]aluout;
wire[7:0]x,y;
assign x={4'b0000,a};
assign y={4'b0000,b};
always @(a,b,x,y,code)
begin
case(code)
3'b000:aluout=x+y;
3'b001:aluout=x-y;
3'b010:aluout=~x;
3'b011:aluout=a*b;
3'b100:aluout=x&y;
3'b101:aluout=x|y;
3'b110:aluout=~(x&y);
3'b111:aluout=~(x|y);
default:aluout=8'h00;
endcase
end
endmodule

module alu2_tb;
reg [3:0]a,b;
reg [2:0]code;
integer i,j;
wire[7:0]aluout;
alu2 dut(.a(a),.b(b),.code(code),.aluout(aluout));
initial begin
$monitor($time,"a=%b,b=%b,code=%b,aluout=%b",a,b,code,aluout);
code=3'b000;{a,b}=8'h00;
for(i=0;i<8;i=i+1)begin
	code=i;
	for(j=0;j<256;j=j+1)begin
		#5 {a,b}=j;
	end
end
#5 $finish;
end
endmodule

