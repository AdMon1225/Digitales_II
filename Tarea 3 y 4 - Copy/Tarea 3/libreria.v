module AND(

    input A,
    input B,
    output C);

    assign #(1:2.4:3.5, 1:2.4:3.5) C = A & B;
endmodule


module OR(
    input A,
    input B,
    output C);

    assign #(0.9:2.25:3.6, 0.9:2.25:3.6) C = A | B;
endmodule


module NOT(
    input A,
    output B);

    assign #(0.7:2:3.3, 0.7:2:3.3) B = ~A;
endmodule


module FlopD(
    input clk,
    input D,
    output reg Q);

    always @ (posedge clk)
    begin
        Q <= D;
    end
endmodule



module mux2x1(
    input data_in0,
    input data_in1,
    input selector,
    output data_out);

    wire not_out, and0_out, and1_out;

    AND AND0 (.A(data_in0), .B(not_out), .C(and0_out));
    AND AND1 (.A(data_in1), .B(selector), .C(and1_out));
    OR OR0 (.A(and0_out), .B(and1_out), .C(data_out));
    NOT NOT0 (.A(selector), .B(not_out));
endmodule



module mux2x1dual(
    input [1:0] d0,
    input [1:0] d1,
    input selector,
    output [1:0] dout);

    mux2x1 mux0 (.data_in0(d0[1]), .data_in1(d1[1]), .selector(selector), .data_out(dout[1]));
    mux2x1 mux1 (.data_in0(d0[0]), .data_in1(d1[0]), .selector(selector), .data_out(dout[0]));
endmodule


module mux_mem_estructural(
    input clk,
	input reset_L,
	input selector,
	input [1:0] data_in0,
	input [1:0] data_in1,
	output [1:0] data_out);

    wire [1:0] mout, mout1;

    mux2x1dual mux0 (.d0(data_in0), .d1(data_in1), .selector(selector), .dout(mout));
    mux2x1dual mux1 (.d0(mout), .d1(0), .selector(~reset_L), .dout(mout1));
    FlopD FF0 (.clk(clk), .D(mout1[1]), .Q(data_out[1]));
    FlopD FF1 (.clk(clk), .D(mout1[0]), .Q(data_out[0]));
endmodule


module mux_mem_conductual(

	input clk,
	input reset_L,
	input selector,
	input [1:0] data_in0,
	input [1:0] data_in1,
	output reg [1:0] data_out);
	
	reg [1:0] mout;
	
	always @ (*)
	begin 
		if (~selector) mout = data_in0;
		else mout = data_in1;
	end
	
	always @ (posedge clk)
	begin
		if (~reset_L) data_out <= 0;
		else data_out <= mout;
	end
		
endmodule 





