// megafunction wizard: %LPM_DIVIDE%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: LPM_DIVIDE 

// ============================================================
// File Name: divider_n.v
// Megafunction Name(s):
// 			LPM_DIVIDE
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 14.0.0 Build 200 06/17/2014 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, the Altera Quartus II License Agreement,
//the Altera MegaCore Function License Agreement, or other 
//applicable license agreement, including, without limitation, 
//that your use is for the sole purpose of programming logic 
//devices manufactured by Altera and sold by Altera or its 
//authorized distributors.  Please refer to the applicable 
//agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module divider_n (
	clken,
	clock,
	denom,
	numer,
	quotient,
	remain);

	input	  clken;
	input	  clock;
	input	[31:0]  denom;
	input	[31:0]  numer;
	output	[31:0]  quotient;
	output	[31:0]  remain;

	wire [31:0] sub_wire0;
	wire [31:0] sub_wire1;
	wire [31:0] quotient = sub_wire0[31:0];
	wire [31:0] remain = sub_wire1[31:0];

	lpm_divide	LPM_DIVIDE_component (
				.clken (clken),
				.clock (clock),
				.denom (denom),
				.numer (numer),
				.quotient (sub_wire0),
				.remain (sub_wire1),
				.aclr (1'b0));
	defparam
		LPM_DIVIDE_component.lpm_drepresentation = "UNSIGNED",
		LPM_DIVIDE_component.lpm_hint = "MAXIMIZE_SPEED=6,LPM_REMAINDERPOSITIVE=TRUE",
		LPM_DIVIDE_component.lpm_nrepresentation = "UNSIGNED",
		LPM_DIVIDE_component.lpm_pipeline = 1,
		LPM_DIVIDE_component.lpm_type = "LPM_DIVIDE",
		LPM_DIVIDE_component.lpm_widthd = 32,
		LPM_DIVIDE_component.lpm_widthn = 32;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
// Retrieval info: PRIVATE: PRIVATE_LPM_REMAINDERPOSITIVE STRING "TRUE"
// Retrieval info: PRIVATE: PRIVATE_MAXIMIZE_SPEED NUMERIC "6"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: USING_PIPELINE NUMERIC "1"
// Retrieval info: PRIVATE: VERSION_NUMBER NUMERIC "2"
// Retrieval info: PRIVATE: new_diagram STRING "1"
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: CONSTANT: LPM_DREPRESENTATION STRING "UNSIGNED"
// Retrieval info: CONSTANT: LPM_HINT STRING "MAXIMIZE_SPEED=6,LPM_REMAINDERPOSITIVE=TRUE"
// Retrieval info: CONSTANT: LPM_NREPRESENTATION STRING "UNSIGNED"
// Retrieval info: CONSTANT: LPM_PIPELINE NUMERIC "1"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_DIVIDE"
// Retrieval info: CONSTANT: LPM_WIDTHD NUMERIC "21"
// Retrieval info: CONSTANT: LPM_WIDTHN NUMERIC "30"
// Retrieval info: USED_PORT: clken 0 0 0 0 INPUT NODEFVAL "clken"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
// Retrieval info: USED_PORT: denom 0 0 21 0 INPUT NODEFVAL "denom[20..0]"
// Retrieval info: USED_PORT: numer 0 0 30 0 INPUT NODEFVAL "numer[29..0]"
// Retrieval info: USED_PORT: quotient 0 0 30 0 OUTPUT NODEFVAL "quotient[29..0]"
// Retrieval info: USED_PORT: remain 0 0 21 0 OUTPUT NODEFVAL "remain[20..0]"
// Retrieval info: CONNECT: @clken 0 0 0 0 clken 0 0 0 0
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: @denom 0 0 21 0 denom 0 0 21 0
// Retrieval info: CONNECT: @numer 0 0 30 0 numer 0 0 30 0
// Retrieval info: CONNECT: quotient 0 0 30 0 @quotient 0 0 30 0
// Retrieval info: CONNECT: remain 0 0 21 0 @remain 0 0 21 0
// Retrieval info: GEN_FILE: TYPE_NORMAL divider_n.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL divider_n.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL divider_n.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL divider_n.bsf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL divider_n_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL divider_n_bb.v TRUE
// Retrieval info: LIB_FILE: lpm
