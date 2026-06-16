`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 02:19:47 PM
// Design Name: 
// Module Name: bpm_clock
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


module bpm_clock(
    input clk,
    input [15:0] bpm,
    input running,
    output reg step_pulse
    );
    
    wire [31:0] max = 32'd375_000_000 / (bpm + 1);
    reg [31:0] counter;
    
    always @ (posedge clk) begin
        if (!running) begin
            counter <= 0;
            step_pulse <= 0;
        end else begin
            if (counter >= max) begin
                counter <= 0;
                step_pulse <= 1;
            end else begin
                counter <= counter + 1;
                step_pulse <= 0;
            end
        end
    end
endmodule
