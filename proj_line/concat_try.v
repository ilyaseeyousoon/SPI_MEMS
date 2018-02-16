module concat_try(
                        input [7:0] data_gnd,
								input [15:0] data_fifo_adc,								                      
								output [23:0] output_data
                        );
								
								
			

			
	assign output_data={data_gnd,data_fifo_adc};				
					
					
				
				
								
endmodule