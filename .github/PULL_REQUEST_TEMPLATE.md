---
# SPDX-FileCopyrightText: Copyright 2021 Arm Limited and/or its affiliates <open-source-office@arm.com>
# SPDX-License-Identifier: Apache-2.0
name: Pull request
about: Technical issues, document format problems, bugs in scripts or feature proposal.

---

**Thank you for submitting a pull request!**

If this PR is about a bugfix:

Please use the bugfix label and make sure to go through the checklist below.

If this PR is about a proposal:

We are looking forward to evaluate your proposal, and if possible to
make it part of the Arm C Language Extension (ACLE) specifications.

We would like to encourage you reading through the [contribution
guidelines](../CONTRIBUTING.md), in particular the section on [submitting
a proposal](../CONTRIBUTING.md#proposals-for-new-content).

Please use the proposal label.

As for any pull request, please make sure to go through the below
checklist.


Checklist: (mark with ``X`` those which apply)

* [ ] If an issue reporting the bug exists, I have mentioned it in the
      PR (do not bother creating the issue if all you want to do is
      fixing the bug yourself).
* [ ] I have added/updated the `SPDX-FileCopyrightText` lines on top
      of any file I have edited. Format is `SPDX-FileCopyrightText:
      Copyright {year} {entity or name} <{contact informations}>`
      (Please update existing copyright lines if applicable. You can
      specify year ranges with hyphen , as in `2017-2019`, and use
      commas to separate gaps, as in `2018-2020, 2022`).
* [ ] I have udated the `Copyright` section of the sources of the
      specification I have edited (this will show up in the text
      rendered in the PDF and other output format supported). The
      format is the same described in the previous item.
* [ ] I have run the CI scripts (if applicable, as they might be
      tricky to set up on non-*nix machines). The sequence can be
      found in the [contribution
      guidelines](../CONTRIBUTING.md#continuous-integration). Don't
      worry if you cannot run these scripts on your machine, your
      patch will be automatically checked in the Actions of the pull
      request.
* [ ] The pull request is done against the branch `next-release`.
