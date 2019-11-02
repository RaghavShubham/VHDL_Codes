
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:19:19 10/15/2019
-- Design Name:   jff
-- Module Name:   fg.vhd
-- Project Name:  gghhghjgjhg
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: jff
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity strucAsyn is
    Port ( clok : in  STD_LOGIC;
           rest : in  STD_LOGIC;
           qout : out  STD_LOGIC_VECTOR (3 downto 0));
end strucAsyn;

architecture Behavioral of strucAsyn is
component jff
	Port (  j : in  STD_LOGIC;
           k : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component;

signal t : std_logic_vector(3 downto 0);
begin

D0 : jff port map('1','1',clok,rest,t(0));
D1 : jff port map('1','1',t(0),rest,t(1));
D2 : jff port map('1','1',t(1),rest,t(2));
D3 : jff port map('1','1',t(2),rest,t(3));

qout(0) <= not t(0);
qout(1) <= not t(1);
qout(2) <= not t(2);
qout(3) <= not t(3);
end Behavioral;

