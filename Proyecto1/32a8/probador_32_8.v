module probador_32_8(input [7:0] data_out,
						input [7:0] data_out_estructural, //la salida debe ser de 8 bits
						input valid_out_estructural,
						input valid_out,
						output reg valid,
						output reg [31:0] data_in, //la entrada debe ser de 32 bits
						output reg clk_4f,
						output reg clk_2f,
						output reg clk_f,
						output reg reset);
	initial begin
		$dumpfile("log328.vcd");
		$dumpvars;

		valid <= 0;		
		reset <= 0;
		data_in <= 0;
		 
		// asignamos valores en cada flanco d reloj

		@(posedge clk_f);

		@(posedge clk_f);
		reset <= 1;
		valid <= 0;
		data_in <= 32'hFFAABB22;

		@(posedge clk_f);
		valid <= 1;
		data_in <= 32'hFD554488;

		@(posedge clk_f);
		valid <= 1;
		data_in <= 32'hCCBBAAFF;

		@(posedge clk_f);
		valid <= 1;
		data_in <= 32'hFD554488;

		@(posedge clk_f);
		valid <= 0;
		data_in <= 32'h12345678;

		@(posedge clk_f);
		valid <= 0;
		data_in <= 32'hBBCCDDEE;

		@(posedge clk_f);

		@(posedge clk_f);
		#40 $finish;
	end
	
	//aca definimos las frecuencias de cada reloj

	initial begin
		clk_4f <= 1;
		clk_2f <= 0;
		clk_f <= 0;
	end 
	always begin
		#1 clk_4f <= ~clk_4f;
	end
	always begin
		#2 clk_2f <= ~clk_2f;
	end
	always begin
		#4 clk_f <= ~clk_f;
	end
endmodule
