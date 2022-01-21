#!/bin/bash
set -o errexit -o pipefail

# this script is meant to be used with 'datalad run'

for file_url in \
	"http://data.csail.mit.edu/places/places365/filelist_places365-challenge.tar filelist_places365-challenge.tar" \
	"http://data.csail.mit.edu/places/places365/train_large_places365challenge.tar large/train_large_places365challenge.tar" \
	"http://data.csail.mit.edu/places/places365/val_large.tar large/val_large.tar" \
	"http://data.csail.mit.edu/places/places365/test_large.tar large/test_large.tar" \
	"http://data.csail.mit.edu/places/places365/train_256_places365challenge.tar 256/train_256_places365challenge.tar" \
	"http://data.csail.mit.edu/places/places365/val_256.tar 256/val_256.tar" \
	"http://data.csail.mit.edu/places/places365/test_256.tar 256/test_256.tar" \
	"https://raw.githubusercontent.com/zhoubolei/places_devkit/fd6486304b04a45072f2eaf5681e5f4aaa4abc31/categories_places365.txt categories_places365.txt"
do
        echo ${file_url} | git-annex addurl -c annex.largefiles=anything --raw --batch --with-files
done

md5sum -c md5sums
