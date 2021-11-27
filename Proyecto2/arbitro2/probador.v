module probador(
    output reg reset, clk, active,
    output reg [11:0] demuxin,
    output reg emptyFIFO,
    output reg [3:0] almost_fullFIFO, 
    input pop, popSynth,
    input [3:0] push, pushSynth);

    initial clk <= 0;
    always #1 clk <= ~clk;
    
    initial begin
        $dumpfile("verificacion.vcd");
        $dumpvars();

        reset <= 0;
        active <= 0;
        demuxin <= 0;
        emptyFIFO <= 0;
        almost_fullFIFO <= 0;

        @(posedge clk);

        @(posedge clk);
        reset <= 1;
        emptyFIFO <= 1;

        @(posedge clk);

        @(posedge clk);
        active <= 1;

        @(posedge clk);

        @(posedge clk);
        demuxin <= 'h0AB;

        @(posedge clk);
        demuxin <= 'h4AB;

        @(posedge clk);
        demuxin <= 'h8AB;

        @(posedge clk);
        demuxin <= 'hFAB;

        @(posedge clk);
        demuxin <= 'h0DE;

        @(posedge clk);
        demuxin <= 'h4DE;

        @(posedge clk);
        demuxin <= 'h8DE;

        @(posedge clk);
        demuxin <= 'hFDE;

        @(posedge clk);
        emptyFIFO <= 0;

        @(posedge clk);
        demuxin <= 'h074;

        @(posedge clk);
        demuxin <= 'h474;

        @(posedge clk);
        demuxin <= 'h974;

        @(posedge clk);
        demuxin <= 'hE43;

        @(posedge clk);
        almost_fullFIFO <= 'b1000;

        @(posedge clk);
        almost_fullFIFO <= 'b1100;

        @(posedge clk);
        almost_fullFIFO <= 'b1110;

        #5 $finish;
    end 
endmodule