module tlatch(t,en,q);
input t,en;
output reg q;
always @(*)begin
case({t,en})
2'bx0:q=1'bx;
2'b10:q=~q;
2'b00:q=q;
endcase
end
endmodule

module tlatch_tb;
reg t,en;
wire q;
tlatch dut(.t(t),.en(en),.q(q));
initial begin
$monitor($time,"t=%b,en=%b,q=%b",t,en,q);
en=1'b1;
#20 t=1'b1;
#20 t=1'b0;
#20 t=1'b1;en=1'b0;
#20 t=1'b0;
$finish;
end
endmodule