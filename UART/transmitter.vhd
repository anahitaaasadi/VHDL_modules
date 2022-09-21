----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:44:15 05/14/2021 
-- Design Name: 
-- Module Name:    UART - Behavioral 
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

entity transmitter is port(input: in std_logic_vector(7 downto 0);
									clk, en: in std_logic;
									output: out std_logic);
end transmitter;

architecture Behavioral of transmitter is

signal flag: std_logic := '0';
signal parity: std_logic_vector(7 downto 0) := "00000000";
signal in_reg: std_logic_vector(7 downto 0) := "00000000";

type state is (state1, state2, state3, state4, state5, state6, state7, state8, state9, state10, state11);
signal pr_state, nx_state: state;

begin

p1: process(clk)
begin
if rising_edge(clk) then
	pr_state <= nx_state;
	if en = '1' then
		in_reg <= input;
		pr_state <= state1;
		flag <= '1';
	else 
		flag <= '0';
	end if;
end if;
end process;

p2: process(pr_state)
variable int_check: integer range 0 to 15 := 0;
begin
case pr_state is
	when state1 =>	output <= '0';
						nx_state <= state2;
	when state2 =>	output <= in_reg(0);
						nx_state <= state3;
						parity <= parity + in_reg(0);
	when state3 =>	output <= in_reg(1);
						nx_state <= state4;
						parity <= parity + in_reg(1);
	when state4 =>	output <= in_reg(2);
						nx_state <= state5;
						parity <= parity + in_reg(2);
	when state5 =>	output <= in_reg(3);
						nx_state <= state6;
						parity <= parity + in_reg(3);
	when state6 =>	output <= in_reg(4);
						nx_state <= state7;
						parity <= parity + in_reg(4);
	when state7 =>	output <= in_reg(5);
						nx_state <= state8;
						parity <= parity + in_reg(5);
	when state8 =>	output <= in_reg(6);
						nx_state <= state9;
						parity <= parity + in_reg(6);
	when state9 =>	output <= in_reg(7);
						nx_state <= state10;
						parity <= parity + in_reg(7);
	when state10=>	int_check := conv_integer(parity);
						int_check := int_check rem 2;			
						if int_check = 0 then
							output <= '0';
						else
							output <= '1';
						end if;
						nx_state <= state11;
						parity <= "00000000";
	when state11 =>output <= '1';
						if(flag = '1') then
							nx_state <= state1;
						end if;
	when others =>	output <= '1';
	end case;
end process;
end Behavioral;