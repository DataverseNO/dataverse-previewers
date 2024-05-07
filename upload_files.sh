#!/bin/bash

dirLocal=$(pwd)

# go to the version folder
if [ -z "$1" ]; then
    echo "The variable is empty."
    exit 1
fi
folder="$1"

cd "${folder}"
if [ ! -d ./css ]; then
  mkdir ./css
fi
cd ./css
while read url; do
    wget --quiet $url
done < "${dirLocal}/urls_css.txt"

cd "${folder}"
if [ ! -d ./js ]; then
  mkdir ./js
fi
cd ./js
while read url; do
    wget --quiet $url
done < "${dirLocal}/urls_js.txt"

exit 0