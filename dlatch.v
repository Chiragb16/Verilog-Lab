`timescale 1ns/1ps
module dlatch(d,q,en);
input d,en;
output q;
assign q=en?d:q;
endmodule

module dlatch_tb;
reg d,en;
wire q;
dlatch dut(.d(d),.q(q),.en(en));
initial begin
$monitor($time,"d=%b,q=%b,en=%b",d,q,en);
d=1'b0;en=1'b0;
#10 d=1'b1;#10 d=1'b0;#10 d=1'b1;
#10 d=1'b0;en=1'b0;
$finish;
end
endmodule