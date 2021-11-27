module probador(
    output reg [11:0] data,
    output reg [2:0] wr_ptr, rd_ptr,
    output reg write, read, clk, reset,
    input [11:0] q, qSynth); 

    initial clk <= 0;
    always #1 clk <= ~clk; 
    
    initial begin
        $dumpfile("verificacion.vcd");
        $dumpvars();

        data <= 0;
        wr_ptr <= 0;
        rd_ptr <= 0;
        write <= 0;
        read <= 0;
        reset <= 0; 
        
        @(posedge clk);
        reset <= 1;
        write <= 1;

        @(posedge clk);
        data <= 'h123;
        wr_ptr <= 1;

        @(posedge clk);
        data <= 'hABC;
        wr_ptr <= 2;
     	
	    @(posedge clk);
        data <= 'h456;
        wr_ptr <= 3;

	    @(posedge clk);
        data <= 'hDEF;
        wr_ptr <= 4;
        write <= 0;

	    @(posedge clk);
        read <= 1; 

	    @(posedge clk);
        rd_ptr <= 1;

	    @(posedge clk);
        rd_ptr <= 2;

        @(posedge clk);
        rd_ptr <= 3;

        @(posedge clk);

        $finish;    
    end
endmodule     
