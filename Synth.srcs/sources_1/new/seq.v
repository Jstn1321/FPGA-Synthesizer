`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 02:36:52 PM
// Design Name: 
// Module Name: seq
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


module seq(
    input clk,
    input step_pulse,
    input running,
    input reset,
    input gate_pulse,
    input [6:0] write_note,
    input [3:0] write_step,
    input write_enable,
    input [15:0] active,
    output reg [6:0] note_out,
    output reg gate_out,
    output reg [3:0] current_step,
    output reg note_event
    );
    
    reg [6:0] notes [0:15];
    wire [3:0] next_step = current_step + 1;
    integer i;

    initial begin
        for (i = 0; i < 16; i = i + 1)
            notes[i] = 7'd60;
    end

    always @(posedge clk) begin
        if (reset) begin
            current_step <= 0;
            note_out     <= 7'd60;
            gate_out     <= 0;
            note_event <= 0;
            for (i = 0; i < 16; i = i + 1)
                notes[i] <= 7'd60;
        end else if (step_pulse) begin
            note_out    <= notes[current_step];
            gate_out    <= active[current_step] & running;
            note_event  <= active[current_step] & running;
            current_step <= current_step + 1;
        end else begin
            if (gate_out && !gate_pulse) begin
                gate_out   <= 0;
                note_event <= 1;
            end
            else begin
                note_event <= 0;
            end
        end
            if (write_enable) notes[write_step] <= write_note;
        end
endmodule
