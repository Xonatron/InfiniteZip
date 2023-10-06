@echo off
setlocal enabledelayedexpansion

rem Define path to WinRAR executable (adjust path if needed)
set winrarPath="C:\Program Files\WinRAR\WinRAR.exe"

rem Define folders (temp folder will be inside output folder)
set outputFolder=output
set tempFolder=temp

rem Create folders (temp folder will be inside output folder)
mkdir "%outputFolder%"
mkdir "%outputFolder%\%tempFolder%"

rem Change current working folder to output folder
cd /d "%outputFolder%"

rem Create an initial ZIP file containing this batch file (the hidden secret inside the ZIP of ZIPs)!
%winrarPath% a -ep1 -o -y -inul -IBCK -m5 "%tempFolder%\infinite.zip" "..\infinitezip.bat"

rem Initialize count (count should match number of .zip files, including the containing .zip file itself)
set count=1

:loop

rem Increment the count (count should match number of .zip files, including the containing .zip file itself)
set /a count+=1

rem Create new ZIP file containing the previous ZIP file (use temporary files)
%winrarPath% a -ep1 -o -y -inul -IBCK -m5 "%tempFolder%\temp.zip" "%tempFolder%\infinite.zip"

rem Delete old ZIP file (which is a previous version of our output ZIP file)
del "%tempFolder%\infinite.zip"

rem Rename new ZIP file from temporary name to proper name
rename "%tempFolder%\temp.zip" "infinite.zip"

rem Create a new folder with the new current count of ZIP files inside and including the current ZIP file
mkdir "!count!"

rem Copy the current ZIP file into the folder
copy "%tempFolder%\infinite.zip" "!count!" > nul

rem Display message indicating another iteration has occured
echo infinite.zip file updated and copied to folder !count!.

goto loop

rem This line will never be reached as the script runs in an infinite loop
endlocal
