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
    output reg signed [15:0] audio_out
    );
    
    reg signed [31:0] temp;
    
    always @ (posedge clk) begin
        temp <= ($signed({1'b0,alpha}) * (audio_in - audio_out));
        audio_out <= audio_out + temp[30:15] ;
    end
endmodule
