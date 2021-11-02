`include "mux_param.v"
`include "mux_param_Synth.v"
`include "FSM.v"
`include "FSM_Synth.v"
`include "probador.v"
`include "cmos_cells.v"

module Banco_Prueba;

	parameter BUS_SIZE = 16;
	parameter WORD_SIZE = 4;
    parameter WORD_NUM = BUS_SIZE / WORD_SIZE;

    wire reset, clk, err, next_err, errSynth, next_errSynth;
	wire [BUS_SIZE-1:0] data_in, data_out, data_outSynth;
    wire [WORD_NUM-1:0] salida_control, salida_controlSynth;

    mux_param mux1 (/*AUTOINST*/
		    // Outputs
		    .data_out		(data_out[BUS_SIZE-1:0]),
		    .salida_control	(salida_control[WORD_NUM-1:0]),
		    // Inputs
		    .clk		(clk),
		    .reset		(reset),
		    .data_in		(data_in[BUS_SIZE-1:0]));

    mux_param_Synth mux1Synth (/*AUTOINST*/
			       // Outputs
			       .data_out	(data_outSynth[15:0]),
			       .salida_control	(salida_controlSynth[3:0]),
			       // Inputs
			       .clk		(clk),
			       .data_in		(data_in[15:0]),
			       .reset		(reset));

    FSM FSM1 (/*AUTOINST*/
	      // Outputs
	      .err			(err),
	      .next_err			(next_err),
	      // Inputs
	      .clk			(clk),
	      .reset			(reset),
	      .data_in			(data_in[BUS_SIZE-1:0]));

    FSM_Synth FSM1Synth (/*AUTOINST*/
			 // Outputs
			 .err			(errSynth),
			 .next_err		(next_errSynth),
			 // Inputs
			 .clk			(clk),
			 .data_in		(data_in[15:0]),
			 .reset			(reset));

    probador probador1 (/*AUTOINST*/
			// Outputs
			.clk		(clk),
			.reset		(reset),
			.data_in	(data_in[BUS_SIZE-1:0]),
			// Inputs
			.data_out	(data_out[BUS_SIZE-1:0]),
			.salida_control	(salida_control[WORD_NUM-1:0]),
			.data_out_Synth	(data_outSynth[BUS_SIZE-1:0]),
			.salida_control_Synth(salida_controlSynth[WORD_NUM-1:0]),
			.err		(err),
			.next_err	(next_err),
			.err_Synth	(errSynth),
			.next_err_Synth	(next_errSynth));


endmodule
