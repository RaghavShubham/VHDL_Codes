----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:43:51 10/07/2019 
-- Design Name: 
-- Module Name:    multiplexer8_1 - Behavioral 
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

entity multiplexer8_1 is
    Port ( din : in  STD_LOGIC_VECTOR (7 DOWNTO 0);
           sel : in  STD_LOGIC_VECTOR (2 DOWNTO 0);
           y : out  STD_LOGIC);
end multiplexer8_1;

architecture Behavioral of multiplexer8_1 is

begin
y <= din(7) when (sel="000") else
            din(6) when (sel="001") else
            din(5) when (sel="010") else
            din(4) when (sel="011") else
            din(3) when (sel="100") else
            din(2) when (sel="101") else
            din(1) when (sel="110") else
            din(0);


end Behavioral;

