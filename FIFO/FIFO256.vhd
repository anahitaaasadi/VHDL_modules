----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:48:32 05/07/2021 
-- Design Name: 
-- Module Name:    ram256byte - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIFO256 is port	(din: in std_logic_vector(7 downto 0);
								clk_rd, clk_wr, wr, rd: in std_logic;
								dout: out std_logic_vector(7 downto 0);
								full, empty: out std_logic);
end FIFO256;

architecture Behavioral of FIFO256 is
									type memory is array(0 to 255) of std_logic_vector(7 downto 0);
									signal ram: memory;
									signal rd_addr: std_logic_vector(7 downto 0):= "00000000";
									signal wr_addr: std_logic_vector(7 downto 0):= "00000000";
begin

process(clk_wr)
begin
	if(clk_wr'event and clk_wr = '1') then	
		full <= '0';
		if(wr = '1') then
			ram(conv_integer(wr_addr)) <= din;
			wr_addr <= wr_addr + "00000001";
			if(wr_addr = "11111111") then 
				ram(conv_integer(wr_addr)) <= din;
				full <= '1';
				wr_addr <= "00000000";
			end if;
		end if;
	end if;
end process;

process(clk_rd)
begin
	if(clk_rd'event and clk_rd = '1') then 	
		empty <= '0';
		if(rd = '1') then
			dout <= ram(conv_integer(rd_addr));
			rd_addr <= rd_addr + "00000001";
			if(rd_addr = "11111111") then 
				dout <= ram(conv_integer(rd_addr));
				rd_addr <= "00000000";
			if(rd_addr = wr_addr) then
				empty <= '1';
			end if;
			end if;
		end if;
	end if;
end process;

end Behavioral;