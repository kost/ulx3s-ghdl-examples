library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity debounce is
  port (
    clk_25mhz: in std_logic;
    wifi_gpio0 : out std_logic;
    btn: in std_logic_vector(6 downto 0);
    led : out std_logic_vector(7 downto 0) );
end debounce;

architecture test of debounce is
signal cnt: std_logic_vector(7 downto 0);
signal clk_cnt: std_logic_vector(23 downto 0);
signal prev_btn: std_logic;
begin
  wifi_gpio0 <= '1';
  process(clk_25MHz)
  begin
      if rising_edge(clk_25MHz) then
	clk_cnt <= std_logic_vector(unsigned(clk_cnt) + 1);
      end if;
  end process;

  process(clk_cnt(20))
  begin
      if rising_edge(clk_cnt(20)) then
         prev_btn <= btn(1);
         if (prev_btn = '1' and btn(1) = '1') then
            cnt <= std_logic_vector(unsigned(cnt) + 1);
         end if;
      end if;
  end process;

  led <= cnt;

end test;


