----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:09:46 10/16/2019 
-- Design Name: 
-- Module Name:    asccode - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity JKFF is
    Port ( j : in  STD_LOGIC;
           k: in  STD_LOGIC;
           c : in  STD_LOGIC;
           r : in  STD_LOGIC;
           q: out  STD_LOGIC);
end JKFF;

architecture Behavioral of JKFF is

SIGNAL s : STD_LOGIC := '0';
begin

	PROCESS(c, r,j,k) BEGIN
		
		IF(r = '1') THEN
				s<='0';
		ELSIF(c'EVENT AND c='1') THEN
			IF(j='0' AND k='0') THEN
				s<=s;
			ELSIF(j='0' AND k='1') THEN
				s<='0';
			ELSIF(j='1' AND k='0') THEN
				s<='1';
			ELSIF(j='1' AND k='1') THEN 
				s<= (NOT s);
			END IF;
		END IF;
		q<=s;
			
	END PROCESS;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Async is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR(3 DOWNTO 0));
end Async;

architecture str of Async is

COMPONENT JKFF is
 Port ( j,k,c,r : in  STD_LOGIC;
		  q : out  STD_LOGIC);
end COMPONENT;

SIGNAL s : STD_LOGIC_VECTOR(3 DOWNTO 0);
begin

	x0: JKFF PORT MAP('1', '1', clk, rst, s(0));
	x1: JKFF PORT MAP('1', '1', s(0), rst, s(1));
	x2: JKFF PORT MAP('1', '1', s(1), rst, s(2));
	x3: JKFF PORT MAP('1', '1', s(2), rst, s(3));
	
	q(0) <= s(0);
	q(1) <= s(1);
	q(2) <= s(2);
	q(3) <= s(3);
	

end str;

