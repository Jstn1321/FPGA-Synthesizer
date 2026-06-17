`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2026 03:39:03 PM
// Design Name: 
// Module Name: i2s_tx
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


module i2s_tx #(
    parameter CLK_FREQ   = 100_000_000,
    parameter SAMPLE_RATE = 44_100,
    parameter BIT_DEPTH  = 32
)(
    input  clk,
    input  signed [15:0] sample_l,
    input  signed [15:0] sample_r,
    output reg bclk,
    output reg lrclk,
    output reg din
);

localparam BCLK_DIV  = CLK_FREQ / (SAMPLE_RATE * BIT_DEPTH * 2 * 2);

reg [5:0]  bit_cnt;   
reg [31:0] shift_reg;  
reg [7:0]  bclk_cnt;   

always @(posedge clk) begin
    bclk_cnt <= bclk_cnt + 1;

    if (bclk_cnt == BCLK_DIV - 1) begin
        bclk_cnt <= 0;
        bclk     <= ~bclk;

        if (bclk) begin
            if (bit_cnt == 0) begin
                lrclk    <= 0;
                shift_reg <= {sample_l, 16'd0};
            end else if (bit_cnt == 32) begin
                lrclk    <= 1;
                shift_reg <= {sample_r, 16'd0};
            end

            din     <= shift_reg[31];
            shift_reg <= {shift_reg[30:0], 1'b0};
            bit_cnt <= bit_cnt + 1;

            if (bit_cnt == 63) bit_cnt <= 0;
        end
    end
end

endmodule
