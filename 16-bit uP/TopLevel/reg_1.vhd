library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Components_project.all;
use iEEE.numeric_STD.ALL;

entity reg_1 is
  port (
    data_in  : in std_logic;
    data_out : out std_logic;
    clock     : in  std_logic;
    enable   : in  std_logic
   -- reset    : in  bit
	);
end reg_1;

architecture behave of reg_1 is

begin
process(clock,enable)
begin 
  if(clock'event and clock = '1') then
    --if(reset = '1') then
      --data_out <= (others => '0');
    if enable = '1' then
      data_out <= data_in;
    end if;
  end if;
end process;
end behave;

