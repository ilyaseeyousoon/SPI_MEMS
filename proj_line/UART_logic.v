module UART_logic(
                        input [7:0] rdout_fifo,
								input [23:0] data_fifo_stm,
								input reset,
                        input CLK,
								input ready,
                        output rdreq_fifo_stm,
                        output rdy
                        );
		
reg rdreq_fifo_stm_flag,rdy_flag,start_transmit_flag,start_flag,end_flag=0;	
reg [17:0] count = 18'd0;
	
always @ (posedge CLK) begin

if(reset) begin
rdreq_fifo_stm_flag<=0;
rdy_flag<=0;
start_flag<=0;
end
else begin

////////////////////////
if((rdout_fifo==25)) begin
start_transmit_flag<=1;
start_flag<=1;
end
else begin
if((rdout_fifo==0)&&(start_flag))begin

end_flag<=1;
 end

if( end_flag && ready)begin
start_flag<=0;
rdreq_fifo_stm_flag<=1;
rdy_flag<=1;
start_transmit_flag<=0;
end_flag<=0;
end

if(end_flag==0)
rdy_flag<=0;

end
/////////////////////
if(start_transmit_flag) begin

if(ready && (rdy_flag==0)) begin
rdreq_fifo_stm_flag<=1;
rdy_flag<=1;
end

if(rdreq_fifo_stm_flag) begin

rdreq_fifo_stm_flag<=0;
end

end
else begin
rdreq_fifo_stm_flag<=0;
rdy_flag<=0;

end







end
end								
								
assign rdreq_fifo_stm=rdreq_fifo_stm_flag;								
assign rdy=rdy_flag;						
								
								
								
								
endmodule							