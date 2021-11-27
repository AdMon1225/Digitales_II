`include "arbitro1.v"
`include "arbitro1Synth.v"
`include "probador.v"
`include "cmos_cells.v"

module testbench();

wire [3:0] emptyFIFO, almost_fullFIFO, pop, push, popSynth, pushSynth;
wire reset, clk, active;
wire [11:0] demuxin;

arbitro1 arbitroCond (/*AUTOINST*/
		      // Outputs
		      .pop		(pop[3:0]),
		      .push		(push[3:0]),
		      // Inputs
		      .reset		(reset),
		      .clk		(clk),
			  .active (active),
		      .emptyFIFO	(emptyFIFO[3:0]),
		      .almost_fullFIFO	(almost_fullFIFO[3:0]),
			  .demuxin (demuxin));

arbitro1Synth arbitroSynth (/*AUTOINST*/
			    // Outputs
			    .pop		(popSynth[3:0]),
			    .push		(pushSynth[3:0]),
			    // Inputs
			    .almost_fullFIFO	(almost_fullFIFO[3:0]),
				.active (active),
			    .clk		(clk),
			    .emptyFIFO		(emptyFIFO[3:0]),
				.demuxin (demuxin),
			    .reset		(reset));

probador probador (/*AUTOINST*/
		   // Outputs
		   .reset		(reset),
		   .active (active),
		   .clk			(clk),
		   .emptyFIFO		(emptyFIFO[3:0]),
		   .almost_fullFIFO	(almost_fullFIFO[3:0]),
		   .demuxin (demuxin),
		   // Inputs
		   .pop			(pop[3:0]),
		   .popSynth		(popSynth[3:0]),
		   .push		(push[3:0]),
		   .pushSynth		(pushSynth[3:0]));

endmodule
