#!/bin/bash
FILES="$1/*"

CAFFE_HOME=../caffe
COLORIZE_HOME=.

for FILE in $FILES
do
  PYTHONPATH="$CAFFE_HOME/python/:$PYTHONPATH" python "$COLORIZE_HOME/colorize.py" --gpu -1 -img_in "$FILE"  -img_out "$FILE.colourised.jpg"
  convert "$FILE" "$FILE.colourised.jpg" -append "$FILE.stitched.jpg"
done
