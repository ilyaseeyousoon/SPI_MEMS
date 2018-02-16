library verilog;
use verilog.vl_types.all;
entity data_from_adc is
    port(
        clk_10MHz_adc_i : in     vl_logic;
        clk_200MHz_i    : in     vl_logic;
        clk_ADC_valid   : in     vl_logic;
        reset_after_end_frame: in     vl_logic;
        ADC_data_16bit  : in     vl_logic_vector(15 downto 0);
        reset           : in     vl_logic;
        write_data_valid: out    vl_logic;
        ADC_data_16bit_out: out    vl_logic_vector(15 downto 0)
    );
end data_from_adc;
