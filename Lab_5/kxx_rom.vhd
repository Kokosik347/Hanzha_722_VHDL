---------------------------------------------
--  Lab Work #5: compact reversive S-box kxx 
---------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_arith.all; -- old solution
--use IEEE.std_logic_unsigned.all; -- old solution
use IEEE.numeric_std.all; -- new solution

entity kxx_rom is
	port (
		R : in STD_LOGIC;
		X : in STD_LOGIC_VECTOR(3 downto 0);
		Y : out STD_LOGIC_VECTOR(3 downto 0)
	);
end entity;

architecture kxx_rom_arc of kxx_rom is  
	signal inp_addr : STD_LOGIC_VECTOR(4 downto 0);
	type sbox_array is array (0 to 31) of STD_LOGIC_VECTOR(3 downto 0);
	constant kxx : sbox_array := (
	    					x"c", x"1", x"a", x"f", x"9", x"2", x"6", x"8", --R=0;X:0-7
	                        x"0", x"d", x"3", x"4", x"e", x"7", x"5", x"b", --R=0;X:8-15
	                        x"8", x"1", x"5", x"a", x"b", x"e", x"6", x"d", --R=1;X:0-7
	                        x"7", x"4", x"2", x"f", x"0", x"9", x"c", x"3"  --R=1;X:8-15
	); 
begin															 											
	inp_addr <= R & X;
	
end architecture;