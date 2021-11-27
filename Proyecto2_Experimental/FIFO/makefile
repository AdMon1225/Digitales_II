run:
	yosys -s sintesis.ys
	sed -i 's/fifoMod/fifoModSynth/' fifoModSynth.v
	sed -i 's/memoria/memoriaSynth/' fifoModSynth.v
	sed -i 's/write/writeSynth/' fifoModSynth.v
	sed -i 's/read/readSynth/' fifoModSynth.v
	sed -i 's/control/controlSynth/' fifoModSynth.v
	iverilog testbench.v -o verificacion
	vvp verificacion
	gtkwave verificacion.vcd