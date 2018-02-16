library verilog;
use verilog.vl_types.all;
entity clk_to_ADC is
    port(
        clk_200MHz_i    : in     vl_logic;
        clk_5MHz_i      : in     vl_logic;
        clock_to_ADC_req: in     vl_logic;
        reset           : in     vl_logic;
        reset_ADC_signal: in     vl_logic;
        clk_5MHz_o      : out    vl_logic
    );
end clk_to_ADC;
