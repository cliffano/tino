#!/bin/bash

DIR="$1"
FILES="$DIR/*"

mkdir -p "$DIR/colourised/" "$DIR/stitched/"

for FILE in $FILES
do
  if [ -f "$FILE" ]; then
    FILE_NAME=$(basename "$FILE")
    echo "Colouring: $FILE_NAME"
    docker run -t -v "$DIR:/base" mecab/siggraph2016_colorization "/base/$FILE_NAME" "/base/colourised/$FILE_NAME"
    if [ -f "$DIR/colourised/$FILE_NAME" ]; then
      convert "$DIR/$FILE_NAME" "$DIR/colourised/$FILE_NAME" +append "$DIR/stitched/$FILE_NAME"
    fi
  fi
done
