module test_module  (input clk_150MHz_i,
							input clk_10MHz_i,
							input reset,
							input reset_after_end_frame,
							input [9:0] rdusedw,
							input [15:0] fifo_data,
							input wreq,
							output clk_ADC_valid,
							output rdreq,							
							output [15:0]ADC_data
							  );
							
reg start_test_algoritm,clk_valid,rdreq_flag,clk_valid_req,clk_valid_1,clk_valid_2=0;							
reg [15:0] data_buf= 16'd0;

always @(posedge clk_150MHz_i) begin

if(reset|| reset_after_end_frame) begin
start_test_algoritm<=0;
clk_valid_req<=0;
end
else begin

if((rdusedw>=519)&&(wreq==0) ) begin
start_test_algoritm<=1;
rdreq_flag<=1;
clk_valid_req<=1;
end
else begin 
if(rdusedw==0) begin
rdreq_flag<=0;
end 
end

end 
end

always @(posedge clk_10MHz_i) begin
 
if(rdreq_flag) begin
data_buf<=fifo_data;
end  
else
data_buf<=0;

if(clk_valid_req) begin
clk_valid_1<=1;
clk_valid<=clk_valid_1;

end
else
clk_valid<=0;
end

 

 
 
 
 
 
 
assign rdreq=rdreq_flag;
assign ADC_data=data_buf;
assign clk_ADC_valid=clk_valid;

endmodule