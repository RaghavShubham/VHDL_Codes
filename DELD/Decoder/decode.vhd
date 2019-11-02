----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:11:38 10/16/2019 
-- Design Name: 
-- Module Name:    decode - Behavioral 
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

entity decode is
Port ( i : in  STD_LOGIC_VECTOR (2 downto 0);
y : out  STD_LOGIC_VECTOR (7 downto 0));
end decode;

architecture Behavioral of decode is

begin
process(i)
begin
case i is
when "111" => y<="00000001";
when "110" => y<="00000010";
when "101" => y<="00000100";
when "100" => y<="00001000";
when "011" => y<="00010000";
when "010" => y<="00100000";
when "001" => y<="01000000";

when "000" => y<="10000000";
when others => null;
end case;
end process;
end Behavioral;