module reset_after_end_frame_module  ( 
								input clk_200MHz_i,
								input reset_after_end_frame_request_out,					
								input reset, 					
								output mass_reset_after_frame,
								output signal_to_diods_request
								);
								
reg [8:0] count=9'd0;
reg reset_after_end_frame_temp=0;	
reg signal_to_diods_request_temp=0;
reg signal_to_diods_request_flag=0;
							
always @(posedge clk_200MHz_i) begin
if(reset) begin
count<=9'd0;
reset_after_end_frame_temp<=0;
signal_to_diods_request_temp<=0;
signal_to_diods_request_flag<=0;
end // if(reset)
else begin


if(reset_after_end_frame_request_out) begin
reset_after_end_frame_temp<=1;
signal_to_diods_request_flag<=1;
count<=9'd0;
end
else begin
reset_after_end_frame_temp<=0;
if(signal_to_diods_request_flag &&(count < 9'd40)) begin
count<=count+1'b1;
signal_to_diods_request_temp<=1;
end
else begin
signal_to_diods_request_temp<=0;
end
end //if(reset_after_end_frame_request_out) else
end	//if(reset) else							
end

assign mass_reset_after_frame = reset_after_end_frame_temp;
assign signal_to_diods_request = signal_to_diods_request_temp;

																								
endmodule