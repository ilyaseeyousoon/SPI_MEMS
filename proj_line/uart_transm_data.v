module uart_transm_data (
    input clk,
	 input reset,
	 input busy,
	 input wait_data,
	 input busy_transmit,
	 input  [15:0]rx_uart_data,
	 output [7:0]tx_data ,
    output enable
  );
  
  reg [7:0] UART_H,UART_L,tx_data_temp=0;
  reg uart_part_flag,wait_flag,wait_end_receive_flag,enable_temp=0;
  reg [3:0]transm_count=0;
  
    always @(posedge clk) begin
  
  if(reset) begin
  
  end
  else begin 
  
  if(wait_data) begin
  wait_flag<=1;
  end

  
  if(busy==1 && wait_flag==1) begin
  wait_end_receive_flag<=1;
  end
  
  if(busy==0 && wait_end_receive_flag==1) begin
  wait_end_receive_flag<=0;
  wait_flag<=0;
 UART_H<= rx_uart_data[15:8];
 UART_L <= rx_uart_data[7:0];
 transm_count<=transm_count+1;
  end
  
  if(busy_transmit==0) begin
  
  if(transm_count==1) begin
  tx_data_temp<=UART_H;
  transm_count<=transm_count+1;
  end
  
    if(transm_count==2) begin
  transm_count<=transm_count+1;
  enable_temp<=1;
  end
  
      if(transm_count==3) begin
  tx_data_temp<=UART_L;
  transm_count<=transm_count+1;
  enable_temp<=0;
  end
  
        if(transm_count==4) begin
  transm_count<=transm_count+1;
  enable_temp<=1;
  end
  
          if(transm_count==5) begin
  transm_count<=0;
  enable_temp<=0;
  tx_data_temp<=8'd0;
  end
  
  end// busy tr
  
  end 
  end
  
  assign tx_data=tx_data_temp;
  assign enable=enable_temp;
  
  
  endmodule