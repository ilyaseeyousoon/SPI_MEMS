module spi_control (
    input clk_150MHz_i,
	 input reset,
	 input busy,
	 output [31:0] clk_div ,
	 output [31:0]addr ,
	 output [15:0]tx_data ,
    output enable
  );
  
  reg enable_temp=0;
  
  always @(posedge clk_150MHz_i) begin
  
  if (reset) begin
  //reset
  enable_temp<=0;
  end
  else begin
  // main
  if (!busy) begin
  if(enable_temp==0) begin
  enable_temp<=1;
  end
  else begin
  enable_temp<=0;
  end
  end // if (!busy)
  
  
  end
  end
  
  
  assign clk_div=1;
  assign addr=0;
  assign tx_data [15:0] =62720;
  assign enable=enable_temp;
  
  endmodule