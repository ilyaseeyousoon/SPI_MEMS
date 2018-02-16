library verilog;
use verilog.vl_types.all;
entity clk_to_ADC is
    port(
        clk_20MHz_i     : in     vl_logic;
        clock_to_ADC_req: in     vl_logic;
        reset           : in     vl_logic;
        reset_after_end_frame: in     vl_logic;
        clk_ADC_valid   : out    vl_logic;
        clk_10MHz_o     : out    vl_logic
    );
end clk_to_ADC;
