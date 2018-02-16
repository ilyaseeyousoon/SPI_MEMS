module firsttry  ( input clk_200MHz_i,
							input clk_5MHz_i,
							input reset,
							input stm_signal,
							input signal_to_diods_request,
							output signal_to_diods  );
							
							
/*
?????????? ?? ??????? ? ??????????? ??? ?????????? ?????? 
???????????? ?????? ????? ??? ??????? ?????? ????????????? 6 ?????? 5??? ?????.
??????:
request_count ???????????? ? ? ?????? 200 ??? ? 5 ???. ?? ????? 
?? ????????????????? ????? ????????.?? ???? ?? ??? ?????? ???????? ? ????? ?????? 
? ???????? ???? ?????????. 
*/ 
reg request_count=0;
reg [2:0] count=3'b000;
reg signal_to_diods_temp=0;

always @(posedge clk_200MHz_i)
begin
if(reset || (count==3'd7))
begin
request_count<=0;
end
else 
if(stm_signal || signal_to_diods_request)
request_count<=1;
end  

always @(posedge clk_5MHz_i)
begin 

if(request_count)
begin
count<=count+1'b1;
signal_to_diods_temp=1;
end
else
if(count==3'd7)
begin
count<=3'b000;
signal_to_diods_temp<=0;
end
end



assign signal_to_diods=signal_to_diods_temp;




endmodule