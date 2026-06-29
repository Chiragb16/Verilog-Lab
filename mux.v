module generate_mux(in,s,q);
input [15:0]in;
input [3:0]s;
output q;
assign q=in[s];
endmodule

module generat_mux_tb;
reg [15:0]in;
reg [3:0]s;
wire q;
generate_mux dut(.in(in),.s(s),.q(q));
initial begin
$monitor($time,"in=%b,s=%b,q=%b",in,s,q);
in=16'hFEFE;
#5 s=4'b0011;
#20 s=4'b1111;
#20 s=4'b0101;
 $finish;
end
endmodule