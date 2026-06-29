module dff(
    input d, set, rst, clk,
    output reg q,
    output qb
);
    assign qb = ~q; // qb is always the complement of q

    always @(posedge clk) begin
        if (set) 
            q <= 1'b1; // Asynchronous set
        else if (rst) 
            q <= 1'b0; // Asynchronous reset
        else 
            q <= d; // Normal D Flip-Flop operation
    end
endmodule

module dff_tb;
    reg d, set, rst, clk;
    wire q, qb;

    dff dut(.d(d), .set(set), .rst(rst), .clk(clk), .q(q), .qb(qb));

    // Generate clock signal with a period of 10 time units
    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0; // Initialize clock
        d = 0; set = 0; rst = 0; // Initialize all signals

        $monitor($time, " d=%b, set=%b, rst=%b, clk=%b, q=%b, qb=%b", d, set, rst, clk, q, qb);

        #5 rst = 1;  // Apply reset
        #10 rst = 0; // Remove reset

        #10 d = 1;   // Apply input
        #10 d = 0;

        #10 set = 1; // Apply set
        #10 set = 0; rst = 1; // Apply reset

        #10 $finish;
    end
endmodule

