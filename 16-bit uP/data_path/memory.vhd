library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Components_project.all;
use iEEE.numeric_STD.ALL;

entity memory is
port( 	address : in std_logic_vector(15 downto 0);
	data_in : in std_logic_vector(15 downto 0);
	data_out : out std_logic_vector(15 downto 0);
	write_enable,read_enable,clock: in std_logic);
end memory;

architecture design of memory is

type mem is array (511 downto 0) of std_logic_vector(15 downto 0);
signal memory_block : mem;
signal address_int :integer range 511 downto 0;
begin

address_int <= to_integer(unsigned(address));

	process(clock,read_enable,write_enable,address,memory_block,data_in,address_int) is
	begin
	--if(clock'event and clock='1') then
		if(write_enable = '1') then
		--	if(writebyte = '1') then
			memory_block(address_int) <= data_in(15 downto 0);
		elsif (read_enable = '1') then
		--if(readbyte = '1')then
			data_out(15 downto 0) <= memory_block(address_int);
		
		end if;
--	end if;
	end process;
end architecture;

