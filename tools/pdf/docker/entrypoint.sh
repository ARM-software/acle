#!/bin/bash

# SPDX-FileCopyrightText: Copyright 2021 Arm Limited and/or its affiliates <open-source-office@arm.com>
# SPDX-License-Identifier: Apache-2.0

cd /src
echo $PWD
ls -al

# Generate the intrinsic specifications and the PDFs. If this step
# fails at any point, stop the docker run.
/src/tools/pdf/hyperref-check.sh || exit 1
/src/tools/pdf/generate-intrinsics-specs.sh || exit 1
/src/tools/pdf/generate-pdfs.sh || exit 1
rm -rf tmp
