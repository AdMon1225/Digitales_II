run:
	yosys -s sintesis_QoS.ys
	sed -i 's/QoS/QoS_sint/' QoS_sint.v
	sed -i 's/FSM/FSM_sint/' QoS_sint.v
	sed -i 's/arbitro1/arbitro1_sint/' QoS_sint.v
	sed -i 's/arbitro2/arbitro2_sint/' QoS_sint.v
	sed -i 's/control/control_sint/' QoS_sint.v
	sed -i 's/counter_cond/counter_sint/' QoS_sint.v
	sed -i 's/demuxC1/demuxC1_sint/' QoS_sint.v
	sed -i 's/demuxC2/demuxC2_sint/' QoS_sint.v
	sed -i 's/fifoMod/fifoMod_sint/' QoS_sint.v
	sed -i 's/memoria/memoria_sint/' QoS_sint.v
	sed -i 's/muxY/muxY_sint/' QoS_sint.v
	sed -i 's/valid/valid_sint/' QoS_sint.v
	sed -i 's/read/read_sint/' QoS_sint.v
	sed -i 's/write/write_sint/' QoS_sint.v
	sed -i 's/active_out/active_out_sint/' QoS_sint.v
	sed -i 's/idle_out/idle_out_sint/' QoS_sint.v
	sed -i 's/fifo_dataout0/fifo_dataout0_sint/' QoS_sint.v
	sed -i 's/fifo_dataout1/fifo_dataout1_sint/' QoS_sint.v
	sed -i 's/fifo_dataout2/fifo_dataout2_sint/' QoS_sint.v
	sed -i 's/fifo_dataout3/fifo_dataout3_sint/' QoS_sint.v
	iverilog testbench.v -o QOSsignals
	vvp QOSsignals
	gtkwave QOS.vcd
	rm QOSsignals