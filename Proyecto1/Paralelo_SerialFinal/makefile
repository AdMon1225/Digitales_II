o1: o2 o3 o4 o5
	gtkwave verificacion.vcd
o2: 
	yosys -s Paralelo_SerialSynth.ys
o3:
	sed -i 's/Paralelo_Serial/Paralelo_SerialSynth/' Paralelo_SerialSynth.v
o4:
	iverilog testbench.v -o verificacion
o5:
	vvp verificacion