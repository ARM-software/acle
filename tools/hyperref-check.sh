#!/usr/bin/env bash
set -x

# Extracting all broken hyperref detected by PDFTex
for file in "./main/acle.md" "./morello/morello.md" "./mve_intrinsics/mve.md" "./neon_intrinsics/advsimd.md"; do
  echo "Checking $file..."

  broken_refs=`pandoc $file --verbose --fail-if-warnings -o pdfs/tmp.pdf 2>&1 | \
  grep -E 'pdfTeX warning \(dest\): name{[^}]+}' | sed -E  's/.*name\{([^}]+)\}.*/\1/' | sort | uniq`

  if [[ $(wc -l <<< "$broken_refs") -gt 0 ]]; then
    echo "**** WARNING! These section links have been found to not be working: "
    echo "$broken_refs" | tr " " "\n"
    exit 1
  fi
done
