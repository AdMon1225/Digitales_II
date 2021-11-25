module probador(
    output reg clk, push,
    output reg [11:0] data_in, //Data_in que le ingresa al FIFO solito amarillo
    output reg popBP0, popBP1, popBP2, popBP3, //Pops de entrada que da probador hacia los 4 FIFOs azules

    // Contadores
    output reg req, 
    output reg [2:0] idx,
    input valid, valid_sint,
    input [4:0] data, data_sint,

    // Maquina de Estados
    output reg reset, init, 
    output reg [3:0] umbralHigh, umbralLow,
    input active_out, active_out_sint, idle_out, idle_out_sint,

    // Salidas de datos de los 4 FIFOs azules
    input [11:0] fifo_dataout0, fifo_dataout1, fifo_dataout2, fifo_dataout3, fifo_dataout0_sint, fifo_dataout1_sint, fifo_dataout2_sint, fifo_dataout3_sint);

   
    initial clk <= 0;
    always #1 clk <= ~clk; 

    initial begin
        $dumpfile("QOS.vcd");
        $dumpvars;

        data_in <= 0;
        push <= 0;
        popBP0 <= 0;
        popBP1 <= 0;
        popBP2 <= 0;
        popBP3 <= 0;
        req <= 0;
        idx <= 0;
        reset <= 0;
        init <= 0;
        umbralHigh <= 4;
        umbralLow <= 1;

        @(posedge clk);
        @(posedge clk);

        //Prueba 1
        @(posedge clk);
        reset <= 1;
        
        @(posedge clk);
        init <= 1; //Se cumple prueba 1. 

        //Prueba 2
        @(posedge clk);
        umbralHigh <= 7;
        umbralLow <= 2;

        @(posedge clk);
        umbralHigh <= 5;
        umbralLow <= 1; 

        @(posedge clk);
        init <= 0; //Se cumple prueba 2.
        

        //Prueba 3. 
        @(posedge clk);
        data_in <= 'h0FF; //Desde aca, se mandan 4 palabras hacia el FIFO azul P0
        push <= 1;

        @(posedge clk);
        data_in <= 'h404;

        @(posedge clk);
        data_in <= 'h895;

        @(posedge clk);
        data_in <= 'hCAE; 

        @(posedge clk);
        data_in <= 'h15A; //Desde aca, se mandan 4 palabras hacia el FIFO azul P1

        @(posedge clk);
        data_in <= 'h55A;

        @(posedge clk);
        data_in <= 'h95A;

        @(posedge clk);
        data_in <= 'hD5A;

        @(posedge clk);
        data_in <= 'h25A; //Desde aca, se mandan 4 palabras hacia el FIFO azul P2

        @(posedge clk);
        data_in <= 'h65A;

        @(posedge clk);
        data_in <= 'hA5A;

        @(posedge clk);
        data_in <= 'hE5A;

        @(posedge clk);
        data_in <= 'h35A; //Desde aca, se mandan 4 palabras hacia el FIFO azul P3

        @(posedge clk);
        data_in <= 'h75A;

        @(posedge clk);
        data_in <= 'hB5A;

        @(posedge clk);
        data_in <= 'hF5A;

        @(posedge clk);
        data_in <= 0;
        push <= 0;

        repeat(10) begin
            @(posedge clk);
        end

        @(posedge clk);
        data_in <= 'h0DC; //Provocamos un almost_full en FIFO azul P0
        push <= 1;

        @(posedge clk);
        data_in <= 0;
        push <= 0;

        repeat(10) begin
            @(posedge clk);
        end

        @(posedge clk);
        popBP0 <= 1; 

        @(posedge clk);
        popBP0 <= 0; 

        @(posedge clk);
        data_in <= 'h1AB;
        push <= 1; //Provocamos un almost_full en FIFO azul P1

        @(posedge clk);
        data_in <= 0;
        push <= 0;

        repeat(10) begin
            @(posedge clk);
        end

        @(posedge clk);
        popBP1 <= 1; 

        @(posedge clk);
        popBP1 <= 0; 

        @(posedge clk);
        data_in <= 'h2FE;
        push <= 1; //Provocamos un almost_full en FIFO azul P2

        @(posedge clk);
        data_in <= 0;
        push <= 0;

        repeat(10) begin
            @(posedge clk);
        end

        @(posedge clk);
        popBP2 <= 1; 

        @(posedge clk);
        popBP2 <= 0; 

        @(posedge clk);
        data_in <= 'h376;
        push <= 1; //Provocamos un almost_full en FIFO azul P3

        @(posedge clk);
        data_in <= 0;
        push <= 0;

        repeat(10) begin
            @(posedge clk);
        end

        @(posedge clk);
        popBP3 <= 1; 

        @(posedge clk);
        popBP3 <= 0; 

        repeat(12) begin
            @(posedge clk); // Se cumple prueba 3. 
        end

        




        #20 $finish;

    end 
endmodule