#!/usr/bin/env bash
set -ex

# Copyright (c) 2021, Arm Limited
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
	outputPdfFile=$2
	configYamlFile=$3
	headingLineNum=$(awk '/<!---END_OF_HTML_HEADER--->/ { print NR; exit }' $inputMdFile)

	tail -n +$headingLineNum $inputMdFile | \
	pandoc --template=tools/acle_template.tex --metadata-file=$configYamlFile -o $outputPdfFile
}

mkdir -p pdfs

# the option`--inline-footnotes` is used to print the footnotes off
# the references "in place" in the `References` section.
rst2pdf main/acle.rst         \
	--inline-footnotes \
	-s tools/rst2pdf-acle.style \
        --repeat-table-rows         \
        --default-dpi=110           \
        -o pdfs/acle.pdf

rst2pdf neon_intrinsics/advsimd.rst         \
	-s tools/rst2pdf-acle-intrinsics.style \
        --repeat-table-rows         \
        --default-dpi=110           \
        -o pdfs/advsimd.pdf

#convert svg image to pdf for use in pdf generation via pandoc
inkscape -z mve_intrinsics/Arm_logo_blue_RGB.svg  -e tools/Arm-logo-blue-RGB.pdf

generate_pdfs_from_md ./morello/morello.md ./pdfs/morello.pdf ./morello/morello_pdf_conf.yaml
generate_pdfs_from_md ./tmp/mve.for-pdf.md ./pdfs/mve.pdf ./mve_intrinsics/mve_pdf_conf.yaml
