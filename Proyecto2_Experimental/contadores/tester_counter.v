`timescale 1ns/1ps


module tester_counter (
    output reg clk,
    output reg req,
    output reg IDLE,
    output reg reset_L,
    output reg [2:0] idx,
    output reg fifo0_pop,
    output reg fifo1_pop,
    output reg fifo2_pop,
    output reg fifo3_pop,
    output reg fifo4_pop,
    input valid,
    input [4:0] data_out, data_out_sint);


    initial begin
    clk <= 0;
    fifo0_pop <= 0;
    fifo1_pop <= 0;
    fifo1_pop <= 0;
    fifo2_pop <= 0; 
    fifo3_pop <= 0;
    fifo4_pop <= 0;
    req <= 0;
    reset_L <= 0;
    IDLE <= 0;
    idx [2:0] <= 3'b000;
    end
	always #1 clk <= ~clk;  

	initial begin

	    $dumpfile("COUNTERS.vcd");
	    $dumpvars;

	    {fifo0_pop, fifo1_pop, fifo2_pop, fifo3_pop, fifo4_pop} <= 0;
	    {req, IDLE, reset_L} <= 0;
        idx = 3'b000;

	    @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);

	
        @(posedge clk);
        reset_L <= 0;
        IDLE <= 0;
        req <= 0;
        idx <= 3'b000;
        fifo0_pop <= 0;
        fifo1_pop <= 0;
        fifo2_pop <= 0;
        fifo3_pop <= 0;
        fifo4_pop <= 0;

	    @(posedge clk);
        reset_L <= 1;
        IDLE <= 0;
        req <= 0;
        idx <= 3'b010;
        fifo0_pop <= 0;
        fifo1_pop <= 0;
        fifo2_pop <= 0;
        fifo3_pop <= 0;
        fifo4_pop <= 1;


	    @(posedge clk);
        reset_L <= 1;
        IDLE <= 1;
        req <= 1;
        idx <= 3'b010;
        fifo0_pop <= 1;
        fifo1_pop <= 0;
        fifo2_pop <= 0;
        fifo3_pop <= 0;
        fifo4_pop <= 1;

	    @(posedge clk);
        reset_L <= 1;
        IDLE <= 1;
        req <= 1;
        idx <= 3'b011;
        fifo0_pop <= 1;
        fifo1_pop <= 1;
        fifo2_pop <= 1;
        fifo3_pop <= 0;
        fifo4_pop <= 1;


	    @(posedge clk);
        reset_L <= 1;
        IDLE <= 1;
        req <= 1;
        idx <= 3'b001;
        fifo0_pop <= 1;
        fifo1_pop <= 1;
        fifo2_pop <= 1;
        fifo3_pop <= 1;
        fifo4_pop <= 1;

	    @(posedge clk);
        reset_L <= 1;
        IDLE <= 1;
        req <= 1;
        idx <= 3'b010;
        fifo0_pop <= 0;
        fifo1_pop <= 1;
        fifo2_pop <= 1;
        fifo3_pop <= 1;
        fifo4_pop <= 0;


	    @(posedge clk);
        reset_L <= 1;
        IDLE <= 1;
        req <= 1;
        idx <= 3'b011;
        fifo0_pop <= 0;
        fifo1_pop <= 0;
        fifo2_pop <= 1;
        fifo3_pop <= 1;
        fifo4_pop <= 1;
 

	    @(posedge clk);
        reset_L <= 1;
        IDLE <= 1;
        req <= 1;
        idx <= 3'b100;
        fifo0_pop <= 1;
        fifo1_pop <= 1;
        fifo2_pop <= 1;
        fifo3_pop <= 1;
        fifo4_pop <= 0;


	    @(posedge clk);
        reset_L <= 1;
        IDLE <= 1;
        req <= 1;
        idx <= 3'b010;
        fifo0_pop <= 1;
        fifo1_pop <= 0;
        fifo2_pop <= 1;
        fifo3_pop <= 1;
        fifo4_pop <= 0;


	    @(posedge clk);
        reset_L <= 0;
        IDLE <= 1;
        req <= 1;
        idx <= 3'b010;
        fifo0_pop <= 1;
        fifo1_pop <= 0;
        fifo2_pop <= 1;
        fifo3_pop <= 1;
        fifo4_pop <= 0;

	    @(posedge clk);

	    @(posedge clk);

	    @(posedge clk);

	    $finish;

	end

	initial clk <= 0;
        always #1 clk <= ~clk; 

endmodule
