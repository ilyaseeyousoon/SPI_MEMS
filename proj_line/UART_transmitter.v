module UART_transmitter(
                        input [7:0] DATA,
                        input CLK,
                        input Rdy,
                        output reg TX =1
                        );
    reg start_trans=1'd0;
    reg [7:0] count = 8'd0;
    reg [7:0] tr_count = 8'd0;
    reg [7:0] shifter;
always @ (posedge CLK)
begin
    if (Rdy)
    begin
        start_trans<=1'd1;
        shifter<=DATA;
    end
    if (start_trans)
    begin
        tr_count<=tr_count+1;
         
        if (count==0)
        begin
            if (tr_count<173) // результат от деления частоты CLK на скорость UART в бодах (CLK/Vuart)
            begin
                TX<=0;
            end
        else
        begin
            count<=1;
            tr_count<=0;
        end
    end
    else
    begin
        if (tr_count<173) // результат от деления частоты CLK на скорость UART в бодах (CLK/Vuart)
        begin
            TX<=shifter[7];
        end
         
        else
        begin
            shifter[7:1]<=shifter[6:0];
            tr_count<=0;
            count<=count+1;
        end
    end
     
    if (count==9) // если нужен бит четности, то добавлять if (count==10) begin .... end
    begin
        TX<=1;
        start_trans<=1'd0;
        count<=0;
        shifter<=8'd0;
    end
    end
end
endmodule