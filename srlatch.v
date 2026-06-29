module srlatch(s,r,q);
input s,r;
output reg q;
always @(*) begin
 case ({s, r})  
      2'b00: q = q;  
      2'b01: q = 1'b0; 
      2'b10: q = 1'b1; 
      2'b11: q = 1'bZ; 
    endcase
end
endmodule

module srlatch_tb;
reg s,r;
wire q;
srlatch uut(.s(s),.r(r),.q(q));
initial begin 
$monitor($time ,"s=%b,r=%b,q=%b",s,r,q);
s=1'b0;r=1'b0;
#20 s=1'b1;r=1'b0;
#20 s=1'b0;r=1'b0;
#20 s=1'b0;r=1'b1;
#20 s=1'b1;r=1'b1;
$finish;
end
endmodule

