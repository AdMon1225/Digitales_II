module demux1 (
    input [11:0] demuxin,
    output reg [11:0] demuxout0, demuxout1, demuxout2, demuxout3);

always @(*) begin
    if (demuxin[11:10] == 2'b00) demuxout0 = demuxin;
    else demuxout0 = 0;

    if (demuxin[11:10] == 2'b01) demuxout1 = demuxin;
    else demuxout1 = 0;

    if (demuxin[11:10] == 2'b10) demuxout2 = demuxin;
    else demuxout2 = 0;

    if (demuxin[11:10] == 2'b11) demuxout3 = demuxin;
    else demuxout3 = 0;
end
endmodule 
