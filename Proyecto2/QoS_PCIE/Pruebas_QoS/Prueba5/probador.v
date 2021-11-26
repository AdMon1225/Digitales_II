module probador(
    output reg clk, push,
    output reg [11:0] data_in, //Data_in que le ingresa al FIFO solito amarillo
    output reg popBP0, popBP1, popBP2, popBP3, //Pops de entrada que da probador hacia los 4 FIFOs azules

    // Contadores
    output reg req, 
    output reg [2:0] idx,
    input valid, valid_sint,
    input [7:0] data, data_sint,

    // Maquina de Estados
    output reg reset, init, 
    output reg [3:0] umbralHigh, umbralLow,
    input active_out, active_out_sint, idle_out, idle_out_sint,

    // Salidas de datos de los 4 FIFOs azules
    input [11:0] fifo_dataout0, fifo_dataout1, fifo_dataout2, fifo_dataout3, fifo_dataout0_sint, fifo_dataout1_sint, fifo_dataout2_sint, fifo_dataout3_sint);

   
    initial clk <= 0;
    always #1 clk <= ~clk; 

    initial begin
        $dumpfile("prueba5.vcd");
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
        data_in <= 'h504;

        @(posedge clk);
        data_in <= 'hA95;

        @(posedge clk);
        data_in <= 'hFAE; 

        @(posedge clk);
        data_in <= 'h0AE;

        @(posedge clk);
        data_in <= 'h5FF;

        @(posedge clk);
        data_in <= 'hA27;

        @(posedge clk);
        data_in <= 'hF90;

        @(posedge clk);
        data_in <= 0;
        push <= 0; 

        repeat(20) begin
            @(posedge clk);
        end

        @(posedge clk);
        popBP0 <= 1;
        popBP1 <= 1;
        popBP2 <= 1;
        popBP3 <= 1;

        @(posedge clk);

        @(posedge clk);
        popBP0 <= 0;
        popBP1 <= 0;
        popBP2 <= 0;
        popBP3 <= 0;
        

        @(posedge clk);
        req <= 1;
        idx <= 0;

        @(posedge clk);
        idx <= 1;

        @(posedge clk);
        idx <= 2;

        @(posedge clk);
        idx <= 3;

        @(posedge clk);
        idx <= 4;

        @(posedge clk);
        req <= 0;
        idx <= 0;


        #20 $finish;

    end 
endmodule