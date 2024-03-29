--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:14:59 10/20/2015
-- Design Name:   
-- Module Name:   C:/hlocal/Practica2/tb_contador.vhd
-- Project Name:  Practica2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cntr
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
 
ENTITY tb_contador IS
END tb_contador;
 
ARCHITECTURE behavior OF tb_contador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cntr
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         cu : IN  std_logic;
         cntr : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal cu : std_logic := '0';

 	--Outputs
   signal cntr_2 : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cntr PORT MAP (
          rst => rst,
          clk => clk,
          cu => cu,
          cntr => cntr_2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;

   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		rst <= '0';
      wait for 100 ns;	
          cu <= '1';
      --wait for clk_period*10;
		wait for 100 ns;	
          cu <= '0';
		wait for 100 ns;	
			 rst <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
