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