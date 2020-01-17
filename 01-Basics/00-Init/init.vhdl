library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity init is
  port (
    wifi_gpio0 : out std_logic
    );
end init;

architecture test of init is
begin
  wifi_gpio0 <= '1';
end test;


