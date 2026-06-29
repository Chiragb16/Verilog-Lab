`timescale 10ps / 1ps

module fulladd(a,b,c,sum,carry);
input a,b,c;
output sum,carry;
wor carry;
assign sum=a^b^c;
assign carry=a&b;
assign carry=b&c;
assign carry=c&a;
endmodule


module fulladd_tb;
reg a,b,c;
fulladd uut (
.a(a),
.b(b),
.c(c),
.sum(sum),
.carry(carry)
);
initial
c=1'b0;
initial
begin
#5 a=1'b1;b=1'b1;
#5 a=1'b0;
end
initial 
#25 $finish;
endmodule