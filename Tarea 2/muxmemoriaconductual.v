module mux_mem_conductual(

	input clk,
	input reset_L,
	input selector,
	input [1:0] data_in0,
	input [1:0] data_in1,
	output reg [1:0] data_out);
	
	reg [1:0] mout;
	
	always @ (*)
	begin 
		if (~selector) mout = data_in0;
		else mout = data_in1;
	end
	
	always @ (posedge clk)
	begin
		if (~reset_L) data_out <= 0;
		else data_out <= mout;
	end
		
endmodule 
