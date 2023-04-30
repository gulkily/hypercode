#!/bin/sh

# find txt and image files younger than 3 minutes and index them

find html/image -cmin -3 | xargs ./index.pl
find html/txt -cmin -3 | grep \\.txt$ | xargs ./index.pl

