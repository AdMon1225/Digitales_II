count:
	yosys -s sintesis_counter.s
	sed -i 's/counter_cond/counter_sint/' counter_sint.v
	sed -i 's/data_out/data_out_sint/' counter_sint.v
	sed -i 's/valid/valid_sint/' counter_sint.v
	iverilog testbench_counter.v -o OUT
	vvp OUT
	gtkwave COUNTERS.vcd
	rm OUT COUNTERS.vcd

