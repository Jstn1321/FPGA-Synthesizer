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
    input [3:0] waveform,
    input gate,
    input sample_tick,
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
    .sample_tick(sample_tick),
    .increment(increment)
    );
    
    waveforms u_wave (
    .clk      (clk),
    .phase    (phase),
    .increment(increment),
    .square   (square),
    .saw      (saw),
    .triangle (triangle),
    .sine     (sine)
    );
    
    reg signed [15:0] reg_sample;
    //0 is sqr 1 is saw 2 is tri 3 is sin
    always @ (posedge clk) begin
        if (waveform[0]) reg_sample <= square;
        else if (waveform[1]) reg_sample <= saw;
        else if (waveform[2]) reg_sample <= triangle;
        else if (waveform[3]) reg_sample <= sine;
    end
    
    wire [15:0] env;
    
    adsr u_adsr (
    .clk    (clk),
    .attack (attack),
    .sustain    (sustain),
    .decay  (decay),
    .release_time   (release_time),
    .gate   (gate),
    .sample_tick    (sample_tick),
    .env_out (env)
    );
    
    vca u_vca (
    .clk    (clk),
    .audio_in   (reg_sample),
    .env    (env),
    .audio_out  (sample)
    );

//assign sample = reg_sample;
endmodule