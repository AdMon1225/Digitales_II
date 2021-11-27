`include "arbitro2.v"
`include "arbitro2Synth.v"
`include "probador.v"
`include "cmos_cells.v"

module testbench();

wire [3:0] almost_fullFIFO, push, pushSynth;
wire [11:0] muxout;
wire reset, clk, emptyFIFO, pop, popSynth;

arbitro2 arbitroCond (/*AUTOINST*/
		      // Outputs
		      .pop		(pop),
		      .push		(push[3:0]),
		      // Inputs
		      .reset		(reset),
		      .clk		(clk),
		      .muxout		(muxout[11:0]),
		      .emptyFIFO	(emptyFIFO),
		      .almost_fullFIFO	(almost_fullFIFO[3:0]));

arbitro2Synth arbitroSynth (/*AUTOINST*/
			    // Outputs
			    .pop		(popSynth),
			    .push		(pushSynth[3:0]),
			    // Inputs
			    .almost_fullFIFO	(almost_fullFIFO[3:0]),
			    .clk		(clk),
			    .emptyFIFO		(emptyFIFO),
			    .muxout		(muxout[11:0]),
			    .reset		(reset));

probador probador (/*AUTOINST*/
		   // Outputs
		   .reset		(reset),
		   .clk			(clk),
		   .muxout		(muxout[11:0]),
		   .emptyFIFO		(emptyFIFO),
		   .almost_fullFIFO	(almost_fullFIFO[3:0]),
		   // Inputs
		   .pop			(pop),
		   .popSynth		(popSynth),
		   .push		(push[3:0]),
		   .pushSynth		(pushSynth[3:0]));

endmodule
