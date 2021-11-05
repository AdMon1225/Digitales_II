module probador(
    output reg clk, enable, reset, error,
    input salida_gray, salida_graySynth);

    initial clk <= 0;
    always #1 clk <= ~clk; 
    
    initial begin
        $dumpfile("verificacion.vcd");
        $dumpvars();
        
        reset <= 0;
        enable <= 0;
        
        @(posedge clk);
        reset <= 0;

        @(posedge clk);
        reset <= 0;
        
        @(posedge clk);
        reset <= 1;

        @(posedge clk);
        enable <= 1;

        @(posedge clk);
        enable <= 1;

        @(posedge clk);
        enable <= 1;

        @(posedge clk);
        enable <= 1;

        @(posedge clk);
        enable <= 1;

        @(posedge clk);
        enable <= 1;

        @(posedge clk);
        enable <= 1;

        @(posedge clk);
        enable <= 1;

        @(posedge clk);
        enable <= 0;

        @(posedge clk);
        enable <= 0;

        @(posedge clk);
        enable <= 0;

        @(posedge clk);
        enable <= 1;
        reset <= 0;

        @(posedge clk);
        enable <= 1;

        @(posedge clk);
        enable <= 1;

        @(posedge clk);
        enable <= 1;
        reset <=1; 
        
        #150 $finish;    
    end

    always @(*) begin
        if (salida_graySynth != salida_gray) begin
            error = 1;
        end
        else begin
            error = 0; 
        end
    end
endmodule