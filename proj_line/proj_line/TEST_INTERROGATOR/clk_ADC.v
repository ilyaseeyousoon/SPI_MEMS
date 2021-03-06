module clk_to_ADC  ( input clk_200MHz_i,
							input clk_5MHz_i,
							input clock_to_ADC_req,
							input reset,
							input reset_ADC_signal,
							output clk_5MHz_o  );
							

reg request_clock=0;
reg temp=0;
reg clk_5MHz_o_temp=0;
always @(posedge clk_200MHz_i)
begin
if(reset || reset_ADC_signal)
request_clock=0;
else 
if(clock_to_ADC_req)
request_clock=1;

end  

always @(posedge clk_5MHz_i)
if(request_clock)
 clk_5MHz_o_temp <= clk_5MHz_i ;
else
 clk_5MHz_o_temp <=  0 ;
 
assign clk_5MHz_o=clk_5MHz_o_temp;
endmodule


