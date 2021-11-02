o1: o2 o3 o4 o5
	gtkwave verificacion.vcd
o2: 
	yosys -s muxSynth.ys
	yosys -s FSMSynth.ys

o3:
	sed -i 's/mux_param/mux_param_Synth/' mux_param_Synth.v
	sed -i 's/FSM/FSM_Synth/' FSM_Synth.v

o4:
	iverilog testbench.v -o verificacion 
	
o5: 
	vvp verificacion