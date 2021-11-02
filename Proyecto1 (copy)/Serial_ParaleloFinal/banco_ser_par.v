`timescale 1ms/100ps

`include "ser_par.v"
`include "ser_par_sint.v"
`include "prob_ser_par.v"
`include "cmos_cells.v"

    module banco_ser_par;
		wire [7:0] data2send;
        wire [7:0] data2send_sint;
        wire [7:0] data_out;
        wire [7:0]  data_out_sint;
		wire clk_4f, clk_32f, valid_out, data_in, reset, active, active_sint, valid_out_sint;



		ser_par cond(/*AUTOINST*/
			     // Outputs
			     .active		(active),
			     .valid_out		(valid_out),
			     .data_out		(data_out[7:0]),
			     // Inputs
			     .reset		(reset),
			     .clk_4f		(clk_4f),
			     .clk_32f		(clk_32f),
			     .data_in		(data_in));



		ser_par_sint estr(/*AUTOINST*/
				  // Outputs
				  .active		(active_sint),
				  .data_out		(data_out_sint[7:0]),
				  .valid_out		(valid_out_sint),
				  // Inputs
				  .clk_32f		(clk_32f),
				  .clk_4f		(clk_4f),
				  .data_in		(data_in),
				  .reset		(reset));



		prob_ser_par test(/*AUTOINST*/
				  // Outputs
				  .reset		(reset),
				  .data_in		(data_in),
				  .clk_4f		(clk_4f),
				  .clk_32f		(clk_32f),
				  // Inputs
				  .active		(active),
				  .valid_out		(valid_out),
				  .active_sint		(active_sint),
				  .valid_out_sint	(valid_out_sint),
				  .data2send		(data2send[7:0]),
				  .data_out		(data_out[7:0]),
				  .data2send_sint	(data2send_sint[7:0]),
				  .data_out_sint	(data_out_sint[7:0]));


    endmodule
