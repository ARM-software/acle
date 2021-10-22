---
name: Fixing a bug
about: Thank you for submitting a fix to the specifications.
title: "[bugfix]"

---

**Thank you for submitting a fix to the specifications.**

Please make sure to go through the following checklist:

* [ ] If an issue reporting the bug exists, I have mentioned it in the
      PR. Do not bother creating the issue if all you want to do is
      fixing the bug yourself.
* [ ] I have added/updated the `SPDX-FileCopyrightText` lines on top
      of any file I have edited. Format is ``SPDX-FileCopyrightText:
      Copyright {year} {name} <{email address}>``. You can specify
      year ranges with hyphen (``2017-2019``) and commas to separate
      gaps (``2018-2020, 2022``).
* [ ] I have udated the `Copyright` section of the sources of the
      specification I have edited (this will show up in the text
      rendered in the PDF and other output format supported). The
      format is the same described in the previous item.
* [ ] I have run the CI scripts (if applicable, as they might be
      tricky to set up on non-*nix machines). The sequence can be
      found in the [contribution
      guidelines](CONTRIBUTING.md#continuous-integration). Don't worry
      if you cannot run these scripts on your machine, your patch will
      be automatically checked in the Actions of the pull request.

