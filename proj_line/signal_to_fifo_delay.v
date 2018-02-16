module signal_to_fifo_delay   (			
										input clk_200MHz_i,
										input centroid_flag_fifo_in,
										output centroid_flag_fifo_out );
										
reg a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31,a32,a33,a34,a35,a36,a37,a38,a39,a40=0;
										
always @(posedge clk_200MHz_i) begin
a1<=centroid_flag_fifo_in;
a2<=a1;
a3<=a2;
a4<=a3;
a5<=a4;
a6<=a5;
a7<=a6;
a8<=a7;
a9<=a8;
a10<=a9;
a11<=a10;
a12<=a11;
a13<=a12;
a14<=a13;
a15<=a14;
a16<=a15;
a17<=a16;
a18<=a17;
a19<=a18;
a20<=a19;
a21<=a20;
a22<=a21;
a23<=a22;
a24<=a23;
a25<=a24;
a26<=a25;
a27<=a26;
a28<=a27;
a29<=a28;
a30<=a29;
a31<=a30;
a32<=a31;
a33<=a32;
a34<=a33;
a35<=a34;
a36<=a35;
a37<=a36;
a38<=a37;
a39<=a38;
a40<=a39;
end


assign centroid_flag_fifo_out=a40;	

									
endmodule