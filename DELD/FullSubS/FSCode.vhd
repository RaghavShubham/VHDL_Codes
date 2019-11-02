----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:40:22 10/16/2019 
-- Design Name: 
-- Module Name:    FSCode - Behavioral 
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

entity H1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           DIFF : out  STD_LOGIC;
           BORR : out  STD_LOGIC);
end H1;

architecture dataflow of H1 is
begin
DIFF <= A XOR B;
BORR <= NOT A AND B;
end dataflow;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity H2 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           DIFF : out  STD_LOGIC;
           BORR : out  STD_LOGIC);
end H2;
architecture dataflow of H2 is
begin
DIFF <= A XOR B;
BORR <= NOT A AND B;
end dataflow;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity OR_1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end OR_1;
architecture dataflow of OR_1 is
begin
C<= A OR B;
end dataflow;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSUB is
    Port ( FA : in  STD_LOGIC;
           FB : in  STD_LOGIC;
			  FBIN: in STD_LOGIC;
          FDIFF : out  STD_LOGIC;
           FBORR : out  STD_LOGIC);
end FSUB;
architecture STRUCTURAL of FSUB is
COMPONENT H1 IS
Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           DIFF : out  STD_LOGIC;
           BORR : out  STD_LOGIC);
END COMPONENT;

COMPONENT H2 IS
Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           DIFF : out  STD_LOGIC;
           BORR : out  STD_LOGIC);
END COMPONENT;

COMPONENT OR_1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end COMPONENT;

SIGNAL S0,S1,S2,S3: STD_LOGIC;

begin

U1: H1 PORT MAP(A=>FA,B=>FB,DIFF=>S0,BORR=>S1);
U2: H2 PORT MAP(A=>S0,B=>FBIN,DIFF=>FDIFF,BORR=>S3);
U3: OR_1 PORT MAP(A=>S3,B=>S1,C=>FBORR);

end STRUCTURAL;
