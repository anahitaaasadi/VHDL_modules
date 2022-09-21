--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:11:48 11/05/2021
-- Design Name:   
-- Module Name:   D:/ISE/az4/dac_t1.vhd
-- Project Name:  az4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dac
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
library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY dac_t1 IS
END dac_t1;
 
ARCHITECTURE behavior OF dac_t1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dac
    PORT(
         clk : IN  std_logic;
         din : IN  std_logic_vector(1 downto 0);
         dout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal din : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal dout : std_logic_vector(7 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dac PORT MAP (
          clk => clk,
          din => din,
          dout => dout
        );

	clk <= not(clk) after 10 ns;
	din <= "00" after 5 ns, "01" after 500 us, "10" after 1 ms, "11" after 1500 us;

END;
