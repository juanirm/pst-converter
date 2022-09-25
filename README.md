# PST Converter

This small project aims to provide a free and open source way to convert `.pst` files (personal storage table) to `MBOX` files, structured in a way that Mozilla Thunderbird can import.

## How it works

A docker container is run with the `libpst` library inside. The container invokes the `converter.sh` Bash script. The Bash script executes the `readpst` utility which converts all `.pst` files inside the `in` directory, and outputs them to the `out` directory. `find` commands are then run to restructure the directories so Thunderbird can import them.

## Usage

1. Put the `.pst` files to be converted into the `in` folder
1. Build the docker image: `docker-compose build`
1. Start conversion: `docker-compose up`
1. The script will produce a single directory with an `.sbd` suffix (short for sub-directory). Example: `5db2f19c41144330b8c75bc1cb37d3cc.sbd`

## How to import into Thunderbird

You need to move the *contents* of the `.sbd` directory to a Thunderbird profile directory. To find this, go to **Account Settings** in Thunderbird, click **Local Folders** in the sidebar (or your actual email account if you want to import the messages to that). Under the **Message Storage** heading there will be a path - move the contents of the `.sbd` directory to that. Restart Thunderbird.

## How to customize it

Conversion options can be set in the `convert.sh` file
Input and output directories can be changed in `docker-compose.yml`. Keep in mind that the `convert.sh` script does some magic based on the output directory being `out`. Some later versions of this might make better usage of environment variables to 'fix' this 🙂

## Credits

- Paul Colby for his article: http://colby.id.au/importing-pst-files-into-thunderbird-using-libpst/
- `libpst` team for their tool: https://www.five-ten-sg.com/libpst/

## Resources

- `readpst` man page: https://www.five-ten-sg.com/libpst/rn01re01.html
