# InfiniteZip
Creates a .ZIP file of a .ZIP file of a .ZIP file of a .ZIP file of a .ZIP file of a .ZIP file... forever.

<img width="466" alt="image" src="https://github.com/Xonatron/InfiniteZip/assets/7736471/7818ba5b-6add-448c-816d-a7728cb87332">\
There are 50,000 .ZIP files here!

## Usage:
To create infinite.zip -- an "infinite" .ZIP file:
1. Run infinitezip.bat.
1. This batch file runs forever...
1. Cancel manually, whenever you wish.
1. Output is found inside automatically created "output" folder.
1. Each numbered folder ("2", "3", "4", ...) contains that many .ZIP files within a single .ZIP file. Off by one error alert: For example, inside the "100" folder will exist a .ZIP with 99 .ZIP files contained within it, making 100 .ZIP files in total.
1. There is no "1" folder, as this (first) .ZIP is never saved -- technically, because it is generated before the code loop begins.
1. Within the "output" folder, you may delete the "temp" folder; it contains temporary working files.
