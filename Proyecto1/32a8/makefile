32_A_8:
	yosys -s 32_8.s
	sed -i "s/log_32_8/log_32_8_sint/g" log_32_8_sint.v
	sed -i "s/data_out/data_out_sint/g" log_32_8_sint.v
	sed -i "s/valid_out/valid_out_sint/g" log_32_8_sint.v
	iverilog -T typ testbench_32_8.v -o outs
	vvp outs
	gtkwave log328.vcd