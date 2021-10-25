<!-- SPDX-FileCopyrightText: Copyright 2021 Arm Limited and/or its affiliates <open-source-office@arm.com> -->
<!-- SPDX-License-Identifier: Apache-2.0 -->
---
name: Fixing an issue.
about: Technical issues, document format problems, bugs in scripts, and so on.
title: "[bugfix]"
label: bugfix

---

**Thank you for submitting a fix to the specifications.**

Please make sure to go through the following checklist:

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
      rendered in the PDF and other output format supported, the
      format is the same described in the previous item).
* [ ] I have run the CI scripts (if applicable, as they might be
      tricky to set up on non-*nix machines. The sequence can be found
      in the [contribution
      guidelines](../CONTRIBUTING.md#continuous-integration). Don't
      worry if you cannot run these scripts on your machine, your
      patch will be automatically checked in the Actions of the pull
      request).
* [ ] The pull request is done against the branch `next-release`.
