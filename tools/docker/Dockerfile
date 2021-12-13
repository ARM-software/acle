# SPDX-FileCopyrightText: Copyright 2021 Arm Limited and/or its affiliates <open-source-office@arm.com>
# SPDX-License-Identifier: Apache-2.0
# syntax=docker/dockerfile:1

# We use Ubuntu 20.04 (Long term Support, LTS) to avoid major updates
# in the tools used to build the specification to avoid changes in the
# appearance of the PDFs.
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND="noninteractive"
# The option --no-install-recommends is used to prevent apt from
# installing the texlive-*-doc packages.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-latex-extra \
    lmodern \
    pandoc \
    inkscape \
    python3 \
    python3-tabulate \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
