--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.1i
--  \   \         Application : ISE
--  /   /         Filename : wAVEEEEEEEEE.vhw
-- /___/   /\     Timestamp : Wed Oct 16 13:59:27 2019
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: wAVEEEEEEEEE
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY wAVEEEEEEEEE IS
END wAVEEEEEEEEE;

ARCHITECTURE testbench_arch OF wAVEEEEEEEEE IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT FSUB
        PORT (
            FA : In std_logic;
            FB : In std_logic;
            FBIN : In std_logic;
            FDIFF : Out std_logic;
            FBORR : Out std_logic
        );
    END COMPONENT;

    SIGNAL FA : std_logic := '0';
    SIGNAL FB : std_logic := '0';
    SIGNAL FBIN : std_logic := '0';
    SIGNAL FDIFF : std_logic := '0';
    SIGNAL FBORR : std_logic := '0';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : FSUB
        PORT MAP (
            FA => FA,
            FB => FB,
            FBIN => FBIN,
            FDIFF => FDIFF,
            FBORR => FBORR
        );

        PROCESS    -- clock process for FA
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                FA <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                FA <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            PROCEDURE CHECK_FBORR(
                next_FBORR : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (FBORR /= next_FBORR) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns FBORR="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, FBORR);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_FBORR);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_FDIFF(
                next_FDIFF : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (FDIFF /= next_FDIFF) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns FDIFF="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, FDIFF);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_FDIFF);
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
                FB <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  285ns
                WAIT FOR 200 ns;
                FBIN <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  485ns
                WAIT FOR 200 ns;
                FB <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  685ns
                WAIT FOR 200 ns;
                FBIN <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  885ns
                WAIT FOR 200 ns;
                FB <= '1';
                FBIN <= '1';
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

