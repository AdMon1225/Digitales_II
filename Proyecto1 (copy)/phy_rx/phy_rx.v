`include "ser_par.v"
`include "un_byte_striping.v"
`include "mux_8_32.v"



module phy_rx (	input par_ser_1,
				input par_ser_2,
				input reset,
				input clk_f,
				input clk_2f,
				input clk_4f,
				input clk_32f,
				output active_ser_par_1,
				output active_ser_par_2,
				output valid_output,
				output [31:0] data_output);

	wire clk_4f, clk_32f, clk_f, reset;
	wire [7:0] data2send_1, data2send_2;
	wire [7:0] data_out_1, data_out_2;
	wire [7:0] ser_par_1, ser_par_2;
	wire valid_ser_par_1, valid_ser_par_2, valid_8a32_1, valid_8a32_2;
	wire [31:0] m8a32_out1, m8a32_out2;



    ser_par SP1(/*AUTOINST*/
		// Outputs
		.active			(active_ser_par_1),
		.valid_out		(valid_ser_par_1),
		.data_out		(ser_par_1[7:0]),
		// Inputs
		.reset			(reset),
		.clk_4f			(clk_4f),
		.clk_32f		(clk_32f),
		.data_in		(par_ser_1));


    ser_par SP2(/*AUTOINST*/
		// Outputs
		.active			(active_ser_par_2),
		.valid_out		(valid_ser_par_2),
		.data_out		(ser_par_2[7:0]),
		// Inputs
		.reset			(reset),
		.clk_4f			(clk_4f),
		.clk_32f		(clk_32f),
		.data_in		(par_ser_2));


    mux_8_32 demux1(/*AUTOINST*/
		    // Outputs
		    .data_out		(m8a32_out1[31:0]),
		    .valid_out		(valid_8a32_1),
		    // Inputs
		    .clk_4f		(clk_4f),
		    .clk_f		(clk_f),
		    .data_in		(ser_par_1[7:0]),
		    .valid		(valid_ser_par_1),
		    .reset		(reset));



    mux_8_32 demux2(/*AUTOINST*/
		    // Outputs
		    .data_out		(m8a32_out2[31:0]),
		    .valid_out		(valid_8a32_2),
		    // Inputs
		    .clk_4f		(clk_4f),
		    .clk_f		(clk_f),
		    .data_in		(ser_par_2[7:0]),
		    .valid		(valid_ser_par_2),
		    .reset		(reset));





    un_byte_striping STR(/*AUTOINST*/
			 // Outputs
			 .data_out		(data_output[31:0]),
			 .valid_out		(valid_output),
			 // Inputs
			 .reset_L		(reset),
			 .lane_0		(m8a32_out1[31:0]),
			 .lane_1		(m8a32_out2[31:0]),
			 .valid_0		(valid_8a32_1),
			 .valid_1		(valid_8a32_2),
			 .clk_2f		(clk_2f),
			 .clk_f			(clk_f));
    








endmodule


