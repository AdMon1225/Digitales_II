run:
	yosys -s sintesis.ys
	sed -i 's/arbitro2/arbitro2Synth/' arbitro2Synth.v
	iverilog testbench.v -o verificacion
	vvp verificacion
	gtkwave verificacion.vcd