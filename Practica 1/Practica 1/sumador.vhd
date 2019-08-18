library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sumador is
	port(op1 : in std_logic_vector(3 downto 0);
		  op2 : in std_logic_vector(3 downto 0);
		  res : out std_logic_vector(3 downto 0));
end sumador;

architecture rtl of sumador is
begin
	res <= std_logic_vector(unsigned(op1)+unsigned(op2));
end rtl;