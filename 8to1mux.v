module to1mux(in, sel, y);
    input [7:0] in;
    input [2:0] sel;
    output y;
    assign y = in[sel];
endmodule

module to1mux_tb;
    reg [7:0] in;
    reg [2:0] sel;
    integer i;
    wire y;

    to1mux dut (.in(in), .sel(sel), .y(y));

    initial begin
        $dumpfile("8to1mux.vcd"); // Correct order
        $dumpvars(0, to1mux_tb);  // Dumps all signals in testbench

        $monitor("Time=%0t, in=%b, sel=%b, y=%b", $time, in, sel, y); // Fixed typo

        in = 8'b01010101;
        for (i = 0; i < 8; i = i + 1) begin  // Runs only for valid 3-bit values
            sel = i; 
            #10;
        end
        #10 $finish;
    end
endmodule
