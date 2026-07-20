#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright 2023 Arm Limited and/or its affiliates <open-source-office@arm.com>
# SPDX-License-Identifier: Apache-2.0

########################### BUILD GITHUB PAGES ################################
#
# This script uses Git and Docker to build the GitHub Pages version of the ACLE
# project locally.
#
# It accepts one mandatory option (build or serve) and one optional one
# (--finalversion).
#
#  build generates the web pages, but does not launch a web server.
#  serve generates them and also launches a web server.
#
# Once web server is launched, one can access the server using any web browser.
# Its address is printed in the output.
#
###############################################################################


mode=""
finalversion="false"

while [[ $# -gt 0 ]]; do
    case "$1" in
        build|serve)
            if [[ -n "$mode" ]]; then
                echo "Please provide exactly one mode: 'build' or 'serve'."
                exit 1
            fi
            mode="$1"
            ;;
        --finalversion)
            finalversion="true"
            ;;
        *)
            echo "Unknown option: $1"
            echo "Usage: $0 [build|serve] [--finalversion]"
            exit 1
            ;;
    esac
    shift
done

if [[ -z "$mode" ]]; then
    echo "Please provide one mode: 'build' or 'serve'."
    echo "Usage: $0 [build|serve] [--finalversion]"
    exit 1
fi

set -x

ROOTDIR=$(realpath "$(dirname "$(realpath "$0")")/..")
TEMPDIR=$(mktemp -d)
VERSION_CONFIG_FILE="$ROOTDIR/_config.version.local.yml"

commithash=$(git -C "$ROOTDIR" rev-parse HEAD)

if [[ -z "$(git -C "$ROOTDIR" status --porcelain)" ]]; then
    cleanrepo="true"
else
    cleanrepo="false"
fi

cat > "$VERSION_CONFIG_FILE" <<EOF
commithash: "$commithash"
finalversion: $finalversion
cleanrepo: $cleanrepo
EOF

cleanup() {
    cd "$ROOTDIR"
    git restore _config.yml
    rm -f "$VERSION_CONFIG_FILE"
}

trap cleanup EXIT

cd $TEMPDIR
git clone --depth 1 https://github.com/github/pages-gem.git
cd pages-gem
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
    /usr/local/bundle/bin/jekyll"

if [ "$mode" == "build" ]; then
    SITE=$ROOTDIR
    docker run $docker_run_params build --config _config.yml,_config.version.local.yml
elif [ "$mode" == "serve" ]; then
    SITE=$ROOTDIR
    docker run --network host $docker_run_params serve --host 127.0.0.1 --port 4000 --config _config.yml,_config.version.local.yml
fi

return_code=$?
exit $return_code
