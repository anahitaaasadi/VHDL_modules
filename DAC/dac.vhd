---------------------------------------------------------------------------------
-- File Name: dac
-- Description:	This code converts a 64-sampled analog sin wave to 8-bit digital
--						numbers in different frequencies
-- Author: Anahita Asadi
-- Date: 2021.05.11
-- Last Modified: 2021.10.11
-- Organization: K. N. Toosi. University
---------------------------------------------------------------------------------
library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;
---------------------------------------------------------------------------------
entity dac is port(	clk: in std_logic;
							din: in std_logic_vector(1 downto 0);
							dout: out std_logic_vector(7 downto 0));
end dac;
---------------------------------------------------------------------------------
architecture behavioral of dac is
	type memory  is array (0 to 63) of integer range 0 to 255;
	signal sin: memory := (	128,  140,	152,	164,	176,	187,	198,	208,
									217,	226,	233,	240,	245,	249,	252,	254,
									255,	254,	252,	249,	245,	240,	233,	226,
									217,	208,	198,	187,	176,	164,	152,	140,
									128,	116,	104,	92,	80,	69,	58,	48,
									39,	30,	23,	16,	11,	7,		4,		2,
									1,		2,		4,		7,		11,	16,	23,	30,
									39,	48,	58,	69,	80,	92,	104,	116);
begin
	process(clk)
		variable NC: integer := 0;
		variable din_old: std_logic_vector(1 downto 0) := "00";
		variable count: integer := 0;
		variable i: integer := 0;
	begin
		case din is when "00" 	=> NC :=	1563;
						when "01"	=>	NC :=	3125;
						when "10"	=> NC := 6250;
						when others	=>	NC	:= 6250;
		end case;
			if (clk'event and clk = '1') then
				if (din_old /= din) then
					i := 0;
					count := 0;
					din_old := din;
				end if;
				count := count + 1;
				if (count = NC) then
					i := i + 1;
						if (i = 63) then
							i := 0;
						end if;
					count := 0;
				end if;
			end if;
			case din is when "11" 	=> dout <= conv_std_logic_vector((sin(i))/2,8);
							when others => dout <= conv_std_logic_vector((sin(i)),8);
			end case;
	end process;
end behavioral;
---------------------------------------------------------------------------------