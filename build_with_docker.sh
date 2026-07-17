#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright 2021-2026 Arm Limited and/or its affiliates <open-source-office@arm.com>
# SPDX-License-Identifier: Apache-2.0

set -x
IMAGE_NAME=acle_build
# Build the image.
docker build -t $IMAGE_NAME tools/docker
# Run the image, mounting the current folder into the /src folder of
# the docker image. Run as the host user so that the output files are owned by them.
docker run --rm -u $(id -u):$(id -g) --mount type=bind,source="$(pwd)",target=/src $IMAGE_NAME
rm -rf ./tmp
