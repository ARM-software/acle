#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright 2023 Arm Limited and/or its affiliates <open-source-office@arm.com>
# SPDX-License-Identifier: Apache-2.0

########################### BUILD GITHUB PAGES ################################
#
# This script uses Git and Docker to build the GitHub Pages version of the ACLE
# project locally.
#
# It accepts one of two options: build or serve.
#
#  build generates the web pages, but does not launch a web server.
#  serve generates them and also launches a web server.
#
# Once web server is launched, one can access the server using any web browser.
# Its address is printed in the output.
#
###############################################################################


if [ $# -ne 1 ]; then
    echo "Please provide one option: 'build' or 'serve'."
    exit 1
fi

if [ "$1" != "build" ] && [ "$1" != "serve" ]; then
    echo "Unsupported option. It must be either 'build' or 'serve'."
    exit 1
fi

set -x

ROOTDIR=$(realpath "$(dirname "$(realpath "$0")")/..")
TEMPDIR=$(mktemp -d)
cd $TEMPDIR
git clone https://github.com/github/pages-gem.git
cd pages-gem
make image
cd $ROOTDIR
echo -e "plugins:\n \
        - jekyll-coffeescript\n \
        - jekyll-default-layout\n \
        - jekyll-gist\n \
        - jekyll-github-metadata\n \
        - jekyll-optional-front-matter\n \
        - jekyll-paginate\n \
        - jekyll-readme-index\n \
        - jekyll-titles-from-headings\n \
        - jekyll-relative-links\n" >> _config.yml
cd $TEMPDIR/pages-gem

if [ "$1" == "build" ]; then
    SITE=$ROOTDIR
    docker run --rm -p 4000:4000 -v `realpath ${SITE}`:/src/site gh-pages jekyll build
elif [ "$1" == "serve" ]; then
    SITE=$ROOTDIR make server
fi

return_code=$?
cd $ROOTDIR
git restore _config.yml

exit $return_code
