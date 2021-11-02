`include "phy.v"
`include "probadorphy.v"
`include "cmos_cells.v"
`include "phy_sint.v"

module TBphy();

    wire [31:0] data_in, data_out;
    wire valid_out, valid_in, reset, clk_f, clk_2f, clk_4f, clk_32f, data_final;
	wire [31:0] data_out_sint;
	wire valid_out_sint;

    phy PHYV(/*AUTOINST*/
	     // Outputs
	     .data_out			(data_out[31:0]),
	     .valid_out			(valid_out),
	     // Inputs
	     .data_in			(data_in[31:0]),
	     .valid_in			(valid_in),
	     .reset			(reset),
	     .clk_2f			(clk_2f),
	     .clk_f			(clk_f),
	     .clk_4f			(clk_4f),
	     .clk_32f			(clk_32f));

    probadorphy prob(/*AUTOINST*/
		     // Outputs
		     .data_in		(data_in[31:0]),
		     .valid_in		(valid_in),
		     .reset		(reset),
		     .clk_f		(clk_f),
		     .clk_2f		(clk_2f),
		     .clk_4f		(clk_4f),
		     .clk_32f		(clk_32f),
		     // Inputs
		     .data_out		(data_out[31:0]),
		     .valid_out		(valid_out));
	
	phy_sint SINT(/*AUTOINST*/
		      // Outputs
		      .data_out_sint	(data_out_sint[31:0]),
		      .valid_out_sint	(valid_out_sint),
		      // Inputs
		      .clk_2f		(clk_2f),
		      .clk_32f		(clk_32f),
		      .clk_4f		(clk_4f),
		      .clk_f		(clk_f),
		      .data_in		(data_in[31:0]),
		      .reset		(reset),
		      .valid_in		(valid_in));


endmodule

