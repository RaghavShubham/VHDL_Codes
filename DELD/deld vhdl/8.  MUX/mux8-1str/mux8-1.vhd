----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:21:48 10/16/2019 
-- Design Name: 
-- Module Name:    dsad - Behavioral 
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

-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:24:59 09/25/2017 
-- Design Name: 
-- Module Name:    MUX2TO1 - Behavioral 
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

entity MUX2TO1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S  : in  STD_LOGIC;
			  E : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end MUX2TO1;

architecture Behavioral of MUX2TO1 is

begin

Y<= NOT E and ( (( NOT S AND  A) OR (B AND S) ));
end Behavioral;
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:57:47 09/26/2017 
-- Design Name: 
-- Module Name:    m4to1 - Behavioral 
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

entity m4to1 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           s0 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
			  E: in  STD_LOGIC;
           y : out  STD_LOGIC);
end m4to1;

architecture Behavioral of m4to1 is
component MUX2TO1 is
    
	 Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : in  STD_LOGIC;
	  E: in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

signal y1,y2: std_logic;

begin

mux1 : mux2to1 port map (a,b,s0,E,y1);
mux2 : mux2to1 port map (c,d, s0,not E,y2);
mux3 : mux2to1 port map (y1,y2,s1,E,y);

end Behavioral;
