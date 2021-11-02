`include "bytestriping.v"
`include "bytestripingSynth.v"
`include "probadorBS.v"
`include "cmos_cells.v"

module testbenchBS();

wire clk_2f, clk_f, valid_in, valid_out0Cond, valid_out1Cond, valid_out0Synth, valid_out1Synth, reset;
wire [31:0] data_in, lane_0Cond, lane_1Cond, lane_0Synth, lane_1Synth;

bytestriping bsCond (/*AUTOINST*/
		     // Outputs
		     .lane_0		(lane_0Cond[31:0]),
		     .lane_1		(lane_1Cond[31:0]),
		     .valid_out0	(valid_out0Cond),
		     .valid_out1	(valid_out1Cond),
		     // Inputs
		     .data_in		(data_in[31:0]),
		     .clk_2f		(clk_2f),
		     .clk_f		(clk_f),
		     .valid_in		(valid_in),
		     .reset		(reset));

bytestripingSynth bsSynth (/*AUTOINST*/
			   // Outputs
			   .lane_0		(lane_0Synth[31:0]),
			   .lane_1		(lane_1Synth[31:0]),
			   .valid_out0		(valid_out0Synth),
			   .valid_out1		(valid_out1Synth),
			   // Inputs
			   .clk_2f		(clk_2f),
			   .clk_f		(clk_f),
			   .data_in		(data_in[31:0]),
			   .reset		(reset),
			   .valid_in		(valid_in));

probadorBS probador0 (/*AUTOINST*/
		      // Outputs
		      .data_in		(data_in[31:0]),
		      .clk_2f		(clk_2f),
		      .clk_f		(clk_f),
		      .valid_in		(valid_in),
		      .reset		(reset),
		      // Inputs
		      .lane_0Cond	(lane_0Cond[31:0]),
		      .lane_1Cond	(lane_1Cond[31:0]),
		      .lane_0Synth	(lane_0Synth[31:0]),
		      .lane_1Synth	(lane_1Synth[31:0]),
		      .valid_out0Cond	(valid_out0Cond),
		      .valid_out1Cond	(valid_out1Cond),
		      .valid_out0Synth	(valid_out0Synth),
		      .valid_out1Synth	(valid_out1Synth));
endmodule 
