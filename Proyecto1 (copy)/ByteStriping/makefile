o1: o2 o3 o4 o5
	gtkwave verificacion.vcd
o2:
	yosys -s bytestripingSynth.ys
o3:
	sed -i 's/bytestriping/bytestripingSynth/' bytestripingSynth.v
o4: 
	iverilog testbenchBS.v -o verificacion
o5: 
	vvp verificacion