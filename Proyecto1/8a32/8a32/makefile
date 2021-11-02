all: mux_8_32

mux_8_32:
	yosys -s yosys_8_32.s
	sed -i "s/mux_8_32/sint_8a32_cmos/g" sint_8a32_cmos.v
	sed -i "s/data_out/data_out_estr/g" sint_8a32_cmos.v
	sed -i "s/valid_out/valid_out_estr/g" sint_8a32_cmos.v
	iverilog -T typ banco_8_32.v -o banco
	vvp banco
	rm banco
	gtkwave mux_8_32.vcd