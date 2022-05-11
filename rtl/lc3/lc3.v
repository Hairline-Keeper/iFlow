module Boot(
  input         clock,
  input         reset,
  output        io_uartRx_ready,
  input         io_uartRx_valid,
  input  [7:0]  io_uartRx_bits,
  output        io_work,
  output        io_initPC_valid,
  output [15:0] io_initPC_bits,
  output [15:0] io_initMem_raddr,
  input  [15:0] io_initMem_rdata,
  output [15:0] io_initMem_waddr,
  output [15:0] io_initMem_wdata,
  output        io_initMem_wen,
  input         io_initMem_R
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [12:0] outTimeCnt; // @[Boot.scala 19:27]
  reg  inTransStart; // @[Boot.scala 20:29]
  wire [12:0] _T_1 = outTimeCnt + 13'h1; // @[Boot.scala 25:30]
  wire  _T_2 = ~inTransStart; // @[Boot.scala 28:20]
  wire  _T_3 = io_uartRx_valid & _T_2; // @[Boot.scala 28:17]
  wire  _GEN_1 = _T_3 | inTransStart; // @[Boot.scala 28:35]
  reg [1:0] lc3State; // @[Boot.scala 37:25]
  reg [15:0] memAddr; // @[Boot.scala 40:20]
  reg  second; // @[Boot.scala 41:26]
  reg [7:0] firstData; // @[Reg.scala 15:16]
  wire [15:0] fullData = {firstData,io_uartRx_bits}; // @[Cat.scala 29:58]
  wire  fullDone = second & io_uartRx_valid; // @[Boot.scala 44:26]
  wire  _T_5 = ~second; // @[Boot.scala 46:29]
  wire  _T_7 = ~reset; // @[Boot.scala 47:25]
  wire  _T_8 = lc3State == 2'h0; // @[Boot.scala 49:17]
  wire  _T_9 = _T_8 & fullDone; // @[Boot.scala 49:28]
  wire  _T_10 = outTimeCnt > 13'h1b10; // @[Boot.scala 32:11]
  wire  fuckTimeOut = inTransStart & _T_10; // @[Boot.scala 31:8]
  wire  _T_12 = lc3State == 2'h1; // @[Boot.scala 56:17]
  wire  _T_13 = _T_12 & fullDone; // @[Boot.scala 56:29]
  wire [15:0] _T_15 = memAddr + 16'h1; // @[Boot.scala 57:24]
  wire  _T_17 = _T_12 & fuckTimeOut; // @[Boot.scala 60:29]
  assign io_uartRx_ready = 1'h1; // @[Boot.scala 17:19]
  assign io_work = lc3State == 2'h2; // @[Boot.scala 74:13]
  assign io_initPC_valid = _T_8 & fullDone; // @[Boot.scala 66:21]
  assign io_initPC_bits = {firstData,io_uartRx_bits}; // @[Boot.scala 67:20]
  assign io_initMem_raddr = 16'h0;
  assign io_initMem_waddr = memAddr; // @[Boot.scala 72:22]
  assign io_initMem_wdata = {firstData,io_uartRx_bits}; // @[Boot.scala 71:22]
  assign io_initMem_wen = _T_12 & fullDone; // @[Boot.scala 70:20]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  outTimeCnt = _RAND_0[12:0];
  _RAND_1 = {1{`RANDOM}};
  inTransStart = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  lc3State = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  memAddr = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  second = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  firstData = _RAND_5[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      outTimeCnt <= 13'h0;
    end else if (io_uartRx_valid) begin
      outTimeCnt <= 13'h0;
    end else begin
      outTimeCnt <= _T_1;
    end
    if (reset) begin
      inTransStart <= 1'h0;
    end else begin
      inTransStart <= _GEN_1;
    end
    if (reset) begin
      lc3State <= 2'h0;
    end else if (_T_17) begin
      lc3State <= 2'h2;
    end else if (_T_9) begin
      lc3State <= 2'h1;
    end else if (reset) begin
      lc3State <= 2'h0;
    end
    if (_T_13) begin
      memAddr <= _T_15;
    end else if (_T_9) begin
      memAddr <= fullData;
    end
    if (reset) begin
      second <= 1'h0;
    end else if (io_uartRx_valid) begin
      second <= _T_5;
    end
    if (io_uartRx_valid) begin
      firstData <= io_uartRx_bits;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (fullDone & _T_7) begin
          $fwrite(32'h80000002,"fullDone: %x\n",fullData); // @[Boot.scala 47:25]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_17 & _T_7) begin
          $fwrite(32'h80000002,"Mem init finished, LC3 start work\n"); // @[Boot.scala 62:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module ctrlSigRom(
  input  [5:0] io_sel,
  output       io_out_LD_MAR,
  output       io_out_LD_MDR,
  output       io_out_LD_IR,
  output       io_out_LD_BEN,
  output       io_out_LD_REG,
  output       io_out_LD_CC,
  output       io_out_LD_PC,
  output       io_out_LD_PRIV,
  output       io_out_LD_SAVEDSSP,
  output       io_out_LD_SAVEDUSP,
  output       io_out_LD_VECTOR,
  output       io_out_GATE_PC,
  output       io_out_GATE_MDR,
  output       io_out_GATE_ALU,
  output       io_out_GATE_MARMUX,
  output       io_out_GATE_VECTOR,
  output       io_out_GATE_PC1,
  output       io_out_GATE_PSR,
  output       io_out_GATE_SP,
  output [1:0] io_out_PC_MUX,
  output [1:0] io_out_DR_MUX,
  output [1:0] io_out_SR1_MUX,
  output       io_out_ADDR1_MUX,
  output [1:0] io_out_ADDR2_MUX,
  output [1:0] io_out_SP_MUX,
  output       io_out_MAR_MUX,
  output [1:0] io_out_VECTOR_MUX,
  output       io_out_PSR_MUX,
  output [1:0] io_out_ALUK,
  output       io_out_MIO_EN,
  output       io_out_R_W,
  output       io_out_SET_PRIV
);
  wire [38:0] _GEN_1 = 6'h1 == io_sel ? 39'h602004000 : 39'h0;
  wire [38:0] _GEN_2 = 6'h2 == io_sel ? 39'h4001001100 : _GEN_1;
  wire [38:0] _GEN_3 = 6'h3 == io_sel ? 39'h4001001100 : _GEN_2;
  wire [38:0] _GEN_4 = 6'h4 == io_sel ? 39'h408010000 : _GEN_3;
  wire [38:0] _GEN_5 = 6'h5 == io_sel ? 39'h602004008 : _GEN_4;
  wire [38:0] _GEN_6 = 6'h6 == io_sel ? 39'h4001006900 : _GEN_5;
  wire [38:0] _GEN_7 = 6'h7 == io_sel ? 39'h4001006900 : _GEN_6;
  wire [38:0] _GEN_8 = 6'h8 == io_sel ? 39'h4002008018 : _GEN_7;
  wire [38:0] _GEN_9 = 6'h9 == io_sel ? 39'h602004010 : _GEN_8;
  wire [38:0] _GEN_10 = 6'ha == io_sel ? 39'h4001001100 : _GEN_9;
  wire [38:0] _GEN_11 = 6'hb == io_sel ? 39'h4001001100 : _GEN_10;
  wire [38:0] _GEN_12 = 6'hc == io_sel ? 39'h100086000 : _GEN_11;
  wire [38:0] _GEN_13 = 6'hd == io_sel ? 39'h2090200080 : _GEN_12;
  wire [38:0] _GEN_14 = 6'he == io_sel ? 39'h601001100 : _GEN_13;
  wire [38:0] _GEN_15 = 6'hf == io_sel ? 39'h4001000000 : _GEN_14;
  wire [38:0] _GEN_16 = 6'h10 == io_sel ? 39'h6 : _GEN_15;
  wire [38:0] _GEN_17 = 6'h11 == io_sel ? 39'h0 : _GEN_16;
  wire [38:0] _GEN_18 = 6'h12 == io_sel ? 39'h4108000000 : _GEN_17;
  wire [38:0] _GEN_19 = 6'h13 == io_sel ? 39'h0 : _GEN_18;
  wire [38:0] _GEN_20 = 6'h14 == io_sel ? 39'h508096000 : _GEN_19;
  wire [38:0] _GEN_21 = 6'h15 == io_sel ? 39'h100081800 : _GEN_20;
  wire [38:0] _GEN_22 = 6'h16 == io_sel ? 39'h100081000 : _GEN_21;
  wire [38:0] _GEN_23 = 6'h17 == io_sel ? 39'h2002000018 : _GEN_22;
  wire [38:0] _GEN_24 = 6'h18 == io_sel ? 39'h2000000004 : _GEN_23;
  wire [38:0] _GEN_25 = 6'h19 == io_sel ? 39'h2000000004 : _GEN_24;
  wire [38:0] _GEN_26 = 6'h1a == io_sel ? 39'h4004000000 : _GEN_25;
  wire [38:0] _GEN_27 = 6'h1b == io_sel ? 39'h604000000 : _GEN_26;
  wire [38:0] _GEN_28 = 6'h1c == io_sel ? 39'h2408010004 : _GEN_27;
  wire [38:0] _GEN_29 = 6'h1d == io_sel ? 39'h2000000004 : _GEN_28;
  wire [38:0] _GEN_30 = 6'h1e == io_sel ? 39'h104040000 : _GEN_29;
  wire [38:0] _GEN_31 = 6'h1f == io_sel ? 39'h4004000000 : _GEN_30;
  wire [38:0] _GEN_32 = 6'h20 == io_sel ? 39'h800000000 : _GEN_31;
  wire [38:0] _GEN_33 = 6'h21 == io_sel ? 39'h2000000004 : _GEN_32;
  wire [38:0] _GEN_34 = 6'h22 == io_sel ? 39'h400128000 : _GEN_33;
  wire [38:0] _GEN_35 = 6'h23 == io_sel ? 39'h1004000000 : _GEN_34;
  wire [38:0] _GEN_36 = 6'h24 == io_sel ? 39'h2000000004 : _GEN_35;
  wire [38:0] _GEN_37 = 6'h25 == io_sel ? 39'h4400128200 : _GEN_36;
  wire [38:0] _GEN_38 = 6'h26 == io_sel ? 39'h104040000 : _GEN_37;
  wire [38:0] _GEN_39 = 6'h27 == io_sel ? 39'h4400128000 : _GEN_38;
  wire [38:0] _GEN_40 = 6'h28 == io_sel ? 39'h2000000004 : _GEN_39;
  wire [38:0] _GEN_41 = 6'h29 == io_sel ? 39'h26 : _GEN_40;
  wire [38:0] _GEN_42 = 6'h2a == io_sel ? 39'h284000000 : _GEN_41;
  wire [38:0] _GEN_43 = 6'h2b == io_sel ? 39'h2000400000 : _GEN_42;
  wire [38:0] _GEN_44 = 6'h2c == io_sel ? 39'h2090200040 : _GEN_43;
  wire [38:0] _GEN_45 = 6'h2d == io_sel ? 39'h420128400 : _GEN_44;
  wire [38:0] _GEN_46 = 6'h2e == io_sel ? 39'h0 : _GEN_45;
  wire [38:0] _GEN_47 = 6'h2f == io_sel ? 39'h4400128400 : _GEN_46;
  wire [38:0] _GEN_48 = 6'h30 == io_sel ? 39'h6 : _GEN_47;
  wire [38:0] _GEN_49 = 6'h31 == io_sel ? 39'h2090200000 : _GEN_48;
  wire [38:0] _GEN_50 = 6'h32 == io_sel ? 39'h4000800000 : _GEN_49;
  wire [38:0] _GEN_51 = 6'h33 == io_sel ? 39'h0 : _GEN_50;
  wire [38:0] _GEN_52 = 6'h34 == io_sel ? 39'h2000000004 : _GEN_51;
  wire [38:0] _GEN_53 = 6'h35 == io_sel ? 39'h0 : _GEN_52;
  wire [38:0] _GEN_54 = 6'h36 == io_sel ? 39'h104040000 : _GEN_53;
  wire [38:0] _GEN_55 = 6'h37 == io_sel ? 39'h0 : _GEN_54;
  wire [38:0] _GEN_56 = 6'h38 == io_sel ? 39'h0 : _GEN_55;
  wire [38:0] _GEN_57 = 6'h39 == io_sel ? 39'h0 : _GEN_56;
  wire [38:0] _GEN_58 = 6'h3a == io_sel ? 39'h0 : _GEN_57;
  wire [38:0] _GEN_59 = 6'h3b == io_sel ? 39'h440128600 : _GEN_58;
  wire [38:0] _GEN_60 = 6'h3c == io_sel ? 39'h0 : _GEN_59;
  wire [38:0] _GEN_61 = 6'h3d == io_sel ? 39'h0 : _GEN_60;
  wire [38:0] _GEN_62 = 6'h3e == io_sel ? 39'h0 : _GEN_61;
  wire [38:0] _GEN_63 = 6'h3f == io_sel ? 39'h0 : _GEN_62;
  assign io_out_LD_MAR = _GEN_63[38]; // @[Controller.scala 118:10]
  assign io_out_LD_MDR = _GEN_63[37]; // @[Controller.scala 118:10]
  assign io_out_LD_IR = _GEN_63[36]; // @[Controller.scala 118:10]
  assign io_out_LD_BEN = _GEN_63[35]; // @[Controller.scala 118:10]
  assign io_out_LD_REG = _GEN_63[34]; // @[Controller.scala 118:10]
  assign io_out_LD_CC = _GEN_63[33]; // @[Controller.scala 118:10]
  assign io_out_LD_PC = _GEN_63[32]; // @[Controller.scala 118:10]
  assign io_out_LD_PRIV = _GEN_63[31]; // @[Controller.scala 118:10]
  assign io_out_LD_SAVEDSSP = _GEN_63[30]; // @[Controller.scala 118:10]
  assign io_out_LD_SAVEDUSP = _GEN_63[29]; // @[Controller.scala 118:10]
  assign io_out_LD_VECTOR = _GEN_63[28]; // @[Controller.scala 118:10]
  assign io_out_GATE_PC = _GEN_63[27]; // @[Controller.scala 118:10]
  assign io_out_GATE_MDR = _GEN_63[26]; // @[Controller.scala 118:10]
  assign io_out_GATE_ALU = _GEN_63[25]; // @[Controller.scala 118:10]
  assign io_out_GATE_MARMUX = _GEN_63[24]; // @[Controller.scala 118:10]
  assign io_out_GATE_VECTOR = _GEN_63[23]; // @[Controller.scala 118:10]
  assign io_out_GATE_PC1 = _GEN_63[22]; // @[Controller.scala 118:10]
  assign io_out_GATE_PSR = _GEN_63[21]; // @[Controller.scala 118:10]
  assign io_out_GATE_SP = _GEN_63[20]; // @[Controller.scala 118:10]
  assign io_out_PC_MUX = _GEN_63[19:18]; // @[Controller.scala 118:10]
  assign io_out_DR_MUX = _GEN_63[17:16]; // @[Controller.scala 118:10]
  assign io_out_SR1_MUX = _GEN_63[15:14]; // @[Controller.scala 118:10]
  assign io_out_ADDR1_MUX = _GEN_63[13]; // @[Controller.scala 118:10]
  assign io_out_ADDR2_MUX = _GEN_63[12:11]; // @[Controller.scala 118:10]
  assign io_out_SP_MUX = _GEN_63[10:9]; // @[Controller.scala 118:10]
  assign io_out_MAR_MUX = _GEN_63[8]; // @[Controller.scala 118:10]
  assign io_out_VECTOR_MUX = _GEN_63[7:6]; // @[Controller.scala 118:10]
  assign io_out_PSR_MUX = _GEN_63[5]; // @[Controller.scala 118:10]
  assign io_out_ALUK = _GEN_63[4:3]; // @[Controller.scala 118:10]
  assign io_out_MIO_EN = _GEN_63[2]; // @[Controller.scala 118:10]
  assign io_out_R_W = _GEN_63[1]; // @[Controller.scala 118:10]
  assign io_out_SET_PRIV = _GEN_63[0]; // @[Controller.scala 118:10]
endmodule
module Controller(
  input        clock,
  input        reset,
  input  [9:0] io_in_sig,
  input        io_in_int,
  input        io_in_r,
  input  [3:0] io_in_ir,
  input        io_in_ben,
  input        io_in_psr,
  output       io_out_LD_MAR,
  output       io_out_LD_MDR,
  output       io_out_LD_IR,
  output       io_out_LD_BEN,
  output       io_out_LD_REG,
  output       io_out_LD_CC,
  output       io_out_LD_PC,
  output       io_out_LD_PRIV,
  output       io_out_LD_SAVEDSSP,
  output       io_out_LD_SAVEDUSP,
  output       io_out_LD_VECTOR,
  output       io_out_GATE_PC,
  output       io_out_GATE_MDR,
  output       io_out_GATE_ALU,
  output       io_out_GATE_MARMUX,
  output       io_out_GATE_VECTOR,
  output       io_out_GATE_PC1,
  output       io_out_GATE_PSR,
  output       io_out_GATE_SP,
  output [1:0] io_out_PC_MUX,
  output [1:0] io_out_DR_MUX,
  output [1:0] io_out_SR1_MUX,
  output       io_out_ADDR1_MUX,
  output [1:0] io_out_ADDR2_MUX,
  output [1:0] io_out_SP_MUX,
  output       io_out_MAR_MUX,
  output [1:0] io_out_VECTOR_MUX,
  output       io_out_PSR_MUX,
  output [1:0] io_out_ALUK,
  output       io_out_MIO_EN,
  output       io_out_R_W,
  output       io_out_SET_PRIV,
  input        io_work,
  input        io_end
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [5:0] ctrlSigRom_io_sel; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_LD_MAR; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_LD_MDR; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_LD_IR; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_LD_BEN; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_LD_REG; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_LD_CC; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_LD_PC; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_LD_PRIV; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_LD_SAVEDSSP; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_LD_SAVEDUSP; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_LD_VECTOR; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_GATE_PC; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_GATE_MDR; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_GATE_ALU; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_GATE_MARMUX; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_GATE_VECTOR; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_GATE_PC1; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_GATE_PSR; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_GATE_SP; // @[Controller.scala 123:25]
  wire [1:0] ctrlSigRom_io_out_PC_MUX; // @[Controller.scala 123:25]
  wire [1:0] ctrlSigRom_io_out_DR_MUX; // @[Controller.scala 123:25]
  wire [1:0] ctrlSigRom_io_out_SR1_MUX; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_ADDR1_MUX; // @[Controller.scala 123:25]
  wire [1:0] ctrlSigRom_io_out_ADDR2_MUX; // @[Controller.scala 123:25]
  wire [1:0] ctrlSigRom_io_out_SP_MUX; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_MAR_MUX; // @[Controller.scala 123:25]
  wire [1:0] ctrlSigRom_io_out_VECTOR_MUX; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_PSR_MUX; // @[Controller.scala 123:25]
  wire [1:0] ctrlSigRom_io_out_ALUK; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_MIO_EN; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_R_W; // @[Controller.scala 123:25]
  wire  ctrlSigRom_io_out_SET_PRIV; // @[Controller.scala 123:25]
  reg [5:0] state; // @[Controller.scala 140:22]
  wire  _T = ~io_end; // @[Controller.scala 143:19]
  wire  _T_1 = io_work & _T; // @[Controller.scala 143:16]
  wire  _T_2 = 6'h0 == state; // @[Conditional.scala 37:30]
  wire [4:0] _T_3 = io_in_ben ? 5'h16 : 5'h12; // @[Controller.scala 145:30]
  wire  _T_4 = 6'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_5 = 6'h2 == state; // @[Conditional.scala 37:30]
  wire  _T_6 = 6'h3 == state; // @[Conditional.scala 37:30]
  wire  _T_7 = 6'h4 == state; // @[Conditional.scala 37:30]
  wire [4:0] _T_9 = io_in_ir[0] ? 5'h15 : 5'h14; // @[Controller.scala 149:30]
  wire  _T_10 = 6'h5 == state; // @[Conditional.scala 37:30]
  wire  _T_11 = 6'h6 == state; // @[Conditional.scala 37:30]
  wire  _T_12 = 6'h7 == state; // @[Conditional.scala 37:30]
  wire  _T_13 = 6'h8 == state; // @[Conditional.scala 37:30]
  wire  _T_15 = 6'h9 == state; // @[Conditional.scala 37:30]
  wire  _T_16 = 6'ha == state; // @[Conditional.scala 37:30]
  wire  _T_17 = 6'hb == state; // @[Conditional.scala 37:30]
  wire  _T_18 = 6'hc == state; // @[Conditional.scala 37:30]
  wire  _T_19 = 6'hd == state; // @[Conditional.scala 37:30]
  wire  _T_21 = 6'he == state; // @[Conditional.scala 37:30]
  wire  _T_22 = 6'hf == state; // @[Conditional.scala 37:30]
  wire  _T_23 = 6'h10 == state; // @[Conditional.scala 37:30]
  wire [4:0] _T_24 = io_in_r ? 5'h12 : 5'h10; // @[Controller.scala 161:31]
  wire  _T_25 = 6'h12 == state; // @[Conditional.scala 37:30]
  wire  _T_27 = 6'h14 == state; // @[Conditional.scala 37:30]
  wire  _T_28 = 6'h15 == state; // @[Conditional.scala 37:30]
  wire  _T_29 = 6'h16 == state; // @[Conditional.scala 37:30]
  wire  _T_30 = 6'h17 == state; // @[Conditional.scala 37:30]
  wire  _T_31 = 6'h18 == state; // @[Conditional.scala 37:30]
  wire [4:0] _T_32 = io_in_r ? 5'h1a : 5'h18; // @[Controller.scala 169:31]
  wire  _T_33 = 6'h19 == state; // @[Conditional.scala 37:30]
  wire [4:0] _T_34 = io_in_r ? 5'h1b : 5'h19; // @[Controller.scala 170:31]
  wire  _T_35 = 6'h1a == state; // @[Conditional.scala 37:30]
  wire  _T_36 = 6'h1b == state; // @[Conditional.scala 37:30]
  wire  _T_37 = 6'h1c == state; // @[Conditional.scala 37:30]
  wire [4:0] _T_38 = io_in_r ? 5'h1e : 5'h1c; // @[Controller.scala 173:31]
  wire  _T_39 = 6'h1d == state; // @[Conditional.scala 37:30]
  wire [4:0] _T_40 = io_in_r ? 5'h1f : 5'h1d; // @[Controller.scala 174:31]
  wire  _T_41 = 6'h1e == state; // @[Conditional.scala 37:30]
  wire  _T_42 = 6'h1f == state; // @[Conditional.scala 37:30]
  wire  _T_43 = 6'h20 == state; // @[Conditional.scala 37:30]
  wire  _T_44 = 6'h21 == state; // @[Conditional.scala 37:30]
  wire  _T_46 = 6'h22 == state; // @[Conditional.scala 37:30]
  wire  _T_48 = 6'h23 == state; // @[Conditional.scala 37:30]
  wire  _T_49 = 6'h24 == state; // @[Conditional.scala 37:30]
  wire  _T_51 = 6'h25 == state; // @[Conditional.scala 37:30]
  wire  _T_52 = 6'h26 == state; // @[Conditional.scala 37:30]
  wire  _T_53 = 6'h27 == state; // @[Conditional.scala 37:30]
  wire  _T_54 = 6'h28 == state; // @[Conditional.scala 37:30]
  wire  _T_56 = 6'h29 == state; // @[Conditional.scala 37:30]
  wire  _T_58 = 6'h2a == state; // @[Conditional.scala 37:30]
  wire  _T_59 = 6'h2b == state; // @[Conditional.scala 37:30]
  wire  _T_60 = 6'h2c == state; // @[Conditional.scala 37:30]
  wire  _T_61 = 6'h2d == state; // @[Conditional.scala 37:30]
  wire  _T_62 = 6'h2f == state; // @[Conditional.scala 37:30]
  wire  _T_63 = 6'h30 == state; // @[Conditional.scala 37:30]
  wire  _T_65 = 6'h31 == state; // @[Conditional.scala 37:30]
  wire  _T_67 = 6'h32 == state; // @[Conditional.scala 37:30]
  wire  _T_68 = 6'h33 == state; // @[Conditional.scala 37:30]
  wire  _T_69 = 6'h34 == state; // @[Conditional.scala 37:30]
  wire  _T_71 = 6'h36 == state; // @[Conditional.scala 37:30]
  wire  _T_72 = 6'h3b == state; // @[Conditional.scala 37:30]
  ctrlSigRom ctrlSigRom ( // @[Controller.scala 123:25]
    .io_sel(ctrlSigRom_io_sel),
    .io_out_LD_MAR(ctrlSigRom_io_out_LD_MAR),
    .io_out_LD_MDR(ctrlSigRom_io_out_LD_MDR),
    .io_out_LD_IR(ctrlSigRom_io_out_LD_IR),
    .io_out_LD_BEN(ctrlSigRom_io_out_LD_BEN),
    .io_out_LD_REG(ctrlSigRom_io_out_LD_REG),
    .io_out_LD_CC(ctrlSigRom_io_out_LD_CC),
    .io_out_LD_PC(ctrlSigRom_io_out_LD_PC),
    .io_out_LD_PRIV(ctrlSigRom_io_out_LD_PRIV),
    .io_out_LD_SAVEDSSP(ctrlSigRom_io_out_LD_SAVEDSSP),
    .io_out_LD_SAVEDUSP(ctrlSigRom_io_out_LD_SAVEDUSP),
    .io_out_LD_VECTOR(ctrlSigRom_io_out_LD_VECTOR),
    .io_out_GATE_PC(ctrlSigRom_io_out_GATE_PC),
    .io_out_GATE_MDR(ctrlSigRom_io_out_GATE_MDR),
    .io_out_GATE_ALU(ctrlSigRom_io_out_GATE_ALU),
    .io_out_GATE_MARMUX(ctrlSigRom_io_out_GATE_MARMUX),
    .io_out_GATE_VECTOR(ctrlSigRom_io_out_GATE_VECTOR),
    .io_out_GATE_PC1(ctrlSigRom_io_out_GATE_PC1),
    .io_out_GATE_PSR(ctrlSigRom_io_out_GATE_PSR),
    .io_out_GATE_SP(ctrlSigRom_io_out_GATE_SP),
    .io_out_PC_MUX(ctrlSigRom_io_out_PC_MUX),
    .io_out_DR_MUX(ctrlSigRom_io_out_DR_MUX),
    .io_out_SR1_MUX(ctrlSigRom_io_out_SR1_MUX),
    .io_out_ADDR1_MUX(ctrlSigRom_io_out_ADDR1_MUX),
    .io_out_ADDR2_MUX(ctrlSigRom_io_out_ADDR2_MUX),
    .io_out_SP_MUX(ctrlSigRom_io_out_SP_MUX),
    .io_out_MAR_MUX(ctrlSigRom_io_out_MAR_MUX),
    .io_out_VECTOR_MUX(ctrlSigRom_io_out_VECTOR_MUX),
    .io_out_PSR_MUX(ctrlSigRom_io_out_PSR_MUX),
    .io_out_ALUK(ctrlSigRom_io_out_ALUK),
    .io_out_MIO_EN(ctrlSigRom_io_out_MIO_EN),
    .io_out_R_W(ctrlSigRom_io_out_R_W),
    .io_out_SET_PRIV(ctrlSigRom_io_out_SET_PRIV)
  );
  assign io_out_LD_MAR = ctrlSigRom_io_out_LD_MAR; // @[Controller.scala 141:7]
  assign io_out_LD_MDR = ctrlSigRom_io_out_LD_MDR; // @[Controller.scala 141:7]
  assign io_out_LD_IR = ctrlSigRom_io_out_LD_IR; // @[Controller.scala 141:7]
  assign io_out_LD_BEN = ctrlSigRom_io_out_LD_BEN; // @[Controller.scala 141:7]
  assign io_out_LD_REG = ctrlSigRom_io_out_LD_REG; // @[Controller.scala 141:7]
  assign io_out_LD_CC = ctrlSigRom_io_out_LD_CC; // @[Controller.scala 141:7]
  assign io_out_LD_PC = ctrlSigRom_io_out_LD_PC; // @[Controller.scala 141:7]
  assign io_out_LD_PRIV = ctrlSigRom_io_out_LD_PRIV; // @[Controller.scala 141:7]
  assign io_out_LD_SAVEDSSP = ctrlSigRom_io_out_LD_SAVEDSSP; // @[Controller.scala 141:7]
  assign io_out_LD_SAVEDUSP = ctrlSigRom_io_out_LD_SAVEDUSP; // @[Controller.scala 141:7]
  assign io_out_LD_VECTOR = ctrlSigRom_io_out_LD_VECTOR; // @[Controller.scala 141:7]
  assign io_out_GATE_PC = ctrlSigRom_io_out_GATE_PC; // @[Controller.scala 141:7]
  assign io_out_GATE_MDR = ctrlSigRom_io_out_GATE_MDR; // @[Controller.scala 141:7]
  assign io_out_GATE_ALU = ctrlSigRom_io_out_GATE_ALU; // @[Controller.scala 141:7]
  assign io_out_GATE_MARMUX = ctrlSigRom_io_out_GATE_MARMUX; // @[Controller.scala 141:7]
  assign io_out_GATE_VECTOR = ctrlSigRom_io_out_GATE_VECTOR; // @[Controller.scala 141:7]
  assign io_out_GATE_PC1 = ctrlSigRom_io_out_GATE_PC1; // @[Controller.scala 141:7]
  assign io_out_GATE_PSR = ctrlSigRom_io_out_GATE_PSR; // @[Controller.scala 141:7]
  assign io_out_GATE_SP = ctrlSigRom_io_out_GATE_SP; // @[Controller.scala 141:7]
  assign io_out_PC_MUX = ctrlSigRom_io_out_PC_MUX; // @[Controller.scala 141:7]
  assign io_out_DR_MUX = ctrlSigRom_io_out_DR_MUX; // @[Controller.scala 141:7]
  assign io_out_SR1_MUX = ctrlSigRom_io_out_SR1_MUX; // @[Controller.scala 141:7]
  assign io_out_ADDR1_MUX = ctrlSigRom_io_out_ADDR1_MUX; // @[Controller.scala 141:7]
  assign io_out_ADDR2_MUX = ctrlSigRom_io_out_ADDR2_MUX; // @[Controller.scala 141:7]
  assign io_out_SP_MUX = ctrlSigRom_io_out_SP_MUX; // @[Controller.scala 141:7]
  assign io_out_MAR_MUX = ctrlSigRom_io_out_MAR_MUX; // @[Controller.scala 141:7]
  assign io_out_VECTOR_MUX = ctrlSigRom_io_out_VECTOR_MUX; // @[Controller.scala 141:7]
  assign io_out_PSR_MUX = ctrlSigRom_io_out_PSR_MUX; // @[Controller.scala 141:7]
  assign io_out_ALUK = ctrlSigRom_io_out_ALUK; // @[Controller.scala 141:7]
  assign io_out_MIO_EN = ctrlSigRom_io_out_MIO_EN; // @[Controller.scala 141:7]
  assign io_out_R_W = ctrlSigRom_io_out_R_W; // @[Controller.scala 141:7]
  assign io_out_SET_PRIV = ctrlSigRom_io_out_SET_PRIV; // @[Controller.scala 141:7]
  assign ctrlSigRom_io_sel = state; // @[Controller.scala 124:20]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      state <= 6'h0;
    end else if (_T_1) begin
      if (_T_2) begin
        state <= {{1'd0}, _T_3};
      end else if (_T_4) begin
        state <= 6'h12;
      end else if (_T_5) begin
        state <= 6'h19;
      end else if (_T_6) begin
        state <= 6'h17;
      end else if (_T_7) begin
        state <= {{1'd0}, _T_9};
      end else if (_T_10) begin
        state <= 6'h12;
      end else if (_T_11) begin
        state <= 6'h19;
      end else if (_T_12) begin
        state <= 6'h17;
      end else if (_T_13) begin
        if (io_in_psr) begin
          state <= 6'h2c;
        end else begin
          state <= 6'h24;
        end
      end else if (_T_15) begin
        state <= 6'h12;
      end else if (_T_16) begin
        state <= 6'h18;
      end else if (_T_17) begin
        state <= 6'h1d;
      end else if (_T_18) begin
        state <= 6'h12;
      end else if (_T_19) begin
        if (io_in_psr) begin
          state <= 6'h2d;
        end else begin
          state <= 6'h25;
        end
      end else if (_T_21) begin
        state <= 6'h12;
      end else if (_T_22) begin
        state <= 6'h1c;
      end else if (_T_23) begin
        state <= {{1'd0}, _T_24};
      end else if (_T_25) begin
        if (io_in_int) begin
          state <= 6'h31;
        end else begin
          state <= 6'h21;
        end
      end else if (_T_27) begin
        state <= 6'h12;
      end else if (_T_28) begin
        state <= 6'h12;
      end else if (_T_29) begin
        state <= 6'h12;
      end else if (_T_30) begin
        state <= 6'h10;
      end else if (_T_31) begin
        state <= {{1'd0}, _T_32};
      end else if (_T_33) begin
        state <= {{1'd0}, _T_34};
      end else if (_T_35) begin
        state <= 6'h19;
      end else if (_T_36) begin
        state <= 6'h12;
      end else if (_T_37) begin
        state <= {{1'd0}, _T_38};
      end else if (_T_39) begin
        state <= {{1'd0}, _T_40};
      end else if (_T_41) begin
        state <= 6'h12;
      end else if (_T_42) begin
        state <= 6'h17;
      end else if (_T_43) begin
        state <= {{2'd0}, io_in_ir};
      end else if (_T_44) begin
        if (io_in_r) begin
          state <= 6'h23;
        end else begin
          state <= 6'h21;
        end
      end else if (_T_46) begin
        if (io_in_psr) begin
          state <= 6'h3b;
        end else begin
          state <= 6'h33;
        end
      end else if (_T_48) begin
        state <= 6'h20;
      end else if (_T_49) begin
        if (io_in_r) begin
          state <= 6'h26;
        end else begin
          state <= 6'h24;
        end
      end else if (_T_51) begin
        state <= 6'h29;
      end else if (_T_52) begin
        state <= 6'h27;
      end else if (_T_53) begin
        state <= 6'h28;
      end else if (_T_54) begin
        if (io_in_r) begin
          state <= 6'h2a;
        end else begin
          state <= 6'h28;
        end
      end else if (_T_56) begin
        if (io_in_r) begin
          state <= 6'h2b;
        end else begin
          state <= 6'h29;
        end
      end else if (_T_58) begin
        state <= 6'h22;
      end else if (_T_59) begin
        state <= 6'h2f;
      end else if (_T_60) begin
        state <= 6'h2d;
      end else if (_T_61) begin
        state <= 6'h25;
      end else if (_T_62) begin
        state <= 6'h30;
      end else if (_T_63) begin
        if (io_in_r) begin
          state <= 6'h32;
        end else begin
          state <= 6'h30;
        end
      end else if (_T_65) begin
        if (io_in_psr) begin
          state <= 6'h2d;
        end else begin
          state <= 6'h25;
        end
      end else if (_T_67) begin
        state <= 6'h34;
      end else if (_T_68) begin
        state <= 6'h12;
      end else if (_T_69) begin
        if (io_in_r) begin
          state <= 6'h36;
        end else begin
          state <= 6'h34;
        end
      end else if (_T_71) begin
        state <= 6'h12;
      end else if (_T_72) begin
        state <= 6'h12;
      end
    end
  end
endmodule
module Regfile(
  input         clock,
  input         reset,
  input         io_wen,
  input  [2:0]  io_wAddr,
  input  [2:0]  io_r1Addr,
  input  [2:0]  io_r2Addr,
  input  [15:0] io_wData,
  output [15:0] io_r1Data,
  output [15:0] io_r2Data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] regfile_0; // @[Regfile.scala 20:24]
  reg [15:0] regfile_1; // @[Regfile.scala 20:24]
  reg [15:0] regfile_2; // @[Regfile.scala 20:24]
  reg [15:0] regfile_3; // @[Regfile.scala 20:24]
  reg [15:0] regfile_4; // @[Regfile.scala 20:24]
  reg [15:0] regfile_5; // @[Regfile.scala 20:24]
  reg [15:0] regfile_6; // @[Regfile.scala 20:24]
  reg [15:0] regfile_7; // @[Regfile.scala 20:24]
  wire [15:0] _GEN_17 = 3'h1 == io_r1Addr ? regfile_1 : regfile_0; // @[Regfile.scala 25:13]
  wire [15:0] _GEN_18 = 3'h2 == io_r1Addr ? regfile_2 : _GEN_17; // @[Regfile.scala 25:13]
  wire [15:0] _GEN_19 = 3'h3 == io_r1Addr ? regfile_3 : _GEN_18; // @[Regfile.scala 25:13]
  wire [15:0] _GEN_20 = 3'h4 == io_r1Addr ? regfile_4 : _GEN_19; // @[Regfile.scala 25:13]
  wire [15:0] _GEN_21 = 3'h5 == io_r1Addr ? regfile_5 : _GEN_20; // @[Regfile.scala 25:13]
  wire [15:0] _GEN_22 = 3'h6 == io_r1Addr ? regfile_6 : _GEN_21; // @[Regfile.scala 25:13]
  wire [15:0] _GEN_25 = 3'h1 == io_r2Addr ? regfile_1 : regfile_0; // @[Regfile.scala 26:13]
  wire [15:0] _GEN_26 = 3'h2 == io_r2Addr ? regfile_2 : _GEN_25; // @[Regfile.scala 26:13]
  wire [15:0] _GEN_27 = 3'h3 == io_r2Addr ? regfile_3 : _GEN_26; // @[Regfile.scala 26:13]
  wire [15:0] _GEN_28 = 3'h4 == io_r2Addr ? regfile_4 : _GEN_27; // @[Regfile.scala 26:13]
  wire [15:0] _GEN_29 = 3'h5 == io_r2Addr ? regfile_5 : _GEN_28; // @[Regfile.scala 26:13]
  wire [15:0] _GEN_30 = 3'h6 == io_r2Addr ? regfile_6 : _GEN_29; // @[Regfile.scala 26:13]
  assign io_r1Data = 3'h7 == io_r1Addr ? regfile_7 : _GEN_22; // @[Regfile.scala 25:13]
  assign io_r2Data = 3'h7 == io_r2Addr ? regfile_7 : _GEN_30; // @[Regfile.scala 26:13]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  regfile_0 = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  regfile_1 = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  regfile_2 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  regfile_3 = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  regfile_4 = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  regfile_5 = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  regfile_6 = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  regfile_7 = _RAND_7[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      regfile_0 <= 16'h0;
    end else if (io_wen) begin
      if (3'h0 == io_wAddr) begin
        regfile_0 <= io_wData;
      end
    end
    if (reset) begin
      regfile_1 <= 16'h0;
    end else if (io_wen) begin
      if (3'h1 == io_wAddr) begin
        regfile_1 <= io_wData;
      end
    end
    if (reset) begin
      regfile_2 <= 16'h0;
    end else if (io_wen) begin
      if (3'h2 == io_wAddr) begin
        regfile_2 <= io_wData;
      end
    end
    if (reset) begin
      regfile_3 <= 16'h0;
    end else if (io_wen) begin
      if (3'h3 == io_wAddr) begin
        regfile_3 <= io_wData;
      end
    end
    if (reset) begin
      regfile_4 <= 16'h0;
    end else if (io_wen) begin
      if (3'h4 == io_wAddr) begin
        regfile_4 <= io_wData;
      end
    end
    if (reset) begin
      regfile_5 <= 16'h0;
    end else if (io_wen) begin
      if (3'h5 == io_wAddr) begin
        regfile_5 <= io_wData;
      end
    end
    if (reset) begin
      regfile_6 <= 16'h0;
    end else if (io_wen) begin
      if (3'h6 == io_wAddr) begin
        regfile_6 <= io_wData;
      end
    end
    if (reset) begin
      regfile_7 <= 16'h0;
    end else if (io_wen) begin
      if (3'h7 == io_wAddr) begin
        regfile_7 <= io_wData;
      end
    end
  end
endmodule
module ALU(
  input  [15:0] io_ina,
  input  [15:0] io_inb,
  input  [1:0]  io_op,
  output [15:0] io_out
);
  wire  _T = 2'h0 == io_op; // @[Conditional.scala 37:30]
  wire [16:0] result = io_ina + io_inb; // @[ALU.scala 22:24]
  wire  _T_4 = 2'h1 == io_op; // @[Conditional.scala 37:30]
  wire [15:0] _T_5 = io_ina & io_inb; // @[ALU.scala 26:33]
  wire  _T_6 = 2'h2 == io_op; // @[Conditional.scala 37:30]
  wire [15:0] _T_7 = ~io_ina; // @[ALU.scala 27:26]
  wire [15:0] _GEN_1 = _T_6 ? _T_7 : io_ina; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_2 = _T_4 ? _T_5 : _GEN_1; // @[Conditional.scala 39:67]
  assign io_out = _T ? result[15:0] : _GEN_2; // @[ALU.scala 23:14 ALU.scala 26:23 ALU.scala 27:23 ALU.scala 28:23]
endmodule
module SimpleBus(
  input  [7:0]  io_GateSig,
  input  [15:0] io_GateData_0,
  input  [15:0] io_GateData_1,
  input  [15:0] io_GateData_2,
  input  [15:0] io_GateData_3,
  input  [15:0] io_GateData_5,
  input  [15:0] io_GateData_7,
  output [15:0] io_out
);
  wire  _T = io_GateSig == 8'h0; // @[SimpleBus.scala 15:34]
  wire [7:0] _T_4 = {{4'd0}, io_GateSig[7:4]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_6 = {io_GateSig[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_8 = _T_6 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_9 = _T_4 | _T_8; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_8 = {{2'd0}, _T_9[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_14 = _GEN_8 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_16 = {_T_9[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_18 = _T_16 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_19 = _T_14 | _T_18; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_9 = {{1'd0}, _T_19[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_24 = _GEN_9 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_26 = {_T_19[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_28 = _T_26 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] _T_29 = _T_24 | _T_28; // @[Bitwise.scala 103:39]
  wire  _T_32 = |_T_29[7:4]; // @[OneHot.scala 32:14]
  wire [3:0] _T_33 = _T_29[7:4] | _T_29[3:0]; // @[OneHot.scala 32:28]
  wire  _T_36 = |_T_33[3:2]; // @[OneHot.scala 32:14]
  wire [1:0] _T_37 = _T_33[3:2] | _T_33[1:0]; // @[OneHot.scala 32:28]
  wire [2:0] _T_40 = {_T_32,_T_36,_T_37[1]}; // @[Cat.scala 29:58]
  wire [15:0] _GEN_1 = 3'h1 == _T_40 ? io_GateData_1 : io_GateData_0; // @[SimpleBus.scala 15:22]
  wire [15:0] _GEN_2 = 3'h2 == _T_40 ? io_GateData_2 : _GEN_1; // @[SimpleBus.scala 15:22]
  wire [15:0] _GEN_3 = 3'h3 == _T_40 ? io_GateData_3 : _GEN_2; // @[SimpleBus.scala 15:22]
  wire [15:0] _GEN_4 = 3'h4 == _T_40 ? 16'h2 : _GEN_3; // @[SimpleBus.scala 15:22]
  wire [15:0] _GEN_5 = 3'h5 == _T_40 ? io_GateData_5 : _GEN_4; // @[SimpleBus.scala 15:22]
  wire [15:0] _GEN_6 = 3'h6 == _T_40 ? 16'h0 : _GEN_5; // @[SimpleBus.scala 15:22]
  wire [15:0] _GEN_7 = 3'h7 == _T_40 ? io_GateData_7 : _GEN_6; // @[SimpleBus.scala 15:22]
  assign io_out = _T ? 16'h0 : _GEN_7; // @[SimpleBus.scala 15:16]
endmodule
module DataPath(
  input         clock,
  input         reset,
  input         io_signal_LD_MAR,
  input         io_signal_LD_MDR,
  input         io_signal_LD_IR,
  input         io_signal_LD_BEN,
  input         io_signal_LD_REG,
  input         io_signal_LD_CC,
  input         io_signal_LD_PC,
  input         io_signal_LD_PRIV,
  input         io_signal_LD_SAVEDSSP,
  input         io_signal_LD_SAVEDUSP,
  input         io_signal_LD_VECTOR,
  input         io_signal_GATE_PC,
  input         io_signal_GATE_MDR,
  input         io_signal_GATE_ALU,
  input         io_signal_GATE_MARMUX,
  input         io_signal_GATE_VECTOR,
  input         io_signal_GATE_PC1,
  input         io_signal_GATE_PSR,
  input         io_signal_GATE_SP,
  input  [1:0]  io_signal_PC_MUX,
  input  [1:0]  io_signal_DR_MUX,
  input  [1:0]  io_signal_SR1_MUX,
  input         io_signal_ADDR1_MUX,
  input  [1:0]  io_signal_ADDR2_MUX,
  input  [1:0]  io_signal_SP_MUX,
  input         io_signal_MAR_MUX,
  input  [1:0]  io_signal_VECTOR_MUX,
  input         io_signal_PSR_MUX,
  input  [1:0]  io_signal_ALUK,
  input         io_signal_MIO_EN,
  input         io_signal_R_W,
  input         io_signal_SET_PRIV,
  output [15:0] io_mem_raddr,
  input  [15:0] io_mem_rdata,
  output [15:0] io_mem_waddr,
  output [15:0] io_mem_wdata,
  output        io_mem_wen,
  input         io_mem_R,
  output [9:0]  io_out_sig,
  output        io_out_int,
  output        io_out_r,
  output [3:0]  io_out_ir,
  output        io_out_ben,
  output        io_out_psr,
  input         io_initPC_valid,
  input  [15:0] io_initPC_bits,
  output        io_uartRx_ready,
  input         io_uartRx_valid,
  input  [7:0]  io_uartRx_bits,
  input         io_uartTx_ready,
  output        io_uartTx_valid,
  output [7:0]  io_uartTx_bits,
  output        io_end
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  wire  regfile_clock; // @[DataPath.scala 32:23]
  wire  regfile_reset; // @[DataPath.scala 32:23]
  wire  regfile_io_wen; // @[DataPath.scala 32:23]
  wire [2:0] regfile_io_wAddr; // @[DataPath.scala 32:23]
  wire [2:0] regfile_io_r1Addr; // @[DataPath.scala 32:23]
  wire [2:0] regfile_io_r2Addr; // @[DataPath.scala 32:23]
  wire [15:0] regfile_io_wData; // @[DataPath.scala 32:23]
  wire [15:0] regfile_io_r1Data; // @[DataPath.scala 32:23]
  wire [15:0] regfile_io_r2Data; // @[DataPath.scala 32:23]
  wire [15:0] alu_io_ina; // @[DataPath.scala 33:19]
  wire [15:0] alu_io_inb; // @[DataPath.scala 33:19]
  wire [1:0] alu_io_op; // @[DataPath.scala 33:19]
  wire [15:0] alu_io_out; // @[DataPath.scala 33:19]
  wire [7:0] bus_io_GateSig; // @[DataPath.scala 34:19]
  wire [15:0] bus_io_GateData_0; // @[DataPath.scala 34:19]
  wire [15:0] bus_io_GateData_1; // @[DataPath.scala 34:19]
  wire [15:0] bus_io_GateData_2; // @[DataPath.scala 34:19]
  wire [15:0] bus_io_GateData_3; // @[DataPath.scala 34:19]
  wire [15:0] bus_io_GateData_5; // @[DataPath.scala 34:19]
  wire [15:0] bus_io_GateData_7; // @[DataPath.scala 34:19]
  wire [15:0] bus_io_out; // @[DataPath.scala 34:19]
  reg [63:0] time_; // @[utils.scala 23:20]
  wire [63:0] _T_1 = time_ + 64'h1; // @[utils.scala 24:12]
  reg  BEN; // @[DataPath.scala 40:20]
  reg  N; // @[DataPath.scala 41:18]
  reg  P; // @[DataPath.scala 42:18]
  reg  Z; // @[DataPath.scala 43:18]
  reg [15:0] PC; // @[DataPath.scala 46:20]
  reg [15:0] RESET_PC; // @[DataPath.scala 47:26]
  reg [15:0] IR; // @[DataPath.scala 52:20]
  reg [15:0] MAR_REG; // @[DataPath.scala 54:24]
  reg [15:0] MDR; // @[DataPath.scala 55:20]
  reg [15:0] KBDR; // @[DataPath.scala 58:21]
  reg [15:0] KBSR; // @[DataPath.scala 59:21]
  reg [15:0] DDR; // @[DataPath.scala 60:21]
  reg [15:0] DSR; // @[DataPath.scala 61:21]
  reg [15:0] PRE_IR; // @[DataPath.scala 67:23]
  reg  END; // @[DataPath.scala 68:20]
  wire  _T_2 = IR == 16'h0; // @[DataPath.scala 70:11]
  wire  _T_3 = PRE_IR != 16'h0; // @[DataPath.scala 70:29]
  wire  _T_4 = _T_2 & _T_3; // @[DataPath.scala 70:19]
  wire  _GEN_2 = _T_4 | END; // @[DataPath.scala 70:38]
  wire [2:0] baseR = IR[8:6]; // @[DataPath.scala 75:17]
  wire  isImm = IR[5]; // @[DataPath.scala 77:17]
  wire [2:0] dst = IR[11:9]; // @[DataPath.scala 78:17]
  wire [10:0] _T_8 = IR[4] ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [15:0] offset5 = {_T_8,IR[4:0]}; // @[Cat.scala 29:58]
  wire [9:0] _T_12 = IR[5] ? 10'h3ff : 10'h0; // @[Bitwise.scala 72:12]
  wire [15:0] offset6 = {_T_12,IR[5:0]}; // @[Cat.scala 29:58]
  wire [6:0] _T_16 = IR[8] ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [15:0] offset9 = {_T_16,IR[8:0]}; // @[Cat.scala 29:58]
  wire [4:0] _T_20 = IR[10] ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [15:0] offset11 = {_T_20,IR[10:0]}; // @[Cat.scala 29:58]
  wire [15:0] offset8 = {8'h0,IR[7:0]}; // @[Cat.scala 29:58]
  wire [15:0] ADDR1MUX = io_signal_ADDR1_MUX ? regfile_io_r1Data : PC; // @[DataPath.scala 90:21]
  wire  _T_22 = 2'h1 == io_signal_ADDR2_MUX; // @[Mux.scala 80:60]
  wire [15:0] _T_23 = _T_22 ? offset6 : 16'h0; // @[Mux.scala 80:57]
  wire  _T_24 = 2'h2 == io_signal_ADDR2_MUX; // @[Mux.scala 80:60]
  wire [15:0] _T_25 = _T_24 ? offset9 : _T_23; // @[Mux.scala 80:57]
  wire  _T_26 = 2'h3 == io_signal_ADDR2_MUX; // @[Mux.scala 80:60]
  wire [15:0] ADDR2MUX = _T_26 ? offset11 : _T_25; // @[Mux.scala 80:57]
  wire [15:0] addrOut = ADDR1MUX + ADDR2MUX; // @[DataPath.scala 99:26]
  wire  _T_28 = PC == 16'h0; // @[DataPath.scala 102:18]
  wire [15:0] _T_30 = PC + 16'h1; // @[DataPath.scala 102:40]
  wire  _T_32 = 2'h0 == io_signal_PC_MUX; // @[Mux.scala 80:60]
  wire  _T_34 = 2'h1 == io_signal_PC_MUX; // @[Mux.scala 80:60]
  wire [15:0] BUSOUT = bus_io_out; // @[DataPath.scala 221:10]
  wire  _T_36 = 2'h2 == io_signal_PC_MUX; // @[Mux.scala 80:60]
  wire  _T_39 = 2'h0 == io_signal_DR_MUX; // @[Mux.scala 80:60]
  wire [2:0] _T_40 = _T_39 ? dst : dst; // @[Mux.scala 80:57]
  wire  _T_41 = 2'h1 == io_signal_DR_MUX; // @[Mux.scala 80:60]
  wire [2:0] _T_42 = _T_41 ? 3'h7 : _T_40; // @[Mux.scala 80:57]
  wire  _T_43 = 2'h2 == io_signal_DR_MUX; // @[Mux.scala 80:60]
  wire  _T_47 = 2'h0 == io_signal_SR1_MUX; // @[Mux.scala 80:60]
  wire [2:0] _T_48 = _T_47 ? dst : dst; // @[Mux.scala 80:57]
  wire  _T_49 = 2'h1 == io_signal_SR1_MUX; // @[Mux.scala 80:60]
  wire [2:0] _T_50 = _T_49 ? baseR : _T_48; // @[Mux.scala 80:57]
  wire  _T_51 = 2'h2 == io_signal_SR1_MUX; // @[Mux.scala 80:60]
  wire [15:0] _T_53 = regfile_io_r1Data + 16'h1; // @[DataPath.scala 122:54]
  wire [15:0] _T_57 = regfile_io_r1Data - 16'h1; // @[DataPath.scala 124:30]
  wire  _T_58 = 2'h1 == io_signal_SP_MUX; // @[Mux.scala 80:60]
  wire [15:0] _T_59 = _T_58 ? _T_57 : _T_53; // @[Mux.scala 80:57]
  wire  _T_60 = 2'h2 == io_signal_SP_MUX; // @[Mux.scala 80:60]
  wire [15:0] _T_61 = _T_60 ? 16'h6 : _T_59; // @[Mux.scala 80:57]
  wire  _T_62 = 2'h3 == io_signal_SP_MUX; // @[Mux.scala 80:60]
  wire  _T_69 = ~io_signal_R_W; // @[DataPath.scala 158:30]
  wire  MEM_RD = io_signal_MIO_EN & _T_69; // @[DataPath.scala 158:27]
  wire [15:0] MAR = io_signal_LD_MAR ? BUSOUT : MAR_REG; // @[DataPath.scala 227:20]
  wire  _T_70 = MAR < 16'hfe00; // @[DataPath.scala 159:35]
  wire  MEM_EN = io_signal_MIO_EN & _T_70; // @[DataPath.scala 159:27]
  wire  _T_71 = MAR == 16'hfe00; // @[DataPath.scala 162:21]
  wire  _T_72 = MEM_RD & _T_71; // @[DataPath.scala 162:13]
  wire  _T_73 = MAR == 16'hfe02; // @[DataPath.scala 163:21]
  wire  _T_74 = MEM_RD & _T_73; // @[DataPath.scala 163:13]
  wire  _T_75 = MAR == 16'hfe04; // @[DataPath.scala 164:21]
  wire  _T_76 = MEM_RD & _T_75; // @[DataPath.scala 164:13]
  wire [15:0] _T_80 = _T_76 ? DSR : io_mem_rdata; // @[Mux.scala 98:16]
  wire [15:0] _T_81 = _T_74 ? KBDR : _T_80; // @[Mux.scala 98:16]
  wire [15:0] IN_MUX = _T_72 ? KBSR : _T_81; // @[Mux.scala 98:16]
  wire  _T_85 = io_uartRx_ready & io_uartRx_valid; // @[Decoupled.scala 40:37]
  wire [15:0] _T_86 = {8'h0,io_uartRx_bits}; // @[Cat.scala 29:58]
  wire  _T_89 = _T_71 & io_signal_MIO_EN; // @[DataPath.scala 175:36]
  wire  LD_KBSR = _T_89 & io_signal_R_W; // @[DataPath.scala 175:50]
  wire  _T_91 = _T_75 & io_signal_MIO_EN; // @[DataPath.scala 176:36]
  wire  LD_DSR = _T_91 & io_signal_R_W; // @[DataPath.scala 176:50]
  wire  _T_92 = MAR == 16'hfe06; // @[DataPath.scala 177:22]
  wire  _T_93 = _T_92 & io_signal_MIO_EN; // @[DataPath.scala 177:36]
  wire  LD_DDR = _T_93 & io_signal_R_W; // @[DataPath.scala 177:50]
  wire [15:0] _T_94 = {io_uartTx_ready,15'h0}; // @[Cat.scala 29:58]
  reg  _T_95; // @[DataPath.scala 183:29]
  wire [3:0] _T_100 = {io_signal_GATE_VECTOR,io_signal_GATE_PC1,io_signal_GATE_PSR,io_signal_GATE_SP}; // @[Cat.scala 29:58]
  wire [3:0] _T_103 = {io_signal_GATE_PC,io_signal_GATE_MDR,io_signal_GATE_ALU,io_signal_GATE_MARMUX}; // @[Cat.scala 29:58]
  wire  _T_112 = IR[11] & N; // @[DataPath.scala 237:37]
  wire  _T_114 = IR[10] & Z; // @[DataPath.scala 237:52]
  wire  _T_115 = _T_112 | _T_114; // @[DataPath.scala 237:42]
  wire  _T_117 = IR[9] & P; // @[DataPath.scala 237:66]
  wire  _T_118 = _T_115 | _T_117; // @[DataPath.scala 237:57]
  wire  _T_119 = time_ == 64'h0; // @[DataPath.scala 238:26]
  wire  _T_120 = io_signal_LD_PC | _T_119; // @[DataPath.scala 238:18]
  wire [15:0] dstData = regfile_io_wData;
  wire  _T_122 = |dstData; // @[DataPath.scala 246:22]
  wire  _T_123 = ~_T_122; // @[DataPath.scala 246:10]
  wire  _T_125 = ~dstData[15]; // @[DataPath.scala 247:10]
  wire  _T_127 = _T_125 & _T_122; // @[DataPath.scala 247:23]
  wire  _GEN_11 = io_signal_LD_CC ? _T_123 : Z; // @[DataPath.scala 244:19]
  wire [15:0] in_mux = IN_MUX; // @[DataPath.scala 186:20 DataPath.scala 188:9]
  wire [15:0] mem_en = {{15'd0}, MEM_EN}; // @[DataPath.scala 187:20 DataPath.scala 189:10]
  Regfile regfile ( // @[DataPath.scala 32:23]
    .clock(regfile_clock),
    .reset(regfile_reset),
    .io_wen(regfile_io_wen),
    .io_wAddr(regfile_io_wAddr),
    .io_r1Addr(regfile_io_r1Addr),
    .io_r2Addr(regfile_io_r2Addr),
    .io_wData(regfile_io_wData),
    .io_r1Data(regfile_io_r1Data),
    .io_r2Data(regfile_io_r2Data)
  );
  ALU alu ( // @[DataPath.scala 33:19]
    .io_ina(alu_io_ina),
    .io_inb(alu_io_inb),
    .io_op(alu_io_op),
    .io_out(alu_io_out)
  );
  SimpleBus bus ( // @[DataPath.scala 34:19]
    .io_GateSig(bus_io_GateSig),
    .io_GateData_0(bus_io_GateData_0),
    .io_GateData_1(bus_io_GateData_1),
    .io_GateData_2(bus_io_GateData_2),
    .io_GateData_3(bus_io_GateData_3),
    .io_GateData_5(bus_io_GateData_5),
    .io_GateData_7(bus_io_GateData_7),
    .io_out(bus_io_out)
  );
  assign io_mem_raddr = io_signal_LD_MAR ? BUSOUT : MAR_REG; // @[DataPath.scala 193:18]
  assign io_mem_waddr = io_signal_LD_MAR ? BUSOUT : MAR_REG; // @[DataPath.scala 194:18]
  assign io_mem_wdata = MDR; // @[DataPath.scala 195:17]
  assign io_mem_wen = io_signal_MIO_EN & io_signal_R_W; // @[DataPath.scala 196:17]
  assign io_out_sig = 10'h0;
  assign io_out_int = 1'h0; // @[DataPath.scala 258:15]
  assign io_out_r = io_mem_R; // @[DataPath.scala 259:15]
  assign io_out_ir = IR[15:12]; // @[DataPath.scala 260:15]
  assign io_out_ben = BEN; // @[DataPath.scala 261:15]
  assign io_out_psr = 1'h0; // @[DataPath.scala 262:15]
  assign io_uartRx_ready = ~KBSR[15]; // @[DataPath.scala 169:19]
  assign io_uartTx_valid = _T_95; // @[DataPath.scala 183:19]
  assign io_uartTx_bits = DDR[7:0]; // @[DataPath.scala 184:19]
  assign io_end = END; // @[DataPath.scala 69:10]
  assign regfile_clock = clock;
  assign regfile_reset = reset;
  assign regfile_io_wen = io_signal_LD_REG; // @[DataPath.scala 145:21]
  assign regfile_io_wAddr = _T_43 ? 3'h6 : _T_42; // @[DataPath.scala 146:21]
  assign regfile_io_r1Addr = _T_51 ? 3'h6 : _T_50; // @[DataPath.scala 147:21]
  assign regfile_io_r2Addr = IR[2:0]; // @[DataPath.scala 148:21]
  assign regfile_io_wData = bus_io_out; // @[DataPath.scala 149:21]
  assign alu_io_ina = regfile_io_r1Data; // @[DataPath.scala 140:14]
  assign alu_io_inb = isImm ? offset5 : regfile_io_r2Data; // @[DataPath.scala 141:14]
  assign alu_io_op = io_signal_ALUK; // @[DataPath.scala 142:13]
  assign bus_io_GateSig = {_T_103,_T_100}; // @[DataPath.scala 202:18]
  assign bus_io_GateData_0 = PC; // @[DataPath.scala 212:22]
  assign bus_io_GateData_1 = MDR; // @[DataPath.scala 213:22]
  assign bus_io_GateData_2 = alu_io_out; // @[DataPath.scala 214:22]
  assign bus_io_GateData_3 = io_signal_MAR_MUX ? addrOut : offset8; // @[DataPath.scala 215:22]
  assign bus_io_GateData_5 = PC - 16'h1; // @[DataPath.scala 217:22]
  assign bus_io_GateData_7 = _T_62 ? 16'h6 : _T_61; // @[DataPath.scala 219:22]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  time_ = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  BEN = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  N = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  P = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  Z = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  PC = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  RESET_PC = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  IR = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  MAR_REG = _RAND_8[15:0];
  _RAND_9 = {1{`RANDOM}};
  MDR = _RAND_9[15:0];
  _RAND_10 = {1{`RANDOM}};
  KBDR = _RAND_10[15:0];
  _RAND_11 = {1{`RANDOM}};
  KBSR = _RAND_11[15:0];
  _RAND_12 = {1{`RANDOM}};
  DDR = _RAND_12[15:0];
  _RAND_13 = {1{`RANDOM}};
  DSR = _RAND_13[15:0];
  _RAND_14 = {1{`RANDOM}};
  PRE_IR = _RAND_14[15:0];
  _RAND_15 = {1{`RANDOM}};
  END = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  _T_95 = _RAND_16[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      time_ <= 64'h0;
    end else begin
      time_ <= _T_1;
    end
    if (reset) begin
      BEN <= 1'h0;
    end else if (io_signal_LD_BEN) begin
      BEN <= _T_118;
    end
    if (reset) begin
      N <= 1'h0;
    end else if (io_signal_LD_CC) begin
      N <= dstData[15];
    end
    if (reset) begin
      P <= 1'h0;
    end else if (io_signal_LD_CC) begin
      P <= _T_127;
    end
    Z <= reset | _GEN_11;
    if (reset) begin
      PC <= 16'h3000;
    end else if (_T_120) begin
      if (_T_36) begin
        PC <= addrOut;
      end else if (_T_34) begin
        PC <= BUSOUT;
      end else if (_T_32) begin
        if (_T_28) begin
          PC <= RESET_PC;
        end else begin
          PC <= _T_30;
        end
      end else begin
        PC <= RESET_PC;
      end
    end else if (io_initPC_valid) begin
      PC <= io_initPC_bits;
    end
    if (reset) begin
      RESET_PC <= 16'h3000;
    end else if (io_initPC_valid) begin
      RESET_PC <= io_initPC_bits;
    end
    if (reset) begin
      IR <= 16'h0;
    end else if (io_signal_LD_IR) begin
      IR <= MDR;
    end
    if (reset) begin
      MAR_REG <= 16'h0;
    end else if (io_signal_LD_MAR) begin
      MAR_REG <= BUSOUT;
    end
    if (reset) begin
      MDR <= 16'h0;
    end else if (io_signal_LD_MDR) begin
      if (io_signal_MIO_EN) begin
        if (_T_72) begin
          MDR <= KBSR;
        end else if (_T_74) begin
          MDR <= KBDR;
        end else if (_T_76) begin
          MDR <= DSR;
        end else begin
          MDR <= io_mem_rdata;
        end
      end else begin
        MDR <= BUSOUT;
      end
    end
    if (reset) begin
      KBDR <= 16'h0;
    end else if (_T_85) begin
      KBDR <= _T_86;
    end
    if (reset) begin
      KBSR <= 16'h0;
    end else if (LD_KBSR) begin
      KBSR <= MDR;
    end else if (_T_85) begin
      KBSR <= 16'h8000;
    end
    if (reset) begin
      DDR <= 16'h0;
    end else if (LD_DDR) begin
      DDR <= MDR;
    end
    if (reset) begin
      DSR <= 16'h0;
    end else if (LD_DSR) begin
      DSR <= MDR;
    end else begin
      DSR <= _T_94;
    end
    PRE_IR <= IR;
    if (reset) begin
      END <= 1'h0;
    end else begin
      END <= _GEN_2;
    end
    _T_95 <= _T_93 & io_signal_R_W;
  end
endmodule
module Memory(
  input         clock,
  input  [15:0] io_raddr,
  output [15:0] io_rdata,
  input  [15:0] io_waddr,
  input  [15:0] io_wdata,
  input         io_wen,
  output        io_R
);
  wire  dual_mem_clka; // @[Memory.scala 65:23]
  wire  dual_mem_wea; // @[Memory.scala 65:23]
  wire [15:0] dual_mem_addra; // @[Memory.scala 65:23]
  wire [15:0] dual_mem_dina; // @[Memory.scala 65:23]
  wire  dual_mem_clkb; // @[Memory.scala 65:23]
  wire [15:0] dual_mem_addrb; // @[Memory.scala 65:23]
  wire [15:0] dual_mem_doutb; // @[Memory.scala 65:23]
  // dual_mem dual_mem ( // @[Memory.scala 65:23]
  //   .clka(dual_mem_clka),
  //   .wea(dual_mem_wea),
  //   .addra(dual_mem_addra),
  //   .dina(dual_mem_dina),
  //   .clkb(dual_mem_clkb),
  //   .addrb(dual_mem_addrb),
  //   .doutb(dual_mem_doutb)
  // );
  sky130_sram_1rw1r_44x64_8 dual_mem ( // @[Memory.scala 65:23]
    .clk0(dual_mem_clka),
    .web0(dual_mem_wea),
    .addr0(dual_mem_addra),
    .din0(dual_mem_dina),
    .clk1(dual_mem_clkb),
    .addr1(dual_mem_addrb),
    .dout1(dual_mem_doutb)
  );
  assign io_rdata = dual_mem_doutb; // @[Memory.scala 72:21]
  assign io_R = 1'h1; // @[Memory.scala 92:8]
  assign dual_mem_clka = clock; // @[Memory.scala 66:21]
  assign dual_mem_wea = io_wen; // @[Memory.scala 67:21]
  assign dual_mem_addra = io_waddr; // @[Memory.scala 68:21]
  assign dual_mem_dina = io_wdata; // @[Memory.scala 69:21]
  assign dual_mem_clkb = clock; // @[Memory.scala 70:21]
  assign dual_mem_addrb = io_raddr; // @[Memory.scala 71:21]
endmodule
module UartRX(
  input        clock,
  input        reset,
  input        io_rxd,
  input        io_channel_ready,
  output       io_channel_valid,
  output [7:0] io_channel_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  wire [8:0] BIT_CNT = 9'h1b2 - 9'h1; // @[Uart.scala 95:40]
  reg  _T_1; // @[Uart.scala 99:30]
  reg  rxReg; // @[Uart.scala 99:22]
  reg [7:0] shiftReg; // @[Uart.scala 101:25]
  reg [19:0] cntReg; // @[Uart.scala 102:23]
  reg [3:0] bitsReg; // @[Uart.scala 103:24]
  reg  valReg; // @[Uart.scala 104:23]
  wire  _T_2 = cntReg != 20'h0; // @[Uart.scala 106:15]
  wire [19:0] _T_4 = cntReg - 20'h1; // @[Uart.scala 107:22]
  wire  _T_5 = bitsReg != 4'h0; // @[Uart.scala 108:22]
  wire [7:0] _T_7 = {rxReg,shiftReg[7:1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_9 = bitsReg - 4'h1; // @[Uart.scala 111:24]
  wire  _T_10 = bitsReg == 4'h1; // @[Uart.scala 113:18]
  wire  _GEN_0 = _T_10 | valReg; // @[Uart.scala 113:27]
  wire  _T_11 = ~rxReg; // @[Uart.scala 116:20]
  wire  _T_12 = valReg & io_channel_ready; // @[Uart.scala 121:15]
  assign io_channel_valid = valReg; // @[Uart.scala 126:20]
  assign io_channel_bits = shiftReg; // @[Uart.scala 125:19]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T_1 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  rxReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  shiftReg = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  cntReg = _RAND_3[19:0];
  _RAND_4 = {1{`RANDOM}};
  bitsReg = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  valReg = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    _T_1 <= reset | io_rxd;
    rxReg <= reset | _T_1;
    if (reset) begin
      shiftReg <= 8'h0;
    end else if (!(_T_2)) begin
      if (_T_5) begin
        shiftReg <= _T_7;
      end
    end
    if (reset) begin
      cntReg <= 20'h0;
    end else if (_T_2) begin
      cntReg <= _T_4;
    end else if (_T_5) begin
      cntReg <= {{11'd0}, BIT_CNT};
    end else if (_T_11) begin
      cntReg <= 20'h28b;
    end
    if (reset) begin
      bitsReg <= 4'h0;
    end else if (!(_T_2)) begin
      if (_T_5) begin
        bitsReg <= _T_9;
      end else if (_T_11) begin
        bitsReg <= 4'h8;
      end
    end
    if (reset) begin
      valReg <= 1'h0;
    end else if (_T_12) begin
      valReg <= 1'h0;
    end else if (!(_T_2)) begin
      if (_T_5) begin
        valReg <= _GEN_0;
      end
    end
  end
endmodule
module UartTX(
  input        clock,
  input        reset,
  output       io_txd,
  output       io_channel_ready,
  input        io_channel_valid,
  input  [7:0] io_channel_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire [8:0] BIT_CNT = 9'h1b2 - 9'h1; // @[Uart.scala 51:40]
  reg [10:0] shiftReg; // @[Uart.scala 53:25]
  reg [19:0] cntReg; // @[Uart.scala 54:23]
  reg [3:0] bitsReg; // @[Uart.scala 55:24]
  wire  _T_1 = cntReg == 20'h0; // @[Uart.scala 57:31]
  wire  _T_2 = bitsReg == 4'h0; // @[Uart.scala 57:52]
  wire  _T_6 = bitsReg != 4'h0; // @[Uart.scala 63:18]
  wire [10:0] _T_9 = {1'h1,shiftReg[10:1]}; // @[Cat.scala 29:58]
  wire [3:0] _T_11 = bitsReg - 4'h1; // @[Uart.scala 66:26]
  wire [10:0] _T_13 = {2'h3,io_channel_bits,1'h0}; // @[Cat.scala 29:58]
  wire [19:0] _T_15 = cntReg - 20'h1; // @[Uart.scala 77:22]
  assign io_txd = shiftReg[0]; // @[Uart.scala 58:10]
  assign io_channel_ready = _T_1 & _T_2; // @[Uart.scala 57:20]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  shiftReg = _RAND_0[10:0];
  _RAND_1 = {1{`RANDOM}};
  cntReg = _RAND_1[19:0];
  _RAND_2 = {1{`RANDOM}};
  bitsReg = _RAND_2[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      shiftReg <= 11'h7ff;
    end else if (_T_1) begin
      if (_T_6) begin
        shiftReg <= _T_9;
      end else if (io_channel_valid) begin
        shiftReg <= _T_13;
      end else begin
        shiftReg <= 11'h7ff;
      end
    end
    if (reset) begin
      cntReg <= 20'h0;
    end else if (_T_1) begin
      cntReg <= {{11'd0}, BIT_CNT};
    end else begin
      cntReg <= _T_15;
    end
    if (reset) begin
      bitsReg <= 4'h0;
    end else if (_T_1) begin
      if (_T_6) begin
        bitsReg <= _T_11;
      end else if (io_channel_valid) begin
        bitsReg <= 4'hb;
      end
    end
  end
endmodule
module Buffer(
  input        clock,
  input        reset,
  output       io_in_ready,
  input        io_in_valid,
  input  [7:0] io_in_bits,
  input        io_out_ready,
  output       io_out_valid,
  output [7:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  stateReg; // @[Uart.scala 139:25]
  reg [7:0] dataReg; // @[Uart.scala 140:24]
  wire  _T = ~stateReg; // @[Uart.scala 142:27]
  wire  _GEN_1 = io_in_valid | stateReg; // @[Uart.scala 146:23]
  assign io_in_ready = ~stateReg; // @[Uart.scala 142:15]
  assign io_out_valid = stateReg; // @[Uart.scala 143:16]
  assign io_out_bits = dataReg; // @[Uart.scala 155:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  dataReg = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      stateReg <= 1'h0;
    end else if (_T) begin
      stateReg <= _GEN_1;
    end else if (io_out_ready) begin
      stateReg <= 1'h0;
    end
    if (reset) begin
      dataReg <= 8'h0;
    end else if (_T) begin
      if (io_in_valid) begin
        dataReg <= io_in_bits;
      end
    end
  end
endmodule
module BufferedUartTX(
  input        clock,
  input        reset,
  output       io_txd,
  output       io_channel_ready,
  input        io_channel_valid,
  input  [7:0] io_channel_bits
);
  wire  tx_clock; // @[Uart.scala 166:18]
  wire  tx_reset; // @[Uart.scala 166:18]
  wire  tx_io_txd; // @[Uart.scala 166:18]
  wire  tx_io_channel_ready; // @[Uart.scala 166:18]
  wire  tx_io_channel_valid; // @[Uart.scala 166:18]
  wire [7:0] tx_io_channel_bits; // @[Uart.scala 166:18]
  wire  buf__clock; // @[Uart.scala 167:19]
  wire  buf__reset; // @[Uart.scala 167:19]
  wire  buf__io_in_ready; // @[Uart.scala 167:19]
  wire  buf__io_in_valid; // @[Uart.scala 167:19]
  wire [7:0] buf__io_in_bits; // @[Uart.scala 167:19]
  wire  buf__io_out_ready; // @[Uart.scala 167:19]
  wire  buf__io_out_valid; // @[Uart.scala 167:19]
  wire [7:0] buf__io_out_bits; // @[Uart.scala 167:19]
  UartTX tx ( // @[Uart.scala 166:18]
    .clock(tx_clock),
    .reset(tx_reset),
    .io_txd(tx_io_txd),
    .io_channel_ready(tx_io_channel_ready),
    .io_channel_valid(tx_io_channel_valid),
    .io_channel_bits(tx_io_channel_bits)
  );
  Buffer buf_ ( // @[Uart.scala 167:19]
    .clock(buf__clock),
    .reset(buf__reset),
    .io_in_ready(buf__io_in_ready),
    .io_in_valid(buf__io_in_valid),
    .io_in_bits(buf__io_in_bits),
    .io_out_ready(buf__io_out_ready),
    .io_out_valid(buf__io_out_valid),
    .io_out_bits(buf__io_out_bits)
  );
  assign io_txd = tx_io_txd; // @[Uart.scala 171:10]
  assign io_channel_ready = buf__io_in_ready; // @[Uart.scala 169:13]
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_channel_valid = buf__io_out_valid; // @[Uart.scala 170:17]
  assign tx_io_channel_bits = buf__io_out_bits; // @[Uart.scala 170:17]
  assign buf__clock = clock;
  assign buf__reset = reset;
  assign buf__io_in_valid = io_channel_valid; // @[Uart.scala 169:13]
  assign buf__io_in_bits = io_channel_bits; // @[Uart.scala 169:13]
  assign buf__io_out_ready = tx_io_channel_ready; // @[Uart.scala 170:17]
endmodule
module lc3(
  input   clock,
  input   reset,
  input   io_uart_rxd,
  output  io_uart_txd
);
  wire  boot_clock; // @[Top.scala 17:20]
  wire  boot_reset; // @[Top.scala 17:20]
  wire  boot_io_uartRx_ready; // @[Top.scala 17:20]
  wire  boot_io_uartRx_valid; // @[Top.scala 17:20]
  wire [7:0] boot_io_uartRx_bits; // @[Top.scala 17:20]
  wire  boot_io_work; // @[Top.scala 17:20]
  wire  boot_io_initPC_valid; // @[Top.scala 17:20]
  wire [15:0] boot_io_initPC_bits; // @[Top.scala 17:20]
  wire [15:0] boot_io_initMem_raddr; // @[Top.scala 17:20]
  wire [15:0] boot_io_initMem_rdata; // @[Top.scala 17:20]
  wire [15:0] boot_io_initMem_waddr; // @[Top.scala 17:20]
  wire [15:0] boot_io_initMem_wdata; // @[Top.scala 17:20]
  wire  boot_io_initMem_wen; // @[Top.scala 17:20]
  wire  boot_io_initMem_R; // @[Top.scala 17:20]
  wire  controller_clock; // @[Top.scala 18:26]
  wire  controller_reset; // @[Top.scala 18:26]
  wire [9:0] controller_io_in_sig; // @[Top.scala 18:26]
  wire  controller_io_in_int; // @[Top.scala 18:26]
  wire  controller_io_in_r; // @[Top.scala 18:26]
  wire [3:0] controller_io_in_ir; // @[Top.scala 18:26]
  wire  controller_io_in_ben; // @[Top.scala 18:26]
  wire  controller_io_in_psr; // @[Top.scala 18:26]
  wire  controller_io_out_LD_MAR; // @[Top.scala 18:26]
  wire  controller_io_out_LD_MDR; // @[Top.scala 18:26]
  wire  controller_io_out_LD_IR; // @[Top.scala 18:26]
  wire  controller_io_out_LD_BEN; // @[Top.scala 18:26]
  wire  controller_io_out_LD_REG; // @[Top.scala 18:26]
  wire  controller_io_out_LD_CC; // @[Top.scala 18:26]
  wire  controller_io_out_LD_PC; // @[Top.scala 18:26]
  wire  controller_io_out_LD_PRIV; // @[Top.scala 18:26]
  wire  controller_io_out_LD_SAVEDSSP; // @[Top.scala 18:26]
  wire  controller_io_out_LD_SAVEDUSP; // @[Top.scala 18:26]
  wire  controller_io_out_LD_VECTOR; // @[Top.scala 18:26]
  wire  controller_io_out_GATE_PC; // @[Top.scala 18:26]
  wire  controller_io_out_GATE_MDR; // @[Top.scala 18:26]
  wire  controller_io_out_GATE_ALU; // @[Top.scala 18:26]
  wire  controller_io_out_GATE_MARMUX; // @[Top.scala 18:26]
  wire  controller_io_out_GATE_VECTOR; // @[Top.scala 18:26]
  wire  controller_io_out_GATE_PC1; // @[Top.scala 18:26]
  wire  controller_io_out_GATE_PSR; // @[Top.scala 18:26]
  wire  controller_io_out_GATE_SP; // @[Top.scala 18:26]
  wire [1:0] controller_io_out_PC_MUX; // @[Top.scala 18:26]
  wire [1:0] controller_io_out_DR_MUX; // @[Top.scala 18:26]
  wire [1:0] controller_io_out_SR1_MUX; // @[Top.scala 18:26]
  wire  controller_io_out_ADDR1_MUX; // @[Top.scala 18:26]
  wire [1:0] controller_io_out_ADDR2_MUX; // @[Top.scala 18:26]
  wire [1:0] controller_io_out_SP_MUX; // @[Top.scala 18:26]
  wire  controller_io_out_MAR_MUX; // @[Top.scala 18:26]
  wire [1:0] controller_io_out_VECTOR_MUX; // @[Top.scala 18:26]
  wire  controller_io_out_PSR_MUX; // @[Top.scala 18:26]
  wire [1:0] controller_io_out_ALUK; // @[Top.scala 18:26]
  wire  controller_io_out_MIO_EN; // @[Top.scala 18:26]
  wire  controller_io_out_R_W; // @[Top.scala 18:26]
  wire  controller_io_out_SET_PRIV; // @[Top.scala 18:26]
  wire  controller_io_work; // @[Top.scala 18:26]
  wire  controller_io_end; // @[Top.scala 18:26]
  wire  dataPath_clock; // @[Top.scala 19:24]
  wire  dataPath_reset; // @[Top.scala 19:24]
  wire  dataPath_io_signal_LD_MAR; // @[Top.scala 19:24]
  wire  dataPath_io_signal_LD_MDR; // @[Top.scala 19:24]
  wire  dataPath_io_signal_LD_IR; // @[Top.scala 19:24]
  wire  dataPath_io_signal_LD_BEN; // @[Top.scala 19:24]
  wire  dataPath_io_signal_LD_REG; // @[Top.scala 19:24]
  wire  dataPath_io_signal_LD_CC; // @[Top.scala 19:24]
  wire  dataPath_io_signal_LD_PC; // @[Top.scala 19:24]
  wire  dataPath_io_signal_LD_PRIV; // @[Top.scala 19:24]
  wire  dataPath_io_signal_LD_SAVEDSSP; // @[Top.scala 19:24]
  wire  dataPath_io_signal_LD_SAVEDUSP; // @[Top.scala 19:24]
  wire  dataPath_io_signal_LD_VECTOR; // @[Top.scala 19:24]
  wire  dataPath_io_signal_GATE_PC; // @[Top.scala 19:24]
  wire  dataPath_io_signal_GATE_MDR; // @[Top.scala 19:24]
  wire  dataPath_io_signal_GATE_ALU; // @[Top.scala 19:24]
  wire  dataPath_io_signal_GATE_MARMUX; // @[Top.scala 19:24]
  wire  dataPath_io_signal_GATE_VECTOR; // @[Top.scala 19:24]
  wire  dataPath_io_signal_GATE_PC1; // @[Top.scala 19:24]
  wire  dataPath_io_signal_GATE_PSR; // @[Top.scala 19:24]
  wire  dataPath_io_signal_GATE_SP; // @[Top.scala 19:24]
  wire [1:0] dataPath_io_signal_PC_MUX; // @[Top.scala 19:24]
  wire [1:0] dataPath_io_signal_DR_MUX; // @[Top.scala 19:24]
  wire [1:0] dataPath_io_signal_SR1_MUX; // @[Top.scala 19:24]
  wire  dataPath_io_signal_ADDR1_MUX; // @[Top.scala 19:24]
  wire [1:0] dataPath_io_signal_ADDR2_MUX; // @[Top.scala 19:24]
  wire [1:0] dataPath_io_signal_SP_MUX; // @[Top.scala 19:24]
  wire  dataPath_io_signal_MAR_MUX; // @[Top.scala 19:24]
  wire [1:0] dataPath_io_signal_VECTOR_MUX; // @[Top.scala 19:24]
  wire  dataPath_io_signal_PSR_MUX; // @[Top.scala 19:24]
  wire [1:0] dataPath_io_signal_ALUK; // @[Top.scala 19:24]
  wire  dataPath_io_signal_MIO_EN; // @[Top.scala 19:24]
  wire  dataPath_io_signal_R_W; // @[Top.scala 19:24]
  wire  dataPath_io_signal_SET_PRIV; // @[Top.scala 19:24]
  wire [15:0] dataPath_io_mem_raddr; // @[Top.scala 19:24]
  wire [15:0] dataPath_io_mem_rdata; // @[Top.scala 19:24]
  wire [15:0] dataPath_io_mem_waddr; // @[Top.scala 19:24]
  wire [15:0] dataPath_io_mem_wdata; // @[Top.scala 19:24]
  wire  dataPath_io_mem_wen; // @[Top.scala 19:24]
  wire  dataPath_io_mem_R; // @[Top.scala 19:24]
  wire [9:0] dataPath_io_out_sig; // @[Top.scala 19:24]
  wire  dataPath_io_out_int; // @[Top.scala 19:24]
  wire  dataPath_io_out_r; // @[Top.scala 19:24]
  wire [3:0] dataPath_io_out_ir; // @[Top.scala 19:24]
  wire  dataPath_io_out_ben; // @[Top.scala 19:24]
  wire  dataPath_io_out_psr; // @[Top.scala 19:24]
  wire  dataPath_io_initPC_valid; // @[Top.scala 19:24]
  wire [15:0] dataPath_io_initPC_bits; // @[Top.scala 19:24]
  wire  dataPath_io_uartRx_ready; // @[Top.scala 19:24]
  wire  dataPath_io_uartRx_valid; // @[Top.scala 19:24]
  wire [7:0] dataPath_io_uartRx_bits; // @[Top.scala 19:24]
  wire  dataPath_io_uartTx_ready; // @[Top.scala 19:24]
  wire  dataPath_io_uartTx_valid; // @[Top.scala 19:24]
  wire [7:0] dataPath_io_uartTx_bits; // @[Top.scala 19:24]
  wire  dataPath_io_end; // @[Top.scala 19:24]
  wire  memory_clock; // @[Top.scala 20:22]
  wire [15:0] memory_io_raddr; // @[Top.scala 20:22]
  wire [15:0] memory_io_rdata; // @[Top.scala 20:22]
  wire [15:0] memory_io_waddr; // @[Top.scala 20:22]
  wire [15:0] memory_io_wdata; // @[Top.scala 20:22]
  wire  memory_io_wen; // @[Top.scala 20:22]
  wire  memory_io_R; // @[Top.scala 20:22]
  wire  UartRX_clock; // @[Top.scala 23:24]
  wire  UartRX_reset; // @[Top.scala 23:24]
  wire  UartRX_io_rxd; // @[Top.scala 23:24]
  wire  UartRX_io_channel_ready; // @[Top.scala 23:24]
  wire  UartRX_io_channel_valid; // @[Top.scala 23:24]
  wire [7:0] UartRX_io_channel_bits; // @[Top.scala 23:24]
  wire  BufferedUartTX_clock; // @[Top.scala 24:24]
  wire  BufferedUartTX_reset; // @[Top.scala 24:24]
  wire  BufferedUartTX_io_txd; // @[Top.scala 24:24]
  wire  BufferedUartTX_io_channel_ready; // @[Top.scala 24:24]
  wire  BufferedUartTX_io_channel_valid; // @[Top.scala 24:24]
  wire [7:0] BufferedUartTX_io_channel_bits; // @[Top.scala 24:24]
  Boot boot ( // @[Top.scala 17:20]
    .clock(boot_clock),
    .reset(boot_reset),
    .io_uartRx_ready(boot_io_uartRx_ready),
    .io_uartRx_valid(boot_io_uartRx_valid),
    .io_uartRx_bits(boot_io_uartRx_bits),
    .io_work(boot_io_work),
    .io_initPC_valid(boot_io_initPC_valid),
    .io_initPC_bits(boot_io_initPC_bits),
    .io_initMem_raddr(boot_io_initMem_raddr),
    .io_initMem_rdata(boot_io_initMem_rdata),
    .io_initMem_waddr(boot_io_initMem_waddr),
    .io_initMem_wdata(boot_io_initMem_wdata),
    .io_initMem_wen(boot_io_initMem_wen),
    .io_initMem_R(boot_io_initMem_R)
  );
  Controller controller ( // @[Top.scala 18:26]
    .clock(controller_clock),
    .reset(controller_reset),
    .io_in_sig(controller_io_in_sig),
    .io_in_int(controller_io_in_int),
    .io_in_r(controller_io_in_r),
    .io_in_ir(controller_io_in_ir),
    .io_in_ben(controller_io_in_ben),
    .io_in_psr(controller_io_in_psr),
    .io_out_LD_MAR(controller_io_out_LD_MAR),
    .io_out_LD_MDR(controller_io_out_LD_MDR),
    .io_out_LD_IR(controller_io_out_LD_IR),
    .io_out_LD_BEN(controller_io_out_LD_BEN),
    .io_out_LD_REG(controller_io_out_LD_REG),
    .io_out_LD_CC(controller_io_out_LD_CC),
    .io_out_LD_PC(controller_io_out_LD_PC),
    .io_out_LD_PRIV(controller_io_out_LD_PRIV),
    .io_out_LD_SAVEDSSP(controller_io_out_LD_SAVEDSSP),
    .io_out_LD_SAVEDUSP(controller_io_out_LD_SAVEDUSP),
    .io_out_LD_VECTOR(controller_io_out_LD_VECTOR),
    .io_out_GATE_PC(controller_io_out_GATE_PC),
    .io_out_GATE_MDR(controller_io_out_GATE_MDR),
    .io_out_GATE_ALU(controller_io_out_GATE_ALU),
    .io_out_GATE_MARMUX(controller_io_out_GATE_MARMUX),
    .io_out_GATE_VECTOR(controller_io_out_GATE_VECTOR),
    .io_out_GATE_PC1(controller_io_out_GATE_PC1),
    .io_out_GATE_PSR(controller_io_out_GATE_PSR),
    .io_out_GATE_SP(controller_io_out_GATE_SP),
    .io_out_PC_MUX(controller_io_out_PC_MUX),
    .io_out_DR_MUX(controller_io_out_DR_MUX),
    .io_out_SR1_MUX(controller_io_out_SR1_MUX),
    .io_out_ADDR1_MUX(controller_io_out_ADDR1_MUX),
    .io_out_ADDR2_MUX(controller_io_out_ADDR2_MUX),
    .io_out_SP_MUX(controller_io_out_SP_MUX),
    .io_out_MAR_MUX(controller_io_out_MAR_MUX),
    .io_out_VECTOR_MUX(controller_io_out_VECTOR_MUX),
    .io_out_PSR_MUX(controller_io_out_PSR_MUX),
    .io_out_ALUK(controller_io_out_ALUK),
    .io_out_MIO_EN(controller_io_out_MIO_EN),
    .io_out_R_W(controller_io_out_R_W),
    .io_out_SET_PRIV(controller_io_out_SET_PRIV),
    .io_work(controller_io_work),
    .io_end(controller_io_end)
  );
  DataPath dataPath ( // @[Top.scala 19:24]
    .clock(dataPath_clock),
    .reset(dataPath_reset),
    .io_signal_LD_MAR(dataPath_io_signal_LD_MAR),
    .io_signal_LD_MDR(dataPath_io_signal_LD_MDR),
    .io_signal_LD_IR(dataPath_io_signal_LD_IR),
    .io_signal_LD_BEN(dataPath_io_signal_LD_BEN),
    .io_signal_LD_REG(dataPath_io_signal_LD_REG),
    .io_signal_LD_CC(dataPath_io_signal_LD_CC),
    .io_signal_LD_PC(dataPath_io_signal_LD_PC),
    .io_signal_LD_PRIV(dataPath_io_signal_LD_PRIV),
    .io_signal_LD_SAVEDSSP(dataPath_io_signal_LD_SAVEDSSP),
    .io_signal_LD_SAVEDUSP(dataPath_io_signal_LD_SAVEDUSP),
    .io_signal_LD_VECTOR(dataPath_io_signal_LD_VECTOR),
    .io_signal_GATE_PC(dataPath_io_signal_GATE_PC),
    .io_signal_GATE_MDR(dataPath_io_signal_GATE_MDR),
    .io_signal_GATE_ALU(dataPath_io_signal_GATE_ALU),
    .io_signal_GATE_MARMUX(dataPath_io_signal_GATE_MARMUX),
    .io_signal_GATE_VECTOR(dataPath_io_signal_GATE_VECTOR),
    .io_signal_GATE_PC1(dataPath_io_signal_GATE_PC1),
    .io_signal_GATE_PSR(dataPath_io_signal_GATE_PSR),
    .io_signal_GATE_SP(dataPath_io_signal_GATE_SP),
    .io_signal_PC_MUX(dataPath_io_signal_PC_MUX),
    .io_signal_DR_MUX(dataPath_io_signal_DR_MUX),
    .io_signal_SR1_MUX(dataPath_io_signal_SR1_MUX),
    .io_signal_ADDR1_MUX(dataPath_io_signal_ADDR1_MUX),
    .io_signal_ADDR2_MUX(dataPath_io_signal_ADDR2_MUX),
    .io_signal_SP_MUX(dataPath_io_signal_SP_MUX),
    .io_signal_MAR_MUX(dataPath_io_signal_MAR_MUX),
    .io_signal_VECTOR_MUX(dataPath_io_signal_VECTOR_MUX),
    .io_signal_PSR_MUX(dataPath_io_signal_PSR_MUX),
    .io_signal_ALUK(dataPath_io_signal_ALUK),
    .io_signal_MIO_EN(dataPath_io_signal_MIO_EN),
    .io_signal_R_W(dataPath_io_signal_R_W),
    .io_signal_SET_PRIV(dataPath_io_signal_SET_PRIV),
    .io_mem_raddr(dataPath_io_mem_raddr),
    .io_mem_rdata(dataPath_io_mem_rdata),
    .io_mem_waddr(dataPath_io_mem_waddr),
    .io_mem_wdata(dataPath_io_mem_wdata),
    .io_mem_wen(dataPath_io_mem_wen),
    .io_mem_R(dataPath_io_mem_R),
    .io_out_sig(dataPath_io_out_sig),
    .io_out_int(dataPath_io_out_int),
    .io_out_r(dataPath_io_out_r),
    .io_out_ir(dataPath_io_out_ir),
    .io_out_ben(dataPath_io_out_ben),
    .io_out_psr(dataPath_io_out_psr),
    .io_initPC_valid(dataPath_io_initPC_valid),
    .io_initPC_bits(dataPath_io_initPC_bits),
    .io_uartRx_ready(dataPath_io_uartRx_ready),
    .io_uartRx_valid(dataPath_io_uartRx_valid),
    .io_uartRx_bits(dataPath_io_uartRx_bits),
    .io_uartTx_ready(dataPath_io_uartTx_ready),
    .io_uartTx_valid(dataPath_io_uartTx_valid),
    .io_uartTx_bits(dataPath_io_uartTx_bits),
    .io_end(dataPath_io_end)
  );
  Memory memory ( // @[Top.scala 20:22]
    .clock(memory_clock),
    .io_raddr(memory_io_raddr),
    .io_rdata(memory_io_rdata),
    .io_waddr(memory_io_waddr),
    .io_wdata(memory_io_wdata),
    .io_wen(memory_io_wen),
    .io_R(memory_io_R)
  );
  UartRX UartRX ( // @[Top.scala 23:24]
    .clock(UartRX_clock),
    .reset(UartRX_reset),
    .io_rxd(UartRX_io_rxd),
    .io_channel_ready(UartRX_io_channel_ready),
    .io_channel_valid(UartRX_io_channel_valid),
    .io_channel_bits(UartRX_io_channel_bits)
  );
  BufferedUartTX BufferedUartTX ( // @[Top.scala 24:24]
    .clock(BufferedUartTX_clock),
    .reset(BufferedUartTX_reset),
    .io_txd(BufferedUartTX_io_txd),
    .io_channel_ready(BufferedUartTX_io_channel_ready),
    .io_channel_valid(BufferedUartTX_io_channel_valid),
    .io_channel_bits(BufferedUartTX_io_channel_bits)
  );
  assign io_uart_txd = BufferedUartTX_io_txd; // @[Top.scala 27:19]
  assign boot_clock = clock;
  assign boot_reset = reset;
  assign boot_io_uartRx_valid = boot_io_work ? 1'h0 : UartRX_io_channel_valid; // @[Top.scala 32:28 Top.scala 36:22]
  assign boot_io_uartRx_bits = UartRX_io_channel_bits; // @[Top.scala 36:22]
  assign boot_io_initMem_rdata = 16'h0;
  assign boot_io_initMem_R = 1'h0;
  assign controller_clock = clock;
  assign controller_reset = reset;
  assign controller_io_in_sig = dataPath_io_out_sig; // @[Top.scala 71:20]
  assign controller_io_in_int = dataPath_io_out_int; // @[Top.scala 71:20]
  assign controller_io_in_r = dataPath_io_out_r; // @[Top.scala 71:20]
  assign controller_io_in_ir = dataPath_io_out_ir; // @[Top.scala 71:20]
  assign controller_io_in_ben = dataPath_io_out_ben; // @[Top.scala 71:20]
  assign controller_io_in_psr = dataPath_io_out_psr; // @[Top.scala 71:20]
  assign controller_io_work = boot_io_work; // @[Top.scala 72:22]
  assign controller_io_end = dataPath_io_end; // @[Top.scala 40:23]
  assign dataPath_clock = clock;
  assign dataPath_reset = reset;
  assign dataPath_io_signal_LD_MAR = controller_io_out_LD_MAR; // @[Top.scala 74:22]
  assign dataPath_io_signal_LD_MDR = controller_io_out_LD_MDR; // @[Top.scala 74:22]
  assign dataPath_io_signal_LD_IR = controller_io_out_LD_IR; // @[Top.scala 74:22]
  assign dataPath_io_signal_LD_BEN = controller_io_out_LD_BEN; // @[Top.scala 74:22]
  assign dataPath_io_signal_LD_REG = controller_io_out_LD_REG; // @[Top.scala 74:22]
  assign dataPath_io_signal_LD_CC = controller_io_out_LD_CC; // @[Top.scala 74:22]
  assign dataPath_io_signal_LD_PC = controller_io_out_LD_PC; // @[Top.scala 74:22]
  assign dataPath_io_signal_LD_PRIV = controller_io_out_LD_PRIV; // @[Top.scala 74:22]
  assign dataPath_io_signal_LD_SAVEDSSP = controller_io_out_LD_SAVEDSSP; // @[Top.scala 74:22]
  assign dataPath_io_signal_LD_SAVEDUSP = controller_io_out_LD_SAVEDUSP; // @[Top.scala 74:22]
  assign dataPath_io_signal_LD_VECTOR = controller_io_out_LD_VECTOR; // @[Top.scala 74:22]
  assign dataPath_io_signal_GATE_PC = controller_io_out_GATE_PC; // @[Top.scala 74:22]
  assign dataPath_io_signal_GATE_MDR = controller_io_out_GATE_MDR; // @[Top.scala 74:22]
  assign dataPath_io_signal_GATE_ALU = controller_io_out_GATE_ALU; // @[Top.scala 74:22]
  assign dataPath_io_signal_GATE_MARMUX = controller_io_out_GATE_MARMUX; // @[Top.scala 74:22]
  assign dataPath_io_signal_GATE_VECTOR = controller_io_out_GATE_VECTOR; // @[Top.scala 74:22]
  assign dataPath_io_signal_GATE_PC1 = controller_io_out_GATE_PC1; // @[Top.scala 74:22]
  assign dataPath_io_signal_GATE_PSR = controller_io_out_GATE_PSR; // @[Top.scala 74:22]
  assign dataPath_io_signal_GATE_SP = controller_io_out_GATE_SP; // @[Top.scala 74:22]
  assign dataPath_io_signal_PC_MUX = controller_io_out_PC_MUX; // @[Top.scala 74:22]
  assign dataPath_io_signal_DR_MUX = controller_io_out_DR_MUX; // @[Top.scala 74:22]
  assign dataPath_io_signal_SR1_MUX = controller_io_out_SR1_MUX; // @[Top.scala 74:22]
  assign dataPath_io_signal_ADDR1_MUX = controller_io_out_ADDR1_MUX; // @[Top.scala 74:22]
  assign dataPath_io_signal_ADDR2_MUX = controller_io_out_ADDR2_MUX; // @[Top.scala 74:22]
  assign dataPath_io_signal_SP_MUX = controller_io_out_SP_MUX; // @[Top.scala 74:22]
  assign dataPath_io_signal_MAR_MUX = controller_io_out_MAR_MUX; // @[Top.scala 74:22]
  assign dataPath_io_signal_VECTOR_MUX = controller_io_out_VECTOR_MUX; // @[Top.scala 74:22]
  assign dataPath_io_signal_PSR_MUX = controller_io_out_PSR_MUX; // @[Top.scala 74:22]
  assign dataPath_io_signal_ALUK = controller_io_out_ALUK; // @[Top.scala 74:22]
  assign dataPath_io_signal_MIO_EN = controller_io_out_MIO_EN; // @[Top.scala 74:22]
  assign dataPath_io_signal_R_W = controller_io_out_R_W; // @[Top.scala 74:22]
  assign dataPath_io_signal_SET_PRIV = controller_io_out_SET_PRIV; // @[Top.scala 74:22]
  assign dataPath_io_mem_rdata = memory_io_rdata; // @[Top.scala 77:13]
  assign dataPath_io_mem_R = memory_io_R; // @[Top.scala 77:13]
  assign dataPath_io_initPC_valid = boot_io_initPC_valid; // @[Top.scala 75:22]
  assign dataPath_io_initPC_bits = boot_io_initPC_bits; // @[Top.scala 75:22]
  assign dataPath_io_uartRx_valid = boot_io_work & UartRX_io_channel_valid; // @[Top.scala 30:26 Top.scala 35:32]
  assign dataPath_io_uartRx_bits = UartRX_io_channel_bits; // @[Top.scala 30:26]
  assign dataPath_io_uartTx_ready = BufferedUartTX_io_channel_ready; // @[Top.scala 39:23]
  assign memory_clock = clock;
  assign memory_io_raddr = dataPath_io_mem_raddr; // @[Top.scala 77:13]
  assign memory_io_waddr = boot_io_work ? dataPath_io_mem_waddr : boot_io_initMem_waddr; // @[Top.scala 77:13 Top.scala 78:19]
  assign memory_io_wdata = boot_io_work ? dataPath_io_mem_wdata : boot_io_initMem_wdata; // @[Top.scala 77:13 Top.scala 79:19]
  assign memory_io_wen = boot_io_work ? dataPath_io_mem_wen : boot_io_initMem_wen; // @[Top.scala 77:13 Top.scala 80:17]
  assign UartRX_clock = clock;
  assign UartRX_reset = reset;
  assign UartRX_io_rxd = io_uart_rxd; // @[Top.scala 26:19]
  assign UartRX_io_channel_ready = boot_io_work ? dataPath_io_uartRx_ready : boot_io_uartRx_ready; // @[Top.scala 30:26 Top.scala 36:22]
  assign BufferedUartTX_clock = clock;
  assign BufferedUartTX_reset = reset;
  assign BufferedUartTX_io_channel_valid = dataPath_io_uartTx_valid; // @[Top.scala 39:23]
  assign BufferedUartTX_io_channel_bits = dataPath_io_uartTx_bits; // @[Top.scala 39:23]
endmodule
