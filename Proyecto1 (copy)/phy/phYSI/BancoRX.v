`include "phy_rx.v"
`include "phy_rx_sint.v"
`include "probadorRX.v"
`include "cmos_cells.v"

module  BancoRX();


	wire valid_output;
	wire valid_output_sint;
    wire [31:0] data_output;
    wire [31:0] data_output_sint;


    phy_rx RX1(/*AUTOINST*/
	       // Outputs
	       .active_ser_par_1	(active_ser_par_1),
	       .active_ser_par_2	(active_ser_par_2),
	       .valid_output		(valid_output),
	       .data_output		(data_output[31:0]),
	       // Inputs
	       .par_ser_1		(par_ser_1),
	       .par_ser_2		(par_ser_2),
	       .reset			(reset),
	       .clk_f			(clk_f),
	       .clk_2f			(clk_2f),
	       .clk_4f			(clk_4f),
	       .clk_32f			(clk_32f));



    phy_rx_sint RX1sint(/*AUTOINST*/
			// Outputs
			.active_ser_par_sint_1  (active_ser_par_sint_1),
			.active_ser_par_sint_2  (active_ser_par_sint_2),
			.data_output_sint        (data_output_sint[31:0]),
			.valid_output_sint       (valid_output_sint),
			// Inputs
			.clk_2f		(clk_2f),
			.clk_32f	(clk_32f),
			.clk_4f		(clk_4f),
			.clk_f		(clk_f),
			.par_ser_1	(par_ser_1),
			.par_ser_2	(par_ser_2),
			.reset		(reset));


    probadorRX prob(/*AUTOINST*/
		    // Outputs
		    .par_ser_1		(par_ser_1),
		    .par_ser_2		(par_ser_2),
		    .reset		(reset),
		    .clk_32f		(clk_32f),
		    .clk_4f		(clk_4f),
		    .clk_2f		(clk_2f),
		    // Inputs
		    .valid_out_sint	(valid_output_sint),
		    .valid_out		(valid_output),
		    .data_output_sint	(data_output_sint[31:0]),
		    .data_output	(data_output[31:0]));



endmodule
