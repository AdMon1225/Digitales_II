`include "phytx.v"
`include "phy_rx.v"

module phy(input [31:0] data_in,
			input valid_in,
			input reset,
			input clk_2f,
			input clk_f,
			input clk_4f,
			input clk_32f,
			//output [31:0] data_recirculador_inactive,
			output [31:0] data_out,
			output valid_out);
			//output data_and_active);

	wire data_paralelo_serial_1, data_paralelo_serial_2, active_ser_par_1, active_ser_par_2;

   phytx TX(/*AUTOINST*/
	    // Outputs
	    .data_out0			(data_paralelo_serial_1),
	    .data_out1			(data_paralelo_serial_2),
	    // Inputs
	    .data_in			(data_in[31:0]),
	    .valid_in			(valid_in),
	    .reset			(reset),
	    .clk_f			(clk_f),
	    .clk_2f			(clk_2f),
	    .clk_4f			(clk_4f),
	    .clk_32f			(clk_32f));

	phy_rx RX(/*AUTOINST*/
		  // Outputs
		  .active_ser_par_1	(active_ser_par_1),
		  .active_ser_par_2	(active_ser_par_2),
		  .valid_output		(valid_out),
		  .data_output		(data_out[31:0]),
		  // Inputs
		  .par_ser_1		(data_paralelo_serial_1),
		  .par_ser_2		(data_paralelo_serial_2),
		  .reset		(reset),
		  .clk_f		(clk_f),
		  .clk_2f		(clk_2f),
		  .clk_4f		(clk_4f),
		  .clk_32f		(clk_32f));



endmodule
