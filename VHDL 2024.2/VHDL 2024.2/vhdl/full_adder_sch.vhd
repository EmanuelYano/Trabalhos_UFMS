-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Fri Sep 06 10:58:39 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY full_adder_sch IS 
	PORT
	(
		a :  IN  STD_LOGIC;
		b :  IN  STD_LOGIC;
		c :  IN  STD_LOGIC;
		sum :  OUT  STD_LOGIC;
		carry :  OUT  STD_LOGIC
	);
END full_adder_sch;

ARCHITECTURE bdf_type OF full_adder_sch IS 

COMPONENT half_adder
	PORT(x : IN STD_LOGIC;
		 y : IN STD_LOGIC;
		 sum : OUT STD_LOGIC;
		 carry : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;


BEGIN 



b2v_inst : half_adder
PORT MAP(x => c,
		 y => SYNTHESIZED_WIRE_0,
		 sum => sum,
		 carry => SYNTHESIZED_WIRE_2);


b2v_inst1 : half_adder
PORT MAP(x => a,
		 y => b,
		 sum => SYNTHESIZED_WIRE_0,
		 carry => SYNTHESIZED_WIRE_1);


carry <= SYNTHESIZED_WIRE_1 OR SYNTHESIZED_WIRE_2;


END bdf_type;