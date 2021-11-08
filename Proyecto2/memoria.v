module single_port_ram
(
	input [7:0] data,
	input [5:0] addr,
	input we, clk,
	output [7:0] q
);

	// Declare the RAM variable
	reg [7:0] ram[63:0];
	
	// Variable to hold the registered read address
	reg [5:0] addr_reg;
	
	always @ (posedge clk) begin
	// Write
		if (we)
			ram[addr] <= data;
		else begin
			addr_reg <= addr;
		end
	end
		
	// Continuous assignment implies read returns NEW data.
	// This is the natural behavior of the TriMatrix memory
	// blocks in Single Port mode.  
	assign q = ram[addr_reg];

endmodule

// Cuando we = 1, queremos escribir en memoria y no se recibe ningun output. 
//Casi contrario, si we = 0, queremos leer de memoria y se recibe un valor en la salida q. 
