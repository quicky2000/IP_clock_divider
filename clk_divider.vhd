--
--    This file is part of clock_divider
--    Copyright (C) 2011  Julien Thevenon ( julien_thevenon at yahoo.fr )
--
--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.
--
--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with this program.  If not, see <http://www.gnu.org/licenses/>
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_divider is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  input : in std_logic;
           output : out  STD_LOGIC);
end clk_divider;

architecture Behavioral of clk_divider is
	constant max_value : positive := 2;
begin
	process (clk,rst)
		variable counter : natural range 0 to max_value := 0;
	begin
		if rst = '1' then
			counter := 0;
		elsif rising_edge(clk) then
			if input = '1' then
				if counter = max_value then
					counter := 0;
					output <= '1';
				else
					output <= '0';
					counter := counter + 1;
				end if;
			else
				output <= '0';
			end if;
		end if ;
	end process;


end Behavioral;

