library verilog;
use verilog.vl_types.all;
entity window is
    port(
        clk_5MHz_i      : in     vl_logic;
        n               : in     vl_logic_vector(15 downto 0);
        window_input    : in     vl_logic_vector(15 downto 0);
        numerator       : out    vl_logic_vector(15 downto 0);
        denominator     : out    vl_logic_vector(15 downto 0)
    );
end window;
