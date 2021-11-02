module testbenchmux(

	output reg clk,
	output reg reset_L,
	output reg selector,
	output reg [1:0] data_in0,
	output reg [1:0] data_in1,
    output reg valid_0, valid_1,
    input valid_outCond, valid_outSynth,
	input [1:0] data_outCond, data_outSynth);
	
	initial clk <= 0;     /*Inicialización del clock*/
    always #2 clk <= ~clk;

    initial 
    begin 
        $dumpfile("verificacion.vcd"); /*En este archivo se guardan todos los valores de la simulación*/
        $dumpvars;

        reset_L <= 0;
        selector <= 0;
        data_in0 <= 0;
        data_in1 <= 0;
        valid_0 <= 1; valid_1 <= 1; 
        
        @(posedge clk);
        reset_L <= 1;

        @(posedge clk);
        data_in0 <= 1;
        data_in1 <= 2;

        @(posedge clk);
        data_in0 <= 3;
        data_in1 <= 0;
        
        @(posedge clk);
        data_in0 <= 1;
        data_in1 <= 2;

        @(posedge clk);
        data_in0 <= 3;
        data_in1 <= 0;
        selector <= 1;
        
        @(posedge clk);
        data_in0 <= 1;
        data_in1 <= 2;
        valid_0 <= 0; valid_1 <= 0; 

        @(posedge clk);
        data_in0 <= 3;
        data_in1 <= 0;
        
        #10 $finish;
    end
endmodule



