module probador_8_32(input [31:0] data_out,
						input [31:0] data_out_estructural,
						input valid_out_estructural,
						input valid_out,
						output reg valid,
						output reg [7:0] data_in,
						output reg clk_4f,
						output reg clk_2f,
						output reg clk_f,
						output reg reset);
	initial begin
	$dumpfile("mux_8_32.vcd");
	$dumpvars;

	{valid, reset} <= 0;
	{data_in} <= 8'h0000;

	
	@(posedge clk_f);

	@(posedge clk_f);
	reset <= 1;
	valid <= 0;

	@(posedge clk_4f);
	@(posedge clk_4f);

	@(posedge clk_4f);
	data_in <= 8'h55;
	valid <= 1;
	@(posedge clk_4f);
	data_in <= 8'hCC;
	@(posedge clk_4f);
	data_in <= 8'hAA;
	@(posedge clk_4f);
	data_in <= 8'hB8;


	@(posedge clk_4f);
	data_in <= 8'hDD;
	@(posedge clk_4f);
	data_in <= 8'hBB;
	@(posedge clk_4f);
	data_in <= 8'hA8;
	@(posedge clk_4f);
	data_in <= 8'h34;

	@(posedge clk_4f);
	valid <= 0;
	data_in <= 8'hCC;

	@(posedge clk_f);

	@(posedge clk_f);
	#50 $finish;
	end
	
	initial clk_4f <= 1;
	always #32 clk_4f <= ~clk_4f;

	initial clk_2f <= 1;
	always #64 clk_2f <= ~clk_2f;

	initial clk_f <= 1;
	always #128 clk_f <= ~clk_f;


endmodule
