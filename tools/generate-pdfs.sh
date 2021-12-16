#!/usr/bin/env bash
set -ex

# SPDX-FileCopyrightText: Copyright 2021 Arm Limited and/or its affiliates <open-source-office@arm.com>
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

function generate_pdfs_from_md() {
	inputMdFile=$1
	if ! [ -f "$inputMdFile" ]; then
		echo "**** WARNING! $inputMdFile does not exist. Please enter valid file path."
		echo "**** WARNING! Please make sure to run tools/generate-intrinsics-specs.sh before building the PDFs."
		exit 1
	fi

	outputPdfFile=$2
	geometryForIntrinsics='\\newgeometry{landscape,top=3.7cm,bottom=2.7cm,left=1cm,right=1cm,headsep=1.5cm,footskip=.5cm}'

	# This line replaces the ToC declaration in the md files with a blank space.
	# ":a;N;$!ba;" is at the start so sed could recognise newline.
	# The rest is a regular expression.
	# The second replacement string is being used to format the "List of Intrinsics"
	# sections, which contain large longtables.
	# The third replacement is for directing LaTeX to the correct graphics folder
	# in the specific case of the cmse.md file.
	sed -u ':a;N;$!ba;s/\*\sTOC\n{*{:toc}}*//' $inputMdFile | \
	sed -u "s/<!--latex_geometry_conf-->/$geometryForIntrinsics/" | \
	sed -u 's/\](figures/\](cmse\/figures/' | \
	pandoc --template=tools/acle_template.tex -o $outputPdfFile
}

mkdir -p pdfs

# Convert svg image to pdf for use in pdf generation via pandoc.
inkscape -z Arm_logo_blue_RGB.svg  -e tools/Arm-logo-blue-RGB.pdf

generate_pdfs_from_md ./cmse/cmse.md ./pdfs/cmse.pdf
generate_pdfs_from_md ./morello/morello.md ./pdfs/morello.pdf
generate_pdfs_from_md ./main/acle.md ./pdfs/acle.pdf
generate_pdfs_from_md ./tmp/mve.for-pdf.md ./pdfs/mve.pdf
generate_pdfs_from_md ./tmp/advsimd.for-pdf.md ./pdfs/advsimd.pdf
