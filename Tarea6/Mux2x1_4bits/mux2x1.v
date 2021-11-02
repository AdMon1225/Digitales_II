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

module mux2x14b(

	input clk,
	input reset_L,
	input selector,
	input [3:0] data_in0,
	input [3:0] data_in1,
	input valid_0, valid_1,
	output valid_out,
	output [3:0] data_out);

	wire validX;

	mux2x1 mux0 (/*AUTOINST*/
		     // Outputs
		     .valid_out		(validX),
		     .data_out		(data_out[3:2]),
		     // Inputs
		     .clk		    (clk),
		     .reset_L		(reset_L),
		     .selector		(selector),
		     .data_in0		(data_in0[3:2]),
		     .data_in1		(data_in1[3:2]),
		     .valid_0		(valid_0),
		     .valid_1		(valid_1));
	mux2x1 mux1 (/*AUTOINST*/
		     // Outputs
		     .valid_out		(valid_out),
		     .data_out		(data_out[1:0]),
		     // Inputs
		     .clk		    (clk),
		     .reset_L		(reset_L),
		     .selector		(selector),
		     .data_in0		(data_in0[1:0]),
		     .data_in1		(data_in1[1:0]),
		     .valid_0		(valid_0),
		     .valid_1		(valid_1));
endmodule