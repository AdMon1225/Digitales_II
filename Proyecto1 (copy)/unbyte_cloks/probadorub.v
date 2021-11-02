
module   probadorub(
         input [31:0]      data_out,data_outS,  
         output reg                reset_L,     
         output reg[31:0] lane_0,
         output reg[31:0] lane_1,
	 output reg	       valid_0, valid_1,
	 output reg  	clk32,
         input	       valid_out,valid_outS,
	 input	          clk_2f, clk_2fS,
	 input		  clk_4f,clk_4fS,
         input	          clk_f,clk_fS);

	initial begin
    	        $dumpfile("tb.vcd");
    	        $dumpvars;
		//se asigna valor de cero a las salidas
		reset_L = 0;
		lane_0 = 0;
		lane_1 = 0;
		clk32 = 0;	
		{valid_0,valid_1} = 2'b00;
		//primer flanco
    		@(posedge clk32)
   		 reset_L <= 1;
			@(posedge clk32)
   		 reset_L <= 0;
			@(posedge clk32)
   		 reset_L <= 0;
			@(posedge clk32)
   		 reset_L <= 1;
		//segundo flanco
   	        @(posedge clk_2f)
   		 lane_0 <= 32'b00000000000000001111111111111111;
    		 lane_1 <= 32'b00000000000000001111111111111111;
		 {valid_0,valid_1} = 2'b11;

		//tercer flanco;
   	        @(posedge clk_2f)
    		 lane_0 <= 32'b11111111111111111111111111111111;
    		 lane_1 <= 32'b11111111111111111111111111111111;
		 {valid_0,valid_1} = 2'b10;
  
		//cuarto flanco
   		@(posedge clk_2f)
   		 lane_0 <= 32'b00000000000000000000000000000000;
    		 lane_1 <= 32'b00000000000000001111111111111111;
		 {valid_0,valid_1} = 2'b11;
   		
		//quinto flanco
   	        @(posedge clk_2f)
   		 lane_0 <= 32'b00000000000000001111111111111111;
    		 lane_1 <= 32'b00000000000000000000000000000000;
		 {valid_0,valid_1} = 2'b11;
   		//sexto flanco
   	        @(posedge clk_2f)
   		 lane_0 <= 32'b11111111111111111111111111111111;
    		 lane_1 <= 32'b11111111111111111111111111111111;
		 {valid_0,valid_1} = 2'b11;
    		//setimo flanco
   	        @(posedge clk_2f)
    		 lane_0 <= 32'b00000000000000001111111111111111;
    		 lane_1 <= 32'b00000000000000001111111111111111;
		 {valid_0,valid_1} = 2'b11;
    		//octavo flanco
   	        @(posedge clk_2f);
		//noveno flanco
   		@(posedge clk_2f);

		$finish; //fin

	end
	
    initial clk32 <= 0;
    always #20 clk32 <= ~clk32;
endmodule




