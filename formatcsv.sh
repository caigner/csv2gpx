#!/bin/bash

# transform 
# 001<tab>16,123<tab>48,123 -> 001,16.123,48.123
# 

if [[ -z "$1" ]]; then
  echo "Usage: transformcsv.sh <filename.txt>"
  exit
fi

EXTENSION=${1##*.}
NEWFILE=`basename "$1" .$EXTENSION`
OUT="${NEWFILE}.csv"

echo -n "Formating $1 and saving it as $OUT ... "

echo "name,lon,lat" > "$OUT"

cat "$1" | tr "," "." | tr "\t" "," >> "$OUT"

echo "done."

