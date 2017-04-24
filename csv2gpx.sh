#!/bin/bash 

# Convert csv to gpx
#
# See https://www.gpsbabel.org/htmldoc-development/fmt_unicsv.html for more information
#
# See example.csv for csv format
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

$GPSBABEL -t -i unicsv -f "$1" -o gpx -F "$OUT"

echo -e "done.\n"
