module testbenchVerificador(

	output reg clk,
	output reg reset_L,
	output reg selector,
	output reg [1:0] data_in0,
	output reg [1:0] data_in1,
	input [1:0] data_outCond, data_outGenerico, data_outRetardos);

    reg [5:0] checkerGenerico, checkerRetardo;

	initial clk <= 0;     /*Inicialización del clock*/
    always #10 clk <= ~clk;

    initial 
    begin 
        $dumpfile("verificacion.vcd"); /*En este archivo se guardan todos los valores de la simulación*/
        $dumpvars;

        reset_L = 0;
        selector = 0;
        data_in0 = 0;
        data_in1 = 0;
        checkerGenerico = 0; checkerRetardo = 0;

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

//Checker modelo generico
always @(posedge clk ) 
begin
    if (data_outCond != data_outGenerico) checkerGenerico <= checkerGenerico+1;
    else checkerGenerico <= checkerGenerico+0; 
end

//Checker modelo con retardos
always @(posedge clk ) 
begin
    if (data_outCond != data_outRetardos) checkerRetardo <= checkerRetardo+1;
    else checkerRetardo <= checkerRetardo+0; 
end

endmodule


