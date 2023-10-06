@echo off
setlocal enabledelayedexpansion

rem Define the path to WinRAR executable (adjust this path if needed)
set winrarPath="C:\Program Files\WinRAR\WinRAR.exe"

rem Define folders (temp folder will be inside output folder)
set outputFolder=output
set tempFolder=temp

rem Create folders
mkdir "%outputFolder%"
mkdir "%outputFolder%\%tempFolder%"

rem Change the current working folder to output folder
cd /d "%outputFolder%"

rem Create an initial ZIP file containing the TXT file
%winrarPath% a -ep1 -o -y -inul -IBCK -m5 "%tempFolder%\infinite.zip" "..\infinitezip.bat"

rem Initialize count (count should match number of .zip files, including the containing .zip file itself)
set count=1

:loop

rem Increment the count
set /a count+=1

rem Create a new ZIP file containing the previous ZIP file
%winrarPath% a -ep1 -o -y -inul -IBCK -m5 "%tempFolder%\temp.zip" "%tempFolder%\infinite.zip"

rem Delete old ZIP file
del "%tempFolder%\infinite.zip"

rem Rename new ZIP file from temporary name to proper name
rename "%tempFolder%\temp.zip" "infinite.zip"

rem Create a folder with the current count
mkdir "!count!"

rem Copy the current ZIP file into the folder
copy "%tempFolder%\infinite.zip" "!count!" > nul

rem Display a message indicating each iteration
echo infinite.zip file updated and copied to folder !count!.

goto loop

rem This line will never be reached as the script runs in an infinite loop
endlocal
