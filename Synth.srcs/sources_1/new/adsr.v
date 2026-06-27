`timescale 1ns / 1ps
module adsr(
    input clk,
    input sample_tick,
    input [15:0] attack,
    input [15:0] decay,
    input [15:0] sustain,
    input [15:0] release_time,
    input gate,
    output reg [15:0] env_out = 16'd0
);

localparam IDLE    = 3'd0;
localparam ATTACK  = 3'd1;
localparam DECAY   = 3'd2;
localparam SUSTAIN = 3'd3;
localparam RELEASE = 3'd4;

reg [2:0] state = IDLE;

wire [15:0] attack_scaled  = (attack  >> 6) + 1;
wire [15:0] decay_scaled   = (decay   >> 6) + 1;
wire [15:0] release_scaled = (release_time >> 6) + 1;
wire [15:0] sustain_scaled = (sustain > 10'd1023) ? 16'hFFFF : sustain << 6;

always @(posedge clk) begin
    if (sample_tick) begin
        case (state)
            IDLE: begin
                env_out <= 16'd0;
                if (gate) state <= ATTACK;
            end

            ATTACK: begin
                if (!gate) begin
                    state <= RELEASE;
                end else if ({1'b0, env_out} + {1'b0, attack_scaled} >= 17'hFFFF) begin
                    env_out <= 16'hFFFF;
                    state   <= DECAY;
                end else begin
                    env_out <= env_out + attack_scaled;
                end
            end

            DECAY: begin
                if (!gate) begin
                    state <= RELEASE;
                end else if (env_out <= sustain_scaled + decay_scaled) begin
                    env_out <= sustain_scaled;
                    state   <= SUSTAIN;
                end else begin
                    env_out <= env_out - decay_scaled;
                end
            end

            SUSTAIN: begin
                env_out <= sustain_scaled;
                if (!gate) state <= RELEASE;
            end

            RELEASE: begin
                if (gate) begin
                    state <= ATTACK;
                end else if (env_out <= release_scaled) begin
                    env_out <= 16'd0;
                    state   <= IDLE;
                end else begin
                    env_out <= env_out - release_scaled;
                end
            end

            default: begin
                state   <= IDLE;
                env_out <= 16'd0;
            end
        endcase
    end
end
endmodule