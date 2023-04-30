#!/bin/sh

#./_dev_clean_html

# this script will clean html to make room for new html

# mkdir trash
# mkdir trash.`date +%s`
# #todo first move to trash, then rm. reason: rm takes longer than mv
#echo this script is currently disabled because we are now parsing html files as data, and there is test data i want to keep
#exit;

echo "touch -t 197001010000 html/*.html html/*/*.html html/*/*/*.html"
touch -t 197001010000 html/*.html html/*/*.html html/*/*/*.html

echo "touch -t 197001010000 html/*.js html/*/*.js html/*/*/*.js"
touch -t 197001010000 html/*.js html/*/*.js html/*/*/*.js

echo find html -iname '*.html' -type f -exec rm {} \;
find html -iname '*.html' -type f -exec rm {} \;

echo rm -f cache/b/pages/*
rm -f cache/b/pages/*

#echo find html -iname '*.html' -type f -mtime +5 -exec rm {} \;
#find html -iname '*.html' -type f -mtime +5 -exec rm {} \;

#echo find html -mtime +5 -exec ls {} \;
#find html -mtime +5 -exec ls {} \;

echo "================="
echo "Cleanup complete!"
echo "================="
#echo "Rebuilding with ./generate_html_frontend.pl in 3...";
#sleep 2

#echo "2... "
#sleep 2

#echo "1... "
#sleep 2

#echo "Running ./generate_html_frontend.pl"
#./generate_html_frontend.pl
#./pages.pl --php --js -M welcome
