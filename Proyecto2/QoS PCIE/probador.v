module probador (
    output reg clk,
    output reg [11:0] data_in, //Data_in que le ingresa al FIFO solito amarillo
    output reg popBP0, popBP1, popBP2, popBP3, //Pops de entrada que da probador hacia los 4 FIFOs azules

    // Contadores
    output reg req, push,
    output reg [2:0] idx,
    input valid, 
    input [4:0] data,

    // Maquina de Estados
    output reg reset, init, 
    output reg [3:0] umbralHigh, umbralLow,
    input active_out, idle_out,

    // Salidas de datos de los 4 FIFOs azules
    input [11:0] fifo_dataout0, fifo_dataout1, fifo_dataout2, fifo_dataout3);

   
    initial clk <= 0;
    always #1 clk <= ~clk; 

    initial begin
        $dumpfile("verificacion.vcd");
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
        @(posedge clk);

        //Prueba 1
        @(posedge clk);
        reset <= 1;
        init <= 1;

        //Prueba 2
        @(posedge clk);
        umbralHigh <= 5;
        umbralLow <= 1;

        @(posedge clk);
        umbralHigh <= 6;
        umbralLow <= 1;

        @(posedge clk);
        init <= 0;

        @(posedge clk);
        
        @(posedge clk);
        data_in <= 'h37D;
        push <= 1;

        @(posedge clk);
        data_in <= 'hF04;

        @(posedge clk);
        data_in <= 'hE95;

        @(posedge clk);
        data_in <= 'hAAE;

        @(posedge clk);
        data_in <= 'hB5A;

        @(posedge clk);
        data_in <= 0;

        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);


        @(posedge clk);
        popBP0 <= 1;
        popBP1 <= 1;
        popBP2 <= 1;
        popBP3 <= 1;

        #20 $finish;

    end 
endmodule