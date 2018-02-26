module spi_control (
    input clk_150MHz_i,
	 input reset,
	 input busy,
	 input  [7:0]rx_uart_data,
	 input rx_ready,
	 output [31:0] clk_div ,
	 output [31:0]addr ,
	 output [15:0]tx_data ,
    output enable
  );
  
  reg enable_temp,enable_start,rx_ready_flag=0;
  reg [7:0] rx_uart_data_temp_H,rx_uart_data_temp_L;
  reg[3:0] count_uart_data=0;
  
  always @(posedge clk_150MHz_i) begin
  
  if (reset) begin
  //reset
  enable_temp<=0;
  end
  else begin
  // main
  if (!busy) begin
  
  if((enable_temp==0) && (enable_start==1)) begin
  enable_temp<=1;
  end
  else begin
  enable_temp<=0;
  end
  
  if (rx_ready) begin
  rx_ready_flag<=1;
  end

  
  if(rx_ready_flag && (!busy)&& count_uart_data==0) begin
  rx_uart_data_temp_H<=rx_uart_data;
  count_uart_data<=count_uart_data+1;
  rx_ready_flag<=0;
  end
  else begin
  if(rx_ready_flag && (!busy))begin
  if(count_uart_data==1)begin
  enable_start<=1;
  rx_uart_data_temp_L<=rx_uart_data;
  count_uart_data<=count_uart_data+1;
  rx_ready_flag<=0;
  end
  
  end // if(rx_ready_flag && (!busy))
  else begin 
    if(count_uart_data==2)begin
  enable_start<=0;
  count_uart_data<=0;
  end
  end 
  
  end // if(rx_ready_flag && (!busy)&& count_uart_data==0)
 
  end // if (!busy)
  
  end
  
  end
  
  
  assign clk_div=1;
  assign addr=0;
  //assign tx_data [15:0] =62720;
  assign tx_data [15:0] ={rx_uart_data_temp_H,rx_uart_data_temp_L};
  
  assign enable=enable_temp;
  
  endmodule