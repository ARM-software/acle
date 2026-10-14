#!/bin/bash

# SPDX-FileCopyrightText: Copyright 2021, 2026 Arm Limited and/or its affiliates <open-source-office@arm.com>
# SPDX-License-Identifier: Apache-2.0

finalversion=""

while [[ $# -gt 0 ]]; do
	case "$1" in
		--finalversion)
			finalversion="--finalversion"
			;;
		--cleanrepo)
			cleanrepo="--cleanrepo"
			;;
		--commithash)
			[[ $# -ge 2 ]] || {
				echo "Missing argument for --commithash" >&2
				exit 1
			}
			commithash="--commithash $2"
			shift
			;;
		*)
			echo "Unknown option: $1" >&2
			exit 1
			;;
	esac
	shift
done

cd /src
echo $PWD
ls -al

# Generate the intrinsic specifications and the PDFs. If this step
# fails at any point, stop the docker run.
/src/tools/hyperref-check.sh || exit 1
/src/tools/generate-intrinsics-specs.sh || exit 1
/src/tools/generate-pdfs.sh $finalversion $commithash $cleanrepo || exit 1
