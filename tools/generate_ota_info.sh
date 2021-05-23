#!/bin/sh
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
NC="\033[0m"
if [ "$1" ]; then
    echo "Generating .json"
    file_path=$1
    file_name=$(basename "$file_path")
    if [ -f $file_path ]; then
        # only generate for official builds. unless forced with 'export FORCE_JSON=1'
        if [[ $file_name == *"Official"* ]]; then
            datetime=$(date +%s)
            echo "{" > $file_path.json
            echo "  \"response\": [" >> $file_path.json
            echo "    {" >> $file_path.json
            echo "      \"datetime\": ${datetime}," >> $file_path.json
            echo "      \"filename\": \"${file_name}\"" >> $file_path.json
            echo "    }" >> $file_path.json
            echo "  ]" >> $file_path.json
            echo "}" >> $file_path.json
            device_code=$(echo $file_name | cut -d'-' -f4)
            mv "${file_path}.json" "./${device_code}.json"
            echo -e "${GREEN}Done generating ${YELLOW}${device_code}.json${NC}"
        else
            echo -e "${YELLOW}Skipped generating json for a non-official build${NC}"
        fi
    fi
fi
