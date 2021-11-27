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
        $dumpfile("QOS67.vcd");
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
        //data_in <= 'h500; // 500 = 10100000000
        data_in <= 'h24; // 24 = 00000100100
        push <= 1;

        @(posedge clk);
        data_in <= 'h60; // 60 = 00001100000

        @(posedge clk);
        data_in <= 'h70; // 70 = 00001110000

        @(posedge clk);
        data_in <= 'hF3; // F3 = 000011110011

        //para fifo 1
        @(posedge clk);
        data_in <= 'h54A; // 54A = 010101001010

        @(posedge clk);
        data_in <= 'h552; // 552 = 010101010010

        @(posedge clk);
        data_in <= 'h527; // F05 = 010100100111

        @(posedge clk);
        data_in <= 'h5B2; // 5B2 = 010110110010

        //para fifo 2
        @(posedge clk);
        data_in <= 'hAAA; // AAA = 101010101010

        @(posedge clk);
        data_in <= 'hAEE; //  AEE = 101011101110

        @(posedge clk);
        data_in <= 'hAEA; //  AEA = 101011101010

        @(posedge clk);
        data_in <= 'hAFA; //  AFA = 101011111010


        // para fifo 3
        @(posedge clk);
        data_in <= 'hFAF; // FAF =  111110101111

        @(posedge clk);
        data_in <= 'hFD7; // FD7 =  111111010111

        @(posedge clk);
        data_in <= 'hFAF; // FAF =  111110101111

        @(posedge clk);
        data_in <= 'hFFF; // FFF =  111111111111

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
        @(posedge clk);
        @(posedge clk);
        popBP0 <= 0;
        popBP1 <= 0;
        popBP2 <= 0;
        popBP3 <= 0;

        // Leer los contadores de palabras:

        @(posedge clk);
        req <= 1;
        idx <= 3'b000; //000

        @(posedge clk);
        idx <= 3'b001; //001

        @(posedge clk);
        idx <= 3'b010; //010

        @(posedge clk);
        idx <= 3'b011; //011

        @(posedge clk);
        idx <= 3'b100; //100

        @(posedge clk);
        req <= 0;
        idx <= 0;

        
        #5 $finish;

    end 
endmodule








