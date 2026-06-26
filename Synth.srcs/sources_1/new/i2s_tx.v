module i2s_tx #(
    parameter CLK_FREQ    = 100_000_000,
    parameter SAMPLE_RATE = 48000
)(
    input  wire clk,

    input  wire signed [15:0] sample_l,
    input  wire signed [15:0] sample_r,

    output reg bclk  = 0,
    output reg lrclk = 0,
    output reg din   = 0,
    output reg sample_tick = 0
);

localparam integer BCLK_FREQ = SAMPLE_RATE * 64;
localparam integer DIVIDER   = CLK_FREQ / (2 * BCLK_FREQ);

reg [$clog2(DIVIDER)-1:0] div_cnt = 0;

reg [5:0] bit_cnt = 0;

reg [31:0] shift_reg = 0;

reg [15:0] left_sample  = 0;
reg [15:0] right_sample = 0;

always @(posedge clk) begin
    sample_tick <= 0;
    if (div_cnt == DIVIDER-1) begin
        div_cnt <= 0;

        bclk <= ~bclk;
        if (bclk) begin
            if (bit_cnt == 63)
                bit_cnt <= 0;
            else
                bit_cnt <= bit_cnt + 1;
            if (bit_cnt == 63) begin
                sample_tick <= 1;
                lrclk <= 0;

                left_sample  <= sample_l;
                right_sample <= sample_r;

                shift_reg <= {sample_l,16'h0000};

                din <= 0;
            end
            else if (bit_cnt == 31) begin
                lrclk <= 1;

                shift_reg <= {right_sample,16'h0000};

                din <= 0;   
            end

            else begin
                din <= shift_reg[31];
                shift_reg <= {shift_reg[30:0],1'b0};
            end

        end

    end
    else begin
        div_cnt <= div_cnt + 1;
    end

end

endmodule