#!/usr/bin/env sh
# sort-dpkgs.sh
# We keep track of apt dependencies in dpkgs.txt. In case of new dependencies
# being added, scan and sort the file alphabetically.
# (Extra whitespace and duplicate entries are also discarded.)

set -e

dpkgs=$(cat dpkgs.txt)

sorted_pkgs=$(echo "${dpkgs}" | xargs | tr "[:space:]" '\n' | sort | uniq)

if [ "$dpkgs" = "$sorted_pkgs" ]; then
    echo Already sorted.
else
    echo "$sorted_pkgs" > dpkgs.txt && echo Sorted.
fi
