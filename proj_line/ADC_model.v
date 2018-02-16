module ADC_model   (				input clk_200MHz_i,
										input signal_to_diods
										output AD_sp,
										output AD_trig,
										output [15:0]ADC_data,
										output clk_10M_adc_i );
										




	always @(posedge clk_200MHz_i)			
begin

if(signal_to_diods)
signal_to_diods_wait_flag<=1;

if(signal_to_diods_wait_flag) begin
count_signal<=count_signal+1;
if(count_signal==140) begin
count_signal<=0;
signal_to_diods_wait_flag<=0;
signal_to_diods_wait_flag_and<=1;
end 
end

if(signal_to_diods_wait_flag_and) begin

AD_sp_out<=1;
count_AD_sp<=count_AD_sp+1;
if(count_AD_sp==10) begin
count_AD_sp<=0;
signal_to_diods_wait_flag_and<=0;
AD_trig_out<=1;
AD_trig_flag<=1;
end

if(AD_trig_flag) begin
count_AD_trig<=count_AD_trig+1;

if(count_AD_trig==5) begin
count_AD_trig<=0;
AD_trig_flag<=0;
AD_trig_out<=0;
start_data_transmit_flag<=1;
end
end

if(start_data_transmit_flag) begin
count_data<=count_data+1;
if (count_data==72521) begin
start_data_transmit_flag<=0;
end
end

end//alw



always(clk_10M_o) begin

if(start_data_transmit_flag) begin
count_data<=count_data+1;
ADC_data_out<=1;//сюда загрузятся данные из файла
if (count_data==518) begin
count_data<=0;
ADC_data_out<=0;

end
end



end



assign 
					
endmodule