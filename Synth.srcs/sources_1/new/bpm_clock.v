`timescale 1ns / 1ps

module bpm_clock(
    input clk,
    input [15:0] bpm,
    input running,
    output reg step_pulse = 0,
    output reg gate_pulse = 0
);

localparam CLK_FREQ = 100_000_000;

reg [31:0] counter = 0;
reg [31:0] step_period;

// Calculate clocks per 16th note
always @(*) begin
    if (bpm < 1)
        step_period = CLK_FREQ;
    else
        step_period = (CLK_FREQ * 60) / (bpm * 4);
end

always @(posedge clk) begin
    if (!running) begin
        counter    <= 0;
        step_pulse <= 0;
        gate_pulse <= 0;
    end else begin
        step_pulse <= 0;

        if (counter >= step_period - 1) begin
            counter    <= 0;
            step_pulse <= 1;
            gate_pulse <= 1;
        end else begin
            counter <= counter + 1;

            if (counter >= (step_period >> 1))
                gate_pulse <= 0;
        end
    end
end

endmodule