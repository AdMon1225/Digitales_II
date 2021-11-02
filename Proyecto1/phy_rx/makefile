all: run simu clean

run:
	yosys -s rxsint.ys
	sed -i "s/phy_rx/phy_rx_sint/g" phy_rx_sint.v
	sed -i "s/data_output/data_output_sint/g" phy_rx_sint.v
	sed -i "s/valid_output/valid_output_sint/g" phy_rx_sint.v
	sed -i "s/ser_par/ser_par_sint/g" phy_rx_sint.v
	sed -i "s/mux_8_32/mux_8_32_sint/g" phy_rx_sint.v
	sed -i "s/un_byte_striping/un_byte_striping_sint/g" phy_rx_sint.v

simu:

	iverilog -o pruebasRX BancoRX.v
	vvp pruebasRX
	gtkwave verificacionRX.vcd

clean:

	rm TB