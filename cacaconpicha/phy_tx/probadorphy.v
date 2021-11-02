module probadorphy (
    output reg [31:0] data_in,
    output reg  valid_in, reset, clk_f, clk_2f, clk_4f, clk_32f,
    input data_out0Cond, data_out1Cond, data_out0Synth, data_out1Synth
    );

    initial begin
        clk_32f <= 1;
        clk_4f <= 1;
        clk_2f <= 1;
        clk_f <= 1;
    end

    always begin
        #128 clk_f <= ~clk_f;
    end  
    always begin
        #64 clk_2f <= ~clk_2f;  
    end
    always begin
        #32 clk_4f <= ~clk_4f; 
    end
    always begin
        #4 clk_32f <= ~clk_32f;  
    end

    initial 
    begin 
        $dumpfile("verificacion.vcd"); /*En este archivo se guardan todos los valores de la simulación*/
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
        #30 $finish;
    end
endmodule
