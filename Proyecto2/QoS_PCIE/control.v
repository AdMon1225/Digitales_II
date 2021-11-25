module control(
    input [2:0] full_umbral, empty_umbral,
    input clk, reset, fifo_wr, fifo_rd, 
    output reg almost_empty, almost_full, full, empty);

    reg [2:0] contador; 

    always @(posedge clk) begin
        if (reset == 0) begin
            contador <= 0;
        end
        else if (fifo_wr == 1) begin
            contador = contador + 1;
            if (fifo_rd == 1) begin
                contador = contador - 1;
            end
        end
        else if (fifo_wr == 0) begin
            if (fifo_rd == 1) begin
                contador <= contador - 1;
            end
        end
    end

    //Umbrales son para marcar almost_full y almost_empty
    always @(*) begin
        full = 0; //Evitamos latches con valores default
        empty = 0;
        almost_full = 0;
        almost_empty = 0;
        if (reset == 0) begin
            full = 0;
            empty = 0;
            almost_full = 0;
            almost_empty = 0;
        end
        else if (contador >= full_umbral) begin
            almost_full = 1;
            if (contador == 8) begin
                full = 1;
            end
            else begin
                full = 0;
            end
        end
        else if (contador <= empty_umbral) begin
            almost_empty = 1;
            if (contador == 0) begin
                empty = 1;
            end
            else begin
                empty = 0;
            end
        end  
    end
endmodule 