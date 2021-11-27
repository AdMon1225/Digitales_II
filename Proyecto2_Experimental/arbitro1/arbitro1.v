module arbitro1(
    input reset, clk,
    input [3:0] emptyFIFO,
    input [3:0] almost_fullFIFO, 
    output reg [3:0] pop,
    output reg [3:0] push);
    
    reg [2:0] contadorP0, contadorP1, contadorP2, contadorP3;
    integer i;

    always @(*) begin
        pop = 0;

        if (reset == 0) begin
            pop = 0; 
        end
        
        else if (almost_fullFIFO != 0) begin
            pop = 0;
        end 

//Notese que pop[0] es el pop del FIFO del canal P0 (el que tiene peso 4), 
//pop[3] el del canal P1 con peso 3 y asi sucesivamente.  

        else begin
            if (emptyFIFO[0] == 0 && contadorP0 < 4) pop[0] = 1;
            else pop[0] = 0;

            if (emptyFIFO[1] == 0 && contadorP1 < 3 && pop[0] == 0) pop[1] = 1;
            else pop[1] = 0;

            if (emptyFIFO[2] == 0 && contadorP2 < 2 && pop[0] == 0 && pop[1] == 0) pop[2] = 1;
            else pop[2] = 0;

            if (emptyFIFO[3] == 0 && contadorP3 < 1 && pop[0] == 0 && pop[1] == 0 && pop[2] == 0) pop[3] = 1;
            else pop[3] = 0;
        end
    end 
    
    always @(posedge clk) begin
        if (reset == 0) begin
            contadorP0 <= 0;
            contadorP1 <= 0;
            contadorP2 <= 0;
            contadorP3 <= 0;
        end

        else if (almost_fullFIFO == 0) begin
            if (emptyFIFO[0] == 0 && contadorP0 < 4) contadorP0++; 

            else if (emptyFIFO[1] == 0 && contadorP1 < 3) contadorP1++; 

            else if (emptyFIFO[2] == 0 && contadorP2 < 2) contadorP2++; 

            else if (emptyFIFO[3] == 0 && contadorP3 < 1) contadorP3++; 

            else begin
                contadorP0 <= 0;
                contadorP1 <= 0;
                contadorP2 <= 0;
                contadorP3 <= 0;
            end
        end 
    end
    
    always @(*) begin
        push = 0;
        push = pop;
    end 
endmodule 