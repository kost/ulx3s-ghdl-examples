library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity button is
  port (
    wifi_gpio0 : out std_logic;
    led : out std_logic_vector(7 downto 0);
    btn : in std_logic_vector(6 downto 0) 
  );
end button;

architecture test of button is
begin
  wifi_gpio0 <= '1';
  
  led(0) <= btn(1);
end test;


