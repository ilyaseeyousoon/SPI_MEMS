module signal_stm  ( input clk_200MHz_i,
							input clk_10MHz_i,
							input reset,
							input stm_signal,
							input signal_to_diods_request,
							output stm_signal_output,
							output signal_to_diods  );
							
							
/*
1. Сброс производится по сигналу резет или переполнению счетчика,форирующего длительность 
импульса на линейку фотодиодов

2. По запросу stm_signal с МК или signal_to_diods_request с другого модуля(какого?)
выставляется флаг request_count. Этот флаг выставляет в 1 выходной сигнал signal_to_diods и держится 
до тех пор, пока не счетчик count не станет равен 7.

3. После сброса счетчика,request_count и сигнала на выходе,
ожидается новый запрос
*/
 
reg request_count,stm_signal_output_temp=0;
reg [7:0] count=8'b000000;
reg signal_to_diods_temp=0;
reg reset_request_after_count=0;
reg [5:0]global_wait_count=6'd0;
always @(posedge clk_200MHz_i) begin




if(reset || reset_request_after_count )
begin
request_count<=0;
if(reset)
begin
stm_signal_output_temp<=0;
end
end
else 
begin
if(stm_signal || signal_to_diods_request)
begin
request_count<=1;
stm_signal_output_temp<=1;
end
end
end  

always @(posedge clk_10MHz_i) begin 




if(request_count==0)begin
reset_request_after_count<=0;
end
else begin
if(global_wait_count<22) begin
global_wait_count<=global_wait_count+1;
end
else
begin
if(count!=8'd12) begin
count<=count+1'b1;
signal_to_diods_temp=1;
end
else begin
count<=8'b000000;
signal_to_diods_temp<=0;
reset_request_after_count<=1;
global_wait_count<=6'd0;
end
end
end //always @(posedge clk_10MHz_i)
end

assign signal_to_diods=signal_to_diods_temp;
assign stm_signal_output=stm_signal_output_temp;

endmodule