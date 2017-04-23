#!/bin/bash

# colourise all images in a directory and then stitch them to the originals

if [ ! $# -eq 1 ]; then
  echo "Usage: ./tino.sh <directory>"
  exit 1
elif [ ! -d "$1" ]; then
  echo "Error: $1 is not a directory"
  exit 2
fi

DIR="$1"
FILES="$DIR/*"

mkdir -p "$DIR/colourised/" "$DIR/stitched/"

for FILE in $FILES
do
  if [ -f "$FILE" ]; then

    FILE_NAME=$(basename "$FILE")
    echo "Colouring: $DIR/$FILE_NAME"

    # colourise image
    docker run -t -v "$DIR:/base" mecab/siggraph2016_colorization "/base/$FILE_NAME" "/base/colourised/$FILE_NAME"

    if [ -f "$DIR/colourised/$FILE_NAME" ]; then

      # identify whether image is portrait or landscape
      # and then stitch the original image to its colourised version
      ORIENTATION=$(identify -format '%[fx:(h>w)]' "$DIR/$FILE_NAME")
      if [[ ORIENTATION -eq 1 ]]
      then
        convert "$DIR/$FILE_NAME" "$DIR/colourised/$FILE_NAME" +append "$DIR/stitched/$FILE_NAME"
      else
        convert "$DIR/$FILE_NAME" "$DIR/colourised/$FILE_NAME" -append "$DIR/stitched/$FILE_NAME"
      fi
    fi
  fi
done
