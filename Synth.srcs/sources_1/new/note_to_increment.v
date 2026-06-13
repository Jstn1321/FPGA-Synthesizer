`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2026 09:24:51 PM
// Design Name: 
// Module Name: note_to_increment
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


module note_to_increment(
    input clk,
    input [6:0] note,
    output [31:0] increment
    );
    
    blk_mem_gen_0 note_rom(
        .clka   (clk),
        .addra  (note),
        .douta  (increment)
    );
endmodule
