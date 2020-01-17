library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sound is
  port (
    clk_25mhz: in std_logic;
    wifi_gpio0 : out std_logic;
    -- audio_l, audio_r, audio_v: inout std_logic_vector(3 downto 0) := (others => 'Z');
    audio_l, audio_r: inout std_logic_vector(3 downto 0) := (others => 'Z');
    btn: in std_logic_vector(6 downto 0) );
    -- led : out std_logic_vector(7 downto 0) );
end sound;

architecture test of sound is
signal cnt: std_logic_vector(25 downto 0);
signal tone: std_logic_vector(23 downto 0);
-- constant TONE_A4: integer := 28409; -- 25000000/440/2;
-- constant TONE_A5: integer := 14204; -- 25000000/880/2;
constant TONE_A4: integer := 25000000/440/2;
constant TONE_A5: integer := 25000000/880/2;
begin
  wifi_gpio0 <= '1';
  process(clk_25MHz)
  begin
      if rising_edge(clk_25MHz) then
	tone <= std_logic_vector(unsigned(tone) + 1);
      end if;
  end process;

  process(clk_25MHz)
  begin
      if rising_edge(clk_25MHz) then
        if cnt(25)= '0' then
           cnt <= std_logic_vector(to_unsigned(TONE_A4,cnt'length)) when tone(23)='1' else std_logic_vector(to_unsigned(TONE_A5,cnt'length)); 
           audio_l <= not audio_l;
           audio_r <= not audio_r;
        else
	   cnt <= std_logic_vector(unsigned(cnt) - 1);
        end if;
      end if;
  end process;

end test;


