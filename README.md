# InfiniteZip
Creates a zip file of a zip file of a zip file of a zip file of a zip file of a zip file... forever.

## Usage:
To create infinite.zip -- an "infinite" zip file:
1. Run infinitezip.bat.
1. This batch file runs forever...
1. Cancel manually, whenever you wish.
1. Output is found inside automatically created "output" folder.
1. Each numbered folder ("2", "3", "4", ...) contains a .ZIP file with that many .ZIP files (including the .ZIP file itself) contained within it. For example, instead the "100" folder will exist a .ZIP with 99 .ZIP files contained within it, making 100 .ZIP files in total.
1. There is no "1" folder, as this (first) .ZIP is never saved -- technically, because it is generated before the code loop begins.
1. Within the "output" folder, you may delete the "temp" folder; it contains temporary working files.
