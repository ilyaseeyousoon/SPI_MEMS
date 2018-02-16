library verilog;
use verilog.vl_types.all;
entity signal_stm is
    port(
        clk_200MHz_i    : in     vl_logic;
        clk_5MHz_i      : in     vl_logic;
        reset           : in     vl_logic;
        stm_signal      : in     vl_logic;
        signal_to_diods_request: in     vl_logic;
        signal_to_diods : out    vl_logic
    );
end signal_stm;
