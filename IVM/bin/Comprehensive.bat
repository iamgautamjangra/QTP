echo off

REM change to the directory where batch file lives
REM cd %~dp0% 

REM store the current directory
REM SET AUTOMATION_DIR=%~dp0%..\..
REM echo AUTOMATION_DIR = %AUTOMATION_DIR%

REM execute suite loader
cscript.exe C:\IVM_Automation_Michael\common\bin\SuiteLoader.vbs Comprehensive C:\IVM_Automation_Michael\IVM
