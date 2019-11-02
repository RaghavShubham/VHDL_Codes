----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:14:45 10/10/2019 
-- Design Name: 
-- Module Name:    FSUB3 - Behavioral 
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

entity FSUB3 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           BIN : in  STD_LOGIC;
           DIFF : out  STD_LOGIC;
           BORR : out  STD_LOGIC);
end FSUB3;

architecture Behavioral of FSUB3 is

begin
PROCESS(A,B,BIN)
BEGIN

IF(A='0' AND B='0' AND BIN='0')THEN
DIFF<='0';BORR<='0';

ELSIF(A='0' AND B='0' AND BIN='1')THEN
DIFF<='1'; BORR<='1';

ELSIF(A='0' AND B='1' AND BIN='0')THEN
DIFF<='1' ; BORR<'1';

ELSIF(A='0' AND B='1' AND BIN='1')THEN
DIFF<='0 '; BORR<='1';

ELSIF(A='1' AND B='0' AND BIN='0')THEN
DIFF<='1' ; BORR<='0';

ELSIF(A='1' AND B='0' AND BIN='1')THEN
DIFF<='0' ; BORR<='0';

ELSIF(A='1' AND B='1' AND BIN='0')THEN
DIFF<='0' ; BORR<='0';

ELSIF(A='1' AND B='1' AND BIN='1')THEN
DIFF<='1' ; BORR<='1';

END IF;
END PROCESS;




end Behavioral;

