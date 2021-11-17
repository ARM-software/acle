#!/usr/bin/env bash

# Extracting all broken hyperref detected by PDFTex
for file in "./main/acle.md" "./morello/morello.md" "./mve_intrinsics/mve.md" "./neon_intrinsics/advsimd.md"; do
  echo "Checking $file..."

  broken_refs=`pandoc $file --verbose --fail-if-warnings -o pdfs/tmp.pdf 2>&1 | \
               grep -E 'pdfTeX warning \(dest\): name{[^}]+}' | sed -E  's/.*name\{([^}]+)\}.*/\1/' | \
               sort | uniq | tr " " "\n"`
  number_of_broken_refs=`echo "$broken_refs" | wc -l`

  if [[ $number_of_broken_refs -gt 0 ]]; then
      echo "**** WARNING! These section links have been found not to be working: "
      echo "$broken_refs"
      exit 1
  fi
done
