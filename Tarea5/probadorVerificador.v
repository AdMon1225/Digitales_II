`timescale 1ns/100ps
`include "muxmemoriaconductual.v"
`include "testbenchVerificador.v"
`include "cmos_cellsRetardos.v"
`include "estructural1.v"
`include "estructural2.v"

module probadorVerificador();

wire clk, reset_L, selector;
wire [1:0] data_in0, data_in1, data_outCond, data_outGenerico, data_outRetardos;

mux_mem_conductual muxCond (.clk(clk), .reset_L(reset_L), .selector(selector), .data_in0(data_in0), .data_in1(data_in1), .data_out(data_outCond));
muxGenerico muxGen (.clk(clk), .reset_L(reset_L), .selector(selector), .data_in0(data_in0), .data_in1(data_in1), .data_out(data_outGenerico));
muxRetardos muxRet (.clk(clk), .reset_L(reset_L), .selector(selector), .data_in0(data_in0), .data_in1(data_in1), .data_out(data_outRetardos));
testbenchVerificador pruebaModelos (.clk(clk), .reset_L(reset_L), .selector(selector), .data_in0(data_in0), .data_in1(data_in1), .data_outCond(data_outCond), .data_outGenerico(data_outGenerico), .data_outRetardos(data_outRetardos));
endmodule
