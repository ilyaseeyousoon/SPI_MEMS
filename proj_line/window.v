module window (input clk_200MHz_i,
					input rdempty,
					input start_treatment,
					input reset,
					input [15:0] window_input,
					output [39:0] numerator,
					output clken,
					output read_fifo,
					output aclr_fifo,
					output [26:0] denominator );

					
					
reg [15:0] data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,data16,data17,data18,data19 =16'd0;
reg [39:0]buffer_numerator_temp,buffer_numerator,buffer_numerator_shift,buffer_numerator1,buffer_numerator2,num_buf = 40'd0;
reg [39:0]numerator_out=40'd0;
reg [29:0]  buffer_data,buffer_data1=30'd0;
reg [9:0] count,count_fifo,clock_shift,clock_buffer = 10'd0;
reg [29:0]clock_shift_temp= 30'd0;
reg [26:0] buffer_denominator,buffer_denominator1,buffer_denominator2,buffer_denominator3,buffer_denominator4,denominator_out = 27'd0;
reg clken_dev=0;
reg start_treatment_flag=0;
reg reset_flag_temp,reset_flag,wait_flag=0;
reg read_fifo_flag=0;
reg aclr_fifo_flag,aclr_fifo_flag_temp,aclr_fifo_flag_temp1,aclr_fifo_flag_temp2=0;
always @( posedge clk_200MHz_i) begin

if(reset)
reset_flag<=1;

else begin

if(start_treatment)
wait_flag<=1;
if(wait_flag)begin
count_fifo<=count_fifo+1;
read_fifo_flag<=1;
end
if(count_fifo>0) begin
start_treatment_flag<=1;
end




if(start_treatment_flag) begin
count <= count + 1'b1;
data1 <= window_input; 
data2 <= data1;
data3 <= data2;    data4 <= data3;
data5 <= data4;    data6 <= data5;
data7 <= data6;    data8 <= data7;
data9 <= data8;    data10 <= data9;
data11 <= data10;  data12 <= data11;
data13 <= data12;  data14 <= data13;
data15 <= data14;  data16 <= data15;
data17 <= data16;  data18 <= data17;
data19 <= data18;
if(count<18) begin

buffer_data  <= window_input  ;
buffer_data1<=buffer_data;
clock_buffer<= count;
buffer_numerator_temp <= buffer_data1*clock_buffer;
buffer_numerator <= buffer_numerator + buffer_numerator_temp;
buffer_numerator1<=buffer_numerator;
buffer_numerator2<= buffer_numerator1;

buffer_denominator <= buffer_denominator + buffer_data;
buffer_denominator1 <= buffer_denominator ;
buffer_denominator2 <= buffer_denominator1 ;
buffer_denominator3 <= buffer_denominator2 ;
buffer_denominator4 <= buffer_denominator3 ;

if(count==17) 
clock_shift<=clock_shift+1;


end
else begin
  


clock_shift<=clock_shift+1'b1;
buffer_data  <=  window_input;
clock_buffer<= count;
buffer_data1<=buffer_data;
buffer_numerator_temp <= buffer_data1*clock_buffer;
num_buf<=data18 * clock_shift;
buffer_numerator_shift <=buffer_numerator_shift+num_buf;
buffer_numerator <= buffer_numerator + buffer_numerator_temp;
buffer_numerator1<= buffer_numerator-buffer_numerator_shift;
buffer_numerator2<= buffer_numerator1;

buffer_denominator <= buffer_denominator + buffer_data;
clock_shift_temp<=clock_shift_temp+data18;
buffer_denominator1 <= buffer_denominator ;
buffer_denominator2 <= buffer_denominator1-clock_shift_temp ;
buffer_denominator3 <= buffer_denominator2 ;
buffer_denominator4 <= buffer_denominator3 ;
 
  

end

if ((count>=21) && (count<517)) begin
clken_dev<=1;
//numerator_out <= buffer_numerator2;
numerator_out <= buffer_numerator2*10000;
denominator_out <= buffer_denominator4;
end
else begin
if((count>=517) && (count<557)) begin
clken_dev<=1;
end 
else begin
clken_dev<=0;
numerator_out <= 40'd0;
denominator_out <= 21'd0;
end
//if((count==518) || (reset_flag==1)) begin
if((count==557) || (reset_flag==1)) begin
if (reset_flag) begin
aclr_fifo_flag_temp<=1;
aclr_fifo_flag_temp1<=aclr_fifo_flag_temp;
aclr_fifo_flag_temp2<=aclr_fifo_flag_temp1;
aclr_fifo_flag <=aclr_fifo_flag_temp2;
end
aclr_fifo_flag<=0;
read_fifo_flag<=0;
reset_flag_temp<=0;
reset_flag<=reset_flag_temp;
count<=10'd0;
count_fifo<=10'd0;
start_treatment_flag<=0;
wait_flag<=0;
data1<=16'd0; 
data2<=16'd0;
data3<=16'd0;
data4<=16'd0;
data5<=16'd0;
data6<=16'd0;
data7<=16'd0;
data8<=16'd0;
data9<=16'd0;
data10<=16'd0;
data11<=16'd0;
data12<=16'd0;
data13<=16'd0;
data14<=16'd0;
data15<=16'd0;
data16<=16'd0;
data17<=16'd0;
data18<=16'd0;
data19<=16'd0;
buffer_numerator_temp <= 30'd0;
buffer_numerator <= 30'd0;
buffer_numerator_shift <= 30'd0;
buffer_numerator1 <= 30'd0;
buffer_numerator2 <= 30'd0;
num_buf <= 30'd0;
numerator_out <= 40'd0;
buffer_data<=30'd0;
buffer_data1<=30'd0;
clock_shift <= 10'd0;
clock_shift_temp <= 21'd0;
clock_buffer <= 10'd0;
buffer_denominator <= 21'd0;
buffer_denominator1 <= 21'd0;
buffer_denominator2 <= 21'd0;
buffer_denominator3 <= 21'd0;
buffer_denominator4 <= 21'd0;
denominator_out <= 21'd0;


end
end


end
end
end

assign read_fifo=read_fifo_flag;
assign numerator = numerator_out;
assign denominator = denominator_out;
assign clken= clken_dev; 
assign aclr_fifo=aclr_fifo_flag;

endmodule