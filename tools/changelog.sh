#!/bin/sh

# Exports
dir=$ANDROID_BUILD_TOP
out=$dir/out/target/product

export Changelog=Changelog.txt

if [ -f $Changelog ];
then
	rm -f $Changelog
fi

touch $Changelog

# Print something to build output
echo ${bldppl}"Generating changelog..."${txtrst}

for i in $(seq 7);
do
export After_Date=`date --date="$i days ago" +%F`
k=$(expr $i - 1)
export Until_Date=`date --date="$k days ago" +%F`
echo "====================" >> $Changelog;
echo "     $Until_Date    " >> $Changelog;
echo "====================" >> $Changelog;
repo forall -pc 'git log --after=$After_Date --until=$Until_Date --pretty=tformat:"%h  %s  [%an]" --abbrev-commit --abbrev=7' >> $Changelog
echo "" >> $Changelog;
done

sed -i 's/project/ */g' $Changelog
sed -i 's/[/]$//' $Changelog

if [ -e $out/*/$Changelog ]
then
rm $out/*/$Changelog
fi
if [ -e $out/*/system/etc/$Changelog ]
then
rm $out/*/system/etc/$Changelog
fi
cp $Changelog $OUT/system/etc/
cp $Changelog $OUT/
rm $Changelog
