----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:35:26 10/16/2019 
-- Design Name: 
-- Module Name:    HSCode - Behavioral 
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

entity hsub1 is
    Port ( A : in  STD_LOGIC;
			  B : in STD_LOGIC;
           DIFF : out  STD_LOGIC;
			  BORR : out  STD_LOGIC);
end hsub1;

architecture Behavioral of hsub1 is

begin
DIFF<=A XOR B;
BORR<=NOT A AND B;

end Behavioral;



