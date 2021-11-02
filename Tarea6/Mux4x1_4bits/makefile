CC=iverilog
TARGET1=probadormux.v
o1: o2 o3 o4 o5
	gtkwave verificacion.vcd
o2: 
	yosys -s mux4x1_4bitsSynth.ys

o3:
	sed -i 's/mux2x1/mux2x1Synth/' mux4x14bSynth.v
	sed -i 's/mux2x14b/mux2x14bSynth/' mux4x14bSynth.v
	sed -i 's/mux4x14b/mux4x14bSynth/' mux4x14bSynth.v

o4:
	$(CC) $(TARGET1) -o verificacion 
	
o5: 
	vvp verificacion