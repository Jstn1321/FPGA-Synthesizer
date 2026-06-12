`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2026 03:01:25 PM
// Design Name: 
// Module Name: waveforms
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


module waveforms(
    input clk,
    input [31:0]phase,
    output signed [15:0] square,
    output signed [15:0] saw,
    output signed [15:0] triangle,
    output signed [15:0] sine
    );
    assign square = phase[31] ? 16'sd32767 : -16'sd32767;
    
    assign saw = $signed(phase[31:16]) - 16'sd32768;
    
    wire [14:0] half = phase[30:16];
    assign triangle = phase[31]
        ? 16'sd32767 - $signed({1'b0, half}) : $signed({1'b0, half}) - 16'sd32768;  // rising:  -32768 → -1
    
    wire [7:0] addr = phase[31:24];
     
    blk_mem_gen_1 sine_rom (
    .clka(clk),
    .addra(addr),
    .douta(sine)
    );
endmodule