--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.1i
--  \   \         Application : ISE
--  /   /         Filename : gjfghjfgh.vhw
-- /___/   /\     Timestamp : Wed Oct 30 01:07:09 2019
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: gjfghjfgh
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY gjfghjfgh IS
END gjfghjfgh;

ARCHITECTURE testbench_arch OF gjfghjfgh IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT sdfsdfs
        PORT (
            d0 : In std_logic;
            d1 : In std_logic;
            d2 : In std_logic;
            d3 : In std_logic;
            s0 : In std_logic;
            s1 : In std_logic;
            y : Out std_logic
        );
    END COMPONENT;

    SIGNAL d0 : std_logic := '0';
    SIGNAL d1 : std_logic := '0';
    SIGNAL d2 : std_logic := '0';
    SIGNAL d3 : std_logic := '0';
    SIGNAL s0 : std_logic := '0';
    SIGNAL s1 : std_logic := '0';
    SIGNAL y : std_logic := '0';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : sdfsdfs
        PORT MAP (
            d0 => d0,
            d1 => d1,
            d2 => d2,
            d3 => d3,
            s0 => s0,
            s1 => s1,
            y => y
        );

        PROCESS    -- clock process for d0
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                d0 <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                d0 <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            PROCEDURE CHECK_y(
                next_y : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (y /= next_y) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns y="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, y);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_y);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  85ns
                WAIT FOR 85 ns;
                d1 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  285ns
                WAIT FOR 200 ns;
                d3 <= '1';
                s1 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  485ns
                WAIT FOR 200 ns;
                s0 <= '1';
                s1 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  685ns
                WAIT FOR 200 ns;
                d2 <= '1';
                s1 <= '1';
                -- -------------------------------------
                WAIT FOR 515 ns;

                IF (TX_ERROR = 0) THEN
                    STD.TEXTIO.write(TX_OUT, string'("No errors or warnings"));
                    STD.TEXTIO.writeline(RESULTS, TX_OUT);
                    ASSERT (FALSE) REPORT
                      "Simulation successful (not a failure).  No problems detected."
                      SEVERITY FAILURE;
                ELSE
                    STD.TEXTIO.write(TX_OUT, TX_ERROR);
                    STD.TEXTIO.write(TX_OUT,
                        string'(" errors found in simulation"));
                    STD.TEXTIO.writeline(RESULTS, TX_OUT);
                    ASSERT (FALSE) REPORT "Errors found during simulation"
                         SEVERITY FAILURE;
                END IF;
            END PROCESS;

    END testbench_arch;

