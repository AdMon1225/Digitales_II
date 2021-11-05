module tbCvsE(

	output reg clk,
	output reg reset_L,
	output reg selector,
	output reg [1:0] data_in0,
	output reg [1:0] data_in1,
	input [1:0] data_outCond, data_outEstr);

    reg [5:0] contador_conductual, contador_estructural, checker;

	initial clk <= 0;     /*Inicialización del clock*/
    always #10 clk <= ~clk;

    initial 
    begin 
        $dumpfile("pruebafinal.vcd"); /*En este archivo se guardan todos los valores de la simulación*/
        $dumpvars;

        reset_L = 0;
        selector = 0;
        data_in0 = 0;
        data_in1 = 0;
        checker = 0;
        contador_conductual = 0;
        contador_estructural = 0;

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

        #50 $finish;
    end

//Checker
always @(posedge clk ) 
begin
    if (data_outCond != data_outEstr) checker <= 1;
    else checker <= 0; 
end

//Contador modelo conductual
always @(posedge data_outCond ) 
begin
    if (~reset_L) contador_conductual <= 0;
    else contador_conductual <= contador_conductual+1;  
end

//Contador modelo estructural
always @(posedge data_outEstr ) 
begin
    if (~reset_L) contador_estructural <= 0;
    else contador_estructural <= contador_estructural+1;  
end

endmodule


