#!/usr/bin/env bash
set -x

# Extracting all broken hyperref detected by PDFTex
pandoc $file --verbose --fail-if-warnings -o pdfs/tmp.pdf &> erroutput.txt
cat erroutput.txt | grep -E 'pdfTeX warning \(dest\): name{[^}]+}' | sed -E 's/.*name\{([^}]+)\}.*/\1/' | sort | uniq > list_of_broken_links
number_of_broken_refs=`wc -l list_of_broken_links`

if [[ "$number_of_broken_refs" -gt 0 ]]; then
    echo "**** WARNING! These section links have been found not to be working: "
    cat list_of_broken_links
    exit 1
fi
