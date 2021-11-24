module probador(
    output reg reset, clk,
    output reg [3:0] emptyFIFO,
    output reg [3:0] almost_fullFIFO, 
    input [3:0] pop, popSynth,
    input [3:0] push, pushSynth);

    initial clk <= 0;
    always #1 clk <= ~clk; 
    
    initial begin
        $dumpfile("verificacion.vcd");
        $dumpvars();

        reset <= 0;
        emptyFIFO <= 0;
        almost_fullFIFO <= 0;

        @(posedge clk);

        @(posedge clk);
        reset <= 1;
        emptyFIFO <= 'b1111;

        @(posedge clk);
        emptyFIFO <= 'b1111;

        @(posedge clk);
        emptyFIFO <= 'b1111;

        @(posedge clk);
        emptyFIFO <= 'b1111;

        @(posedge clk);
        emptyFIFO <= 'b0001;

        @(posedge clk);
        

        @(posedge clk);
        emptyFIFO <= 'b0011;

        @(posedge clk);

        @(posedge clk);
        
        @(posedge clk);

        @(posedge clk);

        @(posedge clk);

        @(posedge clk);

        @(posedge clk);

        @(posedge clk);

        @(posedge clk);

        @(posedge clk);
        almost_fullFIFO <= 'b1000;

        @(posedge clk);
        almost_fullFIFO <= 'b1100;

        @(posedge clk);
        almost_fullFIFO <= 'b1110;

        #10 $finish;
    end 
endmodule