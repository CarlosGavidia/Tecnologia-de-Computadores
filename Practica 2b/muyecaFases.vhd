----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:37:03 10/26/2015 
-- Design Name: 
-- Module Name:    muyeca - Behavioral 
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


entity muyeca is
		port (
		rst: in std_logic;
		clk: in std_logic;
		c: in std_logic;
		r: in std_logic;
		g:out std_logic;
		l:out std_logic);
		
end muyeca;

architecture Behavioral of muyeca is
signal clk_int : std_logic;
type t_estados is (tranquila, habla, dormida,t1,t2,t3);
signal estado_actual, estado_siguiente: t_estados;

begin
clk_int <= clk;

p_reg: process (clk_int, rst)
begin
	if rst= '1'then 
		estado_actual<= tranquila;
	elsif rising_edge (clk_int) then 
			estado_actual <= estado_siguiente;
		
	end if;
end process p_reg;

p_comb: process (estado_actual,r,c )	
begin

	case estado_actual is 
		when tranquila =>
		g <= '0';
		l <= '0';
		if c= '0' and r = '1' then 
			estado_siguiente <= habla;
		elsif c= '1' and r = '0' then 
			estado_siguiente <= dormida;
		else 
			estado_siguiente <= tranquila;
		end if;
		when habla =>
			g <= '1';
			l <= '0';
			if (c = '1') then
				estado_siguiente <= dormida;
			else
				estado_siguiente <= habla;
			end if;
		when dormida =>
			g <= '0';
			l <= '1'; 
			if (r = '1') then
				estado_siguiente <= t1;
			else
				estado_siguiente <= dormida;
			end if;
		when t1 =>
			g <= '1';
			l <= '1';
			estado_siguiente <= t2;
		when t2 =>
			g <= '1';
			l <= '1';
			estado_siguiente <= t3;
		when t3 =>
			g <= '1';
			l <= '1';
			if (c = '0' and r = '0') then
				estado_siguiente <= tranquila;
			elsif (c = '1' and r = '0') then
				estado_siguiente <= dormida;
			else
				estado_siguiente <= t1;
			end if;
			
	end case;
	
end process p_comb;
	

end Behavioral;


