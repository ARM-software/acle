#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright 2021 Arm Limited and/or its affiliates <open-source-office@arm.com>
# SPDX-License-Identifier: Apache-2.0

set -x
IMAGE_NAME=acle_build
docker build -t $IMAGE_NAME tools/docker \
    && docker run --rm --mount type=bind,source="$(pwd)",target=/src $IMAGE_NAME
