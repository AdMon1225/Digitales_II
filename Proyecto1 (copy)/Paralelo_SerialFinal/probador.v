module probador(
    output reg [7:0] data_in,
    output reg clk_4f, clk_32f, valid_in, reset,
    input data_outCond, data_outSynth);

    //Inicializacion de relojes
    initial begin
        clk_4f <= 0;
        clk_32f <= 1;
    end
    always begin
        #32 clk_4f <= ~clk_4f;
    end
    always begin
        #4 clk_32f <= ~clk_32f;
    end
    
    initial begin
        $dumpfile("verificacion.vcd"); /*En este archivo se guardan todos los valores de la simulación*/
        $dumpvars;

        data_in <= 0;
        valid_in <= 0;
        reset <= 0;

        @(posedge clk_4f)
        reset <= 1;

        @(posedge clk_4f)
        data_in <= 'h9D;
    
        @(posedge clk_4f)
        data_in <= 'hFF;
        valid_in <= 1;

        @(posedge clk_4f)
        data_in <= 'hEE;
        
        @(posedge clk_4f)
        data_in <= 'hAF;
        valid_in <= 0;

        #100 $finish;
    end
endmodule
