module memoria(
	input [11:0] data,
	input [2:0] wr_ptr, rd_ptr,
	input write, read, clk, reset,
	output reg [11:0] q);

	// Declare the RAM variable
	reg [11:0] mem [7:0];
    integer i;
	
	always @ (posedge clk) begin
	// Write
        if (reset == 0) begin 
            for(i = 0; i < 8; i = i + 1) begin
                mem[i] <= 0;
            end 
        end
		else if (write) begin
            mem[wr_ptr] <= data;
        end
	end	

    always @(*) begin
        if (reset == 0) begin
            q = 0;
        end
        else begin
            if (read) begin
                q = mem[rd_ptr];
            end 
            else begin
                q = 0;
            end
        end
    end
endmodule

// Cuando write = 1, queremos escribir en memoria y no se recibe ningun output. 
//Caso contrario, si read = 0, queremos leer de memoria y se recibe un valor en la salida q. 
//Notese que se puede escribir y leer al mismo tiempo. 
