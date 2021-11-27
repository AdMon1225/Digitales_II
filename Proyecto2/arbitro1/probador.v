module probador(
    output reg reset, clk, active,
    output reg [3:0] emptyFIFO,
    output reg [3:0] almost_fullFIFO, 
    output reg [11:0] demuxin,
    input [3:0] pop, popSynth,
    input [3:0] push, pushSynth);

    initial clk <= 0;
    always #1 clk <= ~clk; 
    
    initial begin
        $dumpfile("verificacion.vcd");
        $dumpvars();

        reset <= 0;
        active <= 0;
        emptyFIFO <= 0;
        almost_fullFIFO <= 0;
        demuxin <= 0; 

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
        active <= 1; 

        @(posedge clk);
        emptyFIFO <= 'b1111;

        @(posedge clk);
        emptyFIFO <= 'b1111;

        @(posedge clk);
        emptyFIFO <= 'b1111;
        demuxin <= 'hABC;

        @(posedge clk);
        emptyFIFO <= 0;

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