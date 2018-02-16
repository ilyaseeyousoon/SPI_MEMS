module AD_sp_AD_trig_wait (input clk_200MHz_i,
									input AD_sp_signal,
									input AD_trig_signal,
									input reset,
									input reset_after_end_frame,
									input signal_to_diods_output,
									output clock_to_ADC_req);
/*
1. По сигнану reset или сигнану конца считывания кадра происходит  сброс флага AD_sp_valid, 
выставляемый при появлении сигнала наличия на линии сигнала начала кадра AD_sp_signal 
и сигнала clock_to_ADC_req_temp, выставляемого при наличии 
сигнала AD_sp_signal и сигнала наличия на линии пикселя AD_trig_signal.

2. При наличии сигналов AD_sp_valid и AD_trig_signal, 
на выход передается запрос на тактирование АЦП clock_to_ADC_req.
*/

reg AD_sp_valid = 0;
reg clock_to_ADC_req_temp = 0;

always @(posedge clk_200MHz_i)
begin
if (reset || reset_after_end_frame)
begin
AD_sp_valid = 0;
clock_to_ADC_req_temp = 0;
end
else
begin
if(signal_to_diods_output)
begin
if (AD_sp_signal)
AD_sp_valid = 1;

if (AD_sp_valid && AD_trig_signal)
clock_to_ADC_req_temp = 1;
end
end
end

assign clock_to_ADC_req = clock_to_ADC_req_temp;

endmodule