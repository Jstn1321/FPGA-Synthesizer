`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2026 02:13:22 PM
// Design Name: 
// Module Name: nco
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


module nco(
    input clk,
    input [31:0] increment,
    output reg [31:0] phase
    );
    
    always @ (posedge clk) begin
        phase <= phase + increment;
    end
endmodule
