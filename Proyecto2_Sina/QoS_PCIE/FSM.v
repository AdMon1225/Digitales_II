module FSM(
    input clk,
    input init,
    input reset,
	input empties0,
    input empties1,
    input empties2,
    input empties3,
    input empties4,
    input empties5,
    input empties6,
    input empties7,
    input empties8,
    input empties9,
    input [3:0] umbral_interno_L,
    input [3:0] umbral_interno_H,
    output reg IDLE_OUT,
    output reg ACTIVE_OUT,
    output reg [3:0] umbral_out_L,
    output reg [3:0] umbral_out_H);

parameter RESET = 0;
parameter INIT = 1;
parameter IDLE = 2;
parameter ACTIVE = 3;

reg [9:0] empty;
reg [1:0] state;
reg [1:0] next_state;
reg [3:0] umbral0 = 0;
reg [3:0] umbral1 = 0;


always @(posedge clk) begin
   
    if(!reset) begin
        state <= RESET;
    end
   
    else begin 
        if (init) begin
        state <= INIT;
        end

        else begin
            state <= next_state;
        end
    end

    umbral0 = umbral_interno_L;
    umbral1 = umbral_interno_H;

end


always @(*) begin
    empty[0] = empties0;
    empty[1] = empties1;
    empty[2] = empties2;
    empty[3] = empties3;
    empty[4] = empties4;
    empty[5] = empties5;
    empty[6] = empties6;
    empty[7] = empties7;
    empty[8] = empties8;
    empty[9] = empties9;

    case (state)

        RESET: begin
            IDLE_OUT = 0;
            ACTIVE_OUT = 0;
            umbral_out_L = 0;
            umbral_out_H = 0;
            next_state = INIT;
        end


        INIT: begin
            IDLE_OUT = 0;
            ACTIVE_OUT = 0;
            umbral_out_L = umbral_interno_L;
            umbral_out_H = umbral_interno_H;
            
            if(init) begin
                next_state = INIT;
            end
            
            else begin
                next_state = IDLE;
            end
        end


        IDLE: begin
            IDLE_OUT = 1;
            ACTIVE_OUT = 0;
            umbral_out_L = umbral0;
            umbral_out_H = umbral1;
           
           if(empty == 'b1111111111) begin
                next_state = IDLE;
            end

            else begin
                next_state = ACTIVE;
            end
        end


        ACTIVE: begin
    
            IDLE_OUT = 0;
            ACTIVE_OUT = 1;
            umbral_out_L = umbral0;
            umbral_out_H = umbral1;
         

            if(empty == 'b1111111111) begin
                next_state = IDLE;
            end

            else begin
                next_state = ACTIVE;
            end
        end
        

        default: begin
            next_state = INIT;
        end
    endcase
end
endmodule