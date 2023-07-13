#!/bin/sh
if [ "$1" ]; then
    file_path=$1
    file_name=$(basename "$file_path")
    if [ -f $file_path ]; then
        device_name=$(echo $file_name | cut -d'-' -f5);
        build_prop="out/target/product/${device_name}/system/build.prop";
        oem=$(grep ro\.product\.system\.brand ${build_prop} | cut -d= -f2);
        name=$(grep ro\.havoc\.device\.name ${build_prop} | cut -d= -f2);
        codename=$(grep ro\.havoc\.device\= ${build_prop} | cut -d= -f2);
        version=$(grep ro\.havoc\.version ${build_prop} | cut -d= -f2);
        romtype=$(grep ro\.havoc\.releasetype ${build_prop} | cut -d= -f2);
        variant=$(grep ro\.havoc\.build\.variant ${build_prop} | cut -d= -f2);
        variant_lower=$(echo ${variant} | tr '[:upper:]' '[:lower:]');
        maintainer_name=$(grep ro\.havoc\.maintainer\= ${build_prop} | cut -d= -f2);
        maintainer_username=$(grep ro\.havoc\.maintainer\.username ${build_prop} | cut -d= -f2);
        size=$(stat -c%s $file_path);
        datetime=$(grep ro\.build\.date\.utc ${build_prop} | cut -d= -f2);
        filehash=$(md5sum $file_path | awk '{ print $1 }');
        id=$(sha256sum $file_path | awk '{ print $1 }');
        url="https://sourceforge.net/projects/havoc-os/files/${device_name}/${file_name}/download";
        group=$(grep ro\.havoc\.group\.url ${build_prop} | cut -d= -f2);
        echo "{" > $file_path.json
        echo "  \"oem\":\"${oem}\"," >> $file_path.json
        echo "  \"name\":\"${name}\"," >> $file_path.json
        echo "  \"codename\":\"${codename}\"," >> $file_path.json
        echo "  \"filename\":\"${file_name}\"," >> $file_path.json
        echo "  \"version\":\"${version}\"," >> $file_path.json
        echo "  \"romtype\":\"${romtype}\"," >> $file_path.json
        echo "  \"variant\":\"${variant}\"," >> $file_path.json
        echo "  \"maintainer\":\"${maintainer_name}\"," >> $file_path.json
        echo "  \"username\":\"${maintainer_username}\"," >> $file_path.json
        echo "  \"size\":${size}," >> $file_path.json
        echo "  \"datetime\":${datetime}," >> $file_path.json
        echo "  \"filehash\":\"${filehash}\"," >> $file_path.json
        echo "  \"id\":\"${id}\"," >> $file_path.json
        echo "  \"url\":\"${url}\"," >> $file_path.json
        echo "  \"group\":\"${group}\"" >> $file_path.json
        echo "}" >> $file_path.json
        mv "${file_path}.json" "./${device_name}_${variant_lower}.json"
        echo "JSON Generated: ${device_name}_${variant_lower}.json"
    fi
fi
