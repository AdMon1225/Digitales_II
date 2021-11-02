read_verilog mux_8_32.v

#hierarchy -check -top mux_8_32

proc; opt; fsm; opt; memory; opt

techmap; opt

dfflibmap -liberty ../lib/cmos_cells.lib

abc -liberty ../lib/cmos_cells.lib

clean

#show -lib cmos_cells.v

write_verilog sint_8a32_cmos.v