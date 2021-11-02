module ser_par(
    input reset,
    input clk_4f,
	input clk_32f,
    input data_in,
    output reg active,
    output reg valid_out,
    output reg [7:0] data_out);

    reg [7:0] data2send, data, BC_counter, contador;

    always @(*) begin
        active = 0;
        valid_out = 0;
        data_out = 0;
        if (reset == 0) begin
            active = 0;
            valid_out = 0;
            data_out = 0;
        end
        else if (BC_counter == 4) begin
            data[contador] = data_in;
            data_out = data2send;
            active = 1;
            if (data2send == 'hBC) begin
               valid_out = 0;
            end
            else begin
                valid_out = 1; 
            end
        end
        else begin
            data[contador] = data_in;
            data_out = data2send;
            active = 0;
        end
    end 

    always @(posedge clk_32f) begin
        if (reset == 0) begin
            data <= 0;
            contador <= 7;
        end
        else if (contador == 0) begin
            contador <= 7;
        end
        else begin
            contador <= contador - 1;
        end
    end

    always @(posedge clk_4f) begin
        if (reset == 0) begin
            BC_counter <= 0;
            data2send <= 0;
        end
        else if (BC_counter == 4) begin
            BC_counter <= BC_counter;
            data2send <= data;
        end
        else begin
            BC_counter <= BC_counter + 1;
            data2send <= data;
        end
    end
endmodule 
           
//2DA PRUEBA
/*always @(*) begin
        active = 0;
        valid_out = 0;
        data_out = 0;
        if (reset == 0) begin
            active = 0;
            valid_out = 0;
            data_out = 0;
        end
        else begin
            data[contador] = data_in;
            data_out = data2send; 
            if (BC_counter == 4) begin
                active = 1; 
                if (data2send == 'hBC) begin
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
    end
    always @(posedge clk_32f) begin
        if (reset == 0) begin
            data <= 0; 
            contador <= 7;
        end
        else if (contador == 0) begin
            contador <= 7;
        end
        else begin
            contador <= contador - 1;
        end
    end

    always @(posedge clk_4f) begin
        if (reset == 0) begin
            BC_counter <= 0;
            data2send <= 0;
        end
        else if (BC_counter != 4) begin
            data2send <= data;
            if (data2send == 'hBC) begin
                BC_counter <= BC_counter + 1;
            end
            else begin
                BC_counter <= BC_counter;
            end
        end 
        else if (BC_counter == 4) begin
            data2send <= data;
            BC_counter <= BC_counter;
        end
    end      
endmodule*/