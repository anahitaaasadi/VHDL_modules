--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:19:13 05/14/2021
-- Design Name:   
-- Module Name:   D:/ISE/HW5/UART/UART_t2.vhd
-- Project Name:  UART
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UART
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
 
ENTITY UART_t2 IS
END UART_t2;
 
ARCHITECTURE behavior OF UART_t2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UART
    PORT(
         data_in : IN  std_logic_vector(7 downto 0);
         data_out : OUT  std_logic_vector(7 downto 0);
         clock : IN  std_logic;
         enable : IN  std_logic;
         parityerror : OUT  std_logic;
         frameerror : OUT  std_logic;
         dataready : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal clock : std_logic := '0';
   signal enable : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);
   signal parityerror : std_logic;
   signal frameerror : std_logic;
   signal dataready : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UART PORT MAP (
          data_in => data_in,
          data_out => data_out,
          clock => clock,
          enable => enable,
          parityerror => parityerror,
          frameerror => frameerror,
          dataready => dataready
        );

data_in <= "10011011" after 100 ns;
clock <= not(clock) after 30 ns;
enable <= '1' after 40 ns;

END;