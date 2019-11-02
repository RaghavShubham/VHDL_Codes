----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:47:41 10/11/2018 
-- Design Name: 
-- Module Name:    two - Behavioral 
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

entity two is
    Port ( d0 : in  STD_LOGIC;
           d1 : in  STD_LOGIC;
			  s : in  STD_LOGIC;
           y : out  STD_LOGIC);
end two;

architecture Behavioral of two is

begin
y <= d0 when s='0' else d1;



end Behavioral;

