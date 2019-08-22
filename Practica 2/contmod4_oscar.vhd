----------------------------------------------------------------------------------
-- Company:        UCM
-- Engineer:       Oscar Garnica
-- 
-- Create Date:    11:07:57 10/22/2012 
-- Design Name:    counter
-- Module Name:    rtl 
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity cntr is
  generic (k : integer := 4;            -- Module value
           n : integer := 2);           -- Counter width
-- k < 2**n
  port (rst  : in  std_logic;           -- Asynch reset
        clk  : in  std_logic;           -- Input clock
		  cu   : in  std_logic;
        cntr : out std_logic_vector(n-1 downto 0));
end cntr;

architecture rtl of cntr is
signal clk_int: std_logic;
  signal cntr_reg : unsigned(n-1 downto 0);
  component divisor is
	port(rst	    : in std_logic;
		  clk      : in std_logic;
        clk_1hz  : out std_logic);
end component;

begin
---------------------------------------------------------
-- Descomentar cuando se vaya a realizar la implementacion en la FPGA
--Para la implementacion, necesitamos el dividor de frecuencia
---------------------------------------------------------
i_clk_int: divisor port map(
	rst     => rst,
	clk     => clk,
	clk_1hz => clk_int);
  --egin

  cntr <= std_logic_vector(cntr_reg);

  p_cntr_reg : process(clk_int , rst)
  begin
    --if rst = '1' then
     -- cntr_reg <= (others => '0');
    if rising_edge(clk_int) then
		 if rst = '1' then
		  cntr_reg <= (others => '0');
		  else 
			if cu = '1' then
				if cntr_reg < (k-1) then
				  cntr_reg <= cntr_reg+1;
				else
				  cntr_reg <= (others => '0');
				end if;
			else
				cntr_reg <= cntr_reg;
			
			end if;
		 end if;
	 end if;
  end process p_cntr_reg;

end rtl;

