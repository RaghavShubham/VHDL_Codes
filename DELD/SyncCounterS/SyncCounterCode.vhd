----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:09:43 10/16/2019 
-- Design Name: 
-- Module Name:    SyncCounterCode - Behavioral 
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

entity jff is
    Port ( j : in  STD_LOGIC;
           k : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC);
end jff;

architecture Behavioral of jff is

begin
process(j,k,clk,rst)
variable t: STD_LOGIC;
begin

	if(rst='1') then
	t:='1';
	elsif(clk='1' and clk'event)then
		if(j='0' and k='0') then
		t := t;
		elsif(j='0' and k='1') then
		t := '0';
		elsif(j='1' and k='1') then
		t := not t;
		else
		t:= '1';
		end if;
	end if;
q <=t;
end process;
end Behavioral;
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



