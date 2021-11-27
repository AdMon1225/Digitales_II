module arbitro2(
    input reset, clk, active,
    input [11:0] demuxin,
    input emptyFIFO,
    input [3:0] almost_fullFIFO, 
    output reg pop,
    output reg [3:0] push);

    always @(*) begin
        pop = 0;
        push = 0;

        if (reset == 0 || active == 0) begin
            pop = 0; 
            push = 0;
        end
        
        else if (almost_fullFIFO != 0) begin
            pop = 0;
            push = 0;
        end 

//Si class = 00, el push del canal P0 es 1, caso contrario es 0. 
//class = 01, push canal P1 es 1, etc...
        else begin
            if (emptyFIFO == 1) begin
                pop = 0; 
                if (demuxin[11:10] == 'b00 && demuxin != 0) push[0] = 1;
                else push[0] = 0;

                if (demuxin[11:10] == 'b01 && demuxin != 0) push[1] = 1;
                else push[1] = 0;

                if (demuxin[11:10] == 'b10 && demuxin != 0) push[2] = 1;
                else push[2] = 0;

                if (demuxin[11:10] == 'b11 && demuxin != 0) push[3] = 1;
                else push[3] = 0;
            end
            else begin
                pop = 1;
                if (demuxin[11:10] == 'b00 && demuxin != 0) push[0] = 1;
                else push[0] = 0;

                if (demuxin[11:10] == 'b01 && demuxin != 0) push[1] = 1;
                else push[1] = 0;

                if (demuxin[11:10] == 'b10 && demuxin != 0) push[2] = 1;
                else push[2] = 0;

                if (demuxin[11:10] == 'b11 && demuxin != 0) push[3] = 1;
                else push[3] = 0; 
            end 
        end
    end
endmodule 