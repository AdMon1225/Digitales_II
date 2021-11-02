`include "Paralelo_Serial.v"
`include "Paralelo_SerialSynth.v"
`include "probador.v"
`include "cmos_cells.v"

module testbench();

wire [7:0] data_in;
wire clk_4f, clk_32f, valid_in, reset, data_outCond, data_outSynth;

Paralelo_Serial PSCond (/*AUTOINST*/
			// Outputs
			.data_out	(data_outCond),
			// Inputs
			.data_in	(data_in[7:0]),
			.clk_4f		(clk_4f),
			.clk_32f	(clk_32f),
			.valid_in	(valid_in),
			.reset		(reset));

Paralelo_SerialSynth PSSynth (/*AUTOINST*/
			      // Outputs
			      .data_out		(data_outSynth),
			      // Inputs
			      .clk_32f		(clk_32f),
			      .clk_4f		(clk_4f),
			      .data_in		(data_in[7:0]),
			      .reset		(reset),
			      .valid_in		(valid_in));

probador probador (/*AUTOINST*/
		   // Outputs
		   .data_in		(data_in[7:0]),
		   .clk_4f		(clk_4f),
		   .clk_32f		(clk_32f),
		   .valid_in		(valid_in),
		   .reset		(reset),
		   // Inputs
		   .data_outCond	(data_outCond),
		   .data_outSynth	(data_outSynth));

endmodule
