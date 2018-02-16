module UART_logic_modern(
                        input [7:0] rdout_fifo,
								input [23:0] data_fifo_stm,
								input reset,
                        input CLK,
								input ready,
                        output rdreq_fifo_stm,
                        output rdy,
								output [7:0] UART_data
                        );

								
reg rdreq_fifo_stm_flag,rdy_flag,start_transmit_flag,start_flag,end_flag=0;
reg start_write_sub_data_flag,start_write_count_flag,finish_flag,end_iter,start_write_sub_data_flag_wait=0;	
reg [17:0] count = 18'd0;
reg [2:0] count_sub_data=3'd0;	
reg [7:0] sub_data_H,sub_data_M,sub_data_L,UART_data_buf= 8'd0;
reg [2:0] count_zero,count_25,temp_count,count_temp=3'd0;

always @ (posedge CLK) begin

if(reset) begin
rdreq_fifo_stm_flag<=0;
rdy_flag<=0;
start_flag<=0;
count_25<=0;
end
else begin

////////////////////////
if((rdout_fifo==25)&&(start_flag==0)) begin
end_iter<=1;
start_flag<=1;
count_25<=0;
end
else begin

if(count_25==6)begin
start_transmit_flag<=1;

end
else begin
if(start_flag)
count_25<=count_25+1;
end

if((rdout_fifo==0)&&(start_flag)&&(end_iter==0))begin
count_zero<=count_zero+1;
end_flag<=1;


 end

if( end_flag && ready &&(count_zero==2))begin
if(end_iter) begin
start_transmit_flag<=0;
end_iter<=0;
start_flag<=0;
end_flag<=0;
rdy_flag<=0;
count_zero<=0;
//count_sub_data=3'd0
//start_write_sub_data_flag<=0;
end
end

if(((end_flag==0)||(count_zero!=0))&& rdy_flag)
if(count_temp==0)
count_temp<=count_temp+1;
if(count_temp==1)
rdy_flag<=0;

end
/////////////////////

if(start_transmit_flag) begin

if(ready && (rdy_flag==0)&&(count_sub_data==0)&& end_iter) begin
rdreq_fifo_stm_flag<=1;
end_iter<=0;
end

if(rdreq_fifo_stm_flag) begin
rdreq_fifo_stm_flag<=0;
start_write_count_flag<=1;
end

if(start_write_count_flag) begin
sub_data_H <= data_fifo_stm [23:16] ;
sub_data_M <= data_fifo_stm [15:8] ;
sub_data_L <= data_fifo_stm [7:0] ;
start_write_count_flag<=0;
start_write_sub_data_flag_wait<=1;

end

if(start_write_sub_data_flag_wait)begin
count_sub_data<=2;
start_write_sub_data_flag<=1;
start_write_sub_data_flag_wait<=0;
end



///////
if((count_sub_data==2)&& start_write_sub_data_flag && ready ) begin
if(temp_count==0)begin
UART_data_buf<=sub_data_H;
temp_count<=temp_count+1;
end
else begin
if(temp_count==1) begin
rdy_flag<=1;
temp_count<=temp_count+1;
end
if((temp_count==2)&&(rdy_flag==0))begin
temp_count<=0;
count_sub_data<=count_sub_data-1;
end
end
end
else begin
if((count_sub_data==1)&& start_write_sub_data_flag && ready && (rdy_flag==0)) begin
UART_data_buf<=sub_data_M;
rdy_flag<=1;
count_sub_data<=count_sub_data-1;
end
else begin
if((count_sub_data==0)&& start_write_sub_data_flag && ready&& (rdy_flag==0)) begin
UART_data_buf<=sub_data_L;
rdy_flag<=1;
start_write_sub_data_flag<=0;
finish_flag<=1;
end
end
end
////////
if(finish_flag)begin
finish_flag<=0;
end_iter<=1;
end


end //if(start_transmit_flag) 
else begin
rdreq_fifo_stm_flag<=0;
rdy_flag<=0;

end







end
end								
								
assign rdreq_fifo_stm=rdreq_fifo_stm_flag;								
assign rdy=rdy_flag;						
assign UART_data=UART_data_buf;								
								
								
								
endmodule	