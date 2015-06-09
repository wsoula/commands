#!/bin/bash -e

#Delete leftover temp files, if they exist
if [[ -f tmp ]]; then
  rm tmp
fi
#Get an mp3 file and put its data in a tmp file
file="`ls | grep -m 1 -o .*mp3 | head -1`"
ffmpeg -i "$file" -f ffmetadata tmp
#Delete leftover temp files, if they exist
if [[ -f tmp2 ]]; then
  rm tmp2
fi
#Remove top line of ffmetadata format file as it breaks
#sourcing the file.  Also quote the values.
tail -n +2 tmp > tmp2
sed -ibak s/=/=\"/g tmp2
sed -ibak s/$/\"/g tmp2
. tmp2
#Cleanup
rm tmp tmp2 tmp2bak
#Check for blank artist and album
if [[ "" == "$artist" ]]; then
  echo NO VALUE FOR ARTIST.  EXITING
  exit 1
fi
if [[ "" == "$album" ]]; then
  echo NO VALUE FOR ALBUM TITLE.  EXITING
  exit 1
fi
#Make new directory, transfer files there, and
#delete the old directory.  This will leave the
#bash terminal in a nonexistent working directory
mkdir "../$artist - $album"
mv * "../$artist - $album"
dir=`pwd`
cd ../
rm -r "$dir"
