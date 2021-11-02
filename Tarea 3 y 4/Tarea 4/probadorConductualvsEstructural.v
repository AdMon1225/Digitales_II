`timescale 1ns/100ps
`include "libreria.v"
`include "tbConductualvsEstructural.v"

module probadorMuxes();

wire clk, reset_L, selector;
wire [1:0] data_in0, data_in1, data_outCond, data_outEstr;

mux_mem_conductual muxCond (.clk(clk), .reset_L(reset_L), .selector(selector), .data_in0(data_in0), .data_in1(data_in1), .data_out(data_outCond));
mux_mem_estructural muxEstr (.clk(clk), .reset_L(reset_L), .selector(selector), .data_in0(data_in0), .data_in1(data_in1), .data_out(data_outEstr));
tbCvsE pruebamux (.clk(clk), .reset_L(reset_L), .selector(selector), .data_in0(data_in0), .data_in1(data_in1), .data_outCond(data_outCond), .data_outEstr(data_outEstr));

endmodule 