`include "phytx.v"
`include "phytxSynth.v"
`include "probadorphy.v"
`include "cmos_cells.v"

module TBphy();

wire [31:0] data_in;
wire valid_in, reset, clk_f, clk_2f, clk_4f, clk_32f, data_out0Cond, data_out1Cond, data_out0Synth, data_out1Synth;

phytx phy_tx(/*AUTOINST*/
	     // Outputs
	     .data_out0			(data_out0Cond),
	     .data_out1			(data_out1Cond),
	     // Inputs
	     .data_in			(data_in[31:0]),
	     .valid_in			(valid_in),
	     .reset			(reset),
	     .clk_f			(clk_f),
	     .clk_2f			(clk_2f),
	     .clk_4f			(clk_4f),
	     .clk_32f			(clk_32f));

phytxSynth phy_txSynth (/*AUTOINST*/
			// Outputs
			.data_out0	(data_out0Synth),
			.data_out1	(data_out1Synth),
			// Inputs
			.clk_2f		(clk_2f),
			.clk_32f	(clk_32f),
			.clk_4f		(clk_4f),
			.clk_f		(clk_f),
			.data_in	(data_in[31:0]),
			.reset		(reset),
			.valid_in	(valid_in));

probadorphy prob(/*AUTOINST*/
		 // Outputs
		 .data_in		(data_in[31:0]),
		 .valid_in		(valid_in),
		 .reset			(reset),
		 .clk_f			(clk_f),
		 .clk_2f		(clk_2f),
		 .clk_4f		(clk_4f),
		 .clk_32f		(clk_32f),
		 // Inputs
		 .data_out0Cond		(data_out0Cond),
		 .data_out1Cond		(data_out1Cond),
		 .data_out0Synth	(data_out0Synth),
		 .data_out1Synth	(data_out1Synth));
endmodule

