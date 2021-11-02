module mux_8_32(input clk_4f,
				input clk_f,
				input [7:0] data_in,
				input valid,
				input reset,
				output reg [31:0] data_out,
				output reg valid_out); // tiene que ser reg para poder ser l-value

	integer contador;			
	reg delay_valid;			// para retrasar el valid
	reg [31:0] buffer;			
	reg [31:0] buffer_out;		
	reg ready;

	always @(posedge clk_4f) begin
		if(reset == 0) begin
			contador  <= 0;
			valid_out <= 0;
			buffer <= 0;
			data_out <= 0;
			delay_valid <= 0;
			ready <= 0;
		end
		else begin
			delay_valid <= valid;					// retraso de valid un ciclo
			buffer <= {buffer[23:0], data_in};		// desplaza
			if(delay_valid) begin
				if (contador == 3) begin
					data_out <= buffer;
					valid_out <= 1;
					ready <= 1;
				end
				contador <= contador + 1;
				if(contador >= 3) begin 
					contador <= 0;
				end
			end
		end
	end

	always @(posedge clk_f) begin
		if(ready == 1) begin
			valid_out <= delay_valid;
			ready <= 0;
		end
	end

endmodule