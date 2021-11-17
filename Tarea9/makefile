run:
	yosys -s sintesis.ys
	sed -i "s/sumador/sumadorSynth/g" sumadorSynth.v
	iverilog -o verificacion testbench.v
	vvp verificacion
	gtkwave verificacion.vcd