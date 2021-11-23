`include "QoS.v"
//`include "QoSSynth.v"
`include "probador.v"
//`include "cmos_cells.v"

module testbench();

wire clk, push, popBP0, popBP1, popBP2, popBP3, req, valid, reset, init, active_out, idle_out;
wire [11:0] data_in, fifo_dataout0, fifo_dataout1, fifo_dataout2, fifo_dataout3;
wire [3:0] umbralHigh, umbralLow;
wire [2:0] idx;
wire [4:0] data;




QoS QoS (/*AUTOINST*/
	 // Outputs
	 .valid				(valid),
	 .data				(data[4:0]),
	 .active_out			(active_out),
	 .idle_out			(idle_out),
	 .fifo_dataout0			(fifo_dataout0[11:0]),
	 .fifo_dataout1			(fifo_dataout1[11:0]),
	 .fifo_dataout2			(fifo_dataout2[11:0]),
	 .fifo_dataout3			(fifo_dataout3[11:0]),
	 // Inputs
	 .clk				(clk),
	 .push (push),
	 .data_in			(data_in[11:0]),
	 .popBP0			(popBP0),
	 .popBP1			(popBP1),
	 .popBP2			(popBP2),
	 .popBP3			(popBP3),
	 .req				(req),
	 .idx				(idx[2:0]),
	 .reset				(reset),
	 .init				(init),
	 .umbralHigh			(umbralHigh[3:0]),
	 .umbralLow			(umbralLow[3:0]));

probador probador (/*AUTOINST*/
		   // Outputs
		   .clk			(clk),
		   .push (push),
		   .data_in		(data_in[11:0]),
		   .popBP0		(popBP0),
		   .popBP1		(popBP1),
		   .popBP2		(popBP2),
		   .popBP3		(popBP3),
		   .req			(req),
		   .idx			(idx[2:0]),
		   .reset		(reset),
		   .init		(init),
		   .umbralHigh		(umbralHigh[3:0]),
		   .umbralLow		(umbralLow[3:0]),
		   // Inputs
		   .valid		(valid),
		   .data		(data[4:0]),
		   .active_out		(active_out),
		   .idle_out		(idle_out),
		   .fifo_dataout0	(fifo_dataout0[11:0]),
		   .fifo_dataout1	(fifo_dataout1[11:0]),
		   .fifo_dataout2	(fifo_dataout2[11:0]),
		   .fifo_dataout3	(fifo_dataout3[11:0]));

endmodule

