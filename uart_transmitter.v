module uart_transmitter(
    input clk,
    input rst,
    input tx_start,
    input [7:0] tx_data,

    output reg tx,
    output reg busy
);

parameter BAUD_TICK_COUNT = 10417;

localparam IDLE  = 2'd0,
           START = 2'd1,
           DATA  = 2'd2,
           STOP  = 2'd3;

reg [1:0] state;
reg [13:0] baud_counter;
reg [2:0] bit_counter;
reg [7:0] shift_reg;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        state <= IDLE;
        baud_counter <= 0;
        bit_counter <= 0;
        shift_reg <= 0;
        tx <= 1'b1;
        busy <= 1'b0;
    end
    else
    begin
        case(state)

        IDLE:
        begin
            tx <= 1'b1;
            busy <= 1'b0;
            baud_counter <= 0;
            bit_counter <= 0;

            if(tx_start)
            begin
                shift_reg <= tx_data;
                busy <= 1'b1;
                state <= START;
            end
        end

        START:
        begin
            tx <= 1'b0;

            if(baud_counter == BAUD_TICK_COUNT-1)
            begin
                baud_counter <= 0;
                state <= DATA;
            end
            else
                baud_counter <= baud_counter + 1'b1;
        end

        DATA:
        begin
            tx <= shift_reg[0];

            if(baud_counter == BAUD_TICK_COUNT-1)
            begin
                baud_counter <= 0;
                shift_reg <= {1'b0, shift_reg[7:1]};

                if(bit_counter == 3'd7)
                begin
                    bit_counter <= 0;
                    state <= STOP;
                end
                else
                    bit_counter <= bit_counter + 1'b1;
            end
            else
                baud_counter <= baud_counter + 1'b1;
        end

        STOP:
        begin
            tx <= 1'b1;

            if(baud_counter == BAUD_TICK_COUNT-1)
            begin
                baud_counter <= 0;
                busy <= 1'b0;
                state <= IDLE;
            end
            else
                baud_counter <= baud_counter + 1'b1;
        end

        default:
            state <= IDLE;

        endcase
    end
end

endmodule
