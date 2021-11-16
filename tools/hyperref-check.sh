#!/usr/bin/env bash
set -x

# Extracting all broken hyperref detected by PDFTex
for file in "./main/acle.md" "./morello/morello.md" "./mve_intrinsics/mve.md" "./neon_intrinsics/advsimd.md"; do
  echo "Checking $file..."

  pandoc $file --verbose --fail-if-warnings -o pdfs/tmp.pdf &> erroutput.txt
  cat erroutput.txt | grep -E 'pdfTeX warning \(dest\): name{[^}]+}' | sed -E 's/.*name\{([^}]+)\}.*/\1/' | sort | uniq > list_of_broken_links.txt

  if [[ $(wc -l <<< list_of_broken_links.txt) -gt 0 ]]; then
      echo "**** WARNING! These section links have been found not to be working: "
      cat list_of_broken_links.txt
      exit 1
  fi
done
