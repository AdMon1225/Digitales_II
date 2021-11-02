module probador #(
	parameter BUS_SIZE = 16,
	parameter WORD_SIZE = 4,
    parameter WORD_NUM = BUS_SIZE / WORD_SIZE) 
    (output reg clk,
    output reg reset,
	output reg [BUS_SIZE-1:0] data_in,
	input [BUS_SIZE-1:0] data_out,
    input [WORD_NUM-1:0] salida_control,
	input [BUS_SIZE-1:0] data_out_Synth,
    input [WORD_NUM-1:0] salida_control_Synth,
    input err,
    input next_err,
    input err_Synth,
    input next_err_Synth);

    initial clk <= 0;
    always #1 clk <= ~clk; 
    
    initial begin
        $dumpfile("verificacion.vcd");
        $dumpvars();
        
        reset <= 0;
        data_in <= 0;

        @(posedge clk);
        reset <= 0;

        @(posedge clk);
        reset <= 0;
        
        @(posedge clk);
        reset <= 1;
        data_in <= 'hF120;
        
        @(posedge clk);
        reset <= 1;
        data_in <= 'hF751;
        
        @(posedge clk);
        reset <= 1;
        data_in <= 'hFFA2;

        @(posedge clk);
        reset <= 1;
        data_in <= 'hA503;    

        @(posedge clk);
        reset <= 1;
        data_in <= 'hF9D0;   
    
        @(posedge clk);
        reset <= 1;
        data_in <= 'hF699;

        @(posedge clk);

        @(posedge clk);
        reset <=0;

        @(posedge clk);

        @(posedge clk);

        $finish;    
    end
endmodule