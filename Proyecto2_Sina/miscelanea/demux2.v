module demux2 (
    input [11:0] demuxin,
    output reg [11:0] demuxout0, demuxout1, demuxout2, demuxout3);

always @(*) begin
    if (demuxin[9:8] == 2'b00) demuxout0 = demuxin;
    else if demuxin[9:8] == 2'b01) demuxout1 = demuxin;
    else if demuxin[9:8] == 2'b10) demuxout2 = demuxin;
    else if demuxin[9:8] == 2'b11) demuxout3 = demuxin;
end
endmodule