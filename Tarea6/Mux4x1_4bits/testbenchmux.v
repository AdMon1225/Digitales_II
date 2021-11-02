module testbenchmux(

	output reg clk,
	output reg reset_L,
	output reg [1:0] selector,
	output reg [3:0] data_in0, data_in1, data_in2, data_in3,
    output reg valid_0, valid_1, valid_2, valid_3,
    input valid_outCond, valid_outSynth,
	input [3:0] data_outCond, data_outSynth);
	
	initial clk <= 0;     /*Inicialización del clock*/
    always #2 clk <= ~clk;

    initial 
    begin 
        $dumpfile("verificacion.vcd"); /*En este archivo se guardan todos los valores de la simulación*/
        $dumpvars;

        reset_L <= 0;
        selector <= 0;
        data_in0 <= 0; data_in1 <= 0; data_in2 <= 0; data_in3 <= 0;
        valid_0 <= 1; valid_1 <= 1; valid_2 <= 1; valid_3 <= 1;
        
        @(posedge clk);
        reset_L <= 1;
        selector <= 1;

        @(posedge clk);
        data_in0 <= 0;
        data_in1 <= 1;
        data_in2 <= 2;
        data_in3 <= 3;
        selector <= 2;

        @(posedge clk);
        data_in0 <= 4;
        data_in1 <= 5;
        data_in2 <= 6;
        data_in3 <= 7;
        selector <= 3;
        
        @(posedge clk);
        data_in0 <= 8;
        data_in1 <= 9;
        data_in2 <= 10;
        data_in3 <= 11;
        selector <= 0;

        @(posedge clk);
        data_in0 <= 12;
        data_in1 <= 13;
        data_in2 <= 14;
        data_in3 <= 15;
        selector <= 1;
        
        @(posedge clk);
        data_in0 <= 0;
        data_in1 <= 1;
        data_in2 <= 2;
        data_in3 <= 3;
        valid_0 <= 0; valid_1 <= 0; valid_2 <= 0; valid_3 <= 0;

        @(posedge clk);
        data_in0 <= 4;
        data_in1 <= 5;
        data_in2 <= 6;
        data_in3 <= 7;
        
        #10 $finish;
    end
endmodule



