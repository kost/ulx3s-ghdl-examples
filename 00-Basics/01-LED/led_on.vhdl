library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_on is
  port (
    wifi_gpio0 : out std_logic;
    led : out std_logic_vector(7 downto 0) );
end led_on;

architecture test of led_on is
begin
  wifi_gpio0 <= '1';
  led <= std_logic_vector'("00000001");
end test;


