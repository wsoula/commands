#!/bin/bash -e

if [[ -f tmp ]]; then
  echo file
  rm tmp
else
  echo no file
fi
file="`ls | grep -m 1 -o .*mp3 | head -1`"
echo file is $file
ffmpeg -i "$file" -f ffmetadata tmp
if [[ -f tmp2 ]]; then
  echo file
  rm tmp2
else
  echo no file
fi
tail -n +2 tmp > tmp2
sed -ibak s/=/=\"/g tmp2
sed -ibak s/$/\"/g tmp2
. tmp2
rm tmp tmp2 tmp2bak
mkdir "../$artist - $album"
mv * "../$artist - $album"
dir=`pwd`
cd ../
rm -r "$dir"
