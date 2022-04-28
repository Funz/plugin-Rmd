@echo off

set PATH=%PATH%;C:\Program Files\R\R-4.1.0\bin

set id=%RANDOM%
start "Rmd_%id%" cmd /c "Rscript.exe -e ""rmarkdown::render('%1', output_format = 'html_document',output_file = '%1.html', encoding='UTF-8')"" > Rmd.Rout"
set PID_R="none"
for /F "TOKENS=1,2,*" %%a in ('tasklist /FI "WINDOWTITLE eq Rmd_%id%"') do set PID_R=%%b
echo %PID_R% > PID

if "%PID_R%" neq "none" (
:loop
tasklist | findstr " %PID_R% " >nul
if not errorlevel 1 (
    timeout /t 1 >nul
    goto :loop
)
)

del /f PID

if not exist "*.Rout" (
    exit 2
)
findstr "Err" *.Rout
if not errorlevel 1 (
    exit 1
)
