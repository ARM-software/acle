#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright 2021 Arm Limited and/or its affiliates <open-source-office@arm.com>
# SPDX-License-Identifier: Apache-2.0

set -x
IMAGE_NAME=acle_build
# Build the image.
docker build -t $IMAGE_NAME tools/pdf/docker
# Run the image, mounting the current folder into the /src folder of
# the docker image.
ROOTDIR=$(realpath "$(dirname "$(realpath "$0")")/..")
docker run --rm -v "$ROOTDIR":/src $IMAGE_NAME
