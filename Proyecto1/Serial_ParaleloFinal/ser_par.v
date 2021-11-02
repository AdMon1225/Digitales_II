module ser_par(
    input reset, clk_4f, clk_32f, data_in, 
    output reg active, valid_out,
    output reg [7:0] data_out);

    reg [7:0] data2send, BC_counter, contador, data;

    always @(*) begin
        if (BC_counter == 4) begin
            active = 1;
            if (data_out == 'hBC) begin
                valid_out = 0;
            end
            else begin
                valid_out = 1;
            end
        end
        else begin
            active = 0;
            valid_out = 0;
        end
    end

    always @(posedge clk_32f) begin
        if (reset == 0) begin
            contador <= 7;
            data <= 0;
            data2send <= 0; 
        end
        else begin
            data[contador] <= data_in;
            if (contador == 0) 
                contador <= 7; 
            else begin
                contador <= contador-1;
                if (contador == 7) begin
                    data2send <= data;
                end
            end      
        end
    end

    always @(posedge clk_4f) begin
        if (reset == 0) begin
            data_out <= 0;
            BC_counter <= 0; 
        end
        else begin
           data_out <= data2send;
           if (BC_counter == 4) begin
               BC_counter <= 4; 
           end
           else if (BC_counter < 4) begin
               if (data2send == 'hBC) begin
               BC_counter <= BC_counter+1;
               end
               else begin
               BC_counter <= BC_counter;
               end
           end
        end
    end
endmodule 

