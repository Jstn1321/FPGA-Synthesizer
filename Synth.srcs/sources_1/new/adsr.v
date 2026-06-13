`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2026 07:52:32 PM
// Design Name: 
// Module Name: adsr
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


module adsr(
    input clk,
    input [15:0] attack,
    input [15:0] sustain,
    input [15:0] decay,
    input [15:0] release_time,
    input gate,
    output reg [15:0] env_out
    );
    
    localparam IDLE = 3'd0;
    localparam ATTACK = 3'd1;
    localparam DECAY = 3'd2;
    localparam SUSTAIN = 3'd3;
    localparam RELEASE = 3'd4;
    
    reg [2:0] ADSR_STATE;
    
    always @ (posedge clk) begin
        case (ADSR_STATE)
            IDLE: begin
                env_out <= 0;
                if (gate) ADSR_STATE <= ATTACK;
                end
                
            ATTACK: begin
                if (env_out + attack >= 16'hFFFF) begin
                    env_out <= 16'hFFFF;
                    ADSR_STATE <= DECAY;
                end else if (!gate) ADSR_STATE <= RELEASE;
                else env_out <= env_out + attack;
            end
            
            DECAY: begin
                if (env_out - decay <= sustain) begin
                    env_out <= sustain;
                    ADSR_STATE <= SUSTAIN;
                end else if (!gate) ADSR_STATE <= RELEASE;
                else env_out <= env_out - decay;
            end
            
            SUSTAIN: begin
                env_out <= sustain;
                if (!gate) ADSR_STATE <= RELEASE;
            end
            
            RELEASE: begin
                if (env_out <= release_time) begin
                    env_out <= 0;
                    ADSR_STATE <= IDLE;
                end else env_out <= env_out - release_time;
                if (gate) ADSR_STATE <= ATTACK;
            end
            endcase
        end
endmodule
