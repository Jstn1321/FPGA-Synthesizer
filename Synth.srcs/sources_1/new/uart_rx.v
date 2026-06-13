`timescale 1ns / 1ps
module uart_rx #(
    parameter CLK_FREQ  = 100_000_000,
    parameter BAUD_RATE = 115200
)(
    input  wire        clk,
    input  wire        rx,
    output reg  [15:0] attack,
    output reg  [15:0] decay,
    output reg  [15:0] sustain,
    output reg  [15:0] release_time,
    output reg  [15:0] bpm
);

localparam CLKS_PER_BIT = CLK_FREQ / BAUD_RATE;

localparam IDLE  = 2'd0;
localparam START = 2'd1;
localparam DATA  = 2'd2;
localparam STOP  = 2'd3;

reg [1:0]  uart_state;
reg [15:0] clk_count;
reg [2:0]  bit_index;
reg [7:0]  rx_byte;
reg [7:0]  data;
reg        valid;

always @(posedge clk) begin
    valid <= 0;
    case (uart_state)
        IDLE:  if (!rx) begin
            uart_state <= START;
            clk_count  <= 0;
        end

        START: if (clk_count == CLKS_PER_BIT/2) begin
            uart_state <= DATA;
            clk_count  <= 0;
            bit_index  <= 0;
        end else clk_count <= clk_count + 1;

        DATA: if (clk_count == CLKS_PER_BIT) begin
            clk_count          <= 0;
            rx_byte[bit_index] <= rx;
            if (bit_index == 7) uart_state <= STOP;
            else bit_index <= bit_index + 1;
        end else clk_count <= clk_count + 1;

        STOP: if (clk_count == CLKS_PER_BIT) begin
            uart_state <= IDLE;
            data       <= rx_byte;
            valid      <= 1;
        end else clk_count <= clk_count + 1;
    endcase
end

localparam WAIT_SYNC = 2'd0;
localparam WAIT_ID   = 2'd1;
localparam WAIT_HIGH = 2'd2;
localparam WAIT_LOW  = 2'd3;

reg [1:0] pkt_state;
reg [7:0] param_id;
reg [7:0] value_high;

always @(posedge clk) begin
    if (valid) begin
        case (pkt_state)
            WAIT_SYNC: begin
                if (data == 8'hFF)
                    pkt_state <= WAIT_ID;
            end
            WAIT_ID: begin
                if (data >= 8'h01 && data <= 8'h05) begin
                    param_id  <= data;
                    pkt_state <= WAIT_HIGH;
                end else begin
                    pkt_state <= WAIT_SYNC;
                end
            end 
            WAIT_HIGH: begin
                value_high <= data;
                pkt_state  <= WAIT_LOW;
            end
            WAIT_LOW: begin
                case (param_id)
                    8'h01: if ({value_high, data} <= 1023 &&
                               ({value_high, data} > attack + 4 ||
                                {value_high, data} + 4 < attack))
                               attack <= {value_high, data};
                    8'h02: if ({value_high, data} <= 1023 &&
                               ({value_high, data} > decay + 4 ||
                                {value_high, data} + 4 < decay))
                               decay <= {value_high, data};
                    8'h03: if ({value_high, data} <= 1023 &&
                               ({value_high, data} > sustain + 4 ||
                                {value_high, data} + 4 < sustain))
                               sustain <= {value_high, data};
                    8'h04: if ({value_high, data} <= 1023 &&
                               ({value_high, data} > release_time + 4 ||
                                {value_high, data} + 4 < release_time))
                               release_time <= {value_high, data};
                    8'h05: if ({value_high, data} <= 1023 &&
                               ({value_high, data} > bpm + 4 ||
                                {value_high, data} + 4 < bpm))
                               bpm <= {value_high, data};
                endcase
                pkt_state <= WAIT_SYNC;
            end
        endcase
    end
end

endmodule