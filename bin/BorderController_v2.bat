@echo off
:try
taskkill /im BorderController_v2.exe
ping 127.0.0.1 -n 1 > nul
move "C:\Projects\ABC_BorderController_v2\bin\BorderController_v2.exe" "C:\Projects\ABC_BorderController_v2\bin\BorderController_v2_20180808.exe"
ping 127.0.0.1 -n 2 > nul
if exist "C:\Projects\ABC_BorderController_v2\bin\BorderController_v2.exe" goto try
copy "C:\Temp\BorderController_v2.exe" "C:\Projects\ABC_BorderController_v2\bin\BorderController_v2.exe"
ping 127.0.0.1 -n 2 > nul
C:\Projects\ABC_BorderController_v2\bin\BorderController_v2.exe
