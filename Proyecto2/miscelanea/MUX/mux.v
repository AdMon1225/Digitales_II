module mux
    output reg [11:0] mux_out,
    input [11:0] fifo_out_0,
    input [11:0] fifo_out_1,
    input [11:0] fifo_out_2,
    input [11:0] fifo_out_3,
    input [3:0] pop;

    // dependiendo del pop recibido pasa fifo a la salida
    always @(*)begin
            mux_out = 0;;

            if (pop[0] == 1) 
                mux_out = fifo_out_0[11:0];

            else if (pop[1] == 1)
                mux_out = fifo_out_1[11:0];

            else if (pop[2] == 1)
                mux_out = fifo_out_2[11:0];

            else if (pop[3] == 1)
                mux_out = fifo_out_3[11:0];

            
        end

endmodule