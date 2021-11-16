module arbitro1(
    input reset, clk,
    input [3:0] emptyFIFO,
    input [3:0] almost_fullFIFO, 
    output reg [3:0] pop,
    output reg [3:0] push);
    
    reg [2:0] contadorpeso0, contadorpeso1, contadorpeso2, contadorpeso3;

    always @(*) begin
        pop = 0;

        if (reset == 0) begin
            pop = 0; 
        end
        
        else if (almost_fullFIFO != 0 || emptyFIFO != 0) begin
            pop = 0;
        end 

//Notese que pop[0] es el pop del FIFO del canal P0 (el que tiene peso 4), 
//pop[3] el del canal P1 con peso 3 y asi sucesivamente.  
        else begin
            if (contadorpeso0 != 4) pop[0] = 1;
            else pop[0] = 0;

            if (contadorpeso1 != 3 && contadorpeso0 == 4) pop[1] = 1;
            else pop[1] = 0;

            if (contadorpeso2 != 2 && contadorpeso1 == 3) pop[2] = 1;
            else pop[2] = 0;

            if (contadorpeso3 != 1 && contadorpeso2 == 2) pop[3] = 1;
            else pop[3] = 0;
        end
    end 
    
    always @(posedge clk) begin
        if (reset == 0) begin
            contadorpeso0 <= 0;
            contadorpeso1 <= 0;
            contadorpeso2 <= 0;
            contadorpeso3 <= 0;
        end

        else if (contadorpeso3 != 0) begin
            contadorpeso0 <= 0;
            contadorpeso1 <= 0;
            contadorpeso2 <= 0;
            contadorpeso3 <= 0;
        end

        else if (almost_fullFIFO == 0 && emptyFIFO == 0) begin
            if (contadorpeso0 < 4) contadorpeso0 <= contadorpeso0 + 1;  
            
            else if (contadorpeso1 < 3) contadorpeso1 <= contadorpeso1 + 1; 
                
            else if (contadorpeso2 < 2) contadorpeso2 <= contadorpeso2 + 1; 
                
            else if (contadorpeso3 < 1) contadorpeso3 <= contadorpeso3 + 1; 
        end 
    end 

    always @(*) begin
        push = 0;
        push = pop;
    end 
endmodule 