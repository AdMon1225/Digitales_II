module clock(
    input clock32,reset_L,
    output reg clock4,clock2,clock1
);

reg counter0,counter1,counter2;
always @(posedge clock32 or negedge reset_L) begin 
    if(reset_L==0) begin
        counter0<=0;
        counter1<=0;
        counter2<=0;
        clock4<=0;
        clock2<=0;
        clock1<=0;
    end else begin
        if(counter0==0) begin
            if(counter1==0) begin
                if(clock4==0) begin
                    if(counter2==0) begin
                        clock1<=~clock1;
                    end
                    counter2<=~counter2;
                    clock2<=~clock2;
                end
                clock4<=~clock4;
            end
            counter1<=~counter1;
        end
        counter0<=~counter0;
    end
end
endmodule
