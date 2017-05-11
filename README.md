<img align="right" src="https://raw.github.com/cliffano/tino/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://img.shields.io/travis/cliffano/tino.svg)](http://travis-ci.org/cliffano/tino)
<br/>

Tino
----

Tino is a utility script for automatic colourisation of grayscale images, using Waseda University's SIGGRAPH 2016 [Colorization](http://hi.cs.waseda.ac.jp/~iizuka/projects/colorization/en/) project, via mecab's [siggraph2016_colorization](https://hub.docker.com/r/mecab/siggraph2016_colorization/) Docker image.

Tino will iterate through all images under a given directory, colourise each one of them, and then stitch the grayscale and the colourised versions. This provides a convenient way to compare both versions next to each other, across multiple images in one go.

Check out some [sample galleries](https://au.pinterest.com/pakkunbot/).

Installation
------------

    git clone https://github.com/cliffano/tino
    cd tino
    make init

Usage
-----

Place all grayscale images under a directory.

Run `tino.sh` and pass the directory as an argument:

    ./tino.sh <directory>

Tino will then create subdirectories `colourised` and `stitched` under the specified directory.
`colourised` directory contains the colourised version of the grayscale images.
`stitched` directory contains the grayscale image stitched to its corresponding colourised version.

If the image orientation is portrait, the images will be stitched horizontally. If landscape, then vertically.
