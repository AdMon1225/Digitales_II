ALL: BUILD RUN CLEAN

BUILD:

	 sed -i 's/un_byte_striping/clock/g' sintesis.ys
	 yosys sintesis.ys
	 sed -i 's/clock/clockS/g' clockS.v

	 sed -i 's/clock/un_byte_striping/g' sintesis.ys

	 yosys sintesis.ys
	 sed -i 's/un_byte_striping/un_byte_stripingS/g' un_byte_stripingS.v


	 iverilog -o test.o tbu.v
	 vvp test.o

RUN:
	 gtkwave tb.vcd

CLEAN:

