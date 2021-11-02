module probadorphy (
    output reg [31:0] data_in,
    output reg  valid_in, reset, clk_f, clk_2f, clk_4f, clk_32f,
    input [31:0] data_out,
    input valid_out);

    initial begin
        clk_32f <= 1;
        clk_4f <= 1;
        clk_2f <= 1;
        clk_f <= 1;
    end

    always begin
        #128 clk_f <= ~clk_f; /*f = 0.5 Hz*/
    end
    always begin
         #64 clk_2f <= ~clk_2f;  /*f = 1 Hz*/
    end
    always begin
         #32 clk_4f <= ~clk_4f; /*f = 2 Hz*/
    end
    always begin
        #4 clk_32f <= ~clk_32f;  /*f = 0.125 Hz*/
    end

    initial 
    begin 
        $dumpfile("ver.vcd"); /*En este archivo se guardan todos los valores de la simulación*/
        $dumpvars;

        data_in <= 0;
        valid_in <= 0;
        reset <= 0;

        @(posedge clk_2f)
        
        @(posedge clk_2f)
        reset <= 1;

        @(posedge clk_2f)

        @(posedge clk_2f)

        @(posedge clk_2f)
        
        @(posedge clk_2f)
        data_in <= 'hFFFFFFFF;
        valid_in <= 1;

        @(posedge clk_2f)
        data_in <= 'hEEEEEEEE;
	    
        @(posedge clk_2f)
        data_in <= 'hDDDDDDDD;

        @(posedge clk_2f)
        data_in <= 'hCCCCCCCC;

        @(posedge clk_2f)
        valid_in <= 0;

        @(posedge clk_2f)

        @(posedge clk_2f)
        data_in <= 3;
        valid_in <= 1;
        
        @(posedge clk_2f)
        data_in <= 4;

        @(posedge clk_2f)
        valid_in <= 0;
       
        @(posedge clk_2f)
        #1000 $finish;
    end
endmodule