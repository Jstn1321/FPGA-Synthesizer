`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2026 11:18:44 AM
// Design Name: 
// Module Name: vcf
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vcf(
    input clk,
    input signed [15:0] audio_in,
    input [15:0] alpha,
    input [15:0] resonance,
    output reg signed [15:0] audio_out
);

    wire signed [31:0] feedback;
    wire signed [15:0] effective_audio_in;
    wire signed [31:0] temp;

    assign feedback = $signed({1'b0,resonance}) * audio_out;
    assign effective_audio_in = audio_in - feedback[30:15];
    assign temp = $signed({1'b0,alpha}) * (effective_audio_in - audio_out);

    always @(posedge clk) begin
        audio_out <= audio_out + temp[30:15];
    end

endmodule