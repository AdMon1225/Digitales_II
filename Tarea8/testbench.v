`include "contadorgray.v"
`include "contador_gray_synth.v"
`include "probador.v"
`include "cmos_cells.v"

module testbench();

wire clk, enable, reset;
wire [4:0] salida_gray, salida_graySynth;

contadorgray grayConductual (/*AUTOINST*/
			     // Outputs
			     .salida_gray	(salida_gray[4:0]),
			     // Inputs
			     .clk		(clk),
			     .enable		(enable),
			     .reset		(reset));

contador_gray_synth graySynth (/*AUTOINST*/
			       // Outputs
			       .salida_gray	(salida_graySynth[4:0]),
			       // Inputs
			       .clk		(clk),
			       .enable		(enable),
			       .reset_L		(reset));

probador probador (/*AUTOINST*/
		   // Outputs
		   .clk			(clk),
		   .enable		(enable),
		   .reset		(reset),
		   .error		(error),
		   // Inputs
		   .salida_gray		(salida_gray),
		   .salida_graySynth	(salida_graySynth));

endmodule 
