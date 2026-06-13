`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2026 03:08:42 PM
// Design Name: 
// Module Name: occilator
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


module occilator(
    input clk,
    input [31:0] increment,
    input [1:0] waveform,
    input gate,
    input [15:0] attack,
    input [15:0] decay,
    input [15:0] sustain,
    input [15:0] release_time,
    output signed [15:0] sample
    );

    wire [31:0] phase;
    wire signed [15:0] square, saw, triangle, sine;

    nco u_nco (
    .clk(clk),
    .phase(phase),
    .increment(increment)
    );
    
    waveforms u_wave (
    .clk      (clk),
    .phase    (phase),
    .square   (square),
    .saw      (saw),
    .triangle (triangle),
    .sine     (sine)
    );
    
    reg [15:0] reg_sample;
    //0 is sqr 1 is saw 2 is tri 3 is sin
    always @ (posedge clk) begin
        if (waveform == 2'd0) begin
            reg_sample <= square;
        end else if (waveform == 2'd1) begin
            reg_sample <= saw;
        end else if (waveform == 2'd2) begin
            reg_sample <= triangle;
        end else if (waveform == 2'd3) begin
            reg_sample <= sine;
        end 
    end
    
    wire [15:0] env;
    
    adsr u_adsr (
    .clk    (clk),
    .attack (attack),
    .sustain    (sustain),
    .decay  (decay),
    .release_time   (release_time),
    .gate   (gate),
    .env_out (env)
    );
    
    vca u_vca (
    .clk    (clk),
    .audio_in   (reg_sample),
    .env    (env),
    .audio_out  (sample)
    );

endmodule