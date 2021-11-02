module prob_ser_par(input active,
					input valid_out,
					input active_sint,
					input valid_out_sint,
                    input [7:0] data2send,
					input [7:0]data_out,
                    input [7:0] data2send_sint,
					input [7:0] data_out_sint,
					output reg reset,
					output reg data_in,
					output reg clk_4f,
					output reg clk_32f);

initial begin
    $dumpfile("test_ser_par.vcd");
    $dumpvars;

    // inicializamos las salidas en cero
    data_in <= 0;
	reset <=0;

    //Tenemos un BC con reset en cero
    @(posedge clk_4f);
	reset <= 0;
	data_in<=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=0;

    //Tenemos un BC con reset en 1
	@(posedge clk_4f);
	reset <= 1;
	data_in<=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=0;

    //Tenemos ahora dos BC con reset en 1
	@(posedge clk_4f);
	reset <=1;
	data_in<=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=0;


    //Tenemos ahora tres BC con reset en 1
    @(posedge clk_4f);
	data_in<=1;
	reset <=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=0;
    

    //Tenemos ahora cuatro BC con reset en 1
    @(posedge clk_4f);
	data_in<=1;
	reset <=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=0;


    //Tenemos ahora cinco BC con reset en 1
    @(posedge clk_4f);
	data_in<=1;
	reset <=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=0;

    
    @(posedge clk_4f);
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;


    @(posedge clk_4f);
	data_in<=0;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=0;

	@(posedge clk_4f);
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=0;


    @(posedge clk_4f);
	data_in<=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=0;

    // ahora un BC
    @(posedge clk_4f);
	data_in<=1;
	reset <=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=1;
	@(posedge clk_32f)
	data_in<=0;
	@(posedge clk_32f)
	data_in<=0;
    
    
	@(posedge clk_4f);
	data_in<=1;
    


	$finish;

end


	initial clk_4f <= 1;
	always #8 clk_4f <= ~clk_4f;

	initial clk_32f <= 1;
	always #1 clk_32f <= ~clk_32f;

endmodule