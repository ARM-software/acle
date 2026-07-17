#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright 2023, 2026 Arm Limited and/or its affiliates <open-source-office@arm.com>
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
git clone --depth 1 https://github.com/github/pages-gem.git
cd pages-gem
docker image inspect gh-pages >/dev/null 2>&1 || \
    docker build -t gh-pages --build-arg RUBY_VERSION=3.2 .
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

docker_run_params="--rm \
    -u "$(id -u):$(id -g)" \
    -v $TEMPDIR/pages-gem:/src/gh/pages-gem \
    -v $ROOTDIR:/src/site \
    -w /src/site \
    --entrypoint /usr/local/bin/ruby \
    gh-pages \
    -r/src/site/tools/jekyll-page-timing.rb \
    /usr/local/bundle/bin/jekyll"

if [ "$1" == "build" ]; then
    SITE=$ROOTDIR
    docker run $docker_run_params build
elif [ "$1" == "serve" ]; then
    SITE=$ROOTDIR
    docker run -p 4000:4000 $docker_run_params serve --host 0.0.0.0
fi

return_code=$?
cd $ROOTDIR
git restore _config.yml

exit $return_code
