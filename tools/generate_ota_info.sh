#!/bin/sh
if [ "$1" ]
then
  file_path=$1
  filename=$(basename "$file_path")
  if [ -f $file_path ]; then
    version=$(echo $HAVOC_BASE_VERSION);
    romtype=$(grep ro\.havoc\.releasetype $OUT/system/build.prop | cut -d= -f2);
    size=$(stat -c%s $file_path);
    datetime=$(grep ro\.build\.date\.utc $OUT/system/build.prop | cut -d= -f2);
    id=$(sha256sum $file_path | awk '{ print $1 }');
    url="https://sourceforge.net/projects/havoc-os/files/$HAVOC_BUILD/$filename/download";
    echo -e "{\n  \"response\": [\n    {\n      \"filename\": \"$filename\",\n      \"version\": \"v$version\",\n      \"romtype\": \"$romtype\",\n      \"size\": \"$size\",\n      \"datetime\": $datetime,\n      \"id\": \"$id\",\n      \"url\": \"$url\"\n    }\n  ]\n}" > $OUT/$HAVOC_BUILD.json
  fi
fi
