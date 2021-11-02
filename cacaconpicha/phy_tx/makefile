o1: o2 o3 o4 o5
	gtkwave verificacion.vcd
o2: 
	yosys -s sintesis.ys
o3:
	sed -i 's/phytx/phytxSynth/' phytxSynth.v
	sed -i 's/bytestriping/bytestripingSynth/' phytxSynth.v
	sed -i 's/log_32_8/log_32_8Synth/' phytxSynth.v
	sed -i 's/Paralelo_Serial/Paralelo_SerialSynth/' phytxSynth.v
o4:
	iverilog TBphy.v -o verificacion
o5:
	vvp verificacion