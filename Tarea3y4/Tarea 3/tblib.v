
module tbmux2x1dual(
    output reg [1:0] d0,
    output reg [1:0] d1,
    output reg selector,
    input [1:0] dout);

    reg clk;

    initial clk <= 0;
    always #10 clk <= ~clk;

    initial 
    begin
        $dumpfile("pruebamux2x1dual.vcd");
        $dumpvars;

        selector = 0;
        d0 = 0; d1 = 0;
        
        @(posedge clk);
        d0 <= 2; d1 <= 1;

        @(posedge clk);
        selector <= 1;

        @(posedge clk);
        selector <= 0;

        #20 $finish;
    end
endmodule