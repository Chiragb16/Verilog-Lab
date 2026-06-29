module gray_counter_4bit ( clk,reset,gray);
input clk,reset;
output reg [3:0]gray; 
reg [3:0] binary;
always @(posedge clk or posedge reset) begin
if (reset) begin
         binary <= 4'b0000;
end else begin
         binary <= binary + 1;
        end
    end
    always @(*) begin
        gray[3] = binary[3];
        gray[2] = binary[3] ^ binary[2];
        gray[1] = binary[2] ^ binary[1];
        gray[0] = binary[1] ^ binary[0];
    end
endmodule

module gray_counter_4bit_tb;
reg clk,reset;
wire [3:0]gray;
gray_counter_4bit uut(.clk(clk),.reset(reset),.gray(gray));
always begin
#10 clk=~clk;
end
initial begin
$monitor($time,"clk=%b,reset=%b,gray=%b",clk,reset,gray);
clk=0;reset=1;
#5 reset=0;
end
endmodule

