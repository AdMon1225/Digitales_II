module word #(
    //Definicion de parametros
	parameter BUS_SIZE = 16,
	parameter WORD_SIZE = 4,
    parameter WORD_NUM = BUS_SIZE / WORD_SIZE) 
    (
	input      clk,
	input      reset,
	input      [WORD_SIZE-1:0] data_in,
	output reg [WORD_SIZE-1:0] data_out,
    output reg salida_control);

    always @ (posedge clk) begin
      	if (reset == 0) begin
            data_out <= 0;
            salida_control <= 0;
        end 
        else if (reset == 1) begin
            data_out <= data_in;
            salida_control <= data_in[3] | data_in[2] | data_in[1] | data_in[0];
        end
    end
endmodule

module mux_param #(
    //Definicion de parametros
	parameter BUS_SIZE = 16,
	parameter WORD_SIZE = 4,
    parameter WORD_NUM = BUS_SIZE / WORD_SIZE) 
    (
    //Definicion de entradas    
    input clk,
	input reset,
	input  [BUS_SIZE-1:0] data_in,
	output [BUS_SIZE-1:0] data_out,
    output [WORD_NUM-1:0] salida_control
    );
    genvar i;
    generate
	    for (i = 0; i < WORD_NUM; i = i + 1) begin : MEM
            word #(
                .BUS_SIZE(BUS_SIZE),
                .WORD_SIZE(WORD_SIZE)
            )
            word1 (
                .clk(clk),
                .reset(reset),
                .data_in(data_in[((WORD_SIZE*i)+(WORD_SIZE-1)):(WORD_SIZE*i)]),
                .data_out(data_out[(BUS_SIZE-1-i*WORD_SIZE):(WORD_NUM-i-1)*(WORD_SIZE)]),
                .salida_control(salida_control[(WORD_NUM-i-1):(WORD_NUM-i-1)])
            );
        end
    endgenerate
endmodule