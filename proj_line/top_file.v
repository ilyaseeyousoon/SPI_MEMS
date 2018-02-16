// Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 14.0.0 Build 200 06/17/2014 SJ Full Version"
// CREATED		"Thu Jul 27 21:12:54 2017"

module top_file(
	key0,
	key1,
	stm_signal,
	AD_sp_signal,
	AD_trig_signal,
	clock_in,
	rdreq,
	rdclk,
	wreq,
	data_stm,
	clk_10MHz_o,
	signal_to_diods,
	wrfull,
	rdempty,
	centroids,
	leds,
	rdusedw
);


input wire	key0;
input wire	key1;
input wire	stm_signal;
input wire	AD_sp_signal;
input wire	AD_trig_signal;
input wire	clock_in;
input wire	rdreq;
input wire	rdclk;
input wire	wreq;
input wire	[15:0] data_stm;
output wire	clk_10MHz_o;
output wire	signal_to_diods;
output wire	wrfull;
output wire	rdempty;
output wire	[39:0] centroids;
output wire	[7:0] leds;
output wire	[7:0] rdusedw;

wire	[39:0] centroids_ALTERA_SYNTHESIZED;
wire	[15:0] data;
wire	[15:0] dataadc;
wire	[15:0] q;
wire	[39:0] quo;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_49;
wire	[15:0] SYNTHESIZED_WIRE_16;
wire	[9:0] SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_22;
wire	[39:0] SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	[26:0] SYNTHESIZED_WIRE_32;
wire	[39:0] SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_42;
wire	[9:0] SYNTHESIZED_WIRE_43;
wire	[39:0] SYNTHESIZED_WIRE_44;





window	b2v_inst(
	.clk_200MHz_i(SYNTHESIZED_WIRE_45),
	.rdempty(SYNTHESIZED_WIRE_1),
	.start_treatment(SYNTHESIZED_WIRE_46),
	.reset(key1),
	.window_input(q),
	.clken(SYNTHESIZED_WIRE_48),
	.read_fifo(SYNTHESIZED_WIRE_36),
	.aclr_fifo(SYNTHESIZED_WIRE_38),
	.denominator(SYNTHESIZED_WIRE_32),
	.numerator(SYNTHESIZED_WIRE_33));


signal_stm	b2v_inst1(
	.clk_200MHz_i(SYNTHESIZED_WIRE_45),
	.clk_10MHz_i(SYNTHESIZED_WIRE_47),
	.reset(key1),
	.stm_signal(stm_signal),
	.signal_to_diods_request(SYNTHESIZED_WIRE_5),
	.signal_to_diods(signal_to_diods));


centroids_selection	b2v_inst10(
	.clk_200MHz_i(SYNTHESIZED_WIRE_45),
	.start_selection(SYNTHESIZED_WIRE_48),
	.reset(key1),
	.centroid_in(quo),
	.centroid_out(SYNTHESIZED_WIRE_9),
	.enable_clk_div(SYNTHESIZED_WIRE_42),
	.centroid_data_out(SYNTHESIZED_WIRE_44),
	.group_size(SYNTHESIZED_WIRE_43));


signal_to_fifo_delay	b2v_inst12(
	.clk_200MHz_i(SYNTHESIZED_WIRE_45),
	.centroid_flag_fifo_in(SYNTHESIZED_WIRE_9),
	.centroid_flag_fifo_out(SYNTHESIZED_WIRE_22));


fifo_test_data_stm	b2v_inst13(
	.wrreq(wreq),
	.wrclk(SYNTHESIZED_WIRE_10),
	.rdreq(SYNTHESIZED_WIRE_11),
	.rdclk(SYNTHESIZED_WIRE_47),
	
	.data(data_stm),
	
	.q(SYNTHESIZED_WIRE_16),
	.rdusedw(SYNTHESIZED_WIRE_17));


test_module	b2v_inst15(
	.clk_150MHz_i(SYNTHESIZED_WIRE_45),
	.clk_10MHz_i(SYNTHESIZED_WIRE_47),
	.reset(key1),
	.reset_after_end_frame(SYNTHESIZED_WIRE_49),
	.fifo_data(SYNTHESIZED_WIRE_16),
	.rdusedw(SYNTHESIZED_WIRE_17),
	.clk_ADC_valid(SYNTHESIZED_WIRE_20),
	.rdreq(SYNTHESIZED_WIRE_11),
	.ADC_data(dataadc));

assign	leds[7] =  ~key0;


PLL	b2v_inst17(
	.inclk0(clock_in),
	.c0(SYNTHESIZED_WIRE_45),
	.c1(SYNTHESIZED_WIRE_25),
	.c2(SYNTHESIZED_WIRE_47),
	.c3(SYNTHESIZED_WIRE_10)
	);


data_from_adc	b2v_inst2(
	.clk_10MHz_adc_i(SYNTHESIZED_WIRE_47),
	.clk_200MHz_i(SYNTHESIZED_WIRE_45),
	.clk_ADC_valid(SYNTHESIZED_WIRE_20),
	.reset_after_end_frame(SYNTHESIZED_WIRE_49),
	.reset(key1),
	.ADC_data_16bit(dataadc),
	.write_data_valid(SYNTHESIZED_WIRE_34),
	.reset_after_end_frame_request_out(SYNTHESIZED_WIRE_46),
	.ADC_data_16bit_out(data));


fifo_stm	b2v_inst3(
	.wrreq(SYNTHESIZED_WIRE_22),
	.wrclk(SYNTHESIZED_WIRE_45),
	.rdreq(rdreq),
	.rdclk(rdclk),
	.aclr(key1),
	.data(SYNTHESIZED_WIRE_24),
	.wrfull(wrfull),
	.rdempty(rdempty),
	.q(centroids_ALTERA_SYNTHESIZED),
	.rdusedw(rdusedw));


clk_to_ADC	b2v_inst4(
	.clk_20MHz_i(SYNTHESIZED_WIRE_25),
	.clock_to_ADC_req(SYNTHESIZED_WIRE_26),
	.reset(key1),
	.reset_after_end_frame(SYNTHESIZED_WIRE_49),
	
	.clk_10MHz_o(clk_10MHz_o));


reset_after_end_frame_module	b2v_inst5(
	.clk_200MHz_i(SYNTHESIZED_WIRE_45),
	.reset_after_end_frame_request_out(SYNTHESIZED_WIRE_46),
	.reset(key1),
	.mass_reset_after_frame(SYNTHESIZED_WIRE_49),
	.signal_to_diods_request(SYNTHESIZED_WIRE_5));


div_first	b2v_inst6(
	.clock(SYNTHESIZED_WIRE_45),
	.clken(SYNTHESIZED_WIRE_48),
	.denom(SYNTHESIZED_WIRE_32),
	.numer(SYNTHESIZED_WIRE_33),
	.quotient(quo)
	);


FIFO_ADC	b2v_inst7(
	.wrreq(SYNTHESIZED_WIRE_34),
	.wrclk(SYNTHESIZED_WIRE_47),
	.rdreq(SYNTHESIZED_WIRE_36),
	.rdclk(SYNTHESIZED_WIRE_45),
	.aclr(SYNTHESIZED_WIRE_38),
	.data(data),
	
	.rdempty(SYNTHESIZED_WIRE_1),
	.q(q));


AD_sp_AD_trig_wait	b2v_inst8(
	.clk_200MHz_i(SYNTHESIZED_WIRE_45),
	.AD_sp_signal(AD_sp_signal),
	.AD_trig_signal(AD_trig_signal),
	.reset(key1),
	.reset_after_end_frame(SYNTHESIZED_WIRE_49),
	.clock_to_ADC_req(SYNTHESIZED_WIRE_26));


div_centr	b2v_inst9(
	.clock(SYNTHESIZED_WIRE_45),
	.clken(SYNTHESIZED_WIRE_42),
	.denom(SYNTHESIZED_WIRE_43),
	.numer(SYNTHESIZED_WIRE_44),
	.quotient(SYNTHESIZED_WIRE_24)
	);

assign	centroids = centroids_ALTERA_SYNTHESIZED;
assign	leds[6:0] = centroids_ALTERA_SYNTHESIZED[6:0];

endmodule
