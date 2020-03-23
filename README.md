# PST Converter
This small project aims to provide a free and open source way to convert Microsoft PST files to Mbox (Thunderbird) ones.

## Prerequisites
In the working directory 2 folders should exist:
- in
- out

## How it works
A docker container is run with the required library (libpst) and a shell script is invoked (converter.sh). The shell script executes a conversion of all the .pst files included in the 'in' folder and outputs the converted files into the 'out' folder.

## How to use (asuming you know Docker basics)
1. Create the 'in' and 'out' folders
2. Put the .pst files to be converted into the in folder
3. Build the docker images `docker-compose build`
4. Start conversion by executing `docker-compose up`

## How to customize it
Conversion options can be set in the `convert.sh` file
Input and output directories can be changed in `docker-compose.yml`. Keep in mind that the `convert.sh` script does some magic based on the output directory being `out`. Some later versions of this might make better usage of environment variables to 'fix' this :)

## Credits to:
Paul Colby for his article
http://colby.id.au/importing-pst-files-into-thunderbird-using-libpst/

LibPST team for their tool
https://www.five-ten-sg.com/libpst/

## Read more
ReadPST man page
https://www.five-ten-sg.com/libpst/rn01re01.html
