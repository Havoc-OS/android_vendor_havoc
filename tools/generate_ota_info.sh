#!/bin/sh
if [ "$1" ]
then
  file_path=$1
  filename=$(basename "$file_path")
  if [ -f $file_path ]; then
    oem=$(echo $PRODUCT_BRAND);
    name=$(echo $PRODUCT_MODEL);
    codename=$(echo $HAVOC_BUILD);
    version=$(echo $HAVOC_VERSION);
    romtype=$(echo $HAVOC_BUILD_TYPE);
    variant=$(echo $HAVOC_BUILD_VARIANT);
    maintainer=$(echo $HAVOC_MAINTAINER);
    size=$(stat -c%s $file_path);
    datetime=$(grep ro\.build\.date\.utc $OUT/system/build.prop | cut -d= -f2);
    id=$(sha256sum $file_path | awk '{ print $1 }');
    url="https://download.havoc-os.com/$HAVOC_BUILD/$filename";
    group=$(echo $HAVOC_GROUP_URL);
    echo "{\n  \"response\": [\n    {\n      \"oem\": \"$oem\",\n      \"name\": \"$name\",\n      \"codename\": \"$codename\",\n      \"filename\": \"$filename\",\n      \"version\": \"$version\",\n      \"romtype\": \"$romtype\",\n      \"variant\": \"$variant\",\n      \"maintainer\": \"$maintainer\",\n      \"size\": \"$size\",\n      \"datetime\": $datetime,\n      \"id\": \"$id\",\n      \"url\": \"$url\",\n      \"group\": \"$group\",\n      \"changelog\": \"\"\n    }\n  ]\n}" > $OUT/$HAVOC_BUILD.json
  fi
fi
