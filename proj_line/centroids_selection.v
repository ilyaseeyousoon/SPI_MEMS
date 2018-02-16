module centroids_selection   (input clk_200MHz_i,
										input [39:0] centroid_in,
										input start_selection,
										input reset,
										output [39:0] centroid_data_out,
										output [9:0] group_size,
										output  centroid_out,
										output enable_clk_div);
	
reg start_selection_flag,reset_flag,centroid_out_flag=0;
reg [9:0] count,count_pipe, count_within_group,count_within_group_out = 10'd0;
reg [39:0] data_buf, data_buf_next,data_buf_next1,data_buf_next2,data_buf_next3, data_centr_group, data_centr_group_finish=40'd0;
reg signed [40:0] data_compare=0;
reg end_group_flag=0;
reg [5:0] clock_wait_div=6'd0;
reg centroid_valid_flag,enable_clk_div_flag,disable_clk_div_flag=0;
always @( posedge clk_200MHz_i) begin

if(reset) begin
reset_flag<=1;
enable_clk_div_flag<=0;
end
else begin


/************************************/
if(start_selection) begin
enable_clk_div_flag<=1;
if(clock_wait_div==40)begin
start_selection_flag<=1;
end
else begin
clock_wait_div<=clock_wait_div+1;
end
end//if(start_selection)
else begin
clock_wait_div<=0;
start_selection_flag<=0;
count<=0;
if(count_within_group!=0) begin
end_group_flag<=1;
count_within_group<=10'd0;
data_centr_group<=40'd0;
count_within_group_out<=count_within_group;
data_centr_group_finish<=data_centr_group;
centroid_out_flag<=1;
end //if(count_within_group!=0) 
end //elseif(start_selection)
/************************************/
if(end_group_flag)begin
end_group_flag<=0;
data_centr_group_finish<=40'd0;
count_within_group_out<=10'd0;
centroid_out_flag<=0;
end
/************************************/
if((start_selection_flag==0)&&(centroid_out_flag))
disable_clk_div_flag<=1;

if((disable_clk_div_flag)&&(count_pipe==40))begin
disable_clk_div_flag<=0;
count_pipe<=0;
enable_clk_div_flag<=0;
end
else begin
if(disable_clk_div_flag)
count_pipe<=count_pipe+1;

end
/************************************/
if(start_selection_flag) begin
count <= count + 1'b1;
data_buf <= centroid_in;
data_buf_next <= data_buf;
data_buf_next1<=data_buf_next;
data_buf_next2<=data_buf_next1;
data_buf_next3<=data_buf_next2;
if(count>=2) begin
data_compare<= data_buf_next-data_buf;

if((data_compare>(-4000)) && (data_compare<4000)) begin
data_centr_group_finish<=0;


data_centr_group<=data_centr_group+data_buf_next;
count_within_group<=count_within_group+1;


end //if((data_compare>(-10000)) && (data_compare<10000))
else begin
if(count_within_group>2 )begin
end_group_flag<=1;
centroid_out_flag<=1;
count_within_group<=10'd0;
data_centr_group<=40'd0;
count_within_group_out<=count_within_group;
data_centr_group_finish<=data_centr_group;
end
count<=0;

end
end

end //if(start_selection_flag)
end // else if(reset)
end //alw

assign centroid_out=centroid_out_flag;
assign centroid_data_out = data_centr_group_finish;
assign group_size=count_within_group_out;
assign enable_clk_div=enable_clk_div_flag;
				
endmodule