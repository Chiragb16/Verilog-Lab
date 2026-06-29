module counter(clk,ctr,rst);
input clk,rst;
output reg[31:0]ctr;
always @( posedge clk)
begin
	if(rst)
		ctr=32'b0;
	else
		ctr=ctr +1;
end	
endmodule
