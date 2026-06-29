module bin_to_gray(B,G);
input[3:0]B;
output[3:0]G;
assign G[3]=B[3];
assign G[2]=B[3]^B[2];
assign G[1]=B[2]^B[1];
assign G[0]=B[1]^B[0];
endmodule

module bin_to_gray_tb;
reg[3:0]B;
wire[3:0]G;
bin_to_gray dut(.B(B),.G(G));
initial begin
$monitor($time,"B=%b,G=%b",B,G);
repeat(16)
begin
B=$random;
#5;
end
end
endmodule

