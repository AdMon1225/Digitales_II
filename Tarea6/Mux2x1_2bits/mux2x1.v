module mux2x1(

	input clk,
	input reset_L,
	input selector,
	input [1:0] data_in0,
	input [1:0] data_in1,
	input valid_0, valid_1,
	output reg valid_out,
	output reg [1:0] data_out);
	
	reg [1:0] mout;
	reg validOutMux;
	
	always @(*) 
	begin
		if (selector == 0) begin
			mout = data_in0;
			validOutMux = valid_0;
		end	
		else begin
			mout = data_in1;
			validOutMux = valid_1;
		end	
	end
	
	always @(posedge clk) 
	begin
		if (reset_L == 0) begin
			data_out <= 0;
		end
		else begin
			if (validOutMux) begin
				data_out <= mout;
				valid_out <= validOutMux;
			end
			else begin
				data_out <= data_out;
				valid_out <= validOutMux;
			end
		end 
	end				
endmodule