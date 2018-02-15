#!/bin/bash

# process all images in a directory and then stitch each one to the original

if [ ! $# -eq 2 ]; then
  echo "Usage: ./tino.sh <type> <directory>"
  exit 1
elif [ ! -d "$2" ]; then
  echo "Error: $2 is not a directory"
  exit 2
fi

TYPE="$1"
DIR="$2"
FILES="$DIR/*"

mkdir -p "$DIR/processed/" "$DIR/stitched/"

for FILE in $FILES
do
  if [ -f "$FILE" ]; then

    FILE_NAME=$(basename "$FILE")
    echo "Processing: $DIR/$FILE_NAME"

    if [ "$TYPE" = "colorization-siggraph2016" ]; then
      docker run -t -v "$DIR:/base" mecab/siggraph2016_colorization "/base/$FILE_NAME" "/base/processed/$FILE_NAME"
    fi

    if [ -f "$DIR/processed/$FILE_NAME" ]; then

      # identify whether image is portrait or landscape
      # and then stitch the original image to its colourised version
      ORIENTATION=$(identify -format '%[fx:(h>w)]' "$DIR/$FILE_NAME")
      if [[ ORIENTATION -eq 1 ]]
      then
        convert "$DIR/$FILE_NAME" "$DIR/processed/$FILE_NAME" +append "$DIR/stitched/$FILE_NAME"
      else
        convert "$DIR/$FILE_NAME" "$DIR/processed/$FILE_NAME" -append "$DIR/stitched/$FILE_NAME"
      fi
    fi
  fi
done
