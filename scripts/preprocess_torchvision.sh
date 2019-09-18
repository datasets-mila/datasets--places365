#!/bin/bash
set -o errexit -o pipefail

# this script is meant to be used with 'datalad run'

_SNAME=$(basename "$0")

source scripts/utils.sh echo -n

mkdir -p logs/

python3 -m pip install -r scripts/requirements_torchvision.txt

# Move data files to the project's root as it is where torchvision looks for
# the raw files
git mv large/*.tar .
git-annex fsck --fast .

python3 scripts/preprocess_torchvision.py \
	1>>logs/${_SNAME}.out_$$ 2>>logs/${_SNAME}.err_$$

./scripts/stats.sh data_*/*/*/ val_*/

# Delete raw files
git rm -rf *.tar md5sums

git-annex add -c annex.largefiles=anything *places365*.*
