module firsttry_tb  ; 
 
  reg    stm_signal   ; 
  reg    clk_5MHz_i   ; 

  end
  
  wire    signal_to_diods   ; 
  reg    signal_to_diods_request   ; 
  reg    clk_200MHz_i   ; 
  reg    reset   ; 

  end
  
  firsttry  
   DUT  ( 
       .stm_signal (stm_signal ) ,
      .clk_5MHz_i (clk_5MHz_i ) ,
      .signal_to_diods (signal_to_diods ) ,
      .signal_to_diods_request (signal_to_diods_request ) ,
      .clk_200MHz_i (clk_200MHz_i ) ,
      .reset (reset ) ); 

endmodule

