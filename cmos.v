module cmos(x,f);
input x;
output f;
supply1 vdd;
supply0 gnd;
pmos(f,vdd,x);
nmos(f,gnd,x);
endmodule
