`timescale 1ns / 100ps 
`include "un_byte_striping.v"
`include "probadorub.v"
`include "cmos_cells.v"
`include "clock.v"
`include "clockS.v"
`include "un_byte_stripingS.v"


module tbu; // Testbench
        wire [31:0] lane_0, lane_1, data_out,data_outS;
	wire reset_L, clk_2f,clk_f,clk_4f, clk_2fS,clk_fS,clk_4fS, clk32, valid_0, valid_1, valid_out, valid_outS;
	

	//instancias
   clock relojes(/*AUTOINST*/
			    // Outputs
			    .clock4		(clk_4f),
			    .clock2		(clk_2f),
			    .clock1		(clk_f),
			    // Inputs
			    .clock32		(clk32),
			    .reset_L		(reset_L));
   
	un_byte_striping cond(/*AUTOINST*/
			      // Outputs
			      .data_out		(data_out[31:0]),
			      .valid_out	(valid_out),
			      // Inputs
			      .reset_L		(reset_L),
			      .lane_0		(lane_0[31:0]),
			      .lane_1		(lane_1[31:0]),
			      .valid_0		(valid_0),
			      .valid_1		(valid_1),
			      .clk_2f		(clk_2f),
			      .clk_f		(clk_f));

	clockS relojeS(/*AUTOINST*/
			    // Outputs
			    .clockS4		(clk_4fS),
			    .clockS2		(clk_2fS),
			    .clockS1		(clk_fS),
			    // Inputs
			    .clockS32		(clk32),
			    .reset_L		(reset_L));
   
	un_byte_stripingS Estructural(/*AUTOINST*/
			      // Outputs
			      .data_out		(data_outS[31:0]),
			      .valid_out	(valid_outS),
			      // Inputs
			      .reset_L		(reset_L),
			      .lane_0		(lane_0[31:0]),
			      .lane_1		(lane_1[31:0]),
			      .valid_0		(valid_0),
			      .valid_1		(valid_1),
			      .clk_2f		(clk_2f),
			      .clk_f		(clk_f));

	probadorub condu(/*AUTOINST*/
			 // Outputs
			 .reset_L		(reset_L),
			 .lane_0		(lane_0[31:0]),
			 .lane_1		(lane_1[31:0]),
			 .valid_0		(valid_0),
			 .valid_1		(valid_1),
			 .clk32			(clk32),
			 // Inputs
			 .data_out		(data_out[31:0]),
			 .valid_out		(valid_out),
			 .clk_2f		(clk_2f),
			 .clk_4f		(clk_4f),
			 .clk_f			(clk_f),
			 .data_outS		(data_outS[31:0]),
			 .valid_outS		(valid_outS),
			 .clk_2fS		(clk_2fS),
			 .clk_4fS		(clk_4fS),
			 .clk_fS			(clk_fS));

	
endmodule
