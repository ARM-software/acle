<!-- SPDX-FileCopyrightText: Copyright 2023 Arm Limited and/or its affiliates <open-source-office@arm.com> -->
<!-- CC-BY-SA-4.0 AND Apache-Patent-License -->
<!-- See LICENSE.md file for details -->

# How to build GitHub Pages locally

## Introduction

The GitHub pages are only built when a commit is added to the `latest-release`
branch. This makes the process of testing the HTML rendering of local changes
difficult.

This document describes one process to build the GitHub page locally.

## Prerequisites

 - Docker.
 - Make.

Note: it has only been tested on Linux.

## Guide

 1. Clone [GitHub Pages Ruby Gem](https://github.com/github/pages-gem).
 2. Follow the first step on their
   [page](https://github.com/github/pages-gem#docker) to build the Docker
   image:
     - `make image`.
 3. The build process uses [Jekyll](https://jekyllrb.com/) to transform Markdown
   files into HTML. On top of that, the official GitHub Pages build process
   enables some plugins for it that are not included by default in the local
   build process. Thus we must enable them manually:
     - Open `_config.yml` in the root of the ACLE directory.
     - Add the following to the end of the file (list taken from
       [here](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll#plugins)):
        ```yaml
        plugins:
        - jekyll-coffeescript
        - jekyll-default-layout
        - jekyll-gist
        - jekyll-github-metadata
        - jekyll-optional-front-matter
        - jekyll-paginate
        - jekyll-readme-index
        - jekyll-titles-from-headings
        - jekyll-relative-links
        ```
 4. Follow the second step on their
   [page](https://github.com/github/pages-gem#docker) to build the pages with
   Jekyll and run a web server:
     - `SITE=PATH_TO_ACLE_DIRECTORY make server`.
 5. On the terminal output, the IP and port of the web server will be shown.
   Just open it in a browser.

Incremental builds can be done by starting at step 4.