CC=iverilog
TARGET1=probadorlib.v
o1: o2 o3
	gtkwave pruebamux2x1dual.vcd
o2:
	$(CC) $(TARGET1) -o verificacion_lib
	
o3: 
	vvp verificacion_lib