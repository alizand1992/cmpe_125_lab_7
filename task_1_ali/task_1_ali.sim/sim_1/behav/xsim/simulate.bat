@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Thu Nov 07 17:04:35 -0800 2019
REM SW Build 2615518 on Fri Aug  9 15:55:25 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim control_unit_data_path_tb_behav -key {Behavioral:sim_1:Functional:control_unit_data_path_tb} -tclbatch control_unit_data_path_tb.tcl -log simulate.log"
call xsim  control_unit_data_path_tb_behav -key {Behavioral:sim_1:Functional:control_unit_data_path_tb} -tclbatch control_unit_data_path_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
