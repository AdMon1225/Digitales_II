module probadorRX(  output reg par_ser_1,
				    output reg par_ser_2,
				    output reg reset,
					output reg clk_32f,
					output reg clk_4f,
					output reg clk_2f,
					input valid_out_sint,
                    input valid_out,
                    input [31:0] data_output_sint,
					input [31:0] data_output);


	initial begin
	
    
        $dumpfile("verificacionRX.vcd");
	    $dumpvars;

	    par_ser_1<=0;
	    par_ser_2<=0;
	    reset <=0;
	
	    //se define el primer BC
	    @(posedge clk_4f);
	    @(posedge clk_4f);

	    @(posedge clk_4f);
	    reset <= 1;
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
    	par_ser_2<=1;
    	@(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=1;

    	//se define el segundo BC
    	@(posedge clk_4f);
    	par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=0;
    	@(posedge clk_32f);
    	par_ser_1<=1;
    	par_ser_2<=1;
    	@(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=1;

	    //se define el tercer BC
	    @(posedge clk_4f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
        par_ser_1<=1;
    	par_ser_2<=1;
    	@(posedge clk_32f);
    	par_ser_1<=0;
    	par_ser_2<=0;
    	@(posedge clk_32f);
    	par_ser_1<=0;
    	par_ser_2<=0;

	    //se define el cuarto BC
	    @(posedge clk_4f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    reset <=1;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=0;
    	@(posedge clk_32f);
    	par_ser_1<=1;
    	par_ser_2<=1;
    	@(posedge clk_32f);
    	par_ser_1<=1;
    	par_ser_2<=1;
    	@(posedge clk_32f);
    	par_ser_1<=1;
    	par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=0;
	    @(posedge clk_32f);
    	par_ser_1<=0;
    	par_ser_2<=0;


	    //se definen los datos
        @(posedge clk_4f);
    	par_ser_1<=1;
    	par_ser_2<=0;
    	@(posedge clk_32f);
    	par_ser_1<=1;
    	par_ser_2<=0;
    	@(posedge clk_32f);
    	par_ser_1<=0;
    	par_ser_2<=1;
    	@(posedge clk_32f);
    	par_ser_1<=0;
    	par_ser_2<=1;
        @(posedge clk_32f);
    	par_ser_1<=0;
    	par_ser_2<=1;
    	@(posedge clk_32f);
    	par_ser_1<=1;
        par_ser_2<=1;
        @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=0;

	    @(posedge clk_4f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=0;

	    @(posedge clk_4f);
	    par_ser_1<=0;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=0;

	    @(posedge clk_4f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;

	    @(posedge clk_4f);
	    par_ser_1<=1;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=0;

	    @(posedge clk_4f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=0;
	    @(posedge clk_32f);
    	par_ser_1<=0;
    	par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	
	    @(posedge clk_4f);
	    par_ser_1<=0;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=0;

	    @(posedge clk_4f);
	    par_ser_1<=0;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=0;
	    @(posedge clk_32f);
	    par_ser_1<=1;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=1;
	    @(posedge clk_32f);
	    par_ser_1<=0;
	    par_ser_2<=1;

	    @(posedge clk_4f);
	    par_ser_1<=1;
	    par_ser_2<=1;

	    @(posedge clk_4f);

	    @(posedge clk_4f);

	    @(posedge clk_4f);
	    $finish;
	end
	
	initial clk_2f <= 1;
	always #16 clk_2f <= ~clk_2f;

	initial clk_4f <= 1;
	always #8 clk_4f <= ~clk_4f;

	initial clk_32f <= 1;
	always #1 clk_32f <= ~clk_32f;
endmodule
