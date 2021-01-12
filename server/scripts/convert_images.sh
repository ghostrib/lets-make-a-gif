#! /usr/local/bin/bash

# https://stackoverflow.com/a/3211670
n=1
dir="${PWD}"/images
for f in "${dir}"/*; do
  ext="${f#*.}"
  new=$(printf "image-%04d.${ext}" "$n")
  mv -- "$f" "${dir}/$new"
  let n=n+1
done

ffmpeg -f image2 -framerate 12 -i "${dir}"/image-%04d.png "${PWD}"/uploads/new-file.gif

rm "${dir}"/*