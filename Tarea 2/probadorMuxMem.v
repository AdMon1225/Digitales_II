`include "muxmemoriaconductual.v"
`include "testbenchMuxMem.v"

module probadorMuxMem();

wire clk, reset_L, selector;
wire [1:0] data_in0, data_in1, data_out;

mux_mem_conductual mux1 (.clk(clk), .reset_L(reset_L), .selector(selector), .data_in0(data_in0), .data_in1(data_in1), .data_out(data_out));
testbenchMuxMem pruebamux (.clk(clk), .reset_L(reset_L), .selector(selector), .data_in0(data_in0), .data_in1(data_in1), .data_out(data_out));

endmodule 