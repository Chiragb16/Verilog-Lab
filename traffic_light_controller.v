module traffic_light_controller(clk,rst,red,yellow,green);
input clk,rst;
output red,yellow,green;

reg [1:0]state,next_state;
reg [3:0]count;

localparam Red=0,Green=1,Yellow=2;
localparam Red_Time=10,Green_Time=8,Yellow_Time=3;

always @(posedge clk or posedge rst)begin
    if(rst)
        state<=Red;
    else
        state<=next_state;
end

always @(posedge clk or posedge rst)begin
    if(rst)
        count<=4'd0;
    else if(state!=next_state)
        count<=4'd0;
    else
        count<=count+1'b1;
end

always @(*)begin
    case(state)
        Red:begin
            if(count==Red_Time-1)
                next_state=Green;
            else
                next_state=Red;
        end

        Green:begin
            if(count==Green_Time-1)
                next_state=Yellow;
            else
                next_state=Green;
        end

        Yellow:begin
            if(count==Yellow_Time-1)
                next_state=Red;
            else
                next_state=Yellow;
        end

        default:
            next_state=Red;
    endcase
end

assign red=(state==Red);
assign green=(state==Green);
assign yellow=(state==Yellow);

endmodule