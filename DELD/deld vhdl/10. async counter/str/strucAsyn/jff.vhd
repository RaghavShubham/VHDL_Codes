----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:26:40 10/12/2018 
-- Design Name: 
-- Module Name:    jff - Behavioral 
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
process(j, k, clk, rst)
variable t:STD_LOGIC;

beginif(rst = '1')then
		t:='1';
elsif(clk='1'and clk'event)then
		if(j='0' and k='0')then
			t:=t;
		elsif(j='1' and k='1')then
			t:=not t;
		elsif(j='0' and k='1')then
			t:='0';
		else
			t:='1';
		end if;
end if;
	q<=t;
end process;

end Behavioral;

