`include "memoria.v"
`include "write.v"
`include "read.v"
`include "control.v"

module fifoMod (
    input [11:0] fifo_in,
	input [3:0] full_umbral, empty_umbral,
    input clk, reset, fifo_wr, fifo_rd, //fifo_wr es push y fifo_rd es pop
    output almost_full, almost_empty, full, empty,
    output [11:0] fifo_out);

    wire [2:0] wr_ptr, rd_ptr;

    memoria memoriaFIFO (/*AUTOINST*/
			 // Outputs
			 .q			(fifo_out[11:0]),
			 // Inputs
			 .data			(fifo_in[11:0]),
			 .wr_ptr		(wr_ptr[2:0]),
			 .rd_ptr		(rd_ptr[2:0]),
			 .write			(fifo_wr),
			 .read			(fifo_rd),
			 .clk			(clk),
			 .reset			(reset));

	write writelog (/*AUTOINST*/
			// Outputs
			.wr_ptr		(wr_ptr[2:0]),
			// Inputs
			.clk		(clk),
			.reset		(reset),
			.fifo_wr	(fifo_wr));

	read readlog (/*AUTOINST*/
		      // Outputs
		      .rd_ptr		(rd_ptr[2:0]),
		      // Inputs
		      .clk		(clk),
		      .reset		(reset),
		      .fifo_rd		(fifo_rd));

	control controllog (/*AUTOINST*/
			 // Outputs
			 .almost_empty		(almost_empty),
			 .almost_full		(almost_full),
			 .full			(full),
			 .empty			(empty),
			 // Inputs
			 .full_umbral		(full_umbral[2:0]),
			 .empty_umbral		(empty_umbral[2:0]),
			 .clk			(clk),
			 .reset			(reset),
			 .fifo_wr		(fifo_wr),
			 .fifo_rd		(fifo_rd));

endmodule 
