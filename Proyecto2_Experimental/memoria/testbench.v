// escala	unidad temporal 
`timescale 	1ns	/ 100ps
`include "probador.v"
`include "memoria.v"
`include "memoriaSynth.v"
`include "cmos_cells.v"
module testbench;
	wire [11:0] data, q, qSynth;
	wire [2:0] wr_ptr, rd_ptr;
	wire write, read, clk, reset;

	// Descripción conductual de memoria
	
	memoria		    cond(/*AUTOINST*/
				 // Outputs
				 .q			(q[11:0]),
				 // Inputs
				 .data			(data[11:0]),
				 .wr_ptr		(wr_ptr[2:0]),
				 .rd_ptr		(rd_ptr[2:0]),
				 .write			(write),
				 .read			(read),
				 .clk			(clk),
				 .reset			(reset));
			 

	// Descripción estructural de la memoria
	
	memoriaSynth	     synth(/*AUTOINST*/
				   // Outputs
				   .q			(qSynth[11:0]),
				   // Inputs
				   .clk			(clk),
				   .data		(data[11:0]),
				   .rd_ptr		(rd_ptr[2:0]),
				   .read		(read),
				   .reset		(reset),
				   .wr_ptr		(wr_ptr[2:0]),
				   .write		(write));
			  
	

	//probador
	
	probador desc(/*AUTOINST*/
		      // Outputs
		      .data		(data[11:0]),
		      .wr_ptr		(wr_ptr[2:0]),
		      .rd_ptr		(rd_ptr[2:0]),
		      .write		(write),
		      .read		(read),
		      .clk		(clk),
		      .reset		(reset),
		      // Inputs
		      .q		(q[11:0]),
              .qSynth(qSynth));
			    

endmodule
