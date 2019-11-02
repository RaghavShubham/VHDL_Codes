----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:35:14 10/12/2018 
-- Design Name: 
-- Module Name:    StucSyn - Behavioral 
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

entity StucSyn is
    Port ( clok : in  STD_LOGIC;
           rest : in  STD_LOGIC;
           qout : out  STD_LOGIC_VECTOR (2 downto 0));
end StucSyn;
architecture Behavioral of StucSyn is
component jff
	Port ( j : in  STD_LOGIC;
           k : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component;
--signal temp:std_logic_vector(2 downto 0):="000";
signal j3,q1,q2,q3: std_logic;

beginj3<=q1 and q2;
 d0 : jff  port map ('1','1',clok,rest,q1);
 d1 : jff  port map (q1,q1,clok,rest,q2);
 d2 : jff  port map (j3,j3,clok,rest,q3);
 qout(2) <=  q3;  
 qout(1) <=  q2;  
 qout(0) <=  q1;	  

end Behavioral;



