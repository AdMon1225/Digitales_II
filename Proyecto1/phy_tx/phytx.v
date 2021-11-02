`include "Paralelo_Serial.v" 
`include "bytestriping.v" 
`include "log_32_8.v" 

module phytx(
   input [31:0] data_in, 
   input valid_in, reset, clk_f, clk_2f, clk_4f, clk_32f,
   output data_out0, 
   output data_out1);

wire [31:0] BS_out0, BS_out1; //salidas del byte striping
wire BSvalid_out0, BSvalid_out1;

wire [7:0] a328_out0; //salidas del 32 a 8 linea 0
wire a328valid_out0;

wire [7:0] a328_out1; //salidas del 32 a 8 linea 1
wire a328valid_out1;


bytestriping BS(
.data_in (data_in),
.clk_2f  (clk_2f),
.clk_f (clk_f), 
.valid_in (valid_in),
.reset (reset),
.lane_0 (BS_out0),
.lane_1 (BS_out1),
.valid_out0 (BSvalid_out0), 
.valid_out1 (BSvalid_out1)
);

log_32_8 a328bits0(
.clk_4f (clk_4f),
.data_in (BS_out0),
.valid (BSvalid_out0),
.reset (reset),
.data_out (a328_out0),
.valid_out (a328valid_out0)
);

log_32_8 a328bits1(
.clk_4f (clk_4f),
.data_in (BS_out1),
.valid (BSvalid_out1),
.reset (reset),
.data_out (a328_out1),
.valid_out (a328valid_out1)
);

Paralelo_Serial paraleloserial0(  
.data_in (a328_out0),
.clk_4f  (clk_4f),
.clk_32f (clk_32f), 
.valid_in (a328valid_out0),
.reset (reset),
.data_out (data_out0)
);

Paralelo_Serial paraleloserial1(  
.data_in (a328_out1),
.clk_4f  (clk_4f),
.clk_32f (clk_32f), 
.valid_in (a328valid_out1),
.reset (reset),
.data_out (data_out1)
);
endmodule
