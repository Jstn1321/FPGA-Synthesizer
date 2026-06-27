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
    input [31:0] increment,
    output signed [15:0] square,
    output signed [15:0] saw,
    output signed [15:0] triangle,
    output signed [15:0] sine
    );
    wire signed [15:0] raw_square =
        phase[31] ? 16'sd32767 : -16'sd32768;
    
    wire signed [15:0] raw_saw =
        $signed(phase[31:16]) - 16'sd32768;
    
    reg [31:0] prev_phase = 0;
    
    reg signed [15:0] blep_square = 0;
    reg signed [15:0] blep_saw = 0;
    
    wire wrap = (phase < prev_phase);
    
    always @(posedge clk) begin
        prev_phase <= phase;
    

        blep_square <= blep_square - (blep_square >>> 2);
        blep_saw    <= blep_saw    - (blep_saw    >>> 2);
    

        if (wrap) begin
            blep_square <= 16'sd32767;
            blep_saw    <= 16'sd32767;
        end
    end
    
    //assign square = raw_square - blep_square;
    assign square = raw_square;
    assign saw    = raw_saw    - blep_saw;
    
    wire signed [15:0] triangle_raw;

    wire [15:0] tri_phase =
        phase[31] ? ~phase[30:15] : phase[30:15];
    
    assign triangle = $signed(tri_phase) - 16'sd32768;
    
    wire [7:0] addr = phase[31:24];
     
    blk_mem_gen_1 sine_rom (
    .clka(clk),
    .addra(addr),
    .douta(sine)
    );
endmodule