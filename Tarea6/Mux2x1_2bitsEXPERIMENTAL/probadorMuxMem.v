`include "muxmemoriaconductual.v"
`include "testbenchMuxMem.v"

module probadorMuxMem();

wire clk, reset_L, selector, valid_0, valid_1, valid_out;
wire [1:0] data_in0, data_in1, data_out;

muxmemoriaconductual mux0 (/*AUTOINST*/
			   // Outputs
			   .valid_out		(valid_out),
			   .data_out		(data_out[1:0]),
			   // Inputs
			   .clk			(clk),
			   .reset_L		(reset_L),
			   .selector		(selector),
			   .data_in0		(data_in0[1:0]),
			   .data_in1		(data_in1[1:0]),
			   .valid_0		(valid_0),
			   .valid_1		(valid_1));
testbenchMuxMem tb0 (/*AUTOINST*/
		     // Outputs
		     .clk		(clk),
		     .reset_L		(reset_L),
		     .selector		(selector),
		     .data_in0		(data_in0[1:0]),
		     .data_in1		(data_in1[1:0]),
		     .valid_0		(valid_0),
		     .valid_1		(valid_1),
		     // Inputs
		     .valid_out		(valid_out),
		     .data_out		(data_out[1:0]));
endmodule 
