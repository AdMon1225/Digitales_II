module testbenchMuxMem(

	output reg clk,
	output reg reset_L,
	output reg selector,
	output reg [1:0] data_in0,
	output reg [1:0] data_in1,
	input [1:0] data_out);
	
	initial clk <= 0;     /*Inicialización del clock*/
    always #2 clk <= ~clk;

    initial 
    begin 
        $dumpfile("pruebamuxmem.vcd"); /*En este archivo se guardan todos los valores de la simulación*/
        $dumpvars;

        reset_L = 0;
        selector = 0;
        data_in0 = 0;
        data_in1 = 0;

        @(posedge clk);
        reset_L <= 1;

        @(posedge clk);
        data_in0 <= 3;
        data_in1 <= 2;

        @(posedge clk);
        selector <= 1;
        data_in0 <= 1;
        data_in1 <= 0;

        @(posedge clk);
        data_in0 <= 0;
        data_in1 <= 2;

        @(posedge clk);
        selector <= 0;
        data_in0 <= 0;
        data_in1 <= 1;

        @(posedge clk);
        data_in0 <= 3;
        data_in1 <= 2;

        #5 $finish;
    end
endmodule



