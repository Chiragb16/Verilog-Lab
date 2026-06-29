module lfsr(input clk,output reg[7:0]lfsr=255);
wire feedback=lfsr[7];
always @(posedge clk)begin
lfsr[0]<=feedback;
lfsr[1]<=lfsr[0];
lfsr[2]<=lfsr[1]^feedback;
lfsr[3]<=lfsr[2]^feedback;
lfsr[4]<=lfsr[3]^feedback;
lfsr[5]<=lfsr[4];
lfsr[6]<=lfsr[5];
lfsr[7]<=lfsr[6];
end
endmodule
