#!/usr/bin/env bash
set -x

# Extracting all broken hyperref detected by PDFTex
for file in "./main/acle.md" "./morello/morello.md" "./mve_intrinsics/mve.md" "./neon_intrinsics/advsimd.md"; do
  echo "Checking $file..."

  pandoc $file --verbose --fail-if-warnings -o pdfs/tmp.pdf &> tools/erroutput.txt
  cat tools/erroutput.txt | grep -E 'pdfTeX warning \(dest\): name{[^}]+}' | sed -E 's/.*name\{([^}]+)\}.*/\1/' | sort | uniq > tools/list_of_broken_links.txt
  number_of_broken_refs=`cat list_of_broken_links.txt | wc -l`

  if [[ $number_of_broken_refs -gt 0 ]]; then
      echo "**** WARNING! These section links have been found not to be working: "
      cat tools/list_of_broken_links.txt
      exit 1
  fi
done
