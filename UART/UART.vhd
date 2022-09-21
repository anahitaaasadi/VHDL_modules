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

entity UART is port(	data_in: in std_logic_vector(7 downto 0);
							data_out: out std_logic_vector(7 downto 0);
							clock, enable: in std_logic;
							parityerror, frameerror, dataready: out std_logic);
end UART;

architecture Structral of UART is

component transmitter port(input: in std_logic_vector(7 downto 0);
									clk, en: in std_logic;
									output: out std_logic);
end component;
component receiver port(input, clk: in std_logic;
								output: out std_logic_vector(7 downto 0);
								parity_error, frame_error, data_ready: out std_logic);
end component;

signal temp: std_logic;

begin

U1: transmitter port map(data_in, clock, enable, temp);
U2: receiver port map(temp, clock, data_out, parityerror, frameerror, dataready);

end Structral;