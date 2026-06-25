`timescale 1ns / 1ps
module synth_top(
    input clk,
    input teensy_rx,
    input btn,
    input [15:0] sw,
    output [3:0] an,
    output [6:0] seg,
    output [15:0] led,
    output bclk,
    output lrclk,
    output din
);

wire [15:0] attack, decay, sustain, release_time, bpm;
wire [15:0] cutoff, resonance;
wire [15:0] lfo_rate, lfo_depth;
reg [15:0] mod_cutoff;
reg [15:0] alpha_pipe;
wire signed [15:0] lfo_out;
wire [6:0] kbd_note;
wire [6:0] active_note;
wire [6:0] seq_note_out;
wire seq_gate_out;
//wire [15:0] bpm_display = active_note;

wire [3:0] write_step;
wire [6:0] write_note;
wire write_enable;
wire [15:0] active_steps;
wire sample_tick;
reg [18:0] refresh;
always @(posedge clk) refresh <= refresh + 1;

reg [15:0] bpm_latch;



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
    .note      (active_note),
    .increment (increment)
);
wire gate_sig;
wire gate_from_uart;
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
    .sample_tick(sample_tick),
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
    .note(kbd_note),
    .write_step(write_step),
    .write_note(write_note),
    .write_enable(write_enable),
    .active_steps(active_steps),
    .gate_out     (gate_from_uart),
    .cutoff       (cutoff),
    .resonance    (resonance),
    .lfo_rate     (lfo_rate),
    .lfo_depth    (lfo_depth),
    .seq_run (seq_run),
    .volume (volume),
    .seq_reset  (seq_reset)
);

wire step_pulse;

bpm_clock u_bpm(
    .clk    (clk),
    .bpm    (bpm),
    .running    (seq_run),
    .step_pulse (step_pulse)
);
wire [3:0] current_step_out;
seq u_seq(
    .clk    (clk),
    .step_pulse (step_pulse),
    .running   (seq_run),
    .reset  (seq_reset),
    .write_note (write_note),
    .write_step (write_step),
    .write_enable   (write_enable),
    .active (active_steps),
    .note_out   (seq_note_out),
    .gate_out   (seq_gate_out),
    .current_step(current_step_out)
);
assign gate_sig = seq_run ? seq_gate_out : (gate_from_uart | btn);
assign active_note = seq_run ? seq_note_out : kbd_note;
//assign led = filtered_audio[15];
wire signed [15:0] final_audio;
wire [15:0] vol_scaled = volume << 6;

vca u_volume (
    .clk      (clk),
    .audio_in (filtered_audio),
    .env      (vol_scaled),
    .audio_out(final_audio)
);

i2s_tx u_i2s (
    .clk      (clk),
    .sample_l (audio),
    .sample_r (audio), 
    .bclk     (bclk),
    .lrclk    (lrclk),
    .din      (din),
    .sample_tick(sample_tick)
);


reg [3:0] step_counter;
always @(posedge clk) begin
    if (step_pulse) step_counter <= step_counter + 1;
end

//wire [15:0] bpm_display = {12'b0, step_counter};
//wire [15:0] bpm_display = bpm;
wire [15:0] bpm_display = {9'b0, active_note};
//wire [15:0] bpm_display = {8'b0, dbg_write_count};
//wire [15:0] bpm_display = {12'b0, write_step};
//wire [15:0] bpm_display = {9'b0, write_note};

assign led = 16'b1 << current_step_out;
reg [25:0] slow;
always @(posedge clk) slow <= slow + 1;

always @(posedge clk) begin
    if (slow == 0)
        bpm_latch <= bpm_display;
end
/*
reg [6:0] last_write_note;
always @(posedge clk) begin
    if (write_enable) last_write_note <= write_note;
end
*/


endmodule