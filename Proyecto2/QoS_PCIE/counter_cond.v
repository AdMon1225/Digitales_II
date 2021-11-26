module counter_cond

    (
    // condiciones
    input clk,
    input req,
    input IDLE,
    input reset_L,
    input [2:0] idx,


    //  pops de los fifos es lo que entra en los counter
    input fifo0_pop,
    input fifo1_pop,
    input fifo2_pop,
    input fifo3_pop,
    input fifo4_pop,


    // se regresa valid y un data out
    output reg valid,
    output reg [7:0] data_out
    );



    // creamos los counters
    reg [4:0] counter0;
    reg [4:0] counter1;
    reg [4:0] counter2;
    reg [4:0] counter3;
    reg [4:0] counter4;



    always @(posedge clk)begin

        // si reset == 0, los counter seran 0
        if(reset_L == 0)begin
            counter0 <= 5'b00000;
            counter1 <= 5'b00000;
            counter2 <= 5'b00000;
            counter3 <= 5'b00000;
            counter4 <= 5'b00000;
        end  


        // si reset == 1, los counter aumentan
        else if (reset_L == 1)begin 

            if(fifo0_pop)begin
                counter0 <= counter0 + 1;
	    
            end

            if(fifo1_pop)begin
                counter1 <= counter1 + 1;
	   
            end

            if(fifo2_pop)begin
                counter2 <= counter2 + 1;
	    
            end

            if(fifo3_pop)begin
                counter3 <= counter3 + 1;
           
            end

            if(fifo4_pop)begin
                counter4 <= counter4 + 1;

            end


        end   


    end



    always @(*) begin

        valid= 0;
	    data_out= 5'b00000;
	    
        // se pasan los counter a la salida
        if (IDLE && req)begin
            valid = 1;
            case (idx)

                3'b000: 
                begin
                    data_out = counter0;
                end

                3'b001: 
                begin
                    data_out = counter1;
                end

                3'b010: 
                begin
                    data_out = counter2;
                end

                3'b011: 
                begin
                    data_out = counter3;
                end

                3'b100: 
                begin
                    data_out = counter4;
                end
            endcase
        end

        else begin

            valid = 0;
            data_out = 0;

        end



    end


endmodule
