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