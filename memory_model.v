module memory_model();
reg [7:0] mem[0:1023];
initial begin
$readmemh("mem.dat",mem,200,50);
end
endmodule