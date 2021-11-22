run:
	yosys -s sintesis.ys
	sed -i 's/QoS/QoSSynth/' QoSSynth.v
	iverilog testbench.v -o verificacion
	vvp verificacion
	gtkwave verificacion.vcd