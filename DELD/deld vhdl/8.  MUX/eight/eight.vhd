----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:14:05 10/11/2018 
-- Design Name: 
-- Module Name:    eight - Behavioral 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity eight is
    Port ( s2 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           s0 : in  STD_LOGIC;
           d0 : in  STD_LOGIC;
           d1 : in  STD_LOGIC;
           d2 : in  STD_LOGIC;
           d3 : in  STD_LOGIC;
           d4 : in  STD_LOGIC;
           d5 : in  STD_LOGIC;
           d6 : in  STD_LOGIC;
           d7 : in  STD_LOGIC;
           y : out  STD_LOGIC);
end eight;

architecture Behavioral of eight is

begin
y<= d0 when s2='0' and s1 ='0' and s0 = '0' else
	 d1 when s2='0' and s1 ='0' and s0 = '1' else
	 d2 when s2='0' and s1 ='1' and s0 = '0' else	
    d3 when s2='0' and s1 ='1' and s0 = '1' else
	 d4 when s2='1' and s1 ='0' and s0 = '0' else
	 d5 when s2='1' and s1 ='0' and s0 = '1' else
	 d6 when s2='1' and s1 ='1' and s0 = '0' else
	 d7;
end Behavioral;

