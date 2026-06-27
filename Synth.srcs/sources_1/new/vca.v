`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2026 08:32:37 PM
// Design Name: 
// Module Name: vca
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


module vca(
    input clk,
    input signed [15:0] audio_in,
    input [15:0] env,
    output reg signed [15:0] audio_out
    );
    
    wire signed [31:0] mult;

    assign mult = audio_in * $signed({1'b0, env});
    
    always @(posedge clk)
        audio_out <= mult[30:15];
endmodule
