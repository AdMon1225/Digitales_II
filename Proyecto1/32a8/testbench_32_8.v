
`include "log_32_8.v"
`include "log_32_8_sint.v"
`include "cmos_cells.v"
`include "probador_32_8.v"


module testbench_32_8;

	wire [7:0] data_out, data_out_sint;
	wire [31:0] data_in;
	wire clk_2f, clk_4f, clk_f, valid, valid_out, valid_out_sint;


	// Instanciacion del modulo conductual
    log_32_8 cond(/*AUTOINST*/
		  // Outputs
		  .data_out		(data_out[7:0]),
		  .valid_out		(valid_out),
		  // Inputs
		  .clk_4f		(clk_4f),
		  .data_in		(data_in[31:0]),
		  .valid		(valid),
		  .reset		(reset));

	// instanciacion del modulo estructural(sintetizado)
    log_32_8_sint estr(/*AUTOINST*/
		       // Outputs
		       .data_out_sint	(data_out_sint[7:0]),
		       .valid_out_sint	(valid_out_sint),
		       // Inputs
		       .clk_4f		(clk_4f),
		       .data_in		(data_in[31:0]),
		       .reset		(reset),
		       .valid		(valid));

	// instanciacion deel probador
	probador_32_8 tester(/*AUTOINST*/
			     // Outputs
			     .valid		(valid),
			     .data_in		(data_in[31:0]),
			     .clk_4f		(clk_4f),
			     .clk_2f		(clk_2f),
			     .clk_f		(clk_f),
			     .reset		(reset),
			     // Inputs
			     .data_out		(data_out[7:0]),
			     .data_out_estructural(data_out_sint[7:0]),
			     .valid_out_estructural(valid_out_sint),
			     .valid_out		(valid_out));


endmodule


