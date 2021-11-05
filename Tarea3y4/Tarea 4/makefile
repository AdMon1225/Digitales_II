CC=iverilog
TARGET1=probadorConductualvsEstructural.v
o1: o2 o3
	gtkwave pruebafinal.vcd
o2:
	$(CC) $(TARGET1) -o verificacion 
	
o3: 
	vvp verificacion