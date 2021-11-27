module write(
    input clk, reset, fifo_wr,
    output reg [2:0] wr_ptr);

    always @(posedge clk) begin
        if (reset == 0) begin
            wr_ptr <= 0; 
        end
        else if (fifo_wr == 1) begin
            wr_ptr <= wr_ptr + 1; 
        end
        else if (fifo_wr == 0) begin
            wr_ptr <= wr_ptr;
        end
    end
endmodule
