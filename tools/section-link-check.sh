#!/usr/bin/env bash
pandoc main/acle.md --verbose --fail-if-warnings -o pdfs/acle.pdf 2>&1 | grep -E 'pdfTeX warning \(dest\): name{[^}]+}' | sed -E  's/.*name\{([^}]+)\}.*/\1/' | sort | uniq
pandoc morello/morello.md --verbose --fail-if-warnings -o pdfs/morello.pdf 2>&1 | grep -E 'pdfTeX warning \(dest\): name{[^}]+}' | sed -E  's/.*name\{([^}]+)\}.*/\1/' | sort | uniq
pandoc mve_intrinsics/mve.md --verbose --fail-if-warnings -o pdfs/mve.pdf 2>&1 | grep -E 'pdfTeX warning \(dest\): name{[^}]+}' | sed -E  's/.*name\{([^}]+)\}.*/\1/' | sort | uniq
pandoc neon_intrinsics/advsimd.md --verbose --fail-if-warnings -o pdfs/advsimd.pdf 2>&1 | grep -E 'pdfTeX warning \(dest\): name{[^}]+}' | sed -E  's/.*name\{([^}]+)\}.*/\1/' | sort | uniq
