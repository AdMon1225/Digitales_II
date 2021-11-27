`timescale 	1ns	/ 100ps
`include "fifoMod.v"
`include "fifoModSynth.v"
`include "probador.v"
`include "cmos_cells.v"

module testbench();

wire [11:0] fifo_in;
wire [2:0] full_umbral, empty_umbral;
wire clk, reset, fifo_wr, fifo_rd;
wire almost_full, almost_empty, full, empty;
wire almost_fullSynth, almost_emptySynth, fullSynth, emptySynth;
wire [11:0] fifo_out, fifo_outSynth; 


fifoMod fifoCond (/*AUTOINST*/
		  // Outputs
		  .almost_full		(almost_full),
		  .almost_empty		(almost_empty),
		  .full			(full),
		  .empty		(empty),
		  .fifo_out		(fifo_out[11:0]),
		  // Inputs
		  .fifo_in		(fifo_in[11:0]),
		  .full_umbral		(full_umbral[2:0]),
		  .empty_umbral		(empty_umbral[2:0]),
		  .clk			(clk),
		  .reset		(reset),
		  .fifo_wr		(fifo_wr),
		  .fifo_rd		(fifo_rd));

fifoModSynth fifoSynth (/*AUTOINST*/
			// Outputs
			.almost_empty	(almost_emptySynth),
			.almost_full	(almost_fullSynth),
			.empty		(emptySynth),
			.fifo_out	(fifo_outSynth[11:0]),
			.full		(fullSynth),
			// Inputs
			.clk		(clk),
			.empty_umbral	(empty_umbral[2:0]),
			.fifo_in	(fifo_in[11:0]),
			.fifo_rd	(fifo_rd),
			.fifo_wr	(fifo_wr),
			.full_umbral	(full_umbral[2:0]),
			.reset		(reset));

probador probador (/*AUTOINST*/
		   // Outputs
		   .fifo_in		(fifo_in[11:0]),
		   .full_umbral		(full_umbral[2:0]),
		   .empty_umbral	(empty_umbral[2:0]),
		   .clk			(clk),
		   .reset		(reset),
		   .fifo_wr		(fifo_wr),
		   .fifo_rd		(fifo_rd),
		   // Inputs
		   .almost_full		(almost_full),
		   .almost_empty	(almost_empty),
		   .full		(full),
		   .empty		(empty),
		   .almost_fullSynth	(almost_fullSynth),
		   .almost_emptySynth	(almost_emptySynth),
		   .fullSynth		(fullSynth),
		   .emptySynth		(emptySynth),
		   .fifo_out		(fifo_out[11:0]),
		   .fifo_outSynth	(fifo_outSynth[11:0]));

endmodule
