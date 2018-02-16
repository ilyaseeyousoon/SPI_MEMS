module clk_to_ADC_tb  ; 
 
  reg    clock_to_ADC_req   ; 
  reg    clk_5MHz_i   ; 
  reg    clk_200MHz_i   ; 
  wire    clk_5MHz_o   ; 
  reg    reset_ADC_signal   ; 
  reg    reset   ; 
  clk_to_ADC  
   DUT  ( 
       .clock_to_ADC_req (clock_to_ADC_req ) ,
      .clk_5MHz_i (clk_5MHz_i ) ,
      .clk_200MHz_i (clk_200MHz_i ) ,
      .clk_5MHz_o (clk_5MHz_o ) ,
      .reset_ADC_signal (reset_ADC_signal ) ,
      .reset (reset ) ); 

endmodule

