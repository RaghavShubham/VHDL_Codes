----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:44:45 10/10/2019 
-- Design Name: 
-- Module Name:    FSUBSTR - Behavioral 
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

entity FSUBSTR is
PORT(A,B,C: IN STD_LOGIC;
		DIFFF,BORROW: OUT STD_LOGIC);
end FSUBSTR;

architecture Behavioral of FSUBSTR is
SIGNAL C1,C2,C3,S1 : IN STD_LOGIC;

COMPONENT XOR_2 IS 
PORT(K,D,E : IN STD_LOGIC;
		F: OUT: STD_LOGIC);
END COMPONENT;

COMPONENT AND_1 IS
PORT(X,Y : IN STD_LOGIC;
		Z: OUT STD_LOGIC) 
END COMPONENT;
COMPONENT OR_1 IS 
PORT(G,H,I : IN STD_LOGIC;
		Z: OUT STD_LOGIC);
END COMPONENT;

COMPONENT NOT_1 IS 
PORT(U: IN STD_LOGIC;
		V: OUT STD_LOGIC);
END COMPONENT;

begin
X0: XOR_2 PORT MAP(A,B,C,DIFFF);
X2: AND_1 PORT MAP(S1,B,C1);
X3: AND_1 PORT MAP(C,B,C2);
X4: AND_1 PORT MAP(S1,C,C3);
X5: OR_1 PORT MAP(C1,C2,C3,BORROW);
end Behavioral;

