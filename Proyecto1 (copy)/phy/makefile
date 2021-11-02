all: simu 

simu:

	yosys -s sint.ys

	sed -i "s/phy/phy_sint/g" phy_sint.v
	sed -i "s/data_out/data_out_sint/g" phy_sint.v
	sed -i "s/valid_out/valid_out_sint/g" phy_sint.v
	sed -i "s/log_32_8/log_32_8_sint/g" phy_sint.v
	sed -i "s/mux_8_32/mux_8_32_sint/g" phy_sint.v
	sed -i "s/bytestriping/bytestriping_sint/g" phy_sint.v
	sed -i "s/un_byte_striping/un_byte_striping_sint/g" phy_sint.v
	sed -i "s/Paralelo_Serial/Paralelo_Serial_sint/g" phy_sint.v
	sed -i "s/phy_rx/phy_rx_sint/g" phy_sint.v
	sed -i "s/phytx/phytx_sint/g" phy_sint.v
	sed -i "s/ser_par/ser_par_sint/g" phy_sint.v

	iverilog -o prueba TBphy.v
	vvp prueba
	gtkwave ver.vcd