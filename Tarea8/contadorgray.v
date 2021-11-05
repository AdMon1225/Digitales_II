module contadorgray(
    input clk, enable, reset,
    output reg [4:0] salida_gray);

    reg [4:0] count;

    always @(posedge clk) begin
        if (reset == 0) begin
            count <= 0;
        end
        else if (enable == 0) begin
            count <= count;
        end
        else begin
            count <= count+1;
        end
    end

    always @(*) begin
        salida_gray = {count[4], (count[4] ^ count[3]),(count[3] ^ count[2]),(count[2] ^ count[1]), (count[1] ^ count[0])};
    end
endmodule