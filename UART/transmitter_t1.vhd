--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:17:11 05/14/2021
-- Design Name:   
-- Module Name:   D:/ISE/HW5/UART/transmitter_t1.vhd
-- Project Name:  UART
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: transmitter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_ARITH.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY transmitter_t1 IS
END transmitter_t1;
 
ARCHITECTURE behavior OF transmitter_t1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT transmitter
    PORT(
         input : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         en : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal en : std_logic := '0';

 	--Outputs
   signal output : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: transmitter PORT MAP (
          input => input,
          clk => clk,
          en => en,
          output => output
        );

input <= "10110100" after 50 ns;
clk <= not(clk) after 30 ns;
en <= '1' after 30 ns, '0' after 140 ns;

END;
