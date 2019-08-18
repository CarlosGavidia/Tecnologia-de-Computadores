library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.STD_LOGIC_TEXTIO.ALL;
use STD.TEXTIO.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_sumador is
end tb_sumador;

architecture beh of tb_sumador is
--Declaración del componente que vamos a simular
component sumador
port( op1 : in std_logic_vector(3 downto 0);
	  op2 : in std_logic_vector(3 downto 0);
	  res : out std_logic_vector(3 downto 0));
end component;
-- Entradas
signal op1 : std_logic_vector(3 downto 0) := (others => '0');
signal op2 : std_logic_vector(3 downto 0) := (others => '0');
-- Salidas
signal res : std_logic_vector(3 downto 0);

begin
--Instanciacion de la unidad a simular
dut: sumador port map(
	op1 => op1,
	op2 => op2,
	res => res);
--Proceso de estimulos
p_stim: process
begin
			op1<= "0000";
			op2<= "0000";
	wait for 100 ns;
			op1<= "0101";
			op2<= "0100";
	wait for 100 ns;
			op1<= "0000";
			op2<= "0111";
	wait for 100 ns;
			op1<= "0011";
			op2<= "1000";
	wait for 100 ns;
			op1<= "1011";
			op2<= "1111";
	wait for 100 ns;
			op1<= "1001";
			op2<= "0110";
	wait;
	end process p_stim;
end beh;