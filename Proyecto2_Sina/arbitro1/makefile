run:
	yosys -s sintesis.ys
	sed -i 's/arbitro1/arbitro1Synth/' arbitro1Synth.v
	iverilog testbench.v -o verificacion
	vvp verificacion
	gtkwave verificacion.vcd