module seq_detector(clk,rst,din,detect);
input clk,rst,din;
output detect;

localparam S0=3'd0;
localparam S1=3'd1;
localparam S2=3'd2;
localparam S3=3'd3;
localparam S4=3'd4;

reg[2:0] state,next_state;

always @(posedge clk or posedge rst)begin
    if(rst)
        state<=S0;
    else
        state<=next_state;
end

always @(*)begin
    case(state)
        S0:next_state=(din)?S1:S0;
        S1:next_state=(din)?S1:S2;
        S2:next_state=(din)?S3:S0;
        S3:next_state=(din)?S4:S2;
        S4:next_state=(din)?S1:S2;
        default:next_state=S0;
    endcase
end
assign detect=(state==S4)?1'b1:1'b0;

endmodule
