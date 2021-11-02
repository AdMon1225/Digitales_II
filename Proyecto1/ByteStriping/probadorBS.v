module probadorBS (
    output reg [31:0] data_in,
    output reg clk_2f, clk_f, valid_in, reset,
    input [31:0] lane_0Cond, lane_1Cond, lane_0Synth, lane_1Synth,
    input valid_out0Cond, valid_out1Cond, valid_out0Synth, valid_out1Synth);

    initial begin
        clk_2f <= 0;
        clk_f <= 0;
    end

    always begin
        #1 clk_2f <= ~clk_2f; /*f = 0.5 Hz*/
    end

    always begin
        #2 clk_f <= ~clk_f;  /*f = 0.25 Hz*/
    end

    initial 
    begin 
        $dumpfile("verificacion.vcd"); /*En este archivo se guardan todos los valores de la simulación*/
        $dumpvars;

        data_in <= 0;
        valid_in <= 0;
        reset <= 0;

        @(posedge clk_2f)
        data_in <= 'hFFFFFFFF;
        valid_in <= 1;
        reset <= 1;

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

        @(posedge clk_2f)
        data_in <= 'hAAAAAAAA;
        valid_in <= 1;

        @(posedge clk_2f)
        data_in <= 'h99999999;

        @(posedge clk_2f)
        valid_in <= 0;

        #5 $finish;
    end
endmodule
     