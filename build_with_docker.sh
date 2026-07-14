#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright 2021-2026 Arm Limited and/or its affiliates <open-source-office@arm.com>
# SPDX-License-Identifier: Apache-2.0

finalversion=""
cleanrepo=""

while [[ $# -gt 0 ]]; do
	case "$1" in
		--finalversion)
			finalversion="--finalversion"
			;;
		*)
			echo "Unknown option: $1" >&2
			exit 1
			;;
	esac
	shift
done

# Check if repo is in a clean state
git diff --quiet && git diff --cached --quiet
if [[ $? -eq 0 ]]; then
	cleanrepo="--cleanrepo"
fi

# Get last commit
commithash="--commithash $(git rev-parse HEAD)"

echo "Building pdfs with parameters:"
if [[ -n "$finalversion" ]]; then
	echo "  --finalversion"
fi
if [[ -n "$cleanrepo" ]]; then
	echo "  --cleanrepo"
fi
echo "  $commithash"

set -x
IMAGE_NAME=acle_build
# Build the image.
docker build -t $IMAGE_NAME tools/docker
# Run the image, mounting the current folder into the /src folder of
# the docker image. Run as the host user so that the output files are owned by them.
docker run --rm -u $(id -u):$(id -g) --mount type=bind,source="$(pwd)",target=/src $IMAGE_NAME $finalversion $commithash $cleanrepo
