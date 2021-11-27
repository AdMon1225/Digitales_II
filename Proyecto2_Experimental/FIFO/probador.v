module probador(
    output reg [11:0] fifo_in,
	output reg [2:0] full_umbral, empty_umbral,
    output reg clk, reset, fifo_wr, fifo_rd, //fifo_wr es push y fifo_rd es pop
    input almost_full, almost_empty, full, empty,
    input almost_fullSynth, almost_emptySynth, fullSynth, emptySynth,
    input [11:0] fifo_out, fifo_outSynth); 

    initial clk <= 0;
    always #1 clk <= ~clk; 
    
    initial begin
        $dumpfile("verificacion.vcd");
        $dumpvars();

        fifo_in <= 0;
        full_umbral <= 7;
        empty_umbral <= 1;
        reset <= 0; 
        fifo_wr <= 0;
        fifo_rd <= 0;
        
        @(posedge clk);
        reset <= 1;
        fifo_wr <= 1;

        @(posedge clk);
        fifo_in <= 'h123;
        

        @(posedge clk);
        fifo_in <= 'hABC;
        
     	
	    @(posedge clk);
        fifo_in <= 'h456;
       

	    @(posedge clk);
        fifo_in <= 'hDEF;
        fifo_wr <= 0;

	    @(posedge clk);
        fifo_rd <= 1; 

	    @(posedge clk);
        

	    @(posedge clk);
        

        @(posedge clk);
        

        @(posedge clk);
        fifo_rd <= 0;

        @(posedge clk);

        @(posedge clk);

        @(posedge clk);
         $finish;    
    end
endmodule     