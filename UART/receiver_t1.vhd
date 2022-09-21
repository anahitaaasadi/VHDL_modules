--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:25:11 05/14/2021
-- Design Name:   
-- Module Name:   D:/ISE/HW5/UART/receiver_t1.vhd
-- Project Name:  UART
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: receiver
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
 
ENTITY receiver_t1 IS
END receiver_t1;
 
ARCHITECTURE behavior OF receiver_t1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT receiver
    PORT(
         input : IN  std_logic;
         clk : IN  std_logic;
         output : OUT  std_logic_vector(7 downto 0);
         parity_error : OUT  std_logic;
         frame_error : OUT  std_logic;
         data_ready : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(7 downto 0);
   signal parity_error : std_logic;
   signal frame_error : std_logic;
   signal data_ready : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: receiver PORT MAP (
          input => input,
          clk => clk,
          output => output,
          parity_error => parity_error,
          frame_error => frame_error,
          data_ready => data_ready
        );
		  
input <=	'0' after 60 ns , '1' after 120 ns, '0' after 180 ns, '1' after 240 ns,
			'1' after 300 ns, '0' after 360 ns, '1' after 420 ns, '0' after 480 ns,
			'1' after 520 ns, '1' after 580 ns;
clk <= not(clk) after 30 ns;

END;
