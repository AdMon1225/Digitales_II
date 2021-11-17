module probador(
    input [3:0] sum_30_dd, sum_30_ddSynth,
    input [3:0] idx_dd, idx_ddSynth,       
    output reg clk, reset,
    output reg [3:0] idx, data_A, data_B);

    initial clk <= 0;
    always #1 clk <= ~clk; 
    
    initial begin
        $dumpfile("verificacion.vcd");
        $dumpvars();

        reset <= 0;
        data_A  <= 0;
        data_B  <= 0;
        idx     <= 0;

        @(posedge clk);
        data_A  <= 0;
        data_B  <= 0;

        @(posedge clk);
        data_A  <= 0;
        data_B  <= 0;

        @(posedge clk);
        reset <= 1;
        data_A  <= 4'b0111;
        data_B  <= 4'b0101;
        idx     <= 4'b1111;

        @(posedge clk);
        data_A  <= 4'b0010;
        data_B  <= 4'b0001;
        idx     <= 4'b1010;

        @(posedge clk);
        data_A  <= 4'b0111;
        data_B  <= 4'b0101;
        idx     <= 4'b1111;

        @(posedge clk);
        data_A  <= 4'b0010;
        data_B  <= 4'b0001;
        idx     <= 4'b1010;

        @(posedge clk);
        data_A  <= 4'b0111;
        data_B  <= 4'b0101;
        idx     <= 4'b1111;

        @(posedge clk);
        data_A  <= 4'b0010;
        data_B  <= 4'b0001;
        idx     <= 4'b1010;

        @(posedge clk);
        data_A  <= 4'b0111;
        data_B  <= 4'b0101;
        idx     <= 4'b1111;

        @(posedge clk);
        data_A  <= 4'b0010;
        data_B  <= 4'b0001;
        idx     <= 4'b1010;

        @(posedge clk);
        data_A  <= 4'b0111;
        data_B  <= 4'b0101;
        idx     <= 4'b1111;
    
        @(posedge clk);
        data_A  <= 4'b0010;
        data_B  <= 4'b0001;
        idx     <= 4'b1010;

        @(posedge clk);
        data_A  <= 4'b0111;
        data_B  <= 4'b0101;
        idx     <= 4'b1111;

        @(posedge clk);
        data_A  <= 4'b0010;
        data_B  <= 4'b0001;
        idx     <= 4'b1010;

        @(posedge clk);
        data_A  <= 4'b0111;
        data_B  <= 4'b0101;
        idx     <= 4'b1111;

        @(posedge clk);
        data_A  <= 4'b0010;
        data_B  <= 4'b0001;
        idx     <= 4'b1010;

        @(posedge clk);
        data_A  <= 4'b0111;
        data_B  <= 4'b0101;
        idx     <= 4'b1111;

        @(posedge clk);
        data_A  <= 4'b0010;
        data_B  <= 4'b0001;
        idx     <= 4'b1010;

        @(posedge clk);
        data_A  <= 4'b0111;
        data_B  <= 4'b0101;
        idx     <= 4'b1111;

        @(posedge clk);
        data_A  <= 4'b0010;
        data_B  <= 4'b0001;
        idx     <= 4'b1010;

        @(posedge clk);
        data_A  <= 4'b0111;
        data_B  <= 4'b0101;
        idx     <= 4'b1111;

        @(posedge clk);
        data_A  <= 4'b0010;
        data_B  <= 4'b0001;
        idx     <= 4'b1010;

        $finish;
    end
endmodule