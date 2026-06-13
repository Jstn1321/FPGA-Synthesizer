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
    
    reg signed [31:0] temp;
    
    always @ (posedge clk) begin
        temp <= audio_in * $signed({1'b0, env});
        audio_out <= temp[30:15];
    end
endmodule
