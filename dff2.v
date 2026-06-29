module dff(d,rst,q,qb,clk);
input d,rst,clk;
output reg q,qb;
always @(posedge clk)
begin
if(rst<=1)
begin
q=1'b0;q=1'b1;
end
else
begin
q=d;
qb=~q;
end
end
endmodule

module dff2_tb;
reg d,rst,clk;
wire q,qb;
dff uut(.d(d),.rst(rst),.clk(clk),.q(q),.qb(qb));
always begin
#5 clk=~clk;
end
initial begin

clk=1'b0;{d,rst}=2'd0;
#5 {d,rst}=2'd1;#5{d,rst}=2'd2;
#5 {d,rst}=2'd3;#5 $finish;
end
endmodule