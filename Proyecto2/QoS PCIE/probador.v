module probador (
    output reg clk, push, //Push es del FIFO solito amarillo
    output reg [11:0] data_in, //Data_in que le ingresa al FIFO solito amarillo
    output reg popBP0, popBP1, popBP2, popBP3, //Pops de entrada que da probador hacia los 4 FIFOs azules

    // Contadores
    output reg req, 
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

        push <= 0;
        data_in <= 0;
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
        @(posedge clk);
        reset <= 1;

















    end 
endmodule