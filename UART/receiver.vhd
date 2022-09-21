----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:04:16 05/14/2021 
-- Design Name: 
-- Module Name:    receiver - Behavioral 
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

entity receiver is port(input, clk: in std_logic;
								output: out std_logic_vector(7 downto 0);
								parity_error, frame_error, data_ready: out std_logic);
end receiver;

architecture Behavioral of receiver is

signal parity: std_logic_vector(7 downto 0) := "00000000";
type state is (state1, state2, state3, state4, state5, state6, state7, state8, state9, state10, state11);
signal pr_state, nx_state: state;

begin

p1: process(clk)
begin
if rising_edge(clk) then
	pr_state <= nx_state;
end if;
end process;

p2: process(pr_state)
variable int_check: integer range 0 to 15 := 0;
begin
case pr_state is
	when state1 =>	if input = '0' then 
							nx_state <= state2;
							data_ready <= '0';
						end if;
	when state2 =>	output(0) <= input;
						parity(0) <= input;
						nx_state <= state3;
	when state3 =>	output(1) <= input;
						parity(1) <= input;
						nx_state <= state4;
	when state4 =>	output(2) <= input;
						parity(2) <= input;
						nx_state <= state5;
	when state5 =>	output(3) <= input;
						parity(3) <= input;
						nx_state <= state6;
	when state6 =>	output(4) <= input;
						parity(4) <= input;
						nx_state <= state7;
	when state7 =>	output(5) <= input;
						parity(5) <= input;
						nx_state <= state8;
	when state8 =>	output(6) <= input;
						parity(6) <= input;
						nx_state <= state9;
	when state9 =>	output(7) <= input;
						parity(7) <= input;
						nx_state <= state10;
	when state10=>	int_check := conv_integer(parity);
						int_check := int_check rem 2;
						if int_check = 0 then
							if input = '1' then 
								parity_error <= '1';
							else 
								parity_error <= '0';
							end if;
						elsif int_check = 1 then
							if input = '0' then 
								parity_error <= '1';
							else 
								parity_error <= '0';
							end if;
						end if;
						nx_state <= state11;
	when state11=>	if input = '1' then 
							frame_error <= '0';
							data_ready <= '1';
						else
							frame_error <= '1';
						end if;
							nx_state <= state1;
	when others =>	nx_state <= state1;
	end case;
end process;
end Behavioral;