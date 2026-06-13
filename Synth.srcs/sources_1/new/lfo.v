`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2026 11:30:01 AM
// Design Name: 
// Module Name: lfo
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


module lfo(
    input clk,
    input [15:0] rate,
    input [3:0] waveform,
    output signed [15:0] lfo_out
    );
    
    wire [31:0] increment_lfo = rate * 655;
    wire [31:0] phase;
    wire signed [15:0] square, saw, triangle, sine;
    reg signed [15:0] reg_lfo_out;
    
    nco u_nco (
        .clk (clk),
        .increment (increment_lfo),
        .phase (phase)
    );
    
    waveforms u_waveforms (
        .clk (clk),
        .phase   (phase),
        .square  (square),
        .saw    (saw),
        .triangle   (triangle),
        .sine   (sine)
    );
    
    always @ (posedge clk) begin
        if (waveform[0]) reg_lfo_out <= square;
        else if (waveform[1]) reg_lfo_out <= saw;
        else if (waveform[2]) reg_lfo_out <= triangle;
        else if (waveform[3]) reg_lfo_out <= sine;
    end
    
    assign lfo_out = reg_lfo_out;
    
endmodule
