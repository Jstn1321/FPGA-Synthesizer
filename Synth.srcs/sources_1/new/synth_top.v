`timescale 1ns / 1ps
module synth_top(
    input clk,
    input teensy_rx,
    input btn,
    input [15:0] sw,
    output [3:0] an,
    output [6:0] seg,
    output led
);

wire [15:0] attack, decay, sustain, release_time, bpm;
wire [15:0] cutoff, resonance;
wire [15:0] lfo_rate, lfo_depth;
reg [15:0] mod_cutoff;
reg [15:0] alpha_pipe;
wire signed [15:0] lfo_out;
wire [6:0] note;
wire [15:0] bpm_display = note;

reg [18:0] refresh;
always @(posedge clk) refresh <= refresh + 1;

reg [15:0] bpm_latch;
always @(posedge clk) begin
    if (refresh[18:17] == 2'b11 && refresh[16:0] == 0)
        bpm_latch <= bpm_display;
end

wire [3:0] digit0 = bpm_latch % 10;
wire [3:0] digit1 = (bpm_latch / 10) % 10;
wire [3:0] digit2 = (bpm_latch / 100) % 10;
wire [3:0] digit3 = (bpm_latch / 1000) % 10;

reg [3:0] digit;
always @(*) begin
    case (refresh[18:17])
        2'b00: digit = digit0;
        2'b01: digit = digit1;
        2'b10: digit = digit2;
        2'b11: digit = digit3;
    endcase
end

assign an = ~(4'b0001 << refresh[18:17]);

reg [6:0] seg_reg;
always @(*) begin
    case (digit)
        4'd0: seg_reg = 7'b1000000;
        4'd1: seg_reg = 7'b1111001;
        4'd2: seg_reg = 7'b0100100;
        4'd3: seg_reg = 7'b0110000;
        4'd4: seg_reg = 7'b0011001;
        4'd5: seg_reg = 7'b0010010;
        4'd6: seg_reg = 7'b0000010;
        4'd7: seg_reg = 7'b1111000;
        4'd8: seg_reg = 7'b0000000;
        4'd9: seg_reg = 7'b0010000;
        default: seg_reg = 7'b1111111;
    endcase
end

assign seg = seg_reg;



wire [31:0] increment;
note_to_increment u_note_to_increment(
    .clk       (clk),
    .note      (note),
    .increment (increment)
);

wire gate_from_uart;
wire gate_sig = gate_from_uart | btn;
wire signed [15:0] audio;
occilator u_occilator(
    .clk          (clk),
    .increment    (increment),
    .waveform     (sw[3:0]),
    .gate         (gate_sig),
    .attack       (attack),
    .decay        (decay),
    .sustain      (sustain),
    .release_time (release_time),
    .sample       (audio)
);

wire signed [15:0] filtered_audio;
wire signed [31:0] lfo_scaled_wide = lfo_out * $signed({1'b0, lfo_depth});
wire signed [15:0] lfo_scaled = lfo_scaled_wide[30:15];

always @(posedge clk) begin
    mod_cutoff <= cutoff + lfo_scaled;
    alpha_pipe <= mod_cutoff;
end

vcf u_vcf (
    .clk (clk),
    .audio_in (audio),
    .alpha (alpha_pipe),
    .resonance (resonance),
    .audio_out (filtered_audio)
);

lfo u_lfo (
    .clk    (clk),
    .rate   (lfo_rate),
    .waveform (sw[15:12]),
    .lfo_out    (lfo_out)
);

wire [15:0] volume;
wire seq_run;
wire seq_reset;

uart_rx u_teensy (
    .clk          (clk),
    .rx           (teensy_rx),
    .attack       (attack),
    .decay        (decay),
    .sustain      (sustain),
    .release_time (release_time),
    .bpm          (bpm),
    .note         (note),
    .gate_out     (gate_from_uart),
    .cutoff       (cutoff),
    .resonance    (resonance),
    .lfo_rate     (lfo_rate),
    .lfo_depth    (lfo_depth),
    .seq_run (seq_run),
    .volume (volume),
    .seq_reset  (seq_reset)
);

assign led = filtered_audio[15];

endmodule