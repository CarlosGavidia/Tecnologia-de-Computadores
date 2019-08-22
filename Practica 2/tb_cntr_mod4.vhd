--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:31:51 10/18/2015
-- Design Name:   
-- Module Name:   C:/Xilinx/P2/Contador_Mod4/cntr_mod4.vhd
-- Project Name:  Contador_Mod4
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
use	ieee.numeric_std.all;	
use	std.textio.all;	
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY cntr_mod4 IS
END cntr_mod4;
 
ARCHITECTURE behavior OF cntr_mod4 IS 
 
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
	signal cntr2	:	std_logic_vector(1	downto	0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cntr PORT MAP (
          rst => rst,
          clk => clk,
          cu => cu,
			 cntr => cntr2
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
      
      wait for 50 ns;
		rst <= '1';
		cu  <= '0';
		wait for 50 ns;
		rst <= '0';
		cu  <= '0';
		wait for 50 ns;
      rst <= '0';
		cu  <= '1';
		wait for 50 ns;
		rst <= '0';
		cu  <= '1';
		wait for 50 ns;
		rst <= '0';
		cu  <= '0';
		wait for 50 ns;
		rst <= '0';
		cu  <= '1';
		wait for 50 ns;
		rst <= '0';
		cu  <= '1';
		
   end process;

END;