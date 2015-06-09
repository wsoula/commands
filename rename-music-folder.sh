#!/bin/bash -e

if [[ -f tmp ]]; then
  rm tmp
fi
file="`ls | grep -m 1 -o .*mp3 | head -1`"
echo file is $file
ffmpeg -i "$file" -f ffmetadata tmp
if [[ -f tmp2 ]]; then
  rm tmp2
fi
tail -n +2 tmp > tmp2
sed -ibak s/=/=\"/g tmp2
sed -ibak s/$/\"/g tmp2
. tmp2
rm tmp tmp2 tmp2bak
if [[ "" == "$artist" ]]; then
  echo NO VALUE FOR ARTIST.  EXITING
  exit 1
fi
if [[ "" == "$album" ]]; then
  echo NO VALUE FOR ALBUM TITLE.  EXITING
  exit 1
fi
mkdir "../$artist - $album"
mv * "../$artist - $album"
dir=`pwd`
cd ../
rm -r "$dir"
