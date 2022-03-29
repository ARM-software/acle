---
layout: default
title: Contribution Guidelines
---
<!-- SPDX-FileCopyrightText: Copyright 2021-2022 Arm Limited and/or its affiliates <open-source-office@arm.com> -->
<!-- SPDX-License-Identifier: Apache-2.0 -->

# Thank you for considering contributing!

Contributions are always welcome. We accept [bug fixes](#bugs),
[proposals and new ideas](#proposals-for-new-content), or simply [editorial
improvements](#editorial-improvements).

By submitting a pull request you are implicitly adhering to the
[contribution agreement](#contribution-agreement)

## Bugs

You can report a bug by creating an
[issue](https://github.com/ARM-software/acle/issues). You can also fix
it yourself with a [pull
request](https://github.com/ARM-software/acle/pulls).

## Proposals for new content

We are open to any proposal, including the introduction of new sets of
intrinsics.

To add new intrinsics or preprocessor macros, Arm recommends that you
present them in a [pull
request](https://github.com/ARM-software/acle/pulls), along with the
following details:

1. A rationale in support of these intrinsics or macros.
2. A design document to keep track of the reasoning that made the
   proposal reach its current state.

Please note that this extra information is not a requirement for
submitting new content. Contributors are trusted to use their judgment
to decide whether or not the proposal needs this information. Arm
recommends that you add this information so that it is easier for new
ideas to be discussed and possibly accepted, especially for changes of
great impact.

## Editorial improvements

To check the outcome of your changes, run the script
`build_with_docker.sh` (requires
[docker](https://www.docker.com/)). The scripts generate the PDFs of
the specifications and stores them in the folder `pdfs`.

# Continuous integration

The continuous integration bot executes the script:

```
 ./build_with_docker.sh
```

PDFs are generated automatically in response to a pull request. You
can download the PDFs in the `Actions` tab of any pull request.

An additional step uses
[``markdown-link-check```](https://github.com/tcort/markdown-link-check)
to check that all the links in the markdown files are resolving
correcly.

# Branches and pull requests.

The branch `main` is the release branch, which contains the code used
to build the PDFs of the [latest official
release](https://github.com/ARM-software/acle/releases/latest).

New development (bug-fixes, proposals, extensions, and so on) is
committed on the `main` branch. Therefore, please submit your
PR against the branch `main`.

It is good practice to track changes. In the section `Changes for next
release`, please list any changes that you have made to the
document. For an example, see [this
PR](https://github.com/ARM-software/acle/pull/19).

The branch `latest-release` is pointing at the more recent release of
the specs, and it is used to build the [website of the ACLE
project](https://arm-software.github.io/acle).

# Contribution agreement

Contributions to this project are licensed under an inbound=outbound
model such that any such contributions are licensed by the contributor
under the same terms as those in the [LICENSE](LICENSE.md) file.

We _do not_ require copyright assignment. The original contributor
will retain the copyright.

# All contributors

This project follows the [allcontributors
guidelines](https://allcontributors.org/docs/en/overview). We assume
that contributors are happy to be added to the [list of contributors
in the main README file](README.md#contributors-). Please let us know
explicitly if that is not the case in the PR or in the issue you have
raised.
