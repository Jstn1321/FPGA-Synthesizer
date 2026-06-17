module bpm_clock(
    input clk,
    input [15:0] bpm,
    input running,
    output reg step_pulse
);
    reg [31:0] counter;
    reg [15:0] bpm_latch;

    always @(posedge clk) begin
        if (!running) begin
            counter    <= 0;
            step_pulse <= 0;
            bpm_latch  <= bpm;
        end else begin
            if (counter >= bpm_latch) begin
                counter    <= 0;
                step_pulse <= 1;
                bpm_latch  <= bpm;
            end else begin
                counter    <= counter + 1;
                step_pulse <= 0;
            end
        end
    end
endmodule