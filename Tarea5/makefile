CC=iverilog
TARGET1=probadorVerificador.v
o1: o2 o3 o4 o5
	gtkwave verificacion.vcd
o2: 
	yosys -s estructural1.ys
	yosys -s estructural2.ys

o3:
	sed -i 's/mux_mem_conductual/muxGenerico/' estructural1.v
	sed -i 's/mux_mem_conductual/muxRetardos/' estructural2.v

o4:
	$(CC) $(TARGET1) -o verificacion 
	
o5: 
	vvp verificacion