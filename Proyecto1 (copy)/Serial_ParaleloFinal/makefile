all: serial_paralelo

serial_paralelo:
	yosys -s ser_par_sint.ys
	sed -i "s/ser_par/ser_par_sint/g" ser_par_sint.v
	iverilog -o serpar banco_ser_par.v 
	vvp serpar
	gtkwave test_ser_par.vcd
	