#!/usr/bin/env bash
set -ex

mkdir -p pdfs

rst2pdf morello/morello.rst         \
	-s tools/rst2pdf-acle.style \
        --repeat-table-rows         \
        --default-dpi=110           \
        -o pdfs/morello.pdf

rst2pdf main/acle.rst         \
	-s tools/rst2pdf-acle.style \
        --repeat-table-rows         \
        --default-dpi=110           \
        -o pdfs/acle.pdf
