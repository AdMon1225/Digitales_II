`include "fifoMod.v"
`include "arbitro1.v"
`include "arbitro2.v"
`include "demux1.v"
`include "demux2.v"
`include "mux.v"
`include "FSM.v"
`include "counter_cond.v"

module QoS(
    input clk,
    input [11:0] data_in, //Data_in que le ingresa al FIFO solito amarillo
    input popBP0, popBP1, popBP2, popBP3, //Pops de entrada que da probador hacia los 4 FIFOs azules

    // Contadores
    input req, 
    input [2:0] idx,
    output valid, 
    output [4:0] data,

    // Maquina de Estados
    input reset, init, 
    input [3:0] umbralHigh, umbralLow,
    output active_out, idle_out,

    // Salidas de datos de los 4 FIFOs azules
    output [11:0] fifo_dataout0, fifo_dataout1, fifo_dataout2, fifo_dataout3);




    //Wires internos
    wire [11:0] fifo_outYSolo, //Salida del FIFO amarillo solito.
    wire [11:0] demux1outP0, demux1outP1, demux1outP2, demux1outP3, //Salidas del DEMUX1
    wire [11:0] fifo_outYP0, fifo_outYP1, fifo_outYP2, fifo_outYP3, //Salidas de los 4 FIFOs amarillos
    wire [11:0] muxout,
    wire [11:0] fifo_outBSolo, //Salida del FIFO azul solito.
    wire [11:0] demux2outP0, demux2outP1, demux2outP2, demux2outP3, //Salidas del DEMUX2
    wire idle, active,

    wire [3:0] pushA1, //Push para los 4 FIFOs azules. Arbitro1 
    wire [3:0] popA1, //Pop para los 4 FIFOs amarillos. Arbitro1
    wire [3:0] almost_fullA1, //Almost full de los 4 FIFOs azules
    wire [3:0] emptyA1, //Empty de los 4 FIFOs amarillos


    wire [3:0] pushA2, //Push para los 4 FIFOs amarillos. Arbitro2
    wire popA2, //Pop para el FIFO amarillo solito. Arbitro2
    wire [3:0] almost_fullA2, //Almost full de los 4 FIFOs amarillos
    wire emptyA2, //Empty del FIFO amarillo solito

	wire emptyAUX0, emptyAUX1, emptyAUX2, emptyAUX3, emptyAUXSolo, //Empties que solo se utilizan para la FSM.


    wire [3:0] umbralH, umbralL,

    //Instancias de los 10 FIFOs 

    fifoMod FIFOYSolo (/*AUTOINST*/
		       // Outputs
		       .almost_full	(0),
		       .almost_empty	(0),
		       .full		(0),
		       .empty		(emptyA2),
		       .fifo_out	(fifo_outYSolo[11:0]),
		       // Inputs
		       .fifo_in		(data_in[11:0]),
		       .full_umbral	(umbralH[3:0]),
		       .empty_umbral	(umbralL[3:0]),
		       .clk		(clk),
		       .reset		(reset),
		       .fifo_wr		(active),
		       .fifo_rd		(popA2);

    fifoMod FIFOYP0 (/*AUTOINST*/
		     // Outputs
		       .almost_full	(almost_fullA2[0]),
		       .almost_empty	(0),
		       .full		(0),
		       .empty		(emptyA1[0]),
		       .fifo_out	(fifo_outYP0[11:0]),
		       // Inputs
		       .fifo_in		(demux1outP0),
		       .full_umbral	(umbralH[3:0]),
		       .empty_umbral	(umbralL[3:0]),
		       .clk		(clk),
		       .reset		(reset),
		       .fifo_wr		(pushA2[0]),
		       .fifo_rd		(popA1[0]);

    fifoMod FIFOYP1 (/*AUTOINST*/
		     // Outputs
		       .almost_full	(almost_fullA2[1]),
		       .almost_empty	(0),
		       .full		(0),
		       .empty		(emptyA1[1]),
		       .fifo_out	(fifo_outYP1[11:0]),
		       // Inputs
		       .fifo_in		(demux1outP1),
		       .full_umbral	(umbralH[3:0]),
		       .empty_umbral	(umbralL[3:0]),
		       .clk		(clk),
		       .reset		(reset),
		       .fifo_wr		(pushA2[1]),
		       .fifo_rd		(popA1[1]);

    fifoMod FIFOYP2 (/*AUTOINST*/
		     // Outputs
		       .almost_full	(almost_fullA2[2]),
		       .almost_empty	(0),
		       .full		(0),
		       .empty		(emptyA1[2]),
		       .fifo_out	(fifo_outYP2[11:0]),
		       // Inputs
		       .fifo_in		(demux1outP2),
		       .full_umbral	(umbralH[3:0]),
		       .empty_umbral	(umbralL[3:0]),
		       .clk		(clk),
		       .reset		(reset),
		       .fifo_wr		(pushA2[2]),
		       .fifo_rd		(popA1[2]);

    fifoMod FIFOYP3 (/*AUTOINST*/
		     // Outputs
		       .almost_full	(almost_fullA2[3]),
		       .almost_empty	(0),
		       .full		(0),
		       .empty		(emptyA1[3]),
		       .fifo_out	(fifo_outYP3[11:0]),
		       // Inputs
		       .fifo_in		(demux1outP3),
		       .full_umbral	(umbralH[3:0]),
		       .empty_umbral	(umbralL[3:0]),
		       .clk		(clk),
		       .reset		(reset),
		       .fifo_wr		(pushA2[3]),
		       .fifo_rd		(popA1[3]);

    fifoMod FIFOBSolo (/*AUTOINST*/
		       // Outputs
		       .almost_full	(0),
		       .almost_empty	(0),
		       .full		(0),
		       .empty		(emptyAUXSolo),
		       .fifo_out	(fifo_outBSolo[11:0]),
		       // Inputs
		       .fifo_in		(muxout[11:0]),
		       .full_umbral	(umbralH[3:0]),
		       .empty_umbral	(umbralL[3:0]),
		       .clk		(clk),
		       .reset		(reset),
		       .fifo_wr		(active),
		       .fifo_rd		(active));

    fifoMod FIFOBP0 (/*AUTOINST*/
		     // Outputs
		     .almost_full	(almost_fullA1[0]),
		     .almost_empty	(0),
		     .full		(0),
		     .empty		(emptyAUX0),
		     .fifo_out		(fifo_dataout0[11:0]),
		     // Inputs
		     .fifo_in		(demux2outP0[11:0]),
		     .full_umbral	(umbralH[3:0]),
		     .empty_umbral	(umbralL[3:0]),
		     .clk		(clk),
		     .reset		(reset),
		     .fifo_wr		(pushA1[0]),
		     .fifo_rd		(popBP0));

    fifoMod FIFOBP1 (/*AUTOINST*/
		     // Outputs
		     .almost_full	(almost_fullA1[1]),
		     .almost_empty	(0),
		     .full		(0),
		     .empty		(emptyAUX1),
		     .fifo_out		(fifo_dataout1[11:0]),
		     // Inputs
		     .fifo_in		(demux2outP1[11:0]),
		     .full_umbral	(umbralH[3:0]),
		     .empty_umbral	(umbralL[3:0]),
		     .clk		(clk),
		     .reset		(reset),
		     .fifo_wr		(pushA1[1]),
		     .fifo_rd		(popBP1));

    fifoMod FIFOBP2 (/*AUTOINST*/
		     // Outputs
		     .almost_full	(almost_fullA1[2]),
		     .almost_empty	(0),
		     .full		(0),
		     .empty		(emptyAUX2),
		     .fifo_out		(fifo_dataout2[11:0]),
		     // Inputs
		     .fifo_in		(demux2outP2[11:0]),
		     .full_umbral	(umbralH[3:0]),
		     .empty_umbral	(umbralL[3:0]),
		     .clk		(clk),
		     .reset		(reset),
		     .fifo_wr		(pushA1[2]),
		     .fifo_rd		(popBP2));

    fifoMod FIFOBP3 (/*AUTOINST*/
		     // Outputs
		     .almost_full	(almost_fullA1[3]),
		     .almost_empty	(0),
		     .full		(0),
		     .empty		(emptyAUX3),
		     .fifo_out		(fifo_dataout3[11:0]),
		     // Inputs
		     .fifo_in		(demux2outP3[11:0]),
		     .full_umbral	(umbralH[3:0]),
		     .empty_umbral	(umbralL[3:0]),
		     .clk		(clk),
		     .reset		(reset),
		     .fifo_wr		(pushA1[3]),
		     .fifo_rd		(popBP3));



    //Instancias de los arbitros

    arbitro1 arbitro1 (/*AUTOINST*/
		       // Outputs
		       .pop		(popA1[3:0]),
		       .push		(pushA1[3:0]),
		       // Inputs
		       .reset		(reset),
		       .clk		(clk),
		       .emptyFIFO	(emptyA1[3:0]),
		       .almost_fullFIFO	(almost_fullA1[3:0]));

    arbitro2 arbitro2 (/*AUTOINST*/
		       // Outputs
		       .pop		(popA2),
		       .push		(pushA2[3:0]),
		       // Inputs
		       .reset		(reset),
		       .clk		(clk),
		       .demuxin		(fifo_outYSolo[11:0]),
		       .emptyFIFO	(emptyA2),
		       .almost_fullFIFO	(almost_fullA2[3:0]));



    //Instancias de los DEMUXES

    demux1 demux1 (/*AUTOINST*/
		   // Outputs
		   .demuxout0		(demux1outP0[11:0]),
		   .demuxout1		(demux1outP1[11:0]),
		   .demuxout2		(demux1outP2[11:0]),
		   .demuxout3		(demux1outP3[11:0]),
		   // Inputs
		   .demuxin		(fifo_outYSolo[11:0]));

    demux2 demux2 (/*AUTOINST*/
		   // Outputs
		   .demuxout0		(demux2outP0[11:0]),
		   .demuxout1		(demux2outP1[11:0]),
		   .demuxout2		(demux2outP2[11:0]),
		   .demuxout3		(demux2outP3[11:0]),
		   // Inputs
		   .demuxin		(fifo_outBSolo[11:0]));



    //Instancia del unico MUX

    mux mux1 (/*AUTOINST*/
	      // Outputs
	      .mux_out			(muxout[11:0]),
	      // Inputs
	      .fifo_out_0		(fifo_outYP0[11:0]),
	      .fifo_out_1		(fifo_outYP1[11:0]),
	      .fifo_out_2		(fifo_outYP2[11:0]),
	      .fifo_out_3		(fifo_outYP3[11:0]),
	      .pop			(popA1[3:0]));



    //Instancia de los contadores

    counter_cond contadores (/*AUTOINST*/
        // Outputs
        .valid  (valid),
        .data_out  (data),
        // Inputs
        .clk  (clk),
        .req  (req),
        .IDLE  (idle),
        .reset_L  (reset),
        .idx  (idx[2:0]),
        .fifo0_pop  (popBP0),
        .fifo1_pop  (popBP1),
        .fifo2_pop  (popBP2),
        .fifo3_pop  (popBP3),
        .fifo4_pop  (active));



    //Instancia de la FSM

    FSM FSM (/*AUTOINST*/
	     // Outputs
	     .ACTIVE_OUT		(active),
	     .IDLE_OUT			(idle),
	     .umbral_out_L		(umbralL[3:0]),
	     .umbral_out_H		(umbralH[3:0]),
	     // Inputs
	     .clk			(clk),
	     .init			(init),
	     .reset			(reset),
	     .umbral_interno_L		(umbralLow[3:0]),
	     .umbral_interno_H		(umbralHigh[3:0]),
	     .empties0			(emptyA2),
	     .empties1			(emptyA1[0]),
	     .empties2			(emptyA1[1]),
	     .empties3			(emptyA1[2]),
	     .empties4			(emptyA1[3]),
	     .empties5			(emptyAUXSolo),
	     .empties6			(emptyAUX0),
	     .empties7			(emptyAUX1)
		 .empties8			(emptyAUX2)
		 .empties9			(emptyAUX3));

endmodule 