#!/usr/bin/env bash

original_files=(./images/*_original.*)
sizes=(64 128)
assets_people_dir="./assets/people"

for file in "${original_files[@]}"
do
  # This assumes all filenames are of the pattern person_name_lastname_original.extension
  new_file_prefix=${file%_original.*}
  new_file_prefix=${new_file_prefix##*/}

  for size in "${sizes[@]}"
  do
    new_file="${assets_people_dir}/${new_file_prefix}_${size}px.jpg"
    $(magick $file -resize ${size} -quality 92 $new_file)
  done
done
