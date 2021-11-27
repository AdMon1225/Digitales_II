module probador(
    output reg reset, clk,
    output reg [11:0] muxout,
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
        emptyFIFO <= 0;
        almost_fullFIFO <= 0;
        muxout <= 'h0;

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
        emptyFIFO <= 'b1111;

        @(posedge clk);
        emptyFIFO <= 'b1111;

        @(posedge clk);
        emptyFIFO <= 'b1111;

        @(posedge clk);
        emptyFIFO <= 0;
        muxout <= 'h012;

        @(posedge clk);
        muxout <= 'h456;
        
        @(posedge clk);
        muxout <= 'h8D1;

        @(posedge clk);
        muxout <= 'hCD9;

        @(posedge clk);
        muxout <= 'h012;

        @(posedge clk);
        muxout <= 'h456;

        @(posedge clk);
        muxout <= 'h8D1;

        @(posedge clk);
        muxout <= 'hCD9;

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