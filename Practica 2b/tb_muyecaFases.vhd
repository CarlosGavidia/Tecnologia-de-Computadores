----------------------------------------------------------------------------------
---- Company: 
---- Engineer:
----
---- Create Date:   16:39:11 10/26/2015
---- Design Name:   
---- Module Name:   C:/Users/GAVO/Desktop/UCM/2 curso Ingenieria Informatica/tecnologia de computadores/practicas/practica2/Practica2_avanzada_porFases/tb_muyecaFases.vhd
---- Project Name:  Practica2_avanzada_porFases
---- Target Device:  
---- Tool versions:  
---- Description:   
---- 
---- VHDL Test Bench Created by ISE for module: muyeca
---- 
---- Dependencies:
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
----
---- Notes: 
---- This testbench has been automatically generated using types std_logic and
---- std_logic_vector for the ports of the unit under test.  Xilinx recommends
---- that these types always be used for the top-level I/O of a design in order
---- to guarantee that the testbench will bind correctly to the post-implementation 
---- simulation model.
----------------------------------------------------------------------------------
--LIBRARY ieee;
--USE ieee.std_logic_1164.ALL;
-- 
---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----USE ieee.numeric_std.ALL;
-- 
--ENTITY tb_muyecaFases IS
--END tb_muyecaFases;
-- 
--ARCHITECTURE behavior OF tb_muyecaFases IS 
-- 
--    -- Component Declaration for the Unit Under Test (UUT)
-- 
--    COMPONENT muyeca
--    PORT(
--         rst : IN  std_logic;
--         clk : IN  std_logic;
--         c : IN  std_logic;
--         r : IN  std_logic;
--         g : OUT  std_logic;
--         l : OUT  std_logic
--        );
--    END COMPONENT;
--    
--
--   --Inputs
--   signal rst : std_logic := '0';
--   signal clk : std_logic := '0';
--   signal c : std_logic := '0';
--   signal r : std_logic := '0';
--
-- 	--Outputs
--   signal g : std_logic;
--   signal l : std_logic;
--
--   -- Clock period definitions
--   constant clk_period : time := 10 ns;
-- 
--BEGIN
-- 
--	-- Instantiate the Unit Under Test (UUT)
--   uut: muyeca PORT MAP (
--          rst => rst,
--          clk => clk,
--          c => c,
--          r => r,
--          g => g,
--          l => l
--        );
--
--   -- Clock process definitions
--   clk_process :process
--   begin
--		clk <= '0';
--		wait for clk_period/2;
--		clk <= '1';
--		wait for clk_period/2;
--   end process;
-- 
--
--   -- Stimulus process
--   stim_proc: process
--   begin		
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for clk_period*10;
--
--      -- insert stimulus here 
--
--      wait;
--   end process;
--
--END;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use std.textio.all;
 
ENTITY tb_muyecaFases IS
END tb_muyecaFases;
 
ARCHITECTURE behavior OF tb_muyecaFases IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT muyecaFases 
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         c : IN  std_logic;
         r : IN  std_logic;
         g : OUT  std_logic;
         l : OUT  std_logic
        );
    END COMPONENT;
    

  signal clk, rst, g, l : std_logic;
  signal rc               : std_logic_vector(1 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: muyecaFases PORT MAP (
          rst => rst,
          clk => clk,
          c => rc(0),
          r => rc(1),
          g => g,
          l => l
        );
 p_clk : process
  begin
    clk <= '0', '1' after 5 ns;
    wait for 10 ns;
  end process p_clk;

  -- External reset
  p_rst : process
  begin
    rst <= '0';
    
    wait;
  end process p_rst;

   p_driver : process
    variable v_i : natural := 0;
  begin
    rc <= "00";
    wait for 50 ns;
	 rc <= "10";
	 wait for 200 ns;
	   wait until falling_edge(clk);
      rc <= "00";
		wait until falling_edge(clk);
      rc <= "01";
	   assert g='0'
			report "tranquila -> tranquila"
			severity error;

		wait until falling_edge(clk);
      rc <= "10";
      assert g='0'
			report "tranquila -> dormida"
			severity error;	
		wait until falling_edge(clk);
		assert (g='1' and l='1')
			report "dormida -> t1"
			severity error;
--

		wait until falling_edge(clk);
		assert (g='1' and l='1')
			report "t1 -> t2"
			severity error;
			
			wait until falling_edge(clk);
		assert (g='1' and l='1')
			report "t2 -> t3"
			severity error;



--			
      rc <= "00";
		wait until falling_edge(clk);
		assert g='0'
			report "t3 -> tranquila"
			severity error;	
      rc <= "10";
		wait until falling_edge(clk);
		assert g='1' and l='0'
			report "tranquila -> hablando"
			severity error;
		rc <= "01";
		wait until falling_edge(clk);
		assert g='0'
		    report "hablando -> dormida"
			 severity error;
		rc <= "11";
		wait until falling_edge(clk);
		assert (g='1' and l='1')
		    report "dormida -> t1"
			 severity error;
			 
			 --
			
			 
			  wait until falling_edge(clk);
		assert (g='1' and l='1')
		    report "t1 -> t2"
			 severity error;
			 
			  wait until falling_edge(clk);
		assert (g='1' and l='1')
		    report "t2 -> t3"
			 severity error;
			 
			 
			 
			 
			 
			 --
		rc <= "01";
		wait until falling_edge(clk);
		assert g='0'
		    report "t3 -> dormida"
			 severity error;
		wait;
  end process p_driver;


END;
