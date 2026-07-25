module parametrized_updown_counter #(
    parameter WIDTH = 8
)(
    input clk,
    input rst,
    input en,
    input dir,
    output reg [WIDTH-1:0] count
);

always @(posedge clk) begin
    if (rst)
        count <= 0;
    else if (en) begin
        if (dir)
            count <= count + 1'b1;
        else
            count <= count - 1'b1;
    end
end

endmodule
