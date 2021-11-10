#!/usr/bin/env bash
for file in `find . -name "*.md" -type f`; do
  echo "Checking $file..."
  sections=$(pandoc $file --verbose --fail-if-warnings -o pdfs/tmp.pdf 2>&1 | grep -E 'pdfTeX warning \(dest\): name{[^}]+}' | sed -E  's/.*name\{([^}]+)\}.*/\1/' | sort | uniq)
  if [[ $(wc -l <<< "$sections") -gt 0 ]]; then
    echo "**** WARNING! These section links have been found to not be working: "
    echo $sections | tr " " "\n"
    exit 1
  fi
done
