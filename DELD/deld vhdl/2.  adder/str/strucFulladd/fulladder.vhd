----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:48:50 10/12/2018 
-- Design Name: 
-- Module Name:    fulladder - Behavioral 
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

entity fulladder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end fulladder;

architecture Behavioral of fulladder is
component half_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s1 : out  STD_LOGIC;
           c1 : out  STD_LOGIC);
end component;
component orgate is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC);
end component;
signal s1,c2,c1 : std_logic; 
begin
u0: half_adder port map (a,b,s1,c1);
u1: half_adder port map (s1,cin,sum,c2);
u2: orgate port map (c1,c2,carry);


end Behavioral;

