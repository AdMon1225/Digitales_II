module bytestriping(
    input [31:0] data_in,
    input clk_2f, clk_f, valid_in, reset,
    output reg [31:0] lane_0, lane_1,
    output reg valid_out0, valid_out1);
    
    reg selector;

    always @(posedge clk_2f) begin
        if (reset == 0) begin
                lane_0 <= 0;
                lane_1 <= 0;
                selector <= 0;
                valid_out0 <= 0;
                valid_out1 <= 0;
        end
        else if (valid_in == 0) begin
            if (selector == 0) begin
                lane_0 <= 0;
                valid_out0 <= 0;
                selector <= ~selector;
            end
            else if (selector == 1) begin
                lane_1 <= 0;
                valid_out1 <= 0;
                selector <= ~selector;
            end 
        end
        else if (valid_in == 1) begin
            if (selector == 0) begin
                lane_0 <= data_in;
                valid_out0 <= valid_in;
                selector <= ~selector;
            end 
            else if (selector == 1) begin
                lane_1 <= data_in;
                valid_out1 <= valid_in;
                selector <= ~selector;
            end
        end       
    end
endmodule