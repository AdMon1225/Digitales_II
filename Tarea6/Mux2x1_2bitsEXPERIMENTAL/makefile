CC=iverilog
TARGET1=probadorMuxMem.v
o1: o2 o3 o4 o5
	gtkwave verificacion.vcd
o2: 
	yosys -s mux2x1Synth.ys

o3:
	sed -i 's/muxmemoriaconductual/mux2x1Synth/' mux2x1Synth.v

o4:
	$(CC) $(TARGET1) -o verificacion 
	
o5: 
	vvp verificacion