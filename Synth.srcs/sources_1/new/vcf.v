`timescale 1ns / 1ps

module vcf(
    input  wire               clk,
    input  wire signed [15:0] audio_in,
    input  wire        [15:0] alpha,
    input  wire        [15:0] resonance,
    output reg  signed [15:0] audio_out = 16'sd0
);

reg signed [15:0] s1 = 16'sd0;
reg signed [15:0] s2 = 16'sd0;
reg signed [15:0] s3 = 16'sd0;
reg signed [15:0] s4 = 16'sd0;


wire signed [31:0] fb_mult =
    $signed({1'b0, resonance}) * s4;

wire signed [15:0] feedback =
    audio_in - fb_mult[30:15];


wire signed [15:0] d1_in = feedback - s1;
wire signed [15:0] d2_in = s1 - s2;
wire signed [15:0] d3_in = s2 - s3;
wire signed [15:0] d4_in = s3 - s4;


wire signed [31:0] m1 =
    $signed({1'b0, alpha}) * d1_in;

wire signed [31:0] m2 =
    $signed({1'b0, alpha}) * d2_in;

wire signed [31:0] m3 =
    $signed({1'b0, alpha}) * d3_in;

wire signed [31:0] m4 =
    $signed({1'b0, alpha}) * d4_in;

always @(posedge clk) begin
    s1 <= s1 + m1[30:15];
    s2 <= s2 + m2[30:15];
    s3 <= s3 + m3[30:15];
    s4 <= s4 + m4[30:15];

    audio_out <= s4;
end

endmodule