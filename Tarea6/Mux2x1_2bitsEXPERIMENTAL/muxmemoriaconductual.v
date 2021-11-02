module muxmemoriaconductual(

	input clk,
	input reset_L,
	input selector,
	input [1:0] data_in0,
	input [1:0] data_in1,
	input valid_0, valid_1,
	output reg valid_out,
	output reg [1:0] data_out);
	
	reg [1:0] min_0, min_1, mout;
	
	always @ (*)
	begin 
		if (~selector) 
			mout = min_0;
		else 
			mout = min_1;
	end
	
	always @ (posedge clk)
	begin
		if (~reset_L) 
			data_out <= 0;
		else 
			data_out <= mout;
	end

	always @ (*) 
	begin
		if (~valid_0) 
			min_0 = min_0;
		else 
			min_0 = data_in0;
	end

	always @ (*)
	begin
		if (~valid_1) 
			min_1 = min_1;
		else 
			min_1 = data_in1;
	end

	always @(*) 
	begin
		if (selector & valid_1)
			valid_out = 1;
		else if (~selector & valid_0)
			valid_out = 1;
		else 
			valid_out = 0;
		
	end
endmodule 