`include "sumador.v"
`include "sumadorSynth.v"
`include "probador.v"
`include "cmos_cells.v"

module testbench;

wire reset, clk;
wire [3:0] data_A, data_B, sum_30_dd, idx, idx_dd, sum_30_ddSynth, idx_ddSynth;

sumador sumador (/*AUTOINST*/
		 // Outputs
		 .sum_30_dd		(sum_30_dd[3:0]),
		 .idx_dd		(idx_dd[3:0]),
		 // Inputs
		 .clk			(clk),
		 .reset			(reset),
		 .idx			(idx[3:0]),
		 .data_A		(data_A[3:0]),
		 .data_B		(data_B[3:0]));

sumadorSynth sumadorSynth (/*AUTOINST*/
			   // Outputs
			   .idx_dd		(idx_ddSynth[3:0]),
			   .sum_30_dd		(sum_30_ddSynth[3:0]),
			   // Inputs
			   .clk			(clk),
			   .data_A		(data_A[3:0]),
			   .data_B		(data_B[3:0]),
			   .idx			(idx[3:0]),
			   .reset		(reset));

probador probador (/*AUTOINST*/
		   // Outputs
		   .clk			(clk),
		   .reset		(reset),
		   .idx			(idx[3:0]),
		   .data_A		(data_A[3:0]),
		   .data_B		(data_B[3:0]),
		   // Inputs
		   .sum_30_dd		(sum_30_dd[3:0]),
		   .sum_30_ddSynth	(sum_30_ddSynth[3:0]),
		   .idx_dd		(idx_dd[3:0]),
		   .idx_ddSynth		(idx_ddSynth[3:0]));

endmodule

