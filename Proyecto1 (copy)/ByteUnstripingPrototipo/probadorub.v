
module probadorub(    
    output reg [31:0] lane_0, lane_1,
	output reg reset_L, valid_0, valid_1, clk_f, clk_2f, 
	input [31:0] data_out, 
    input valid_out); 

	initial begin
        clk_2f <= 0;
        clk_f <= 0;
    end
    always begin
        #1 clk_2f <= ~clk_2f; /*f = 0.5 Hz*/
    end
    always begin
        #2 clk_f <= ~clk_f;  /*f = 0.25 Hz*/
    end

    initial 
    begin 
        $dumpfile("verificacion.vcd"); /*En este archivo se guardan todos los valores de la simulación*/
        $dumpvars;

        lane_0 <= 0;
		lane_1 <= 0;
        valid_0 <= 0;
		valid_1 <= 0;
        reset_L <= 0;

		




endmodule




