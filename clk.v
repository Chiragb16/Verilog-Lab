`timescale 10ps/1ps
module generating_clk(clk);
output reg clk=0;
initial
begin
forever
#5 clk=~clk;
endmodule