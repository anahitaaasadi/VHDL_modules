--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:44:32 05/07/2021
-- Design Name:   
-- Module Name:   D:/ISE/FIFO256/FIFO256_t1.vhd
-- Project Name:  FIFO256
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FIFO256
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY FIFO256_t1 IS
END FIFO256_t1;
 
ARCHITECTURE behavior OF FIFO256_t1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FIFO256
    PORT(
         din : IN  std_logic_vector(7 downto 0);
         clk_rd : IN  std_logic;
         clk_wr : IN  std_logic;
         wr : IN  std_logic;
         rd : IN  std_logic;
         dout : OUT  std_logic_vector(7 downto 0);
         full : OUT  std_logic;
         empty : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal din : std_logic_vector(7 downto 0) := (others => '0');
   signal clk_rd : std_logic := '0';
   signal clk_wr : std_logic := '0';
   signal wr : std_logic := '0';
   signal rd : std_logic := '0';

 	--Outputs
   signal dout : std_logic_vector(7 downto 0);
   signal full : std_logic;
   signal empty : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FIFO256 PORT MAP (
          din => din,
          clk_rd => clk_rd,
          clk_wr => clk_wr,
          wr => wr,
          rd => rd,
          dout => dout,
          full => full,
          empty => empty
        );

clk_rd <= not clk_rd after 30 ns;
clk_wr <= not clk_wr after 30 ns;
din <= "01011011" after 100 ns , "11111000" after 200 ns , "10100011" after 300 ns , "10100010" after 400 ns ,
		"10000001" after 500 ns , "10101011" after 600 ns, "11110011" after 700 ns, "00011110" after 800 ns,
		"11111100" after 900 ns, "01011100" after 1000 ns, "10111000" after 1100 ns, "00100001" after 1200 ns;
wr <= '1' after 200 ns, '0' after 400 ns, '1' after 600 ns, '0' after 800 ns,
			'1' after 1000 ns, '0' after 1200 ns;
rd <= '0' after 200 ns, '1' after 400 ns, '0' after 600 ns, '1' after 800 ns,
			'0' after 1000 ns, '1' after 1200 ns;

END;
