library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sbvd is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           up_down : in  STD_LOGIC;
           counter : out  STD_LOGIC_VECTOR(3 downto 0)
 );
end sbvd;

architecture Behavioral of sbvd is
signal counter_updown: std_logic_vector(3 downto 0);

begin
process(clk,reset,up_down)
begin
if(clk='1' and clk'event) then
if(reset='1') then
counter_updown<=x"0";
elsif(up_down='1') then
counter_updown<= counter_updown-x"1";
else
counter_updown<=counter_updown+x"1";
end if;
end if;
end process;
counter<=counter_updown;



end Behavioral;
