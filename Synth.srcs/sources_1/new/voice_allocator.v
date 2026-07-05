`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2026 04:24:00 PM
// Design Name: 
// Module Name: voice_allocator
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

module voice_allocator(
    input clk,

    input note_event,
    input note_on,
    input [6:0] event_note,

    output reg gate0,
    output reg gate1,
    output reg gate2,
    output reg gate3,

    output reg [6:0] note0,
    output reg [6:0] note1,
    output reg [6:0] note2,
    output reg [6:0] note3
);

reg used0 = 0;
reg used1 = 0;
reg used2 = 0;
reg used3 = 0;

always @(posedge clk) begin

    if (note_event) begin
        if (note_on) begin

            if (!used0) begin
                used0 <= 1;
                gate0 <= 1;
                note0 <= event_note;
            end

            else if (!used1) begin
                used1 <= 1;
                gate1 <= 1;
                note1 <= event_note;
            end

            else if (!used2) begin
                used2 <= 1;
                gate2 <= 1;
                note2 <= event_note;
            end

            else if (!used3) begin
                used3 <= 1;
                gate3 <= 1;
                note3 <= event_note;
            end

            else begin
                note0 <= event_note;
                gate0 <= 1;
            end

        end

        else begin

            if (used0) begin
                used0 <= 0;
                gate0 <= 0;
            end
            else if (used1) begin
                used1 <= 0;
                gate1 <= 0;
            end
            else if (used2) begin
                used2 <= 0;
                gate2 <= 0;
            end
            else if (used3) begin
                used3 <= 0;
                gate3 <= 0;
            end

        end

    end

end

endmodule