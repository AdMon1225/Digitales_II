/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* top =  1  *)
(* src = "arbitro2Synth.v:1" *)
module arbitro2Synth(reset, clk, active, demuxin, emptyFIFO, almost_fullFIFO, pop, push);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  (* src = "arbitro2Synth.v:2" *)
  input active;
  (* src = "arbitro2Synth.v:5" *)
  input [3:0] almost_fullFIFO;
  (* src = "arbitro2Synth.v:2" *)
  input clk;
  (* src = "arbitro2Synth.v:3" *)
  input [11:0] demuxin;
  (* src = "arbitro2Synth.v:4" *)
  input emptyFIFO;
  (* src = "arbitro2Synth.v:6" *)
  output pop;
  (* src = "arbitro2Synth.v:7" *)
  output [3:0] push;
  (* src = "arbitro2Synth.v:2" *)
  input reset;
  NOT _23_ (
    .A(demuxin[10]),
    .Y(_00_)
  );
  NOR _24_ (
    .A(demuxin[6]),
    .B(demuxin[7]),
    .Y(_01_)
  );
  NOR _25_ (
    .A(demuxin[8]),
    .B(demuxin[9]),
    .Y(_02_)
  );
  NAND _26_ (
    .A(_01_),
    .B(_02_),
    .Y(_03_)
  );
  NOR _27_ (
    .A(demuxin[0]),
    .B(demuxin[1]),
    .Y(_04_)
  );
  NOR _28_ (
    .A(demuxin[2]),
    .B(demuxin[5]),
    .Y(_05_)
  );
  NAND _29_ (
    .A(_04_),
    .B(_05_),
    .Y(_06_)
  );
  NOT _30_ (
    .A(_06_),
    .Y(_07_)
  );
  NOR _31_ (
    .A(demuxin[3]),
    .B(demuxin[4]),
    .Y(_08_)
  );
  NOT _32_ (
    .A(_08_),
    .Y(_09_)
  );
  NOR _33_ (
    .A(_03_),
    .B(_09_),
    .Y(_10_)
  );
  NAND _34_ (
    .A(_07_),
    .B(_10_),
    .Y(_11_)
  );
  NOR _35_ (
    .A(almost_fullFIFO[0]),
    .B(almost_fullFIFO[1]),
    .Y(_12_)
  );
  NOR _36_ (
    .A(almost_fullFIFO[2]),
    .B(almost_fullFIFO[3]),
    .Y(_13_)
  );
  NOT _37_ (
    .A(_13_),
    .Y(_14_)
  );
  NAND _38_ (
    .A(active),
    .B(reset),
    .Y(_15_)
  );
  NOR _39_ (
    .A(_14_),
    .B(_15_),
    .Y(_16_)
  );
  NAND _40_ (
    .A(_12_),
    .B(_16_),
    .Y(_17_)
  );
  NOT _41_ (
    .A(_17_),
    .Y(_18_)
  );
  NOR _42_ (
    .A(demuxin[11]),
    .B(_17_),
    .Y(_19_)
  );
  NAND _43_ (
    .A(_11_),
    .B(_19_),
    .Y(_20_)
  );
  NOR _44_ (
    .A(demuxin[10]),
    .B(_20_),
    .Y(push[0])
  );
  NAND _45_ (
    .A(demuxin[10]),
    .B(_19_),
    .Y(_21_)
  );
  NOT _46_ (
    .A(_21_),
    .Y(push[1])
  );
  NAND _47_ (
    .A(demuxin[11]),
    .B(_18_),
    .Y(_22_)
  );
  NOR _48_ (
    .A(demuxin[10]),
    .B(_22_),
    .Y(push[2])
  );
  NOR _49_ (
    .A(_00_),
    .B(_22_),
    .Y(push[3])
  );
  NOR _50_ (
    .A(emptyFIFO),
    .B(_17_),
    .Y(pop)
  );
endmodule
