#!/bin/bash 

# Convert csv to gpx
#
# See https://www.gpsbabel.org/htmldoc-development/fmt_unicsv.html for more information
#
# csv format example:
# 
# name,lon,lat
# 001,16.1234,48.1234 
# 002,16.2345,48.2345
#
# or
#
# name,lat,lon
# 001,48.1234,16.1234 
# 002,48.2345,16.2345
#


GPSBABEL=/usr/bin/gpsbabel

if [[ -z "$1" ]]; then
   echo "Usage: csv2gpx.sh <input.csv>"
   exit 1
fi


EXTENSION=${1##*.}
newfile=`basename "$1" .$EXTENSION`

OUT="$newfile".gpx

echo -ne "\nConverting $1 to $OUT ... "

$GPSBABEL -i unicsv -f "$1" -o gpx -F "$OUT"

echo -e "done.\n"
