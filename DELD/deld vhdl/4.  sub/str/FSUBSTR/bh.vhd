
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:14:24 10/15/2019
-- Design Name:   FSUB
-- Module Name:   bh.vhd
-- Project Name:  FSUBSTR
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSUB
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY bh_vhd IS
END bh_vhd;

ARCHITECTURE behavior OF bh_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT FSUB
	PORT(
		FA : IN std_logic;
		FB : IN std_logic;
		FBIN : IN std_logic;          
		FDIFF : OUT std_logic;
		FBORR : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL FA :  std_logic := '0';
	SIGNAL FB :  std_logic := '0';
	SIGNAL FBIN :  std_logic := '0';

	--Outputs
	SIGNAL FDIFF :  std_logic;
	SIGNAL FBORR :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: FSUB PORT MAP(
		FA => FA,
		FB => FB,
		FBIN => FBIN,
		FDIFF => FDIFF,
		FBORR => FBORR
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

		-- Place stimulus here

		wait; -- will wait forever
	END PROCESS;

END;
