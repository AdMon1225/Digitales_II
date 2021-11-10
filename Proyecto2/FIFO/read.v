module read(
    input clk, reset, fifo_rd,
    output reg [2:0] rd_ptr);

    always @(posedge clk) begin
        if (reset == 0) begin
            rd_ptr <= 0; 
        end
        else if (fifo_rd == 1) begin
            rd_ptr <= rd_ptr + 1; 
        end
        else if (fifo_rd == 0) begin
            rd_ptr <= rd_ptr;
        end
    end
endmodule  