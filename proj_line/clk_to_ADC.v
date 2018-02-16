module clk_to_ADC  ( input clk_20MHz_i,
							input clock_to_ADC_req,
							input reset,
							input reset_after_end_frame,
							output clk_ADC_valid,
							output clk_10MHz_o  );
							
/*
1. По сигналу reset и reset_after_end_frame происходит сброс флага request_clock.

2. По внешнему запросу тактирования АЦП clock_to_ADC_req выставляется флаг request_clock.

3. По флагу request_clock на линии  clk_10MHz_o устанавливается сигнал 10МГц.
*/							

reg request_clock=0;
reg temp=0;
reg clk_10MHz_o_temp=0;

always @(posedge clk_20MHz_i)
begin
if(reset || reset_after_end_frame)
request_clock=0;
else 
if(clock_to_ADC_req)
request_clock=1;

end  

always @(posedge clk_20MHz_i )
if(request_clock)
 clk_10MHz_o_temp <= !clk_10MHz_o_temp ;
else
 clk_10MHz_o_temp <=  0 ;
 
assign clk_10MHz_o=clk_10MHz_o_temp;
assign clk_ADC_valid=request_clock;
endmodule