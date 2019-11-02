----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:07:38 10/16/2019 
-- Design Name: 
-- Module Name:    HACode - Behavioral 
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

entity andgate is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           y1 : out  STD_LOGIC);
end andgate;

architecture Behavioral of HACode is
begin
y1<=a and b;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity orgate is
    Port ( a : in  STD_LOGIC;
			  b : in  STD_LOGIC;
			  y2 : out  STD_LOGIC);
end orgate;

architecture Behavioral of notgate is
begin
y2<= a or b;
end behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HACode is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
			  sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end HACode;

architecture Behavioral of HACode is
component andgate is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           y1 : out  STD_LOGIC);
end component;
component orgate is
    Port ( a : in  STD_LOGIC;
			  b : in  STD_LOGIC;
			  y2 : out  STD_LOGIC);
end component;
signal y1,y3: std_logic;
begin
u0: andgate port map (a,not b,y1);
u1: andgate port map (not a,b,y3);
u2: andgate port map (a,b,carry);
u3: orgate port map (y1,y3,sum);

end Behavioral;


