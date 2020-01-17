library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity trigger is
  port (
    clk_25mhz: in std_logic;
    wifi_gpio0 : out std_logic;
    btn: in std_logic_vector(6 downto 0);
    led : out std_logic_vector(7 downto 0) );
end trigger;

architecture test of trigger is
signal cnt: std_logic_vector(7 downto 0);
begin
  wifi_gpio0 <= '1';
  process(clk_25MHz)
  begin
      if rising_edge(btn(1)) then
      	cnt <= std_logic_vector(unsigned(cnt) + 1);
      end if;
  end process;
  led <= cnt;
end test;


