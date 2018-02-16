library verilog;
use verilog.vl_types.all;
entity AD_sp_AD_trig_wait is
    port(
        clk_200MHz_i    : in     vl_logic;
        AD_sp_signal    : in     vl_logic;
        AD_trig_signal  : in     vl_logic;
        reset           : in     vl_logic;
        reset_after_end_frame: in     vl_logic;
        clock_to_ADC_req: out    vl_logic
    );
end AD_sp_AD_trig_wait;
