read_verilog log_32_8.v
#hierarchy -check -top counter

proc; opt; fsm; opt; memory; opt

techmap; opt

dfflibmap -liberty cmos_cells.lib

abc -liberty cmos_cells.lib

clean

#show -lib cmos_cells.v

write_verilog log_32_8_sint.v