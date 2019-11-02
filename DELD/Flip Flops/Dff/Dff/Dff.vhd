----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:19:34 10/06/2019 
-- Design Name: 
-- Module Name:    Dff - Behavioral 
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

entity Dff is
    Port ( clk : in  STD_LOGIC;
			reset : in std_logic;
           d : in  STD_LOGIC;
           q : out  STD_LOGIC);
end Dff;

architecture Behavioral of Dff is
signal temp: std_logic;
begin
process(clk,d,reset)
begin
if(reset='1') then
temp<='0';


elsif(clk'event and clk='1') then
	if(d='1') then
	temp<='1';
	else
	temp<='0';
	
end if;
end if;
q<=temp;
end process;
end Behavioral;

