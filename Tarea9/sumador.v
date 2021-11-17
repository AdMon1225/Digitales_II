module sumador(
    input clk,
	input reset,
	input [3:0] idx, data_A, data_B,
	output reg [3:0] sum_30_dd, idx_dd);
	
    reg [1:0] data_A_d_0;
    reg [1:0] data_B_d_0;
    reg [1:0] data_A_d;
    reg [1:0] data_B_d;
    reg acarreo_d;
    reg [2:0] sum_10;
    reg [1:0] sum_10_d;
    reg [3:0] sum_30_d;
    reg [3:0] idx_etapa_1;
    reg [3:0] idx_etapa_2;

    always @(posedge clk) begin
        if (reset == 0) begin
            sum_30_dd   <= 0;
            data_A_d_0  <= 0;
            data_B_d_0  <= 0;
            data_A_d    <= 0;
            data_B_d    <= 0;
            acarreo_d   <= 0;
            sum_10      <= 0;
            sum_10_d    <= 0;
            sum_30_d    <= 0; 
        end 
        else begin
            data_A_d_0      <= data_A[3:2];
            data_B_d_0      <= data_B[3:2];
            sum_10          <= data_A[1:0] + data_B[1:0];
            data_A_d        <= data_A_d_0;
            data_B_d        <= data_B_d_0;
            sum_10_d        <= sum_10[1:0];     
            acarreo_d       <= sum_10[2];
            sum_30_dd[3:2]  <= data_A_d + data_B_d + acarreo_d;
            sum_30_dd[1:0]  <= sum_10_d;
        end
    end

    always @(posedge clk)begin
        if (reset == 0) begin
            idx_dd      <=0;
            idx_etapa_1 <=0;
            idx_etapa_2 <=0;
        end 
        else begin
            idx_etapa_1 <= idx;
            idx_etapa_2 <= idx_etapa_1;
            idx_dd <= idx_etapa_2;
        end
    end
endmodule