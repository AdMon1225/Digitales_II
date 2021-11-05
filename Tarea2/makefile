CC=iverilog
TARGET1=probadorMuxMem.v
o1: o2 o3
	gtkwave pruebamuxmem.vcd
o2:
	$(CC) $(TARGET1) -o verificacionmux
	
o3: 
	vvp verificacionmux
