----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:14:39 10/11/2018 
-- Design Name: 
-- Module Name:    halfadder - Behavioral 
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

entity hadder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
			  sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end hadder;

architecture Behavioral of halfadder is

begin
sum <= ((a and not b) or (not a and b));
carry <= a and b;

end Behavioral;

