#!/usr/bin/env bash
set -ex

rstcheck --ignore-language=c,cpp --report=warning morello/morello.rst
rstcheck --ignore-language=c,cpp --report=warning main/acle.rst
