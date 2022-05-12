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