---
title: Arm Neon Intrinsics Reference
version: 2021Q4
date-of-issue: 11 January 2022
# LaTeX specific variables
landscape: true
copyright-text: "Copyright: see section \\texorpdfstring{{\\nameref{{copyright}}}}{{Copyright}}."
draftversion: false
# Jekyll specific variables
header_counter: true
toc: true
---

<!--
SPDX-FileCopyrightText: Copyright 2014-2023 Arm Limited and/or its affiliates <open-source-office@arm.com>
SPDX-FileCopyrightText: Copyright 2021 Matt P. Dziubinski <matdzb@gmail.com>
CC-BY-SA-4.0 AND Apache-Patent-License
See LICENSE.md file for details
-->

<!---
**** Do not remove! ****
The two lines following this comment are necessary
to generate the Table of Contents via Jekyll.
They are automatically removed by the scripts that generate the pdfs.
-->
* TOC
{{:toc}}
# Preface

## Abstract

This document is complementary to the main Arm C Language Extensions
(ACLE) specification, which can be found on the [ACLE project on
GitHub](https://github.com/ARM-software/acle).

## Latest release and defects report

For the latest release of this document, see the [ACLE project on
GitHub](https://github.com/ARM-software/acle).

Please report defects in this specification to the [issue tracker page
on GitHub](https://github.com/ARM-software/acle/issues).

## License

This work is licensed under the Creative Commons Attribution-ShareAlike
4.0 International License. To view a copy of this license, visit
<http://creativecommons.org/licenses/by-sa/4.0/> or send a letter to
Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

Grant of Patent License. Subject to the terms and conditions of this
license (both the Public License and this Patent License), each Licensor
hereby grants to You a perpetual, worldwide, non-exclusive, no-charge,
royalty-free, irrevocable (except as stated in this section) patent
license to make, have made, use, offer to sell, sell, import, and
otherwise transfer the Licensed Material, where such license applies
only to those patent claims licensable by such Licensor that are
necessarily infringed by their contribution(s) alone or by combination
of their contribution(s) with the Licensed Material to which such
contribution(s) was submitted. If You institute patent litigation
against any entity (including a cross-claim or counterclaim in a
lawsuit) alleging that the Licensed Material or a contribution
incorporated within the Licensed Material constitutes direct or
contributory patent infringement, then any licenses granted to You under
this license for that Licensed Material shall terminate as of the date
such litigation is filed.

### About the license

As identified more fully in the [License](#license) section, this
project is licensed under CC-BY-SA-4.0 along with an additional patent
license. The language in the additional patent license is largely
identical to that in Apache-2.0 (specifically, Section 3 of Apache-2.0
as reflected at <https://www.apache.org/licenses/LICENSE-2.0>) with two
exceptions.

First, several changes were made related to the defined terms so as to
reflect the fact that such defined terms need to align with the
terminology in CC-BY-SA-4.0 rather than Apache-2.0 (e.g., changing
“Work” to “Licensed Material”).

Second, the defensive termination clause was changed such that the scope
of defensive termination applies to “any licenses granted to You”
(rather than “any patent licenses granted to You”). This change is
intended to help maintain a healthy ecosystem by providing additional
protection to the community against patent litigation claims.

## Contributions

Contributions to this project are licensed under an inbound=outbound
model such that any such contributions are licensed by the contributor
under the same terms as those in the [License](#license) section.

We do not require copyright assignment. The original contributor will
retain the copyright.

## Trademark notice

The text of and illustrations in this document are licensed by Arm under
a Creative Commons Attribution–Share Alike 4.0 International license
("CC-BY-SA-4.0”), with an additional clause on patents. The Arm
trademarks featured here are registered trademarks or trademarks of Arm
Limited (or its subsidiaries) in the US and/or elsewhere. All rights
reserved. Please visit <https://www.arm.com/company/policies/trademarks>
for more information about Arm’s trademarks.

## Copyright

* Copyright 2014-2023 Arm Limited and/or its affiliates <open-source-office@arm.com>
* Copyright 2021 Matt P. Dziubinski <matdzb@gmail.com>

## Document history

| Issue | Date              | Change               |
| ----- | ----------------- | -------------------- |
| A     | 09 May 2014       | First release        |
| B     | 24 March 2016     | Updated for ARMv8.1  |
| C     | 30 March 2019     | Version ACLE Q1 2019 |
| D     | 30 June 2019      | Version ACLE Q2 2019 |
| E     | 30 Sept 2019      | Version ACLE Q3 2019 |
| F     | 30 May 2020       | Version ACLE Q2 2020 |
| G     | 30 October 2020   | Version ACLE Q3 2020 |
| H     | 02 July 2021      | 2021Q2               |
| I     | 30 September 2021 | 2021Q3               |
| J     | 11 January 2022   | 2021Q4               |

### Changes between 2021Q2 and 2021Q3

* Fixed the guard macro for the base intrinsics.
* Corrected ``sdot``, ``udot`` and ``usdot`` specification on AArch32.

### Changes between 2021Q3 and 2021Q4.

* Fixed typo in signature of ``vaddq_s16``.
* Updated copyright statement in section [Copyright](#copyright).
* Converted document sources from reStructuredText (`.rst`) to
  Markdown (`.md`). The tool [`pandoc`](https://pandoc.org/) is now
  used to render the PDF of the specs. The PDF is rendered using the
  standard layout used in Arm specifications.
* Added missing item for release 2021Q3 in the table with the list of
  versions in section [Document history](#document-history).

<!---
**** Do not remove! ****
The line following this comment is necessary to generate custom geometry settings
for the intrinsics tables.
It is automatically removed by the scripts that generate the pdfs.
-->
<!--latex_geometry_conf-->

# List of Intrinsics

{intrinsic_table}
