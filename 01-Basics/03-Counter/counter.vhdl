library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
  port (
    clk_25mhz: in std_logic;
    wifi_gpio0 : out std_logic;
    led : out std_logic_vector(7 downto 0) );
end counter;

architecture test of Counter is
signal cnt: std_logic_vector(31 downto 0);
begin
  wifi_gpio0 <= '1';
  process(clk_25MHz)
  begin
      if rising_edge(clk_25MHz) then
      	cnt <= std_logic_vector(unsigned(cnt) + 1);
      end if;
  end process;
  led <= cnt(31 downto 24);
end test;


