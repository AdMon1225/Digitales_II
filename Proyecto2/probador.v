module probador(
    output [7:0] data,
    output [5:0] addr,
    output we, clk,
    input [7:0] q); 

    initial clk <= 0;
    always #1 clk <= ~clk; 
    
    initial begin
        $dumpfile("verificacion.vcd");
        $dumpvars();

        addr <= 0;
        we <= 0;
        data <= 0; 

endmodule     
