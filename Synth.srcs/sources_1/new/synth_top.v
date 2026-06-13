`timescale 1ns / 1ps
module synth_top(
    input        clk,
    input        pmod_rx,
    output [3:0] an,
    output [6:0] seg
);

wire [15:0] attack, decay, sustain, release_time, bpm;

uart_rx u_uart (
    .clk          (clk),
    .rx           (pmod_rx),
    .attack       (attack),
    .decay        (decay),
    .sustain      (sustain),
    .release_time (release_time),
    .bpm          (bpm)
);

wire [15:0] bpm_display = (bpm * 200 / 1023) + 40;

wire [3:0] digit0 = bpm_display % 10;
wire [3:0] digit1 = (bpm_display / 10) % 10;
wire [3:0] digit2 = (bpm_display / 100) % 10;
wire [3:0] digit3 = (bpm_display / 1000) % 10;

reg [18:0] refresh;
always @(posedge clk) refresh <= refresh + 1;

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

reg [15:0] bpm_latch;
always @(posedge clk) begin
    if (refresh[18:17] == 2'b11 && refresh[16:0] == 0)
        bpm_latch <= bpm_display;
end

wire [3:0] digit0 = bpm_latch % 10;
wire [3:0] digit1 = (bpm_latch / 10) % 10;
wire [3:0] digit2 = (bpm_latch / 100) % 10;
wire [3:0] digit3 = (bpm_latch / 1000) % 10;

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

endmodule