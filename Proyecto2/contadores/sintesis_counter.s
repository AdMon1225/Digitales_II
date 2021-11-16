read_verilog counter_cond.v
hierarchy -check -top counter_cond
proc; opt; fsm; opt; memory; opt;
techmap; opt
dfflibmap -liberty cmos_cells.lib
abc -liberty cmos_cells.lib
write_verilog counter_sint.v
