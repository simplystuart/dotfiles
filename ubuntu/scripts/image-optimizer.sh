#!/bin/bash
uploads=/var/www/html/wp-content/uploads
find $uploads -name "*.png" -exec convert {} -strip {} \;
find $uploads -name "*.png" -exec optipng {} \;
find $uploads -name "*.jpg" -exec convert {} -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace sRGB {} \;
find $uploads -name "*.jpg" -exec jpegoptim {} \;
