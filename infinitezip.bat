@echo off
setlocal enabledelayedexpansion

rem Define the path to WinRAR executable (adjust this path if needed)
set winrarPath="C:\Program Files\WinRAR\WinRAR.exe"

rem Define output folder
set outputFolder="output"

rem Create output folder
mkdir "%outputFolder%"

rem Change the current working folder to output folder
cd /d "%outputFolder%"

rem Create an initial ZIP file containing the TXT file
%winrarPath% a -ep1 -o -y -inul -IBCK -m5 infinite.zip "..\infinitezip.bat"

rem Initialize the count (start at 1 matches how many .zips there are in the .zip)
set count=1

:loop

rem Create a new ZIP file containing the previous ZIP file
%winrarPath% a -ep1 -o -y -inul -IBCK -m5 temp.zip infinite.zip

rem Delete old ZIP file
del infinite.zip

rem Rename new ZIP file from temporary name to proper name
rename temp.zip infinite.zip

rem Create a folder with the current count
mkdir "!count!"

rem Copy the current ZIP file into the folder
copy infinite.zip "!count!" > nul

rem Display a message indicating each iteration
echo infinite.zip file updated and copied to folder !count!.

rem Increment the count
set /a count+=1

goto loop

rem This line will never be reached as the script runs in an infinite loop
endlocal
