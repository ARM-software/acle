# SPDX-FileCopyrightText: Copyright 2021, 2023 Arm Limited and/or its affiliates <open-source-office@arm.com>
# SPDX-License-Identifier: Apache-2.0
# syntax=docker/dockerfile:1

FROM debian:bullseye-slim

RUN apt update
RUN apt upgrade -y
RUN apt install -y ruby
RUN apt install -y pandoc
RUN apt install -y inkscape
RUN apt install -y librsvg2-bin
RUN apt install -y python3
RUN apt install -y python3-tabulate
RUN apt install -y texlive-latex-extra
RUN apt install -y texlive-fonts-extra

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
