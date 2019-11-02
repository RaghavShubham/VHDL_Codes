--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.1i
--  \   \         Application : ISE
--  /   /         Filename : wave1.vhw
-- /___/   /\     Timestamp : Thu Oct 11 06:19:48 2018
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: wave1
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY wave1 IS
END wave1;

ARCHITECTURE testbench_arch OF wave1 IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT eight
        PORT (
            s2 : In std_logic;
            s1 : In std_logic;
            s0 : In std_logic;
            d0 : In std_logic;
            d1 : In std_logic;
            d2 : In std_logic;
            d3 : In std_logic;
            d4 : In std_logic;
            d5 : In std_logic;
            d6 : In std_logic;
            d7 : In std_logic;
            y : Out std_logic
        );
    END COMPONENT;

    SIGNAL s2 : std_logic := '0';
    SIGNAL s1 : std_logic := '0';
    SIGNAL s0 : std_logic := '0';
    SIGNAL d0 : std_logic := '1';
    SIGNAL d1 : std_logic := '0';
    SIGNAL d2 : std_logic := '0';
    SIGNAL d3 : std_logic := '0';
    SIGNAL d4 : std_logic := '0';
    SIGNAL d5 : std_logic := '0';
    SIGNAL d6 : std_logic := '0';
    SIGNAL d7 : std_logic := '0';
    SIGNAL y : std_logic := '0';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : eight
        PORT MAP (
            s2 => s2,
            s1 => s1,
            s0 => s0,
            d0 => d0,
            d1 => d1,
            d2 => d2,
            d3 => d3,
            d4 => d4,
            d5 => d5,
            d6 => d6,
            d7 => d7,
            y => y
        );

        PROCESS    -- clock process for s2
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                s2 <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                s2 <= '1';
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
                s0 <= '1';
                d1 <= '1';
                d3 <= '1';
                d4 <= '1';
                d7 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  285ns
                WAIT FOR 200 ns;
                s1 <= '1';
                s0 <= '0';
                d0 <= '0';
                d2 <= '1';
                d4 <= '0';
                d5 <= '1';
                d7 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  485ns
                WAIT FOR 200 ns;
                s1 <= '0';
                d1 <= '0';
                d5 <= '0';
                d6 <= '1';
                d7 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  685ns
                WAIT FOR 200 ns;
                s1 <= '1';
                s0 <= '1';
                d0 <= '1';
                d4 <= '1';
                d6 <= '0';
                d7 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  885ns
                WAIT FOR 200 ns;
                s0 <= '0';
                d1 <= '1';
                d3 <= '0';
                d5 <= '1';
                d7 <= '1';
                -- -------------------------------------
                WAIT FOR 315 ns;

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

