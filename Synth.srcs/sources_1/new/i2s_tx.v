module i2s_tx #(
    parameter CLK_FREQ    = 100_000_000,
    parameter SAMPLE_RATE = 48_000,
    parameter BIT_DEPTH   = 16
)(
    input  clk,
    input  signed [15:0] sample_l,
    input  signed [15:0] sample_r,
    output reg bclk,
    output reg lrclk,
    output reg din,
    output reg sample_tick
);
    localparam BCLK_DIV = CLK_FREQ / (SAMPLE_RATE * BIT_DEPTH * 2 * 2);

    reg [4:0]  bit_cnt;
    reg [15:0] shift_reg;
    reg [7:0]  bclk_cnt;

    always @(posedge clk) begin
    bclk_cnt <= bclk_cnt + 1;
    if (bclk_cnt == BCLK_DIV - 1) begin
        bclk_cnt <= 0;
        bclk <= ~bclk;

        if (bclk == 1) begin 
            din       <= shift_reg[15];
            shift_reg <= {shift_reg[14:0], 1'b0};
            bit_cnt   <= bit_cnt + 1;
            if (bit_cnt == 31) bit_cnt <= 0;
        end else begin 
            if (bit_cnt == 0) begin
                lrclk     <= 0;
                shift_reg <= sample_l;
            end else if (bit_cnt == 16) begin
                lrclk     <= 1;
                shift_reg <= sample_r;
            end
        end
    end
    
    sample_tick <= (bclk == 1 && bit_cnt == 31) ? 1 : 0;
end

endmodule