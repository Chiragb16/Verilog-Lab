module pencode (
    input [7:0] x,
    output reg [2:0] y
);
    always @(x) begin
        casez (x) // 'z' allows "don't-care" handling
            8'b????_???1: y = 3'd0;
            8'b????_??10: y = 3'd1;
            8'b????_?100: y = 3'd2;
            8'b????_1000: y = 3'd3;
            8'b???1_0000: y = 3'd4;
            8'b??10_0000: y = 3'd5;
            8'b?100_0000: y = 3'd6;
            8'b1000_0000: y = 3'd7;
            default: y = 3'bxxx; // Undefined case
        endcase
    end
endmodule
module pencode_tb;
    reg [7:0] x;
    wire [2:0] y;

    pencode dut(.x(x), .y(y));

    initial begin
        $monitor($time, " x=%b y=%b", x, y);

        x = 8'b0000_0000; #10; // No valid input
        x = 8'b0000_0001; #10; // y = 0
        x = 8'b0000_0010; #10; // y = 1
        x = 8'b0000_0100; #10; // y = 2
        x = 8'b0000_1000; #10; // y = 3
        x = 8'b0001_0000; #10; // y = 4
        x = 8'b0010_0000; #10; // y = 5
        x = 8'b0100_0000; #10; // y = 6
        x = 8'b1000_0000; #10; // y = 7
        x = 8'b1100_0010; #10; // Should still detect y = 1 (highest priority)
        
        $finish;
    end
endmodule
