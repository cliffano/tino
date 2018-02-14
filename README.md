<img align="right" src="https://raw.github.com/cliffano/tino/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://img.shields.io/travis/cliffano/tino.svg)](http://travis-ci.org/cliffano/tino)
<br/>

Tino
----

Tino is a utility script for automatic image processing. It currently supports the following processing types:

* `colorization-siggraph2016`
Colourisation of grayscale images using Waseda University's SIGGRAPH 2016 [Colorization](http://hi.cs.waseda.ac.jp/~iizuka/projects/colorization/en/) project, via mecab's [siggraph2016_colorization](https://hub.docker.com/r/mecab/siggraph2016_colorization/) Docker image.

Tino will iterate through all images under a given directory, process each one of them, and then stitch the original and the processed versions. This provides a convenient way to compare both versions next to each other, across multiple images in one go.

Check out some [sample galleries](https://au.pinterest.com/pakkunbot/).

Installation
------------

    git clone https://github.com/cliffano/tino
    cd tino
    make init

Usage
-----

Place all original images under a directory.

Run `tino.sh` and pass the directory as an argument:

    ./tino.sh <type> <directory>

Tino will then create subdirectories `processed` and `stitched` under the specified directory.
`processed` directory contains the processed version of the images.
`stitched` directory contains the original image stitched to its corresponding processed version.

If the image orientation is portrait, the images will be stitched horizontally. If landscape, then vertically.
