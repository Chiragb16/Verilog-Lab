module comparator(in1,in2,alb,agb,aeb);
input [1:0]in1,in2;
output reg alb,agb,aeb;
always @(*)
begin
if(in1>in2)agb=1'b1;
else if(in2>in1)alb=1'b1;
else aeb=1'b1;
end
endmodule

module comparator_tb;
reg [1:0]in1,in2;
wire alb,agb,aeb;
comparator dut(.in1(in1),.in2(in2),.alb(alb),.aeb(aeb),.agb(agb));
initial begin
in1=2'b11;in2=2'b01;
#10 in1=2'b00;in2=2'b10;
#10 in1=2'b10;in2=2'b10;
#5 $finish;
end
endmodule

