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

reg signed [15:0] s1, s2, s3, s4;
reg signed [31:0] fb, temp1, temp2, temp3, temp4;
reg signed [15:0] in1;

always @(posedge clk) begin
    fb   <= $signed({1'b0, resonance}) * s4;
    in1  <= audio_in - fb[30:15];
    temp1 <= $signed({1'b0, alpha}) * (in1 - s1);
    s1    <= s1 + temp1[30:15];
    temp2 <= $signed({1'b0, alpha}) * (s1 - s2);
    s2    <= s2 + temp2[30:15];
    temp3 <= $signed({1'b0, alpha}) * (s2 - s3);
    s3    <= s3 + temp3[30:15];
    temp4 <= $signed({1'b0, alpha}) * (s3 - s4);
    s4    <= s4 + temp4[30:15];

    audio_out <= s4;
end

endmodule