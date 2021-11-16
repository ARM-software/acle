#!/bin/bash

# SPDX-FileCopyrightText: Copyright 2021 Arm Limited and/or its affiliates <open-source-office@arm.com>
# SPDX-License-Identifier: Apache-2.0

cd /src
echo $PWD
ls -al

# Generate the intrinsic specifications and the PDFs. If any of this
# step fails, make the docker run stop.
/src/tools/generate-intrinsics-specs.sh || exit 1
/src/tools/generate-pdfs.sh || exit 1
