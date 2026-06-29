module fulladder(sum,carry,a,b,c);
input a,b,c;
output sum,carry;
assign sum=a^b^c;
assign carry=(a&b)|(b&c)|(c&a);
endmodule

module rippleadder(s,ca,x,y);
output [3:0]s;
output ca;
input [3:0]x,y;
wire [3:0]c;
fulladder f1(s[0],c[1],x[0],y[0],c[0]);
fulladder f2(s[1],c[2],x[1],y[1],c[1]);
fulladder f3(s[2],c[3],x[2],y[2],c[2]);
fulladder f4(s[3],ca,x[3],y[3],c[3]);
endmodule

module rippleadder_tb;
    reg [3:0] x, y;
    wire [3:0] s;
    wire ca;

    rippleadder dut (.x(x), .y(y), .s(s), .ca(ca));

    initial begin
        x = 4'b0000; y = 4'b0000; #20;
        x = 4'd15;   y = 4'd9;    #10;
        x = 4'd12;   y = 4'd5;    #100;
        $finish;
    end
endmodule

