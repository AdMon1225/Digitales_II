`include "counter_cond.v"
`include "counter_sint.v"
`include "tester_counter.v"
`include "cmos_cells.v"

module testbench_counter;

    wire [2:0] idx;
    wire valid, clk, req, IDLE, reset_L, fifo0_pop, fifo1_pop, fifo2_pop, fifo3_pop, fifo4_pop;
    wire [4:0] data_out, data_out_sint;


    counter_cond count_C(/*AUTOINST*/
			 // Outputs
			 .valid			(valid),
			 .data_out		(data_out[4:0]),
			 // Inputs
			 .clk			(clk),
			 .req			(req),
			 .IDLE			(IDLE),
			 .reset_L		(reset_L),
			 .idx			(idx[2:0]),
			 .fifo0_pop		(fifo0_pop),
			 .fifo1_pop		(fifo1_pop),
			 .fifo2_pop		(fifo2_pop),
			 .fifo3_pop		(fifo3_pop),
			 .fifo4_pop		(fifo4_pop));



	counter_sint count_E(/*AUTOINST*/
			     // Outputs
			     .data_out_sint   	(data_out_sint[4:0]),
			     .valid_sint     	(valid_sint),
			     // Inputs
			     .IDLE		(IDLE),
			     .clk		(clk),
			     .fifo0_pop		(fifo0_pop),
			     .fifo1_pop		(fifo1_pop),
			     .fifo2_pop		(fifo2_pop),
			     .fifo3_pop		(fifo3_pop),
			     .fifo4_pop		(fifo4_pop),
			     .idx		(idx[2:0]),
			     .req		(req),
			     .reset_L		(reset_L));



    tester_counter prob(/*AUTOINST*/
			// Outputs
			.clk		(clk),
			.req		(req),
			.IDLE		(IDLE),
			.reset_L	(reset_L),
			.idx		(idx[2:0]),
			.fifo0_pop	(fifo0_pop),
			.fifo1_pop	(fifo1_pop),
			.fifo2_pop	(fifo2_pop),
			.fifo3_pop	(fifo3_pop),
			.fifo4_pop	(fifo4_pop),
			// Inputs
			.valid		(valid),
			.data_out_sint  (data_out_sint[4:0]),
			.data_out	(data_out[4:0]));
	                
		
endmodule
