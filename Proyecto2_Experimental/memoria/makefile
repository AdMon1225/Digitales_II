run:
	yosys -s sintesis.ys
	sed -i 's/memoria/memoriaSynth/' memoriaSynth.v
	iverilog testbench.v -o verificacion
	vvp verificacion
	gtkwave verificacion.vcd
