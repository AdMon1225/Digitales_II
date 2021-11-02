module Paralelo_Serial(
    input [7:0] data_in,
    input clk_4f, clk_32f, valid_in, reset,
    output reg data_out);

    reg [7:0] data2send, contador;

    always @ (*) begin
        data2send = 0;
        data_out = 0;
        if (reset == 0) begin
            data2send = 0;
            data_out = 0;
        end
        else if (valid_in == 0) begin
            data2send = 'hBC;
            data_out = data2send[contador];
        end
        else if (valid_in == 1) begin
            data2send = data_in;
            data_out = data2send[contador];
        end
    end

    always @(posedge clk_32f) begin
         if (reset == 0) begin
            contador <= 7;
        end
        else if (contador == 0) begin
            contador <= 7;
        end
        else begin
            contador <= contador - 1;
        end      
    end
endmodule

