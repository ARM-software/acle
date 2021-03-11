#!/usr/bin/env bash

mkdir -p pdfs

rst2pdf morello/morello.rst         \
	-s tools/rst2pdf-acle.style \
        --repeat-table-rows         \
        --default-dpi=110           \
        -o pdfs/morello.pdf
