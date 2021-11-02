`include "mux2x1.v"
`include "testbenchmux.v"
`include "mux2x1Synth.v"
`include "cmos_cells.v"

module probadormux();

wire clk, reset_L, selector, valid_0, valid_1, valid_outCond, valid_outSynth;
wire [1:0] data_in0, data_in1, data_outCond, data_outSynth;

mux2x1 mux0 (/*AUTOINST*/
	     // Outputs
	     .valid_out			(valid_outCond),
	     .data_out			(data_outCond[1:0]),
	     // Inputs
	     .clk			(clk),
	     .reset_L			(reset_L),
	     .selector			(selector),
	     .data_in0			(data_in0[1:0]),
	     .data_in1			(data_in1[1:0]),
	     .valid_0			(valid_0),
	     .valid_1			(valid_1));		   

mux2x1Synth mux1 (/*AUTOINST*/
		  // Outputs
		  .data_out		(data_outSynth[1:0]),
		  .valid_out		(valid_outSynth),
		  // Inputs
		  .clk			(clk),
		  .data_in0		(data_in0[1:0]),
		  .data_in1		(data_in1[1:0]),
		  .reset_L		(reset_L),
		  .selector		(selector),
		  .valid_0		(valid_0),
		  .valid_1		(valid_1));

testbenchmux tb0 (/*AUTOINST*/
		  // Outputs
		  .clk			(clk),
		  .reset_L		(reset_L),
		  .selector		(selector),
		  .data_in0		(data_in0[1:0]),
		  .data_in1		(data_in1[1:0]),
		  .valid_0		(valid_0),
		  .valid_1		(valid_1),
		  // Inputs
		  .valid_outCond		(valid_outCond),
		  .valid_outSynth		(valid_outSynth),
		  .data_outCond		(data_outCond[1:0]),
		  .data_outSynth	(data_outSynth[1:0]));


endmodule 
