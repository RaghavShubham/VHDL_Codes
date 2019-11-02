----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:37:34 10/07/2019 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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

entity mux is
    Port ( input : in  STD_LOGIC;
           s0 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           s2 : in  STD_LOGIC;
           y : out  STD_LOGIC);
end mux;

architecture Behavioral of mux is

begin
pa process(input,s0,s1,s2)

if(s2<=0 and s1<=0 and s0<=0)then
	y<=input(0);
elsif(s2<=0 and s1<=0 and s0<=1) then
	y<=input(1);
elsif(s2<=0 and s1<=1 and s0<=0)then
	y<=input(2);
elsif(s2<=0 and s1<=1 and s0<=1)then
	y<=input(3);
elsif(s2<=1 and s1<=0 and s0<=0)then
	y<=input(4);
elsif(s2<=1 and s1<=0 and s0<=1)then
	y<=input(5);
elsif(s2<=1 and s1<=1 and s0<=0)then
	y<=input(6);
elsif(s2<=1 and s1<=1 and s0<=1)then
	y<=input(7);
	
end process pa;



end Behavioral;

