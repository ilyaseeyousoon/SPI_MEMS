module data_from_adc  ( input clk_10MHz_adc_i,
								input clk_200MHz_i,
								input clk_ADC_valid,
								input reset_after_end_frame,
								input [15:0] ADC_data_16bit,
								input reset, 
								output write_data_valid,
								output reset_after_end_frame_request_out,
								output [15:0] ADC_data_16bit_out
								);
/*
! Сигнал резет для 200 МГц и 10 Мгц один и тот же.

1. По сигналу reset или reset_after_end_frame в клоковом домене 200 МГц, сбрасывается флаг clk_ADC_valid_access.
В домене 10МГц по сигналу reset обнуляется счетчик count и сбрасывается флаг read_data_from_ADC_valid.

2. Сигнал clk_ADC_valid_access выставляется, если есть внешний сигнал clk_ADC_valid, сообщающий 
о наличии тактирования АЦП.По этоу сиогналу начинается счет значения счетчика count до 7ми.

3. Когда значение  count становится равным 7, выставляется флаг read_data_from_ADC_valid, 
который запускает счетчик данных count_data и данные с АЦП ADC_data_16bit, выводит на выход ADC_data_16bit_out.

4. После того как count_data станет равным 512,непонятно что делать!!! 


*/
						
				
				
reg clk_ADC_valid_access=0;
reg unsigned [4:0]  count=5'b000;	
reg [2:0] count_reset=3'b000;		
reg read_data_from_ADC_valid=0;
reg unsigned [15:0] ADC_data_16bit_temp=16'd0;
reg unsigned [9:0]  count_data= 10'd0;
reg write_data_flag=0;
reg reset_after_end_frame_request=0;
reg reset_after_end_frame_local=0;
			
always @(posedge clk_200MHz_i)			
begin
if(reset ||reset_after_end_frame_local)
clk_ADC_valid_access=0;// внешний сигнал говорящий о том что скоро придет клок с ацп
else
begin
if(clk_ADC_valid)
clk_ADC_valid_access=1;
end
end			
			
always @(posedge clk_10MHz_adc_i)
begin 


if(clk_ADC_valid_access)
begin
if(count != 3'd6)
count<=count+1'b1;
else
begin
read_data_from_ADC_valid<=1;// посчитал 7 тактов и дает разршение считывать данные
end //else if(count != 3'd7)
end//if(clk_ADC_valid_access)
else 
begin
read_data_from_ADC_valid<=0;
reset_after_end_frame_local<=0;
count<=5'b000;
count_data<=10'd0;
count_reset<=3'd0;
write_data_flag<=0;
end //else if(clk_ADC_valid_access)

if(read_data_from_ADC_valid)
begin
if(count_data <=511)
begin
ADC_data_16bit_temp<=ADC_data_16bit;
write_data_flag<=1;
count_data<=count_data+1;
end //if(count_data!=512)
else
begin

write_data_flag<=0;
ADC_data_16bit_temp<=16'd0;
reset_after_end_frame_request<=1;
read_data_from_ADC_valid<=0;
if (count_reset!=1)
begin
count_reset<=count_reset+1'b1;
end
else
begin
count_reset<=0;
reset_after_end_frame_request<=0;
reset_after_end_frame_local<=1;
end


end
end //if(read_data_from_ADC_valid)


end //always @(posedge clk_10MHz_adc_i)

assign reset_after_end_frame_request_out=reset_after_end_frame_request;
assign ADC_data_16bit_out=ADC_data_16bit_temp;	
assign write_data_valid=write_data_flag;
//dddd
endmodule