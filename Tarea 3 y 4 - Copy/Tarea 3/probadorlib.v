`timescale 1ns/100ps 
`include "libreria.v"
`include "tblib.v"

module probadorlib();

wire selector;
wire [1:0] d0, d1, dout;

mux2x1dual mux (.d0(d0), .d1(d1), .selector(selector), .dout(dout));
tbmux2x1dual tb (.d0(d0), .d1(d1), .selector(selector), .dout(dout));

endmodule