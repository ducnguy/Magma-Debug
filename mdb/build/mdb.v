module Addcout8 (input [7:0] I0, input [7:0] I1, output [7:0] O, output  COUT);
wire  inst0_O;
wire  inst1_CO;
wire  inst2_O;
wire  inst3_CO;
wire  inst4_O;
wire  inst5_CO;
wire  inst6_O;
wire  inst7_CO;
wire  inst8_O;
wire  inst9_CO;
wire  inst10_O;
wire  inst11_CO;
wire  inst12_O;
wire  inst13_CO;
wire  inst14_O;
wire  inst15_CO;
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst0 (.I0(1'b0), .I1(I0[0]), .I2(I1[0]), .I3(1'b0), .O(inst0_O));
SB_CARRY inst1 (.I0(I0[0]), .I1(I1[0]), .CI(1'b0), .CO(inst1_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst2 (.I0(1'b0), .I1(I0[1]), .I2(I1[1]), .I3(inst1_CO), .O(inst2_O));
SB_CARRY inst3 (.I0(I0[1]), .I1(I1[1]), .CI(inst1_CO), .CO(inst3_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst4 (.I0(1'b0), .I1(I0[2]), .I2(I1[2]), .I3(inst3_CO), .O(inst4_O));
SB_CARRY inst5 (.I0(I0[2]), .I1(I1[2]), .CI(inst3_CO), .CO(inst5_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst6 (.I0(1'b0), .I1(I0[3]), .I2(I1[3]), .I3(inst5_CO), .O(inst6_O));
SB_CARRY inst7 (.I0(I0[3]), .I1(I1[3]), .CI(inst5_CO), .CO(inst7_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst8 (.I0(1'b0), .I1(I0[4]), .I2(I1[4]), .I3(inst7_CO), .O(inst8_O));
SB_CARRY inst9 (.I0(I0[4]), .I1(I1[4]), .CI(inst7_CO), .CO(inst9_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst10 (.I0(1'b0), .I1(I0[5]), .I2(I1[5]), .I3(inst9_CO), .O(inst10_O));
SB_CARRY inst11 (.I0(I0[5]), .I1(I1[5]), .CI(inst9_CO), .CO(inst11_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst12 (.I0(1'b0), .I1(I0[6]), .I2(I1[6]), .I3(inst11_CO), .O(inst12_O));
SB_CARRY inst13 (.I0(I0[6]), .I1(I1[6]), .CI(inst11_CO), .CO(inst13_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst14 (.I0(1'b0), .I1(I0[7]), .I2(I1[7]), .I3(inst13_CO), .O(inst14_O));
SB_CARRY inst15 (.I0(I0[7]), .I1(I1[7]), .CI(inst13_CO), .CO(inst15_CO));
assign O = {inst14_O,inst12_O,inst10_O,inst8_O,inst6_O,inst4_O,inst2_O,inst0_O};
assign COUT = inst15_CO;
endmodule

module Register8CE (input [7:0] I, output [7:0] O, input  CLK, input  CE);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
wire  inst6_Q;
wire  inst7_Q;
SB_DFFE inst0 (.C(CLK), .E(CE), .D(I[0]), .Q(inst0_Q));
SB_DFFE inst1 (.C(CLK), .E(CE), .D(I[1]), .Q(inst1_Q));
SB_DFFE inst2 (.C(CLK), .E(CE), .D(I[2]), .Q(inst2_Q));
SB_DFFE inst3 (.C(CLK), .E(CE), .D(I[3]), .Q(inst3_Q));
SB_DFFE inst4 (.C(CLK), .E(CE), .D(I[4]), .Q(inst4_Q));
SB_DFFE inst5 (.C(CLK), .E(CE), .D(I[5]), .Q(inst5_Q));
SB_DFFE inst6 (.C(CLK), .E(CE), .D(I[6]), .Q(inst6_Q));
SB_DFFE inst7 (.C(CLK), .E(CE), .D(I[7]), .Q(inst7_Q));
assign O = {inst7_Q,inst6_Q,inst5_Q,inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module Counter8CE (output [7:0] O, output  COUT, input  CLK, input  CE);
wire [7:0] inst0_O;
wire  inst0_COUT;
wire [7:0] inst1_O;
Addcout8 inst0 (.I0(inst1_O), .I1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}), .O(inst0_O), .COUT(inst0_COUT));
Register8CE inst1 (.I(inst0_O), .O(inst1_O), .CLK(CLK), .CE(CE));
assign O = inst1_O;
assign COUT = inst0_COUT;
endmodule

module Addcout3 (input [2:0] I0, input [2:0] I1, output [2:0] O, output  COUT);
wire  inst0_O;
wire  inst1_CO;
wire  inst2_O;
wire  inst3_CO;
wire  inst4_O;
wire  inst5_CO;
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst0 (.I0(1'b0), .I1(I0[0]), .I2(I1[0]), .I3(1'b0), .O(inst0_O));
SB_CARRY inst1 (.I0(I0[0]), .I1(I1[0]), .CI(1'b0), .CO(inst1_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst2 (.I0(1'b0), .I1(I0[1]), .I2(I1[1]), .I3(inst1_CO), .O(inst2_O));
SB_CARRY inst3 (.I0(I0[1]), .I1(I1[1]), .CI(inst1_CO), .CO(inst3_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst4 (.I0(1'b0), .I1(I0[2]), .I2(I1[2]), .I3(inst3_CO), .O(inst4_O));
SB_CARRY inst5 (.I0(I0[2]), .I1(I1[2]), .CI(inst3_CO), .CO(inst5_CO));
assign O = {inst4_O,inst2_O,inst0_O};
assign COUT = inst5_CO;
endmodule

module Register3CE (input [2:0] I, output [2:0] O, input  CLK, input  CE);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
SB_DFFE inst0 (.C(CLK), .E(CE), .D(I[0]), .Q(inst0_Q));
SB_DFFE inst1 (.C(CLK), .E(CE), .D(I[1]), .Q(inst1_Q));
SB_DFFE inst2 (.C(CLK), .E(CE), .D(I[2]), .Q(inst2_Q));
assign O = {inst2_Q,inst1_Q,inst0_Q};
endmodule

module Counter3CE (output [2:0] O, output  COUT, input  CLK, input  CE);
wire [2:0] inst0_O;
wire  inst0_COUT;
wire [2:0] inst1_O;
Addcout3 inst0 (.I0(inst1_O), .I1({1'b0,1'b0,1'b1}), .O(inst0_O), .COUT(inst0_COUT));
Register3CE inst1 (.I(inst0_O), .O(inst1_O), .CLK(CLK), .CE(CE));
assign O = inst1_O;
assign COUT = inst0_COUT;
endmodule

module Mux2x8 (input [7:0] I0, input [7:0] I1, input  S, output [7:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst0 (.I0(I0[0]), .I1(I1[0]), .I2(S), .I3(1'b0), .O(inst0_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst1 (.I0(I0[1]), .I1(I1[1]), .I2(S), .I3(1'b0), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst2 (.I0(I0[2]), .I1(I1[2]), .I2(S), .I3(1'b0), .O(inst2_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst3 (.I0(I0[3]), .I1(I1[3]), .I2(S), .I3(1'b0), .O(inst3_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst4 (.I0(I0[4]), .I1(I1[4]), .I2(S), .I3(1'b0), .O(inst4_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst5 (.I0(I0[5]), .I1(I1[5]), .I2(S), .I3(1'b0), .O(inst5_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst6 (.I0(I0[6]), .I1(I1[6]), .I2(S), .I3(1'b0), .O(inst6_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst7 (.I0(I0[7]), .I1(I1[7]), .I2(S), .I3(1'b0), .O(inst7_O));
assign O = {inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

module Register8CER (input [7:0] I, output [7:0] O, input  CLK, input  CE, input  RESET);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
wire  inst6_Q;
wire  inst7_Q;
SB_DFFESR inst0 (.C(CLK), .R(RESET), .E(CE), .D(I[0]), .Q(inst0_Q));
SB_DFFESR inst1 (.C(CLK), .R(RESET), .E(CE), .D(I[1]), .Q(inst1_Q));
SB_DFFESR inst2 (.C(CLK), .R(RESET), .E(CE), .D(I[2]), .Q(inst2_Q));
SB_DFFESR inst3 (.C(CLK), .R(RESET), .E(CE), .D(I[3]), .Q(inst3_Q));
SB_DFFESR inst4 (.C(CLK), .R(RESET), .E(CE), .D(I[4]), .Q(inst4_Q));
SB_DFFESR inst5 (.C(CLK), .R(RESET), .E(CE), .D(I[5]), .Q(inst5_Q));
SB_DFFESR inst6 (.C(CLK), .R(RESET), .E(CE), .D(I[6]), .Q(inst6_Q));
SB_DFFESR inst7 (.C(CLK), .R(RESET), .E(CE), .D(I[7]), .Q(inst7_Q));
assign O = {inst7_Q,inst6_Q,inst5_Q,inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module Counter8CER (output [7:0] O, output  COUT, input  CLK, input  CE, input  RESET);
wire [7:0] inst0_O;
wire  inst0_COUT;
wire [7:0] inst1_O;
Addcout8 inst0 (.I0(inst1_O), .I1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}), .O(inst0_O), .COUT(inst0_COUT));
Register8CER inst1 (.I(inst0_O), .O(inst1_O), .CLK(CLK), .CE(CE), .RESET(RESET));
assign O = inst1_O;
assign COUT = inst0_COUT;
endmodule

module CounterModM8CE (output [7:0] O, output  COUT, input  CLK, input  CE);
wire [7:0] inst0_O;
wire  inst0_COUT;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
wire  inst8_O;
wire  inst9_O;
wire  inst10_O;
wire  inst11_O;
wire  inst12_O;
wire  inst13_O;
wire  inst14_O;
wire  inst15_O;
wire  inst16_O;
wire  inst17_O;
wire  inst18_O;
wire  inst19_O;
wire  inst20_O;
wire  inst21_O;
wire  inst22_O;
wire  inst23_O;
wire  inst24_O;
wire  inst25_O;
wire  inst26_O;
wire  inst27_O;
wire  inst28_O;
wire  inst29_O;
wire  inst30_O;
wire  inst31_O;
wire  inst32_O;
Counter8CER inst0 (.O(inst0_O), .COUT(inst0_COUT), .CLK(CLK), .CE(CE), .RESET(inst32_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst1 (.I0(inst0_O[0]), .I1(inst0_O[1]), .I2(inst0_O[2]), .I3(inst0_O[3]), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst2 (.I0(inst0_O[0]), .I1(inst0_O[1]), .I2(inst0_O[2]), .I3(inst0_O[3]), .O(inst2_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst3 (.I0(inst1_O), .I1(inst2_O), .I2(inst0_O[4]), .I3(1'b0), .O(inst3_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst4 (.I0(inst0_O[0]), .I1(inst0_O[1]), .I2(inst0_O[2]), .I3(inst0_O[3]), .O(inst4_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst5 (.I0(inst0_O[0]), .I1(inst0_O[1]), .I2(inst0_O[2]), .I3(inst0_O[3]), .O(inst5_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst6 (.I0(inst4_O), .I1(inst5_O), .I2(inst0_O[4]), .I3(1'b0), .O(inst6_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst7 (.I0(inst3_O), .I1(inst6_O), .I2(inst0_O[5]), .I3(1'b0), .O(inst7_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst8 (.I0(inst0_O[0]), .I1(inst0_O[1]), .I2(inst0_O[2]), .I3(inst0_O[3]), .O(inst8_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst9 (.I0(inst0_O[0]), .I1(inst0_O[1]), .I2(inst0_O[2]), .I3(inst0_O[3]), .O(inst9_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst10 (.I0(inst8_O), .I1(inst9_O), .I2(inst0_O[4]), .I3(1'b0), .O(inst10_O));
SB_LUT4 #(.LUT_INIT(16'h0040)) inst11 (.I0(inst0_O[0]), .I1(inst0_O[1]), .I2(inst0_O[2]), .I3(inst0_O[3]), .O(inst11_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst12 (.I0(inst0_O[0]), .I1(inst0_O[1]), .I2(inst0_O[2]), .I3(inst0_O[3]), .O(inst12_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst13 (.I0(inst11_O), .I1(inst12_O), .I2(inst0_O[4]), .I3(1'b0), .O(inst13_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst14 (.I0(inst10_O), .I1(inst13_O), .I2(inst0_O[5]), .I3(1'b0), .O(inst14_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst15 (.I0(inst7_O), .I1(inst14_O), .I2(inst0_O[6]), .I3(1'b0), .O(inst15_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst16 (.I0(inst0_O[0]), .I1(inst0_O[1]), .I2(inst0_O[2]), .I3(inst0_O[3]), .O(inst16_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst17 (.I0(inst0_O[0]), .I1(inst0_O[1]), .I2(inst0_O[2]), .I3(inst0_O[3]), .O(inst17_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst18 (.I0(inst16_O), .I1(inst17_O), .I2(inst0_O[4]), .I3(1'b0), .O(inst18_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst19 (.I0(inst0_O[0]), .I1(inst0_O[1]), .I2(inst0_O[2]), .I3(inst0_O[3]), .O(inst19_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst20 (.I0(inst0_O[0]), .I1(inst0_O[1]), .I2(inst0_O[2]), .I3(inst0_O[3]), .O(inst20_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst21 (.I0(inst19_O), .I1(inst20_O), .I2(inst0_O[4]), .I3(1'b0), .O(inst21_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst22 (.I0(inst18_O), .I1(inst21_O), .I2(inst0_O[5]), .I3(1'b0), .O(inst22_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst23 (.I0(inst0_O[0]), .I1(inst0_O[1]), .I2(inst0_O[2]), .I3(inst0_O[3]), .O(inst23_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst24 (.I0(inst0_O[0]), .I1(inst0_O[1]), .I2(inst0_O[2]), .I3(inst0_O[3]), .O(inst24_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst25 (.I0(inst23_O), .I1(inst24_O), .I2(inst0_O[4]), .I3(1'b0), .O(inst25_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst26 (.I0(inst0_O[0]), .I1(inst0_O[1]), .I2(inst0_O[2]), .I3(inst0_O[3]), .O(inst26_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst27 (.I0(inst0_O[0]), .I1(inst0_O[1]), .I2(inst0_O[2]), .I3(inst0_O[3]), .O(inst27_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst28 (.I0(inst26_O), .I1(inst27_O), .I2(inst0_O[4]), .I3(1'b0), .O(inst28_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst29 (.I0(inst25_O), .I1(inst28_O), .I2(inst0_O[5]), .I3(1'b0), .O(inst29_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst30 (.I0(inst22_O), .I1(inst29_O), .I2(inst0_O[6]), .I3(1'b0), .O(inst30_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst31 (.I0(inst15_O), .I1(inst30_O), .I2(inst0_O[7]), .I3(1'b0), .O(inst31_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst32 (.I0(inst31_O), .I1(CE), .I2(1'b0), .I3(1'b0), .O(inst32_O));
assign O = inst0_O;
assign COUT = inst32_O;
endmodule

module Addcout5 (input [4:0] I0, input [4:0] I1, output [4:0] O, output  COUT);
wire  inst0_O;
wire  inst1_CO;
wire  inst2_O;
wire  inst3_CO;
wire  inst4_O;
wire  inst5_CO;
wire  inst6_O;
wire  inst7_CO;
wire  inst8_O;
wire  inst9_CO;
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst0 (.I0(1'b0), .I1(I0[0]), .I2(I1[0]), .I3(1'b0), .O(inst0_O));
SB_CARRY inst1 (.I0(I0[0]), .I1(I1[0]), .CI(1'b0), .CO(inst1_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst2 (.I0(1'b0), .I1(I0[1]), .I2(I1[1]), .I3(inst1_CO), .O(inst2_O));
SB_CARRY inst3 (.I0(I0[1]), .I1(I1[1]), .CI(inst1_CO), .CO(inst3_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst4 (.I0(1'b0), .I1(I0[2]), .I2(I1[2]), .I3(inst3_CO), .O(inst4_O));
SB_CARRY inst5 (.I0(I0[2]), .I1(I1[2]), .CI(inst3_CO), .CO(inst5_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst6 (.I0(1'b0), .I1(I0[3]), .I2(I1[3]), .I3(inst5_CO), .O(inst6_O));
SB_CARRY inst7 (.I0(I0[3]), .I1(I1[3]), .CI(inst5_CO), .CO(inst7_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst8 (.I0(1'b0), .I1(I0[4]), .I2(I1[4]), .I3(inst7_CO), .O(inst8_O));
SB_CARRY inst9 (.I0(I0[4]), .I1(I1[4]), .CI(inst7_CO), .CO(inst9_CO));
assign O = {inst8_O,inst6_O,inst4_O,inst2_O,inst0_O};
assign COUT = inst9_CO;
endmodule

module Register5CER (input [4:0] I, output [4:0] O, input  CLK, input  CE, input  RESET);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
SB_DFFESR inst0 (.C(CLK), .R(RESET), .E(CE), .D(I[0]), .Q(inst0_Q));
SB_DFFESR inst1 (.C(CLK), .R(RESET), .E(CE), .D(I[1]), .Q(inst1_Q));
SB_DFFESR inst2 (.C(CLK), .R(RESET), .E(CE), .D(I[2]), .Q(inst2_Q));
SB_DFFESR inst3 (.C(CLK), .R(RESET), .E(CE), .D(I[3]), .Q(inst3_Q));
SB_DFFESR inst4 (.C(CLK), .R(RESET), .E(CE), .D(I[4]), .Q(inst4_Q));
assign O = {inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module Counter5CER (output [4:0] O, output  COUT, input  CLK, input  CE, input  RESET);
wire [4:0] inst0_O;
wire  inst0_COUT;
wire [4:0] inst1_O;
Addcout5 inst0 (.I0(inst1_O), .I1({1'b0,1'b0,1'b0,1'b0,1'b1}), .O(inst0_O), .COUT(inst0_COUT));
Register5CER inst1 (.I(inst0_O), .O(inst1_O), .CLK(CLK), .CE(CE), .RESET(RESET));
assign O = inst1_O;
assign COUT = inst0_COUT;
endmodule

module Register10CE (input [9:0] I, output [9:0] O, input  CLK, input  CE);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
wire  inst6_Q;
wire  inst7_Q;
wire  inst8_Q;
wire  inst9_Q;
SB_DFFE inst0 (.C(CLK), .E(CE), .D(I[0]), .Q(inst0_Q));
SB_DFFE inst1 (.C(CLK), .E(CE), .D(I[1]), .Q(inst1_Q));
SB_DFFE inst2 (.C(CLK), .E(CE), .D(I[2]), .Q(inst2_Q));
SB_DFFE inst3 (.C(CLK), .E(CE), .D(I[3]), .Q(inst3_Q));
SB_DFFE inst4 (.C(CLK), .E(CE), .D(I[4]), .Q(inst4_Q));
SB_DFFE inst5 (.C(CLK), .E(CE), .D(I[5]), .Q(inst5_Q));
SB_DFFE inst6 (.C(CLK), .E(CE), .D(I[6]), .Q(inst6_Q));
SB_DFFE inst7 (.C(CLK), .E(CE), .D(I[7]), .Q(inst7_Q));
SB_DFFE inst8 (.C(CLK), .E(CE), .D(I[8]), .Q(inst8_Q));
SB_DFFE inst9 (.C(CLK), .E(CE), .D(I[9]), .Q(inst9_Q));
assign O = {inst9_Q,inst8_Q,inst7_Q,inst6_Q,inst5_Q,inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module PISO10CE (input  SI, input [9:0] PI, input  LOAD, output  O, input  CLK, input  CE);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
wire  inst8_O;
wire  inst9_O;
wire [9:0] inst10_O;
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst0 (.I0(SI), .I1(PI[0]), .I2(LOAD), .I3(1'b0), .O(inst0_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst1 (.I0(inst10_O[0]), .I1(PI[1]), .I2(LOAD), .I3(1'b0), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst2 (.I0(inst10_O[1]), .I1(PI[2]), .I2(LOAD), .I3(1'b0), .O(inst2_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst3 (.I0(inst10_O[2]), .I1(PI[3]), .I2(LOAD), .I3(1'b0), .O(inst3_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst4 (.I0(inst10_O[3]), .I1(PI[4]), .I2(LOAD), .I3(1'b0), .O(inst4_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst5 (.I0(inst10_O[4]), .I1(PI[5]), .I2(LOAD), .I3(1'b0), .O(inst5_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst6 (.I0(inst10_O[5]), .I1(PI[6]), .I2(LOAD), .I3(1'b0), .O(inst6_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst7 (.I0(inst10_O[6]), .I1(PI[7]), .I2(LOAD), .I3(1'b0), .O(inst7_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst8 (.I0(inst10_O[7]), .I1(PI[8]), .I2(LOAD), .I3(1'b0), .O(inst8_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst9 (.I0(inst10_O[8]), .I1(PI[9]), .I2(LOAD), .I3(1'b0), .O(inst9_O));
Register10CE inst10 (.I({inst9_O,inst8_O,inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O}), .O(inst10_O), .CLK(CLK), .CE(CE));
assign O = inst10_O[9];
endmodule

module main (input  CLKIN, input  DTR, input  RTS, output  TX);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_O;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_O;
wire [7:0] inst6_O;
wire  inst6_COUT;
wire [2:0] inst7_O;
wire  inst7_COUT;
wire [7:0] inst8_O;
wire [7:0] inst9_O;
wire [7:0] inst10_O;
wire [7:0] inst11_O;
wire [7:0] inst12_O;
wire [7:0] inst13_O;
wire [7:0] inst14_O;
wire [7:0] inst15_O;
wire  inst15_COUT;
wire [4:0] inst16_O;
wire  inst16_COUT;
wire  inst17_O;
wire  inst18_O;
wire  inst19_O;
wire  inst20_Q;
wire  inst21_O;
wire  inst22_O;
wire  inst23_O;
wire  inst24_O;
wire  inst25_O;
wire  inst26_O;
wire  inst27_O;
wire  inst28_Q;
wire  inst29_O;
SB_DFF inst0 (.C(CLKIN), .D(inst2_O), .Q(inst0_Q));
SB_DFF inst1 (.C(CLKIN), .D(RTS), .Q(inst1_Q));
SB_LUT4 #(.LUT_INIT(16'h0202)) inst2 (.I0(RTS), .I1(inst0_Q), .I2(inst1_Q), .I3(1'b0), .O(inst2_O));
SB_DFF inst3 (.C(CLKIN), .D(inst5_O), .Q(inst3_Q));
SB_DFF inst4 (.C(CLKIN), .D(DTR), .Q(inst4_Q));
SB_LUT4 #(.LUT_INIT(16'h0202)) inst5 (.I0(DTR), .I1(inst3_Q), .I2(inst4_Q), .I3(1'b0), .O(inst5_O));
Counter8CE inst6 (.O(inst6_O), .COUT(inst6_COUT), .CLK(CLKIN), .CE(inst3_Q));
Counter3CE inst7 (.O(inst7_O), .COUT(inst7_COUT), .CLK(CLKIN), .CE(inst25_O));
Mux2x8 inst8 (.I0(inst6_O), .I1({1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}), .S(inst7_O[0]), .O(inst8_O));
Mux2x8 inst9 (.I0({1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}), .I1({1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}), .S(inst7_O[0]), .O(inst9_O));
Mux2x8 inst10 (.I0({1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0}), .I1({1'b1,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0}), .S(inst7_O[0]), .O(inst10_O));
Mux2x8 inst11 (.I0({1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0}), .I1({1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}), .S(inst7_O[0]), .O(inst11_O));
Mux2x8 inst12 (.I0(inst8_O), .I1(inst9_O), .S(inst7_O[1]), .O(inst12_O));
Mux2x8 inst13 (.I0(inst10_O), .I1(inst11_O), .S(inst7_O[1]), .O(inst13_O));
Mux2x8 inst14 (.I0(inst12_O), .I1(inst13_O), .S(inst7_O[2]), .O(inst14_O));
CounterModM8CE inst15 (.O(inst15_O), .COUT(inst15_COUT), .CLK(CLKIN), .CE(inst28_Q));
Counter5CER inst16 (.O(inst16_O), .COUT(inst16_COUT), .CLK(CLKIN), .CE(inst15_COUT), .RESET(inst22_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst17 (.I0(inst16_O[0]), .I1(inst16_O[1]), .I2(inst16_O[2]), .I3(inst16_O[3]), .O(inst17_O));
SB_LUT4 #(.LUT_INIT(16'h4000)) inst18 (.I0(inst16_O[0]), .I1(inst16_O[1]), .I2(inst16_O[2]), .I3(inst16_O[3]), .O(inst18_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst19 (.I0(inst17_O), .I1(inst18_O), .I2(inst16_O[4]), .I3(1'b0), .O(inst19_O));
SB_DFFE inst20 (.C(CLKIN), .E(inst15_COUT), .D(inst21_O), .Q(inst20_Q));
SB_LUT4 #(.LUT_INIT(16'h5454)) inst21 (.I0(inst19_O), .I1(1'b1), .I2(inst20_Q), .I3(1'b0), .O(inst21_O));
SB_LUT4 #(.LUT_INIT(16'h2222)) inst22 (.I0(inst19_O), .I1(inst20_Q), .I2(1'b0), .I3(1'b0), .O(inst22_O));
PISO10CE inst23 (.SI(1'b1), .PI({1'b0,inst14_O[0],inst14_O[1],inst14_O[2],inst14_O[3],inst14_O[4],inst14_O[5],inst14_O[6],inst14_O[7],1'b1}), .LOAD(inst24_O), .O(inst23_O), .CLK(CLKIN), .CE(inst15_COUT));
SB_LUT4 #(.LUT_INIT(16'h2222)) inst24 (.I0(1'b1), .I1(inst20_Q), .I2(1'b0), .I3(1'b0), .O(inst24_O));
SB_LUT4 #(.LUT_INIT(16'h4444)) inst25 (.I0(inst20_Q), .I1(inst15_COUT), .I2(1'b0), .I3(1'b0), .O(inst25_O));
SB_LUT4 #(.LUT_INIT(16'h0001)) inst26 (.I0(inst7_O[0]), .I1(inst7_O[1]), .I2(inst7_O[2]), .I3(1'b0), .O(inst26_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst27 (.I0(inst26_O), .I1(inst19_O), .I2(1'b0), .I3(1'b0), .O(inst27_O));
SB_DFF inst28 (.C(CLKIN), .D(inst29_O), .Q(inst28_Q));
SB_LUT4 #(.LUT_INIT(16'h0EFE)) inst29 (.I0(inst0_Q), .I1(inst28_Q), .I2(inst27_O), .I3(inst15_COUT), .O(inst29_O));
assign TX = inst23_O;
endmodule
