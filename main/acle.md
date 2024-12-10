---
title: Arm C Language Extensions
version: 2024Q3
date-of-issue: 30 September 2024
# LaTeX specific variables
copyright-text: "Copyright: see section \\texorpdfstring{\\nameref{copyright}}{Copyright}."
draftversion: true
# Jekyll specific variables
header_counter: true
toc: true
---

<!--
SPDX-FileCopyrightText: Copyright 2011-2024 Arm Limited and/or its affiliates <open-source-office@arm.com>
SPDX-FileCopyrightText: Copyright 2022 Google LLC.
CC-BY-SA-4.0 AND Apache-Patent-License
See LICENSE.md file for details
-->

<!---
**** Do not remove! ****
The two lines following this comments are necessary
to generate the Table of Contents via Jekyll.
They are automatically removed by the scripts that generates the pdfs.
-->
* TOC
{:toc}
# Preface

## Abstract

This document specifies the Arm C Language Extensions to enable C/C++
programmers to exploit the Arm architecture with minimal restrictions on
source code portability.

## Keywords

ACLE, ABI, C, C++, compiler, armcc, gcc, intrinsic, macro, attribute,
Neon, SIMD, SVE, SVE2, atomic

## Latest release and defects report

For the latest release of this document, see the [ACLE project on
GitHub](https://github.com/ARM-software/acle).

Please report defects in this specification to the [issue tracker page
on GitHub](https://github.com/ARM-software/acle/issues).

## License

This work is licensed under the Creative Commons
Attribution-ShareAlike 4.0 International License. To view a copy of
this license, visit <http://creativecommons.org/licenses/by-sa/4.0/> or
send a letter to Creative Commons, PO Box 1866, Mountain View, CA
94042, USA.

Grant of Patent License. Subject to the terms and conditions of this
license (both the Public License and this Patent License), each
Licensor hereby grants to You a perpetual, worldwide, non-exclusive,
no-charge, royalty-free, irrevocable (except as stated in this
section) patent license to make, have made, use, offer to sell, sell,
import, and otherwise transfer the Licensed Material, where such
license applies only to those patent claims licensable by such
Licensor that are necessarily infringed by their contribution(s) alone
or by combination of their contribution(s) with the Licensed Material
to which such contribution(s) was submitted. If You institute patent
litigation against any entity (including a cross-claim or counterclaim
in a lawsuit) alleging that the Licensed Material or a contribution
incorporated within the Licensed Material constitutes direct or
contributory patent infringement, then any licenses granted to You
under this license for that Licensed Material shall terminate as of
the date such litigation is filed.

## About the license

As identified more fully in the [License](#license) section, this project
is licensed under CC-BY-SA-4.0 along with an additional patent
license. The language in the additional patent license is largely
identical to that in Apache-2.0 (specifically, Section 3 of Apache-2.0
as reflected at <https://www.apache.org/licenses/LICENSE-2.0>) with two
exceptions.

First, several changes were made related to the defined terms so as to
reflect the fact that such defined terms need to align with the
terminology in CC-BY-SA-4.0 rather than Apache-2.0 (for example, changing
“Work” to “Licensed Material”).

Second, the defensive termination clause was changed such that the
scope of defensive termination applies to “any licenses granted to
You” (rather than “any patent licenses granted to You”).  This change
is intended to help maintain a healthy ecosystem by providing
additional protection to the community against patent litigation
claims.

## Contributions

Contributions to this project are licensed under an inbound=outbound
model such that any such contributions are licensed by the contributor
under the same terms as those in the LICENSE file.

We do not require copyright assignment. The original contributor will
retain the copyright.

## Trademark notice

The text of and illustrations in this document are licensed by Arm
under a Creative Commons Attribution–Share Alike 4.0 International
license ("CC-BY-SA-4.0”), with an additional clause on patents.
The Arm trademarks featured here are registered trademarks or
trademarks of Arm Limited (or its subsidiaries) in the US and/or
elsewhere. All rights reserved. Please visit
<https://www.arm.com/company/policies/trademarks> for more information
about Arm’s trademarks.

## Copyright

* Copyright 2011-2024 Arm Limited and/or its affiliates <open-source-office@arm.com>.
* Copyright 2022 Google LLC.

## About this document

### Change control

#### Current Status and Anticipated Changes

The following support level definitions are used by the ACLE
specifications:

**Release**

   Arm considers this specification to have enough implementations,
   which have received sufficient testing, to verify that it is
   correct. The details of these criteria are dependent on the scale
   and complexity of the change over previous versions: small, simple
   changes might only require one implementation, but more complex
   changes require multiple independent implementations, which have
   been rigorously tested for cross-compatibility. Arm anticipates that
   future changes to this specification will be limited to
   typographical corrections, clarifications and compatible extensions.

**Beta**

   Arm considers this specification to be complete, but existing
   implementations do not meet the requirements for confidence in its
   release quality. Arm might need to make incompatible changes if issues
   emerge from its implementation.

**Alpha**

   The content of this specification is a draft, and Arm considers the
   likelihood of future incompatible changes to be significant.

All content in this document is at the **Release** quality level,
unless a different support level is specified in the text.

#### Change history

| **Issue**    | **Date**          | **By** | **Change**                                                                                                           |
| ------------ | ----------------- | ------ | -------------------------------------------------------------------------------------------------------------------- |
| A            | 11/11/11          | AG     | First release                                                                                                        |
| B            | 13/11/13          | AG     | Version 1.1. Editorial changes. Corrections and completions to intrinsics as detailed in 3.3. Updated for C11/C++11. |
| C            | 09/05/14          | TB     | Version 2.0. Updated for Armv8 AArch32 and AArch64.                                                                  |
| D            | 24/03/16          | TB     | Version 2.1. Updated for Armv8.1 AArch32 and AArch64.                                                                |
| E            | 02/06/17          | Arm    | Version ACLE Q2 2017. Updated for Armv8.2-A and Armv8.3-A.                                                           |
| F            | 30/04/18          | Arm    | Version ACLE Q2 2018. Updated for Armv8.4-A.                                                                         |
| G            | 30/03/19          | Arm    | Version ACLE Q1 2019. Updated for Armv8.5-A and MVE. Various bugfixes.                                               |
| H            | 30/06/19          | Arm    | Version ACLE Q2 2019. Updated for TME and more Armv8.5-A intrinsics. Various bugfixes.                               |
| ACLE Q3 2019 | 30/09/19          | Arm    | Version ACLE Q3 2019.                                                                                                |
| ACLE Q4 2019 | 31/12/19          | Arm    | Version ACLE Q4 2019.                                                                                                |
| ACLE Q2 2020 | 31/05/20          | Arm    | Version ACLE Q2 2020.                                                                                                |
| ACLE Q3 2020 | 31/10/20          | Arm    | Version ACLE Q3 2020.                                                                                                |
| 2021Q2       | 02 July 2021      | Arm    | Version ACLE Q2 2021. Open source version. NFCI.                                                                     |
| 2021Q3       | 30 September 2021 | Arm    | Minor re-wording. NFCI.                                                                                              |
| 2021Q4       | 11 January 2022   | Arm    | See [Changes between ACLE Q3 2021 and ACLE Q4 2021](#changes-between-acle-q3-2021-and-acle-q4-2021)                  |
| 2022Q1       | 06 April 2022     | Arm    | See [Changes between ACLE Q4 2021 and ACLE Q1 2022](#changes-between-acle-q4-2021-and-acle-q1-2022)                  |
| 2022Q2       | 01 Jul 2022       | Arm    | See [Changes between ACLE Q1 2021 and ACLE Q2 2022](#changes-between-acle-q1-2022-and-acle-q2-2022)                  |
| 2022Q4       | 23 November 2022  | Arm    | See [Changes between ACLE Q2 2022 and ACLE Q4 2022](#changes-between-acle-q2-2022-and-acle-q4-2022)                  |
| 2023Q2       | 04 August 2023    | Arm    | See [Changes between ACLE Q4 2022 and ACLE Q2 2023](#changes-between-acle-q4-2022-and-acle-q2-2023)                  |
| 2024Q1       | 11 April 2024     | Arm    | See [Changes between ACLE Q2 2023 and ACLE Q1 2024](#changes-between-acle-q2-2023-and-acle-q1-2024)                  |
| 2024Q2       | 21 June 2024      | Arm    | See [Changes between ACLE Q1 2024 and ACLE Q2 2024](#changes-between-acle-q1-2024-and-acle-q2-2024)                  |
| 2024Q3       | 30 September 2024 | Arm    | See [Changes between ACLE Q2 2024 and ACLE Q3 2024](#changes-between-acle-q2-2024-and-acle-q3-2024)                  |

#### Changes between ACLE Q2 2017 and ACLE Q2 2018

Most changes in ACLE Q2 2018 are updates to support features introduced in
Armv8.3-A [[ARMARMv83]](#ARMARMv83). Support is added for the Complex addition and Complex MLA intrinsics.
Armv8.4-A [[ARMARMv84]](#ARMARMv84). Support is added for the Dot Product intrinsics.

#### Changes between ACLE Q2 2018 and ACLE Q1 2019

* Support added for features introduced in Armv8.5-A [[ARMARMv85]](#ARMARMv85) (including the MTE extension).
* Support added for MVE [[MVE-spec]](#MVE-spec) from the Armv8.1-M architecture.
* Support added for Armv8.4-A half-precision extensions through Neon intrinsics.
* Added feature detection macro for LSE atomic operations.
* Added floating-point versions of intrinsics to access coprocessor registers.

#### Changes between ACLE Q1 2019 and ACLE Q2 2019

* Support added for TME features.
* Support added for rounding intrinsics from Armv8.5-A [[ARMARMv85]](#ARMARMv85).

#### Changes between ACLE Q2 2019 and ACLE Q3 2019

* Support added for Armv8.6-A features.
* Support added for random number instruction intrinsics from Armv8.5-A [[ARMARMv85]](#ARMARMv85).

#### Changes between ACLE Q3 2019 and ACLE Q4 2019

* BETA support for the Custom Datapath Extension.
* MVE intrinsics updates and fixes.
* Feature macros for Pointer Authentication and Branch Target Identification.

#### Changes between ACLE Q4 2019 and ACLE Q2 2020

* Updates to CDE intrinsics.
* Allow some Neon intrinsics previously available in A64 only in A32 as well.

#### Changes between ACLE Q2 2020 and ACLE Q3 2020

* Add support for features introduced in the Armv8.7-a architecture update.
* Fix allowed values for __ARM_FEATURE_CDE_COPROC macro.

#### Changes between ACLE Q2 2021 and ACLE Q3 2021
* Fixed FP16 format description at [Half-precision
  floating-point](#half-precision-floating-point).
* Fixed the description of `vmul_lane_u16` at
  [Concepts](#neon-intrinsics-concepts).

#### Changes between ACLE Q3 2021 and ACLE Q4 2021

* Updated copyright statement in section [Copyright](#copyright).
* Introduced `__ARM_FEATURE_PAUTH` and `__ARM_FEATURE_BTI` in sections
  [Pointer Authentication](#pointer-authentication) and [Branch Target
  Identification](#branch-target-identification) respectively.
* Fixed the changelog of 2021Q3, as is was missing the mentioning of
  the intrinsic `vmul_lane_u16` in the second item.
* Fixed item lists rendering in [M-profile Vector
  Extension](#m-profile-vector-extension-mve-intrinsics).
* Fixed superfluous and broken backticks in code examples throughout.
* Added reference to the *Cortex-M Security Extension (CMSE)*
  specifications in [Cortex-M Security Extension
  (CMSE)](#cortex-m-security-extension-cmse).
* Added specification for [NEON-SVE Bridge](#neon-sve-bridge) and
  [NEON-SVE Bridge macros](#neon-sve-bridge-macro).
* Added feature detection macro for the memcpy family of memory
  operations (MOPS) at [memcpy family of memory operations
  standarization instructions -
  MOPS](#memcpy-family-of-memory-operations-standarization-instructions---mops)
* Added intrinsic for the memcpy family of memory operations (MOPS) at
  [memcpy family of operations intrinsics -
  MOPS](#memcpy-family-of-operations-intrinsics---mops)
* Converted document sources from reStructuredText (`.rst`) to
  Markdown (`.md`). The tool [`pandoc`](https://pandoc.org/) is now
  used to render the PDF of the specs. The PDF is rendered using the
  standard layout used in Arm specifications.
* Updated the section links in [Changes between ACLE Q2 2021 and ACLE
  Q3 2021](#changes-between-acle-q2-2021-and-acle-q3-2021) by using
  the actual section title.

#### Changes between ACLE Q4 2021 and ACLE Q1 2022

* Updated the description of the `__arm_mops_memset_tag` intrinsic in [memcpy
  family of operations intrinsics - MOPS](#memcpy-family-of-operations-intrinsics---mops)
  to require both the `__ARM_FEATURE_MOPS` and `__ARM_FEATURE_MEMORY_TAGGING`
  feature macros.
* Fixed minor formatting errors throughout.
* Replaced link text such as “sec-…” and “ssec-…” with section titles.
* Reorganized the presentation of [Feature test macros](#feature-test-macros).
  Also:
  * Generalized some AArch32-specific text to AArch64.
  * Added more cross-references to the descriptions of the macros.
  * Used embedded links for the [list of predefined macros](#summary-of-predefined-macros)
    and fixed some misdirected links.  Resorted the list into alphabetical
    order.
* Reorganized the [Intrinsics](#intrinsics) and
  [Header files](#header-files) sections.
* Added a description of [`<arm_neon_sve_bridge.h>`](#arm_neon_sve_bridge.h)
  to the [Header files](#header-files) section.
* In [Data types](#data-types), clarified that `__fp16` and `__bf16` are
  predefined types whereas vector types like `int32x4_t` are not.
* Moved the [Future directions](#future-directions) chapter to the end.
* Added a description of support levels in [Current Status and
  Anticipated Changes](#current-status-and-anticipated-changes).
* Support added for [Function Multi Versioning](#function-multi-versioning).
* The sections [AES extension](#aes-extension), [SHA2
  extension](#sha2-extension) and [SHA512
  extension](#sha512-extension) have been reworded for clarity, by
  specifying the `FEAT_*` tag they refer to from the Arm Architectural
  Reference Manual.
* Sorted the items in [References](#references).
* Changed the wording of **Beta** in [Current Status and Anticipated
  Changes](#current-status-and-anticipated-changes).
* Sorted the table in [Terms and abbreviations](#terms-and-abbreviations).
* Formatted `memcpy`, `memmove` and `memset` with fixed-width font all
  throughout the document.
* Minor rewording for:
  * [Introduction](#introduction) section of [memcpy family of
    operations intrinsics -
    MOPS](#memcpy-family-of-operations-intrinsics---mops).
  * [Procedure calls and the Q / GE bits](#procedure-calls-and-the-q-ge-bits).
  * [Custom calling conventions](#custom-calling-conventions) - use a
    bulleted list for the examples.

  No functional change intended.
* Reordered the sections in [Change history](#change-history) in
  chronological order.

#### Changes between ACLE Q1 2022 and ACLE Q2 2022

* Added [support for SVE and SVE2](#arm_sve.h). This incorporates the final
  00bet6 version of the separate beta document [Arm C Language Extensions for
  SVE](https://developer.arm.com/architectures/system-architectures/software-standards/acle),
  except that the optional feature `__ARM_FEATURE_SVE_NONMEMBER_OPERATORS`
  has been removed. The SVE and SVE2 support is now at “release” rather than
  beta quality and the separate beta document is no longer maintained.
* Added section [Scalable Vector Extension procedure call standard attribute](#scalable-vector-extension-procedure-call-standard-attribute)
* Fixes for [Function Multi Versioning](#function-multi-versioning):
  * typo in `FEAT_DPB2`.
  * added `FEAT_LS64*`.

#### Changes between ACLE Q2 2022 and ACLE Q4 2022

* Added [**Alpha**](#current-status-and-anticipated-changes)
  [support for SME](#arm_sme.h).
* Added feature detection macro `__ARM_FEATURE_RCPC` for RCpc (Release Consistent processor consistent) model at [RCpc](#rcpc).
* Added two new valid values to the
  [SVE feature macros](#scalable-vector-extension-sve):
  * `__ARM_FEATURE_SVE_VECTOR_OPERATORS=2`
  * `__ARM_FEATURE_SVE_PREDICATE_OPERATORS=2`
* Fixes for [Function Multi Versioning](#function-multi-versioning):
  * Added missing features of `ID_AA64ISAR1_EL1` and `ID_AA64ISAR2_EL1`.
  * Renamed the feature macro to `__HAVE_FUNCTION_MULTI_VERSIONING`
  * Added some clarifications.

#### Changes between ACLE Q4 2022 and ACLE Q2 2023

* Added SLC as a valid Cache Level for the Memory prefetch intrinsics.
* Added [support for 128-bit system registers](#special-register-intrinsics),
  including two intrinsics for accessing them (`__rsr128` and `__wsr128`), and a
  feature macro to detect if they are available (`__ARM_FEATURE_SYSREG128`).
* Added support for FEAT_LRCPC3 LDAP1/STL1 intrinsics and `__ARM_FEATURE_RCPC`.
* Corrected the mandatory architecture versions for FEAT_LRCPC and FEAT_LRCPC2.
* Corrected references to `-pedantic` flag.
* Fixed typos.
* Fixes for [Function Multi Versioning](#function-multi-versioning):
  * Renamed features to `sme-f64f64` and `sme-i16i64`
  * Corrected register name to `ID_AA64SMFR0_EL1.I16I64`
* Removed incorrect optimisation remark in [CMSE](#CMSE-ACLE)'s floating-point
  register clearing.
* Removed incorrect information about the floating-point ABI used in
  [CMSE](#CMSE-ACLE)'s Arguments on the stack and floating point handling.
* Corrected description and example in [CMSE](#CMSE-ACLE)'s section about
  non-secure function pointers.
* Added a requirement on [`arm_new_za`] to set the initial contents of
  ZA to zero.

#### Changes between ACLE Q2 2023 and ACLE Q1 2024

* Changed the definition of the `__ARM_ACLE` macro to reflect the current
  versioning scheme.
* Added `__ARM_ACLE_VERSION` to express a given ACLE version.
* Combined the SME `slice_base` and `slice_offset` arguments into a
  single `slice` argument.
* Added the [Keyword attributes](#keyword-attributes) section.
* Changed the [SME language extensions](#sme-language-extensions-and-intrinsics)
  to use keyword attributes instead of GNU-style attributes.
* Added description of SVE reinterpret intrinsics.
* Changes and fixes for [Function Multi Versioning](#function-multi-versioning):
  * Combination of attributes `target_version` and `target_clones` is allowed.
  * Clarify the existance of a single default version across all translation
    units with the explicitly provided version being the preferred in case
    `target_version` and `target_clones` are mixed.
  * Emphasise that all instances of the versions share the same calling convention.
  * Changed the mangling rules [Name mangling](#name-mangling), such that
    feature names are appended in lexicographic order, not in priority order.
  * Mangled names contain a unique set of features (no duplicates).
  * Added [MOPS](#memcpy-family-of-operations-intrinsics---mops).
  * Changed name mangling of the default version.
  * Aligned priorities to account for feature dependencies.
  * Introduced alternative names (aliases) `rdma` for `rdm`.
  * Corrected FEAT_BTI feature register value.
* Introduced the `__ARM_FEATURE_PAUTH_LR` feature macro in section
  [Pointer Authentication](#pointer-authentication) to indicate target support
  for the Armv9.5-A PAC Enhancements.
* Introduced a new value to the `__ARM_FEATURE_PAC_DEFAULT` macro to indicate
  the use of PC as a diversifier for [Pointer Authentication](#pointer-authentication).
* Added a [State management](#state-management) section, replacing the
  `__arm_shared_za`, `__arm_new_za`, and `__arm_preserves_za` attributes
  in the previous Alpha SME spec.
* Changed the status of the SME ACLE from Alpha to Beta.

#### Changes between ACLE Q1 2024 and ACLE Q2 2024
* Added new content for the handling of arguments in CMSE Entry functions and
  return values of CMSE Non-secure calls in order to address security issues.
* Added [**Alpha**](#current-status-and-anticipated-changes)
  support for SVE2.1 (FEAT_SVE2p1).

#### Changes between ACLE Q2 2024 and ACLE Q3 2024

* Fixed incorrect system register dependencies in Function Multi Versioning.
* Added a requirement for function version declaration in Function Multi Versioning.
* Added `__FUNCTION_MULTI_VERSIONING_SUPPORT_LEVEL` to indicate the support
  level of the [Function Multi Versioning](#function-multi-versioning).
* Unified Function Multi Versioning features sha1 and sha2.
* Unified Function Multi Versioning features ls64, ls64_v, and ls64_accdata.
* Added [**Alpha**](#current-status-and-anticipated-changes)
  support for SME2.1 (FEAT_SME2p1).
* Removed requirement to add preprocessor guards for header files.
* Added specifications for floating-point absolute minimum
  and maximum intrinsics (FEAT_FAMINMAX).
* Added specifications for table lookup intrinsics (FEAT_LUT, FEAT_SME_LUTv2).
* Added Release support level for the [Custom Datapath Extension](#custom-datapath-extension).
* Added [**Alpha**](#current-status-and-anticipated-changes)
  support for modal 8-bit floating point intrinsics.

#### Changes for next release

* Unified Function Multi Versioning features ssbs and ssbs2.
* Unified Function Multi Versioning features memtag and memtag2.
* Unified Function Multi Versioning features aes and pmull.
* Unified Function Multi Versioning features sve2-aes and sve2-pmull128.
* Removed Function Multi Versioning features sve-bf16, sve-ebf16, and sve-i8mm.
* Removed Function Multi Versioning features ebf16, memtag3, and rpres.
* Removed Function Multi Versioning feature dgh.
* Simplified Function Multi Versioning version selection rules.
* Add Function Multi Versioning feature names priority[ABCDE].
* Fixed range of operand `o0` (too small) in AArch64 system register designations.
* Fixed SVE2.1 quadword gather load/scatter store intrinsics.
* Removed unnecessary Zd argument from `svcvtnb_mf8[_f32_x2]_fpm`.
* Fixed urls.
* Changed name mangling of function types to include SME attributes.
* Changed `__ARM_NEON_SVE_BRIDGE` to refer to the availability of the
  [`arm_neon_sve_bridge.h`](#arm_neon_sve_bridge.h) header file, rather
  than the [NEON-SVE bridge](#neon-sve-bridge) intrinsics.

### References

This document refers to the following documents.

<!-- Please the list of references in alphabetical order -->

* <span id="AAPCS" class="citation-label">AAPCS</span> Arm,
  [Application Binary Interface for the Arm
  Architecture](https://developer.arm.com/products/architecture/system-architectures/software-standards/abi)

* <span id="AAPCS64" class="citation-label">AAPCS64</span> Arm,
  [Application Binary Interface for the Arm
  Architecture](https://developer.arm.com/products/architecture/system-architectures/software-standards/abi)

* <span id="ARMARM" class="citation-label">ARMARM</span> Arm, Arm
  Architecture Reference Manual (7-A / 7-R), Arm DDI 0406C

* <span id="ARMARMv8" class="citation-label">ARMARMv8</span> Arm,
  Armv8-A Reference Manual (Issue A.b), Arm DDI0487A.B

* <span id="ARMARMv81" class="citation-label">ARMARMv81</span> Arm,
  Armv8.1 Extension, [The ARMv8-A architecture and its ongoing
  development](http://community.arm.com/groups/processors/blog/2014/12/02/the-armv8-a-architecture-and-its-ongoing-development)

* <span id="ARMARMv82" class="citation-label">ARMARMv82</span> Arm,
  Armv8.2 Extension, [Armv8-A architecture
  evolution](https://community.arm.com/groups/processors/blog/2016/01/05/armv8-a-architecture-evolution)

* <span id="ARMARMv83" class="citation-label">ARMARMv83</span> Arm,
  Armv8.3 Extension, [Armv8-A architecture: 2016
  additions](https://community.arm.com/processors/b/blog/posts/armv8-a-architecture-2016-additions)

* <span id="ARMARMv84" class="citation-label">ARMARMv84</span> Arm,
  Armv8.4 Extension, [Introducing 2017’s extensions to the Arm
  Architecture](https://community.arm.com/processors/b/blog/posts/introducing-2017s-extensions-to-the-arm-architecture)

* <span id="ARMARMv85" class="citation-label">ARMARMv85</span> Arm,
  Armv8.5 Extension, [Arm A-Profile Architecture Developments 2018:
  Armv8.5-A](https://community.arm.com/developer/ip-products/processors/b/processors-ip-blog/posts/arm-a-profile-architecture-2018-developments-armv85a)

* <span id="ARMv7M" class="citation-label">ARMv7M</span> Arm, Arm
  Architecture Reference Manual (7-M), Arm DDI 0403C

* <span id="BA" class="citation-label">BA</span> Arm, EABI Addenda and
  Errata Build Attributes, Arm IHI 0045C

* <span id="Bfloat16" class="citation-label">Bfloat16</span> Arm,
  [BFloat16 processing for Neural Networks on
  Armv8-A](https://community.arm.com/developer/ip-products/processors/b/ml-ip-blog/posts/bfloat16-processing-for-neural-networks-on-armv8_2d00_a)

* <span id="C11" class="citation-label">C11</span> ISO, Standard C
  (based on draft N1570), ISO/IEC 9899:2011

* <span id="C99" class="citation-label">C99</span> ISO, Standard C
  (C99), ISO 9899:1999

* <span id="CFP15" class="citation-label">CFP15</span> ISO/IEC,
  Floating point extensions for C, ISO/IEC TS 18661-3

* <span id="CMSE-ACLE" class="citation-label">CMSE-ACLE</span> Arm,
  [Arm®v8-M Security Extensions: Requirements on Development
  Tools](https://developer.arm.com/documentation/ecm0359818/latest)

* <span id="CPP11" class="citation-label">CPP11</span> ISO, Standard
  C++ (based on draft N3337), ISO/IEC 14882:2011

* <span id="CPP14" class="citation-label">CPP14</span> ISO, Standard C++
  (based on draft N3797), ISO/IEC 14882:2014

* <span id="G.191" class="citation-label">G.191</span> ITU-T, Software
  Tool Library 2005 User's Manual, T-REC-G.191-200508-I

* <span id="GCC" class="citation-label">GCC</span> GNU/FSF, [GNU C
  Compiler Collection](http://gcc.gnu.org/onlinedocs)

* <span id="IA-64" class="citation-label">IA-64</span> Intel, Intel
  Itanium Processor-Specific ABI, 245370-003

* <span id="IEEE-FP" class="citation-label">IEEE-FP</span> IEEE, IEEE
  Floating Point, IEEE 754-2008

* <span id="MVE" class="citation-label">MVE</span> Arm, [MVE
  Intrinsics](https://developer.arm.com/architectures/instruction-sets/simd-isas/helium/mve-intrinsics)

* <span id="MVE-spec" class="citation-label">MVE-spec</span> Arm, Arm
  v8-M Architecture Reference Manual, Arm DDI0553B.F

* <span id="Neon" class="citation-label">Neon</span> Arm, [Neon
  Intrinsics](https://developer.arm.com/technologies/neon/intrinsics)

* <span id="POSIX" class="citation-label">POSIX</span> IEEE / TOG, The
  Open Group Base Specifications, IEEE 1003.1

* <span id="Warren" class="citation-label">Warren</span> 8.  Warren, Hacker's Delight, pub. Addison-Wesley 2003

* <span id="cxxabi" class="citation-label">cxxabi</span> [Itanium C++
  ABI](https://itanium-cxx-abi.github.io/cxx-abi/)

### Terms and abbreviations

This document uses the following terms and abbreviations.

<!-- Please keep the rows of the table in alphabetical order by the column "Term" -->

| **Term**         | **Meaning**                                                                                  |
| ---------------- | -------------------------------------------------------------------------------------------- |
| AAPCS            | Arm Procedure Call Standard, part of the ABI, defined in [[AAPCS]](#AAPCS).                  |
| ABI              | Arm Application Binary Interface.                                                            |
| ACLE             | Arm C Language Extensions, as defined in this document.                                      |
| Advanced SIMD    | A 64-bit/128-bit SIMD instruction set defined as part of the Arm architecture.               |
| FFR              | The SVE first-fault register.                                                                |
| FFRT             | The SVE “first-fault register token”. This is a conceptual construct that forms part of the ACLE model of first-faulting and non-faulting loads; see [First-faulting and non-faulting loads](#first-faulting-and-non-faulting-loads) for details. |
| ILP32            | A 32-bit address mode where long is a 32-bit type.                                           |
| LLP64            | A 64-bit address mode where long is a 32-bit type.                                           |
| LP64             | A 64-bit address mode where long is a 64-bit type.                                           |
| Neon             | An implementation of the Arm Advanced SIMD extensions.                                       |
| SIMD             | Any instruction set that operates simultaneously on multiple elements of a vector data type. |
| sizeless type    | A C and C++ type that can be used to create objects, but that has no measurable size; see [Sizeless types](#sizeless-types) for details. |
| SVE              | The Armv8-A Scalable Vector Extension. Also used more generally to include SVE2 and other SVE extensions. |
| SVE2             | An Armv9-A extension of SVE.                                                                 |
| SVL              | Streaming Vector Length; that is, the number of bits in an SVE vector type like ``svint32_t`` when the processor is in [streaming mode](#streaming-mode) |
| SVL.B            | As for SVL, but measured in bytes rather than bits |
| Thumb            | The Thumb instruction set extension to Arm.                                                  |
| VG               | The number of 64-bit elements (“vector granules”) in an SVE vector.                          |
| VFP              | The original Arm non-SIMD floating-point instruction set.                                    |
| build attributes | Object build attributes indicating configuration, as defined in [[BA]](#BA).                 |
| word             | A 32-bit quantity, in memory or a register.                                                  |

### Terms used to specify C and C++ semantics

The following terms are used to specify C and C++ semantics:

<span id="abstract-machine"></span>

**abstract machine**

> The conceptual machine that the C and C++ language standards use to define
> the behavior of programs.

<span id="evaluated-call"></span>

**evaluated call**

> A call that does not occur in an “unevaluated operand”;
> see section `[expr.context]` in the C++ standard for details.
>
> For example, any calls that occur in the operand of a `sizeof`
> expression are not evaluated.

<span id="external-linkage"></span>

**external linkage**

> A function has “external linkage” if there is a single definition that can be
> referenced by name from more than one translation unit. See `[basic.link]`
> in the C++ standard for more details.
>
> As noted in [Intrinsics](#intrinsics), it is unspecified whether ACLE
> intrinsics are functions and, if so, what linkage they have. However,
> certain ACLE support functions are defined to have external linkage.

<span id="ill-formed"></span>

**ill-formed** programs or pieces of programs

> Programs or pieces of programs that violate a rule due to their static
> construction rather than due to their runtime behavior.
>
> Ill-formed programs should usually be rejected with at least one
> diagnostic. However, there are some ill-formed C++ constructs for which
> “no diagnostic is required”; see the `[intro]` section of the C++
> standard for details. Many of these constructs could in principle
> use ACLE features.
>
> In order to cope with such cases, ACLE does not say when
> ill-formed programs should be rejected. However, from a
> quality-of-implementation perspective, it is better to reject
> ill-formed programs wherever possible.

<span id="unprototyped-function"></span>

**unprototyped functions**

> In early versions of C, it was possible to call a function without
> declaring it first. The function was then assumed to return an `int`.
> For example, this was a valid complete translation unit:
>
> ``` c
>   int x() { return some_func(1, 2.0, "apples"); }
> ```
>
> It was also possible to declare a function's return type without specifying
> its argument types. For example:
>
> ``` c
>   double another_func();
>   double f() { return another_func(1.0, 2, "oranges"); }
> ```
>
> Functions such as `some_func` and `another_func` are referred to as
> (K&R-style) “unprototyped” functions. The first C standard categorized
> these functions as an obsolescent feature and C18 removed all remaining
> support for them.

## Conventions

Most SVE ACLE intrinsics have two names: a longer unique name and a
shorter overloaded alias. The convention adopted in this document is to
enclose characters in square brackets if they are only present in the
longer name. For example:

``` c
  svclz[_u16]_m
```

refers to an intrinsic whose full name is `svclz_u16_m` and whose
overloaded alias is `svclz_m`.

## Scope

The Arm C Language Extensions (ACLE) specification specifies source
language extensions and implementation choices that C/C++ compilers can
implement in order to allow programmers to better exploit the Arm
architecture.

The extensions include:

 * Predefined macros that provide information about the functionality of
   the target architecture.

 * Intrinsic functions.

 * Attributes that can be applied to functions, data and other entities.

This specification does not standardize command-line options,
diagnostics or other external behavior of compilers.

The intended users of this specification are:

* Application programmers wishing to adapt or hand-optimize
  applications and libraries for Arm targets.

* System programmers needing low-level access to Arm targets beyond
  what C/C++ provides for.

* Compiler implementors, who will implement this specification.

* Implementors of IDEs, static analysis and other similar tools who wish to
  deal with the C/C++ source language extensions when encountered in
  source code.

ACLE is not a hardware abstraction layer (HAL), and does not specify a
library component but it may make it easier to write a HAL or other
low-level library in C rather than assembler.

## Cortex-M Security Extension (CMSE)

ACLE support for the Cortex-M Security Extension (CMSE) is defined in
*Arm®v8-M Security Extensions: Requirements on Development Tools*
document [CMSE-ACLE](#CMSE-ACLE).

# Introduction

The Arm architecture includes features that go beyond the set of operations
available to C/C++ programmers. The intention of the Arm C Language
Extensions (ACLE) is to allow the creation of applications and middleware
code that is portable across compilers, and across Arm architecture
variants, while exploiting the advanced features of the Arm architecture.

The design principles for ACLE can be summarized as:

 * Be implementable in (or as an addition to) current C/C++
   implementations.

 * Build on and standardize existing practice where possible.

ACLE incorporates some language extensions introduced in the GCC C
compiler. Current GCC documentation [[GCC]](#GCC) can be found at
<http://gcc.gnu.org/onlinedocs/gcc>. 
Formally it should be assumed that ACLE refers to the documentation for
GCC 4.5.1: <http://gcc.gnu.org/onlinedocs/gcc-4.5.1/gcc/>.

Some of the ACLE extensions are not specific to the Arm architecture but
have proven to be of particular benefit in low-level and systems
programming; examples include features for controlling the alignment and
packing of data, and some common operations such as word rotation and
reversal. As and when features become available in international
standards (and implementations), Arm recommends that you use these in
preference to ACLE. When implementations are widely available, any
ACLE-specific features can be expected to be deprecated.

## Portable binary objects

In AArch32, the *ABI for the Arm Architecture* defines a set of build
attributes [[BA]](#BA). These attributes are intended to facilitate generating
cross-platform portable binary object files by providing a mechanism to
determine the compatibility of object files. In AArch64, the ABI does
not define a standard set of build attributes and takes the approach 
that binaries are, in general, not portable across platforms. References
to build attributes in this document should be interpreted as applying
only to AArch32.

# C language extensions

## Data types

This section overlaps with the specification of the Arm Procedure Call
Standard, particularly [[AAPCS]](#AAPCS) (4.1). ACLE extends some of the guarantees
of C, allowing assumptions to be made in source code beyond those
permitted by Standard C.

* Plain char is unsigned, as specified in the ABI [[AAPCS]](#AAPCS) and
  [[AAPCS64]](#AAPCS64) (7.1.1).
  
* When pointers are 32 bits, the long type is 32 bits (ILP32 model).

* When pointers are 64 bits, the long type may be either 64 bits
  (LP64 model) or 32 bits (LLP64 model).

ACLE extends C by providing some types not present in Standard C and
defining how they are dealt with by the AAPCS. These types fall into
two groups:

* types that are defined by [header files](#header-files)

* types that are predefined by the implementation, so that
  no header file needs to be included to make use of them

The former group includes things like [vector data types](#vector-data-types),
which are defined by the header file [`<arm_neon.h>`](#arm_neon.h).

The predefined types are:

* The `__fp16` type for 16-bit floating-point values (see 
 [Half-precision floating-point](#half-precision-floating-point)).

* The `__bf16` type for 16-bit brain floating-point values (see 
 [Half-precision brain floating-point](#half-precision-brain-floating-point)).

* The `__mfp8` type for the modal 8-bit floating-point values (see
[Modal 8-bit floating point types](#modal-8-bit-floating-point)).

### Implementation-defined type properties

ACLE and the Arm ABI allow implementations some freedom in order to
conform to long-standing conventions in various environments. It is
suggested that implementations set suitable defaults for their
environment but allow the default to be overridden.

The signedness of a plain int bit-field is implementation-defined.

Whether the underlying type of an enumeration is minimal or at least
32-bit, is implementation-defined. The predefined macro
`__ARM_SIZEOF_MINIMAL_ENUM` should be defined as 1 or 4 according to
the size of a minimal enumeration type such as `enum { X=0 }`. An
implementation that conforms to the Arm ABI must reflect its choice in
the `Tag_ABI_enum_size build` attribute.

`wchar_t` may be 2 or 4 bytes. The predefined macro
`__ARM_SIZEOF_WCHAR_T` should be defined as the same number. An
implementation that conforms to the Arm ABI must reflect its choice in
the `Tag_ABI_PCS_wchar_t` build attribute.

## Predefined macros

Several predefined macros are defined. Generally these define features
of the Arm architecture being targeted, or how the C/C++ implementation
uses the architecture. These macros are detailed in
[Feature test macros](#feature-test-macros). All ACLE predefined macros
start with the prefix `__ARM`.

## Keyword attributes

This section is in
[**Beta** state](#current-status-and-anticipated-changes) and may change or be
extended in the future.

ACLE adds several non-standard keywords to C and C++. These keywords
all start with the prefix `__arm_`. (However, not everything that
starts with `__arm_` is a keyword.)

The keywords are modeled after standard `[[…]]` attributes and
fulfill a similar role to them.  However, the C++ standard says that
“any [non-standard attribute] that is not recognized by the
implementation is ignored” `[dcl.attr.grammar]`. It is therefore not
appropriate to use standard attributes for properties that affect the
type system, that affect the binary interface of the generated code, or
that must be honored for other reasons. ACLE uses keywords for some of
these properties instead. The keywords are therefore known as
“keyword attributes”.

A keyword attribute can appear wherever a standard `[[…]]` attribute
can appear. Following the terminology of the C++ standard, a keyword
attribute “appertains” to whatever a standard attribute would appertain
to. For example, consider the placeholders A, B, C and D in the
following function declaration:

``` c
  /*A*/ void /*B*/ f /*C*/ (void) /*D*/;
```

Here:

*   Attributes in position A appertain to the function declaration `f`.

*   Attributes in position B appertain to the return type (`void`).

*   Attributes in position C appertain to the function declaration `f`,
    as for A.

*   Attributes in position D appertain to the type of `f` (`void ()(void)`).

Position A is preferred over position C for ACLE code. This is because
position A can also be used for GNU-style attributes, whereas position C
cannot.

The table below lists all the ACLE keyword attributes. The “Target” column
says what the keyword is allowed to appertain to. For example, a function
type keyword can appear in position D above, but it cannot appear in
positions A, B or C.

Keyword attributes are only guaranteed to be supported by compilers that
predefine the associated macro to a nonzero value.

<!-- Please keep this table sorted alphabetically. -->

| **Name**                                                    | **Target**            | **Predefined macro**              |
| ----------------------------------------------------------- | --------------------- | --------------------------------- |
| [`__arm_locally_streaming`](#arm_locally_streaming)         | function declaration  | `__ARM_FEATURE_LOCALLY_STREAMING` |
| [`__arm_in`](#ways-of-sharing-state)                        | function type         | Argument-dependent                |
| [`__arm_inout`](#ways-of-sharing-state)                     | function type         | Argument-dependent                |
| [`__arm_new`](#arm_new)                                     | function declaration  | Argument-dependent                |
| [`__arm_out`](#ways-of-sharing-state)                       | function type         | Argument-dependent                |
| [`__arm_preserves`](#ways-of-sharing-state)                 | function type         | Argument-dependent                |
| [`__arm_streaming`](#arm_streaming)                         | function type         | `__ARM_FEATURE_SME`               |
| [`__arm_streaming_compatible`](#arm_streaming_compatible)   | function type         | `__ARM_FEATURE_SME`               |

Using a keyword attribute multiple times is equivalent to using it once.

## Intrinsics

ACLE standardizes intrinsics to access various features of the
Arm ® architecture. It also standardizes a set of [header
files](#header-files) that provide access to these intrinsics.

Whether intrinsics are macros, functions or built-in operators is
unspecified. For example:

* It is unspecified whether applying #undef to an intrinsic
  removes the name from visibility
* It is unspecified whether it is possible to take the address
  of an intrinsic

However, each argument must be evaluated at most once. So this
definition is acceptable:

``` c
  #define __rev(x) __builtin_bswap32(x)
```

but this is not:

``` c
  #define __rev(x) ((((x) & 0xff) << 24) | (((x) & 0xff00) << 8) | \
    (((x) & 0xff0000) >> 8) | ((x) >> 24))
```

### Constant arguments to intrinsics

Some intrinsics may require arguments that are constant at compile-time,
to supply data that is encoded into the immediate fields of an
instruction. Typically, these intrinsics require an
integral-constant-expression in a specified range, or sometimes a string
literal. An implementation should produce a diagnostic if the argument
does not meet the requirements.

## Header files

ACLE standardizes various header files that provide access to
[intrinsics](#intrinsics) and their associated data types.
It also standardizes [feature test macros](#feature-test-macros)
that indicate which header files are available.

Some architecture features have a dedicated header file;
for example, [`<arm_neon.h>`](#arm_neon.h) provides access to the
[Advanced SIMD (Neon) intrinsics](#advanced-simd-neon-intrinsics).
[`arm_acle.h`](#arm_acle.h) provides a catch-all for intrinsics that
do not belong to a more specific header file.

These headers behave as standard library headers; repeated inclusion has
no effect beyond the first include.

Except where noted otherwise, it is unspecified whether the ACLE headers
include the standard headers `<assert.h>`, `<stdint.h>` or
`<inttypes.h>`. However, the ACLE headers will not define the standard
type names (for example `uint32_t`) except by inclusion of the standard
headers. Arm recommends that you include the standard headers explicitly
if the associated types and macros are needed.

In C++, the following source code fragments are expected to work
correctly:

``` c
  #include <stdint.h>
  // UINT64_C not defined here since we did not set __STDC_FORMAT_MACROS
  ...
  #include <arm_neon.h>
```

and:

``` c
  #include <arm_neon.h>
  ...
  #define __STDC_FORMAT_MACROS
  #include <stdint.h>
  // ... UINT64_C is now defined
```

### `<arm_acle.h>`

`<arm_acle.h>` provides access to intrinsics that do not belong
to the more specific header files below. These intrinsics are in the
C implementation namespace and begin with double underscores. It is
unspecified whether they are available without the header being
included. When `__ARM_ACLE` is defined to `1`, the header file is
guaranteed to be available.

``` c
  #ifdef __ARM_ACLE
  #include <arm_acle.h>
  #endif /* __ARM_ACLE */
```

### `<arm_fp16.h>`

`<arm_fp16.h>` is provided to define the scalar 16-bit floating point
arithmetic intrinsics. As these intrinsics are in the user namespace,
an implementation would not normally define them until the header is
included. When `__ARM_FEATURE_FP16_SCALAR_ARITHMETIC` is defined to `1`,
the header file is available regardless of the context in which the macro
is evaluated.

``` c
  #ifdef __ARM_FEATURE_FP16_SCALAR_ARITHMETIC
  #include <arm_fp16.h>
  #endif /* __ARM_FEATURE_FP16_SCALAR_ARITHMETIC */
```

### `<arm_bf16.h>`

`<arm_bf16.h>` is provided to define the 16-bit brain floating point
arithmetic intrinsics. As these intrinsics are in the user namespace,
an implementation would not normally define them until the header is
included. When `__ARM_FEATURE_BF16` is defined to `1`, the header file is
guaranteed to be available regardless of the context in which the macro
is evaluated.

``` c
  #ifdef __ARM_FEATURE_BF16
  #include <arm_bf16.h>
  #endif /* __ARM_FEATURE_BF16 */
```

When `__ARM_BF16_FORMAT_ALTERNATIVE` is defined to `1` the only scalar
instructions available are conversion intrinsics between `bfloat16_t` and
`float32_t`.  These instructions are:

* `vcvth_bf16_f32` (convert float32_t to bfloat16_t)
* `vcvtah_f32_bf16` (convert bfloat16_t to float32_t)

### `<arm_neon.h>`

`<arm_neon.h>` is provided to define the [Advanced SIMD (Neon)
intrinsics](#advanced-simd-neon-intrinsics) and associated
[data types](#vector-data-types). As these intrinsics and data types are
in the user namespace, an implementation would not normally define them
until the header is included. When `__ARM_NEON` is defined to `1`,
the header file is available regardless of the context in which the macro is
evaluated.


``` c
  #ifdef __ARM_NEON
  #include <arm_neon.h>
  #endif /* __ARM_NEON */
```

Including `<arm_neon.h>` will also cause the following header files
to be included, if the header files are available:

* [`<arm_fp16.h>`](#arm_fp16.h)
* [`<arm_bf16.h>`](#arm_bf16.h)

<span id="arm_sve.h"></span>

### `<arm_sve.h>`

`<arm_sve.h>` defines data types and intrinsics for SVE and its
extensions; see [SVE language extensions and
intrinsics](#sve-language-extensions-and-intrinsics) for details.
When `__ARM_FEATURE_SVE` is defined to `1`, the header file is available
regardless of the context in which the macro is evaluated.

``` c
  #ifdef __ARM_FEATURE_SVE
  #include <arm_sve.h>
  #endif /* __ARM_FEATURE_SVE */
```

Including `<arm_sve.h>` also includes the following header files:

* `<stdint.h>`
* `<stdbool.h>` (for C only)
* [`<arm_fp16.h>`](#arm_fp16.h)
* [`<arm_bf16.h>`](#arm_bf16.h) (if available)

### `<arm_neon_sve_bridge.h>`

`<arm_neon_sve_bridge.h>` defines intrinsics for moving data between
Neon and SVE vector types; see [NEON-SVE Bridge](#neon-sve-bridge)
for details. Before including the header, you should test the
`__ARM_NEON_SVE_BRIDGE` macro.
:

``` c
  #ifdef __ARM_NEON_SVE_BRIDGE
  #include <arm_neon_sve_bridge.h>
  #endif /* __ARM_NEON_SVE_BRIDGE */
```

Including `<arm_neon_sve_bridge.h>` will also include
[`<arm_neon.h>`](#arm_neon.h) and [`<arm_sve.h>`](#arm_sve.h).

### `<arm_mve.h>`

`<arm_mve.h>` is provided to define the [M-profile Vector Extension
(MVE) intrinsics](#m-profile-vector-extension-mve-intrinsics) and associated
data types. The data types occupy the user namespace. By default the
intrinsics occupy both the user namespace and the `__arm_` namespace;
defining `__ARM_MVE_PRESERVE_USER_NAMESPACE` will hide the definition of
the user namespace variants.

The `__ARM_FEATURE_MVE` macro should be tested before including the
header:

``` c
  #if (__ARM_FEATURE_MVE & 3) == 3
  #include <arm_mve.h>
  /* MVE integer and floating point intrinsics are now available to use.  */
  #elif __ARM_FEATURE_MVE & 1
  #include <arm_mve.h>
  /* MVE integer intrinsics are now available to use.  */
  #endif
```

### `<arm_sme.h>`

The specification for SME is in
[**Beta** state](#current-status-and-anticipated-changes) and may
change or be extended in the future.

`<arm_sme.h>` declares functions and defines intrinsics for SME
and its extensions; see [SME language extensions and intrinsics](#sme-language-extensions-and-intrinsics)
for details. When `__ARM_FEATURE_SME` is defined to `1`, the header file is
available regardless of the context in which the macro is evaluated.

``` c
  #ifdef __ARM_FEATURE_SME
  #include <arm_sme.h>
  #endif
```

Including `<arm_sme.h>` also includes [`<arm_sve.h>`](#arm_sve.h).

### Predefined feature macros and header files

Evaluating a feature macro returns the availability of intrinsics and inline
assembly for that feature, but no assumptions should be made on the order or
context in which the preprocessor macros are evaluated. For example:

``` c
    __attribute__((target("+sve")))
    void foo() {
    #ifdef __ARM_FEATURE_SVE
      // The user should make no assumptions that the target attribute
      // enables the __ARM_FEATURE_SVE macro.
    #endif
}
```

The compiler might add additional restrictions to the intrinsics beyond what is
captured by the ACLE macros depending on the context in which the intrinsics
are used. For example:

``` c
    #include <arm_sme.h>
    void foo(svbool_t pg, void *ptr, uint32_t slice_base) {
    #ifdef __ARM_FEATURE_SME
      svst1_hor_za8(0, slice_base, pg, ptr);
    #endif
    }
```

If `__ARM_FEATURE_SME` evaluates to `true` the SME intrinsic `svst1_hor_za8`
is available, but `foo` might still fail to compile because the call does not
occur in a [streaming statement](#streaming-statement).

## Attributes

GCC-style attributes are provided to annotate types, objects and
functions with extra information, such as alignment. These attributes
are defined in [Attributes and pragmas](#attributes-and-pragmas).

## Implementation strategies

An implementation may choose to define all the ACLE non-Neon intrinsics
as true compiler intrinsics, that is, built-in functions. The `<arm_acle.h>`
header would then have no effect.

Alternatively, `<arm_acle.h>` could define the ACLE intrinsics in terms
of already supported features of the implementation, for example compiler
intrinsics with other names, or inline functions using inline assembler.

### Half-precision floating-point

ACLE defines the `__fp16` type, which can be used for half-precision
(16-bit) floating-point in one of two formats. The binary16 format defined
in [[IEEE-FP]](#IEEE-FP), and referred to as *IEEE* format, and an alternative format,
defined by Arm, which extends the range by removing support for
infinities and NaNs, referred to as *alternative* format. Both formats are
described in [[ARMARM]](#ARMARM) (A2.7.4), [[ARMARMv8]](#ARMARMv8) (A1.4.2).

Toolchains are not required to support the alternative format, and use
of the alternative format precludes use of the ISO/IEC TS 18661:3 [[CFP15]](#CFP15)
`_Float16` type and the Armv8.2-A 16-bit floating-point extensions. For
these reasons, Arm deprecates the use of the alternative format for
half precision in ACLE.

The format in use can be selected at runtime but ACLE assumes it
is fixed for the life of a program. If the `__fp16` type is available,
one of `__ARM_FP16_FORMAT_IEEE` and `__ARM_FP16_FORMAT_ALTERNATIVE` will
be defined to indicate the format in use. An implementation conforming to
the Arm ABI will set the `Tag_ABI_FP_16bit_format` build attribute.

The `__fp16` type can be used in two ways; using the intrinsics ACLE
defines when the Armv8.2-A 16-bit floating point extensions are available,
and using the standard C operators. When using standard C operators,
values of `__fp16` type promote to (at least) float when used in
arithmetic operations, in the same way that values of char or short types
promote to int. There is no support for arithmetic directly on `__fp16`
values using standard C operators.

``` c
  void add(__fp16 a, __fp16 b) {
    a + b; /* a and b are promoted to (at least) float.
              Operation takes place with (at least) 32-bit precision.  */
    vaddh_f16 (a, b); /* a and b are not promoted.
                         Operation takes place with 16-bit precision.  */
  }
```

Armv8 introduces floating point instructions to convert 64-bit to 16-bit,
that is, from double to `__fp16`. They are not available in earlier
architectures, therefore have to rely on emulation libraries or a
sequence of instructions to achieve the conversion.

Providing emulation libraries for half-precision floating point
conversions when not implemented in hardware is implementation-defined.

``` c
  double xd;
  __fp16 xs = (float)xd;
```

rather than:

``` c
  double xd;
  __fp16 xs = xd;
```

In some older implementations, `__fp16` cannot be used as an argument or
result type, though it can be used as a field in a structure passed as
an argument or result, or passed via a pointer. The predefined macro
`__ARM_FP16_ARGS` should be defined if `__fp16` can be used as an
argument and result. C++ name mangling is Dh as defined in [[cxxabi]](#cxxabi),
and is the same for both the IEEE and alternative formats.

In this example, the floating-point addition is done in single (32-bit)
precision:

``` c
  void add(__fp16 *z, __fp16 const *x, __fp16 const *y, int n) {
     int i;
     for (i = 0; i < n; ++i) z[i] = x[i] + y[i];
   }
```

### Relationship between `__fp16` and ISO/IEC TS 18661

ISO/IEC TS 18661-3 [[CFP15]](#CFP15) is a published extension to [[C11]](#C11) which
describes a language binding for the [[IEEE-FP]](#IEEE-FP) standard for floating
point arithmetic. This language binding introduces a mapping to an
unlimited number of interchange and extended floating-point types, on
which binary arithmetic is well defined. These types are of the
form `_FloatN`, where `N` gives size in bits of the type.

One instantiation of the interchange types introduced by [[CFP15]](#CFP15) is
the `_Float16` type. ACLE defines the `__fp16` type as a storage
and interchange only format, on which arithmetic operations are defined
to first promote to a type with at least the range and precision of
float.

This has implications for the result of operations which would result
in rounding had the operation taken place in a native 16-bit type. As
software may rely on this behaviour for correctness, arithmetic
operations on `__fp16` are defined to promote even when the
Armv8.2-A fp16 extension is available.

Arm recommends that portable software is written to use the `_Float16`
type defined in [[CFP15]](#CFP15).

Type conversion between a value of type `__fp16` and a value of type
`_Float16` leaves the object representation of the converted value unchanged.

When `__ARM_FP16_FORMAT_IEEE == 1`, this has no effect on the value of
the object. However, as the representation of certain values has a different
meaning when using the Arm alternative format for 16-bit floating point
values [[ARMARM]](#ARMARM) (A2.7.4) [[ARMARMv8]](#ARMARMv8) (A1.4.2), when
`__ARM_FP16_FORMAT_ALTERNATIVE == 1` the type conversion may introduce
or remove infinity or NaN representations.

Arm recommends that software implementations warn on type conversions
between `__fp16` and `_Float16` if `__ARM_FP16_FORMAT_ALTERNATIVE == 1`.

In an arithmetic operation where one operand is of `__fp16` type and
the other is of `_Float16 type`, the `_Float16` type is first
converted to `__fp16` type following the rules above, and then the
operation is completed as if both operands were of `__fp16` type.

[[CFP15]](#CFP15) and [[C11]](#C11) do not define vector types, however many C
implementations do provide these extensions. Where they exist, type
conversion between a value of type vector of `__fp16` and a value of
type vector of `_Float16` leaves the object representation of the
converted value unchanged.

ACLE does not define vector of `_Float16` types.

### Half-precision brain floating-point

ACLE defines the `__bf16` type, which can be used for half-precision
(16-bit) brain floating-point in an alternative format,
defined by Arm, which closely resembles the IEEE 754 single-precision floating
point format.

The `__bf16` type is only available when the
`__ARM_BF16_FORMAT_ALTERNATIVE` feature macro is defined.
When it is available it can only be used by the ACLE intrinsics
; it cannot be used with standard C operators.
It is expected that arithmetic using standard C operators be used using a
single-precision floating point format and the value be converted to `__bf16`
when required using ACLE intrinsics.

Armv8.2-A introduces floating point instructions to convert 32-bit to brain
16-bit, that is, from float to `__bf16`. They are not available in earlier
architectures, therefore have to rely on emulation libraries or a
sequence of instructions to achieve the conversion.

Providing emulation libraries for half-precision floating point
conversions when not implemented in hardware is implementation-defined.

### Modal 8-bit floating-point

ACLE defines the `__mfp8` type, which can be used for the E5M2 and E4M3
8-bit floating-point formats ("FP8"). It is a storage and interchange
only type with no arithmetic operations other than intrinsic calls.

# Architecture and CPU names

## Introduction

The intention of this section is to standardize architecture names, for example
for use in compiler command lines. Toolchains should accept these names
case-insensitively where possible, or use all lowercase where not
possible. Tools may apply local conventions such as using hyphens
instead of underscores.

(Note: processor names, including from the Arm Cortex |reg| processor family,
are used as illustrative examples. This specification is applicable to any
processors implementing the Arm architecture.)

## Architecture names

### CPU architecture

The recommended CPU architecture names are as specified under
`Tag_CPU_arch` in [[BA]](#BA). For details of how to use predefined macros to
test architecture in source code, see [Instruction set architecture and
features](#instruction-set-architecture-and-features).

The following table lists the architectures and the A32 and
T32 instruction set versions.

| **Name**        | **Features**                                             | **A32** | **T32** | **Example processor**  |
| --------------- | -------------------------------------------------------- | ------- | ------- | ---------------------- |
| Armv4           | Armv4                                                    | 4       |         | DEC/Intel StrongARM    |
| Armv4T          | Armv4 with Thumb instruction set                         | 4       | 2       | Arm7TDMI               |
| Armv5T          | Armv5 with Thumb instruction set                         | 5       | 2       | Arm10TDMI              |
| Armv5TE         | Armv5T with DSP extensions                               | 5       | 2       | Arm9E, Intel XScale    |
| Armv5TEJ        | Armv5TE with Jazelle ® extensions                        | 5       | 2       | Arm926EJ               |
| Armv6           | Armv6 (includes TEJ)                                     | 6       | 2       | Arm1136J r0            |
| Armv6K          | Armv6 with kernel extensions                             | 6       | 2       | Arm1136J r1            |
| Armv6T2         | Armv6 with Thumb-2 architecture                          | 6       | 3       | Arm1156T2              |
| Armv6Z          | Armv6K with Security Extensions (includes K)             | 6       | 2       | Arm1176JZ-S            |
| Armv6-M         | T32 (M-profile)                                          |         | 2       | Cortex-M0, Cortex-M1   |
| Armv7-A         | Armv7 application profile                                | 7       | 4       | Cortex-A8, Cortex-A9   |
| Armv7-R         | Armv7 realtime profile                                   | 7       | 4       | Cortex-R4              |
| Armv7-M         | Armv7 microcontroller profile: Thumb-2 instructions only |         | 4       | Cortex-M3              |
| Armv7E-M        | Armv7-M with DSP extensions                              |         | 4       | Cortex-M4              |
| Armv8-A AArch32 | Armv8 application profile                                | 8       | 4       | Cortex-A57, Cortex-A53 |
| Armv8-A AArch64 | Armv8 application profile                                | 8       |         | Cortex-A57, Cortex-A53 |

Note that there is some architectural variation that is not visible
through ACLE; either because it is only relevant at the system level
(for example the Large Physical Address Extension) or because it would be
handled by the compiler (for example hardware divide might or might not be
present in the Armv7-A architecture).

### FPU architecture

For details of how to test FPU features in source code, see
[Floating-point and vector hardware](#floating-point-and-vector-hardware).
In particular, for testing which precisions are supported in hardware,
see [Hardware floating point](#hardware-floating-point).

| **Name**         | **Features**                                       | **Example processor**               |
| ---------------- | -------------------------------------------------- | ----------------------------------- |
| `VFPv2`          | VFPv2                                              | Arm1136JF-S                         |
| `VFPv3`          | VFPv3                                              | Cortex-A8                           |
| `VFPv3_FP16`     | VFPv3 with FP16                                    | Cortex-A9 (with Neon)               |
| `VFPv3_D16`      | VFPv3 with 16 D-registers                          | Cortex-R4F                          |
| `VFPv3_D16_FP16` | VFPv3 with 16 D-registers and FP16                 | Cortex-A9 (without Neon), Cortex-R7 |
| `VFPv3_SP_D16`   | VFPv3 with 16 D-registers, single-precision only   | Cortex-R5 with SP-only              |
| `VFPv4`          | VFPv4 (including FMA and FP16)                     | Cortex-A15                          |
| `VFPv4_D16`      | VFPv4 (including FMA and FP16) with 16 D-registers | Cortex-A5 (VFP option)              |
| `FPv4_SP`        | FPv4 with single-precision only                    | Cortex-M4.fp                        |

## CPU names

ACLE does not standardize CPU names for use in command-line options and
similar contexts. Standard vendor product names should be used.

Object producers should place the CPU name in the `Tag_CPU_name` build
attribute.

# Feature test macros

## Introduction

The feature test macros allow programmers to determine the availability
of ACLE or subsets of it, or of target architectural features. This may
indicate the availability of some source language extensions (for example
intrinsics) or the likely level of performance of some standard C
features, such as integer division and floating-point.

Several macros are defined as numeric values to indicate the level of
support for particular features. These macros are undefined if the
feature is not present. (Aside: in Standard C/C++, references to
undefined macros expand to 0 in preprocessor expressions, so a
comparison such as:

``` c
  #if __ARM_ARCH >= 7
```

will have the expected effect of evaluating to false if the macro is not
defined.)

All ACLE macros begin with the prefix `__ARM_`. All ACLE macros expand
to integral constant expressions suitable for use in an #if directive,
unless otherwise specified. Syntactically, they must be
primary-expressions generally this means an implementation should
enclose them in parentheses if they are not simple constants.

## Testing for Arm C Language Extensions

`__ARM_ACLE` is defined as the version of this specification that is
implemented, formatted as `{YEAR}{QUARTER}{PATCH}`. The `YEAR` segment is
composed of 4 digits, the `QUARTER` segment is composed of 1 digit, and
the `PATCH` segment is also composed of 1 digit.

For example:

 - An implementation based on the version 2023 Q2 of the ACLE with no
   further patch releases will define `__ARM_ACLE` as `202320`.
 - An implementation based on a hypothetical version 2024 Q3 of the ACLE
   with two patch releases will define `__ARM_ACLE` as `202432`.

NOTE: Previously, the macro followed the previous versioning scheme and
was defined as `100 * major_version + minor_version`, which was the
version of this specification implemented. For instance, an implementation
implementing version 2.1 of the ACLE specification defined `__ARM_ACLE`
as `201`.

`__ARM_ACLE_VERSION(year, quarter, patch)` is defined to express a given
ACLE version. Returns with the version number in the same format as the
`__ARM_ACLE` does. Checking the minimum required ACLE version could be
written as:

``` c
#if __ARM_ACLE >= __ARM_ACLE_VERSION(2024, 1, 0)
```

## Endianness

`__ARM_BIG_ENDIAN` is defined as 1 if data is stored by default in
big-endian format. If the macro is not set, data is stored in
little-endian format. (Aside: the "mixed-endian" format for
double-precision numbers, used on some very old Arm FPU implementations,
is not supported by ACLE or the Arm ABI.)

## Instruction set architecture and features

References to the target architecture refer to the target as
configured in the tools, for example by appropriate command-line
options. This may be a subset or intersection of actual targets, in
order to produce a binary that runs on more than one real architecture.
For example, use of specific features may be disabled.

In the 32-bit architecture, some hardware features may be accessible from
only one or other of A32 or T32 state. For example, in the v5TE and v6
architectures, DSP instructions and (where available) VFP
instructions, are only accessible in A32 state, while in the v7-R
architecture, hardware divide is only accessible from T32 state. Where
both states are available, the implementation should set feature test
macros indicating that the hardware feature is accessible. To provide
access to the hardware feature, an implementation might override the
programmer's preference for target instruction set, or generate an
interworking call to a helper function. This mechanism is outside the
scope of ACLE. In cases where the implementation is given a hard
requirement to use only one state (for example to support validation, or
post-processing) then it should set feature test macros only for the
hardware features available in that state as if compiling for a core
where the other instruction set was not present.

An implementation that allows a user to indicate which functions go into
which state (either as a hard requirement or a preference) is not
required to change the settings of architectural feature test macros.

### Arm architecture level

`__ARM_ARCH` is defined as an integer value indicating the current Arm
instruction set architecture (for example 7 for the Arm v7-A architecture
implemented by Cortex-A8 or the Armv7-M architecture implemented by
Cortex-M3 or 8 for the Armv8-A architecture implemented by Cortex-A57).
Armv8.1-A [[ARMARMv81]](#ARMARMv81) onwards, the value of `__ARM_ARCH` is scaled up to
include minor versions. The formula to calculate the value of
`__ARM_ARCH` from Armv8.1-A [[ARMARMv81]](#ARMARMv81) onwards is given by the following
formula:

> For an Arm architecture ArmvX.Y, `__ARM_ARCH` = X * 100 + Y.
> For example, for Armv8.1 `__ARM_ARCH` = 801.

Since ACLE only supports the Arm architecture, this macro would always
be defined in an ACLE implementation.

Note that the `__ARM_ARCH` macro is defined even for cores which only
support the T32 instruction set.

### Instruction set architecture (A32/T32/A64)

`__ARM_ARCH_ISA_ARM` is defined to 1 if the core supports the Arm
instruction set. It is not defined for M-profile cores.

`__ARM_ARCH_ISA_THUMB` is defined to 1 if the core supports the
original T32 instruction set (including the v6-M architecture) and 2
if it supports the T32 instruction set as found in the v6T2
architecture and all v7 architectures.

`__ARM_ARCH_ISA_A64` is defined to 1 if the core supports AArch64's
A64 instruction set.

`__ARM_32BIT_STATE` is defined to 1 if code is being generated for
AArch32.

`__ARM_64BIT_STATE` is defined to 1 if code is being generated for
AArch64.

### Architectural profile (A, R, M or pre-Cortex)

`__ARM_ARCH_PROFILE` is defined to be one of the char literals
`'A'`, `'R'`, `'M'` or `'S'`, or unset, according to the
architectural profile of the target. `'S'` indicates the common
subset of the A and R profiles. The common subset of the A, R and M
profiles is indicated by

``` c
  __ARM_ARCH == 7 && !defined (__ARM_ARCH_PROFILE)
```

This macro corresponds to the `Tag_CPU_arch_profile` object build
attribute. It may be useful to writers of system code. It is expected in
most cases programmers will use more feature-specific tests.

The macro is undefined for architectural targets which predate the use
of architectural profiles.

### Unaligned access supported in hardware

`__ARM_FEATURE_UNALIGNED` is defined if the target supports unaligned
access in hardware, at least to the extent of being able to load or
store an integer word at any alignment with a single instruction. (There
may be restrictions on load-multiple and floating-point accesses.) Note
that whether a code generation target permits unaligned access will in
general depend on the settings of system register bits, so an
implementation should define this macro to match the user's expectations
and intentions. For example, a command-line option might be provided to
disable the use of unaligned access, in which case this macro would not
be defined.

### LDREX/STREX

This feature was deprecated in ACLE 2.0. It is strongly recommended that
C11/C++11 atomics be used instead.  (See also [Synchronization, barrier,
and hint intrinsics](#synchronization-barrier-and-hint-intrinsics).)

`__ARM_FEATURE_LDREX` is defined if the load/store-exclusive
instructions (LDREX/STREX) are supported. Its value is a set of bits
indicating available widths of the access, as powers of 2. The following
bits are used:

| **Bit** | **Value** | **Access width** | **Instruction** |
| ------- | --------- | ---------------- | --------------- |
| 0       | 0x01      | byte             | LDREXB/STREXB   |
| 1       | 0x02      | halfword         | LDREXH/STREXH   |
| 2       | 0x04      | word             | LDREX/STREX     |
| 3       | 0x08      | doubleword       | LDREXD/STREXD   |

Other bits are reserved.

The following values of `__ARM_FEATURE_LDREX` may occur:

| **Macro value** | **Access widths**                | **Example architecture** |
| --------------- | -------------------------------- | ------------------------ |
| (undefined)     | none                             | Armv5, Armv6-M           |
| 0x04            | word                             | Armv6                    |
| 0x07            | word, halfword, byte             | Armv7-M                  |
| 0x0F            | doubleword, word, halfword, byte | Armv6K, Armv7-A/R        |

Other values are reserved.

The LDREX/STREX instructions are introduced in recent versions of the
Arm architecture and supersede the SWP instruction. Where both are
available, Arm strongly recommends programmers to use LDREX/STREX rather
than SWP. Note that platforms may choose to make SWP unavailable in user
mode and emulate it through a trap to a platform routine, or fault it.

### CLZ

`__ARM_FEATURE_CLZ` is defined to 1 if the CLZ (count leading zeroes)
instruction is supported in hardware. Note that ACLE provides the 
`__clz()` family of intrinsics (see [Miscellaneous data-processing
intrinsics](#miscellaneous-data-processing-intrinsics)) even
when `__ARM_FEATURE_CLZ` is not defined.

### Q (saturation) flag

`__ARM_FEATURE_QBIT` is defined to 1 if the Q (saturation) global flag
exists and the intrinsics defined in [The Q (saturation)
flag](#the-q-saturation-flag) are available. This
flag is used with the DSP saturating-arithmetic instructions (such
as QADD) and the width-specified saturating instructions (SSAT and USAT).
Note that either of these classes of instructions may exist without the
other: for example, v5E has only QADD while v7-M has only SSAT.

Intrinsics associated with the Q-bit and their feature macro
`__ARM_FEATURE_QBIT` are deprecated in ACLE 2.0 for A-profile. They
are fully supported for M-profile and R-profile. This macro is defined
for AArch32 only.

### DSP instructions

`__ARM_FEATURE_DSP` is defined to 1 if the DSP (v5E) instructions are
supported and the intrinsics defined in [Saturating
intrinsics](#saturating-intrinsics) are available. These instructions include
QADD, SMULBB and others. This feature also implies support for the Q flag.

`__ARM_FEATURE_DSP` and its associated intrinsics are deprecated in
ACLE 2.0 for A-profile. They are fully supported for M and R-profiles.
This macro is defined for AArch32 only.

### Saturation instructions

`__ARM_FEATURE_SAT` is defined to 1 if the SSAT and USAT instructions
are supported and the intrinsics defined in [Width-specified saturation
intrinsics](#width-specified-saturation-intrinsics) are available. This
feature also implies support for the Q flag.

`__ARM_FEATURE_SAT` and its associated intrinsics are deprecated in
ACLE 2.0 for A-profile. They are fully supported for M and R-profiles.
This macro is defined for AArch32 only.

<span id="32-bit-simd-instructions"></span>

### 32-bit SIMD instructions

`__ARM_FEATURE_SIMD32` is defined to 1 if the 32-bit SIMD instructions
are supported and the intrinsics defined in
[32-bit SIMD Operations](#32-bit-simd-operations) are available. This also
implies support for the GE global flags which indicate byte-by-byte
comparison results.

`__ARM_FEATURE_SIMD32` is deprecated in ACLE 2.0 for A-profile. Users
are encouraged to use Neon Intrinsics as an equivalent for the 32-bit
SIMD intrinsics functionality. However they are fully supported for M
and R-profiles. This is defined for AArch32 only.

### Hardware integer divide

`__ARM_FEATURE_IDIV` is defined to 1 if the target has hardware
support for 32-bit integer division in all available instruction sets.
Signed and unsigned versions are both assumed to be available. The
intention is to allow programmers to choose alternative algorithm
implementations depending on the likely speed of integer division.

Some older R-profile targets have hardware divide available in the T32
instruction set only. This can be tested for using the following test:

``` c
    #if __ARM_FEATURE_IDIV || (__ARM_ARCH_PROFILE == 'R')
```

### CRC32 extension

`__ARM_FEATURE_CRC32` is defined to 1 if the CRC32 instructions are
supported and the intrinsics defined in [CRC32 intrinsics](#crc32-intrinsics)
are available. These instructions include CRC32B, CRC32H and others.
This is only available when `__ARM_ARCH >= 8`.

### Random Number Generation Extension

`__ARM_FEATURE_RNG` is defined to 1 if the Random Number Generation
instructions are supported and the intrinsics defined in
[Random number generation intrinsics](#random-number-generation-intrinsics)
are available.

### Branch Target Identification

`__ARM_FEATURE_BTI_DEFAULT` is defined to 1 if the Branch Target
Identification extension is used to protect branch destinations by default.
The protection applied to any particular function may be overridden by
mechanisms such as function attributes.

`__ARM_FEATURE_BTI` is defined to 1 if Branch Target Identification
extension is available on the target. It is undefined otherwise.

### Pointer Authentication

`__ARM_FEATURE_PAC_DEFAULT` is defined as a bitmap to indicate the use of the
Pointer Authentication extension to protect code against code reuse attacks
by default.
The bits are defined as follows:

| **Bit** | **Meaning**                          |
| ------- | ------------------------------------ |
| 0       | Protection using the A key           |
| 1       | Protection using the B key           |
| 2       | Protection including leaf functions  |
| 3       | Protection using PC as a diversifier |

For example, a value of `0x5` indicates that the Pointer Authentication
extension is used to protect function entry points, including leaf functions,
using the A key for signing.
The protection applied to any particular function may be overridden by
mechanisms such as function attributes.

`__ARM_FEATURE_PAUTH` is defined to 1 if Pointer Authentication extension
(FEAT_PAuth) is available on the target. It is undefined otherwise.

`__ARM_FEATURE_PAUTH_LR` is defined to 1 if Armv9.5-A enhancements to the
Pointer Authentication extension (FEAT_PAuth_LR) are available on the target.
It is undefined otherwise.

### Large System Extensions

`__ARM_FEATURE_ATOMICS` is defined if the Large System Extensions introduced in
the Armv8.1-A [[ARMARMv81]](#ARMARMv81) architecture are supported on this target.
Note: It is strongly recommended that standardized C11/C++11 atomics are used to
implement atomic operations in user code.

### Transactional Memory Extension

`__ARM_FEATURE_TME` is defined to `1` if the Transactional Memory
Extension instructions are supported in hardware and intrinsics defined
in [Transactional Memory Extension (TME)
intrinsics](#transactional-memory-extension-tme-intrinsics) are available.

### Armv8.7-A Load/Store 64 Byte extension

`__ARM_FEATURE_LS64` is defined to 1 if the Armv8.7-A `LD64B`,
`ST64B`, `ST64BV` and `ST64BV0` instructions for atomic 64-byte
access to device memory are supported.
This macro may only ever be defined in the AArch64 execution state.
Intrinsics for using these instructions are specified in
[Load/store 64 Byte intrinsics](#loadstore-64-byte-intrinsics).

### memcpy family of memory operations standarization instructions - MOPS

If the `CPYF*`, `CPY*`, `SET*` and `SETG*` instructions are supported,
`__ARM_FEATURE_MOPS` is defined to 1. These instructions were
introduced in the Armv8.8-A and Armv9.3-A architecture updates for
standardization of `memcpy`, `memset`, and `memmove` family of memory
operations (MOPS).

The `__ARM_FEATURE_MOPS` macro can only be implemented in the AArch64
execution state. Intrinsics for the use of these instructions are
specified in [memcpy family of operations intrinsics -
MOPS](#memcpy-family-of-operations-intrinsics---mops)

### RCPC

`__ARM_FEATURE_RCPC` is set if the weaker RCpc (Release Consistent
processor consistent) model is supported. It is undefined otherwise.
The value indicates the set of Load-Acquire and Store-Release
instructions available. The intention is to allow programmers to guard
the usage of these instructions in inline assembly.

If defined, the value of `__ARM_FEATURE_RCPC` remains consistent with the decimal
value of `LRCPC` field (bits [23:20]) in the `ID_AA64ISAR1_EL1` register.
For convenience these are shown below:

| **Value** | **Feature** | **Instructions**                | **Availability**          |
| --------- | ----------- | ------------------------------- | ------------------------- |
| 1         | FEAT_LRCPC  | LDAPR* instructions             | Armv8.3, optional Armv8.2 |
| 2         | FEAT_LRCPC2 | LDAPUR* and STLUR* instructions | Armv8.4, optional Armv8.2 |
| 3         | FEAT_LRCPC3 | See FEAT_LRCPC3 documentation   | Armv8.9, optional Armv8.2 |

The `__ARM_FEATURE_RCPC` macro can only be implemented in the AArch64
execution state.

### 128-bit system registers

If the `MRRS` and `MSRR` instructions are supported, `__ARM_FEATURE_SYSREG128`
is defined to 1. These instructions were introduced in the Armv9.4-A
architecture updates to support 128-bit system register accesses.

The `__ARM_FEATURE_SYSREG128` macro can only be implemented in the AArch64
execution state. Intrinsics for the use of these instructions are specified in
[Special register intrinsics](#special-register-intrinsics).

## Floating-point and vector hardware

### Hardware floating point

`__ARM_FP` is set if hardware floating-point is available. The value is
a set of bits indicating the floating-point precisions supported. The
following bits are used:

| **Bit** | **Value** | **Precision**                |
| ------- | --------- | ---------------------------- |
| 1       | 0x02      | half (16-bit) data type only |
| 2       | 0x04      | single (32-bit)              |
| 3       | 0x08      | double (64-bit)              |

Bits 0 and 4..31 are reserved

Currently, the following values of `__ARM_FP` may occur (assuming the
processor configuration option for hardware floating-point support is
selected where available):

| **Value**   | **Precisions**       | **Example processor**                                 |
| ----------- | -------------------- | ----------------------------------------------------- |
| (undefined) | none                 | any processor without hardware floating-point support |
| 0x04        | single               | Cortex-R5 when configured with SP only                |
| 0x06        | single, half         | Cortex-M4.fp                                          |
| 0x0C        | double, single       | Arm9, Arm11, Cortex-A8, Cortex-R4                     |
| 0x0E        | double, single, half | Cortex-A9, Cortex-A15, Cortex-R7                      |

Other values are reserved.

Standard C implementations support single and double precision
floating-point irrespective of whether floating-point hardware is
available. However, an implementation might choose to offer a mode to
diagnose or fault use of floating-point arithmetic at a precision not
supported in hardware.

Support for 16-bit floating-point language or 16-bit brain floating-point
language extensions (see [Half-precision (16-bit) floating-point
format](#half-precision-16-bit-floating-point-format) and [Brain
16-bit floating-point support](#brain-16-bit-floating-point-support))
is only required if supported in hardware.

### Half-precision (16-bit) floating-point format

`__ARM_FP16_FORMAT_IEEE` is defined to 1 if the IEEE 754-2008
[[IEEE-FP]](#IEEE-FP) 16-bit floating-point format is used.

`__ARM_FP16_FORMAT_ALTERNATIVE` is defined to 1 if the Arm
alternative [[ARMARM]](#ARMARM) 16-bit floating-point format is used. This format
removes support for infinities and NaNs in order to provide an
additional binade.

At most one of these macros will be defined. See [Half-precision
floating-point](#half-precision-floating-point) for details of
half-precision floating-point types.

### Half-precision argument and result

`__ARM_FP16_ARGS` is defined to 1 if `__fp16` can be used as an
argument and result.

### Vector extensions

#### Advanced SIMD architecture extension (Neon)

`__ARM_NEON` is defined to a value indicating the Advanced SIMD (Neon)
architecture supported. The only current value is 1.

In principle, for AArch32, the Neon architecture can exist in an
integer-only version. To test for the presence of Neon floating-point
vector instructions, test `__ARM_NEON_FP`. When Neon does occur in an
integer-only version, the VFP scalar instruction set is also not
present. See [[ARMARM]](#ARMARM) (table A2-4) for architecturally permitted
combinations.

`__ARM_NEON` is always set to 1 for AArch64.

#### Neon floating-point

`__ARM_NEON_FP` is defined as a bitmap to indicate floating-point
support in the Neon architecture. The meaning of the values is the same
as for `__ARM_FP`. This macro is undefined when the Neon extension is
not present or does not support floating-point.

Current AArch32 Neon implementations do not support double-precision
floating-point even when it is present in VFP. 16-bit floating-point
format is supported in Neon if and only if it is supported in VFP.
Consequently, the definition of `__ARM_NEON_FP` is the same as
`__ARM_FP` except that the bit to indicate double-precision is not set
for AArch32. Double-precision is always set for AArch64.

If `__ARM_FEATURE_FMA` and `__ARM_NEON_FP` are both defined,
fused-multiply instructions are available in Neon also.

#### Scalable Vector Extension (SVE)

`__ARM_FEATURE_SVE` is defined to 1 if there is hardware support
for the FEAT_SVE instructions and if the associated [ACLE
features](#sve-language-extensions-and-intrinsics) are available.
This implies that `__ARM_NEON` and `__ARM_NEON_FP` are both nonzero.

The following macros indicate the presence of various optional
SVE language extensions:

**`__ARM_FEATURE_SVE_BITS==N`**

> When N is nonzero, this indicates that the implementation is generating
> code for an N-bit SVE target and that the implementation supports the
> `arm_sve_vector_bits(N)` attribute. N may also be zero, but this carries
> the same meaning as not defining the macro. See
> [The __ARM_FEATURE_SVE_BITS macro](#the-__arm_feature_sve_bits-macro)
> for details.

**`__ARM_FEATURE_SVE_VECTOR_OPERATORS==N`**

> `N >= 1` indicates that applying the `arm_sve_vector_bits` attribute
> to an SVE vector type creates a type that supports the GNU vector
> extensions. This condition is only meaningful when
> `__ARM_FEATURE_SVE_BITS` is nonzero. See [`arm_sve_vector_bits` behavior
> specific to vectors](#arm_sve_vector_bits-behavior-specific-to-vectors)
> for details.

> `N >= 2` indicates that the operators outlined in the GNU vector
> extensions additionally work on sizeless SVE vector types like `svint32_t`.
> The availability of operators on sizeless types is independent of
> `__ARM_FEATURE_SVE_BITS`.

**`__ARM_FEATURE_SVE_PREDICATE_OPERATORS==N`**

> `N >= 1` indicates that applying the `arm_sve_vector_bits` attribute to
> `svbool_t` creates a type that supports basic built-in vector operations.
> The state of this macro is only meaningful when `__ARM_FEATURE_SVE_BITS`
> is nonzero. See [`arm_sve_vector_bits` behavior specific to
> predicates](#arm_sve_vector_bits-behavior-specific-to-predicates)
> for details.

> `N >= 2` indicates that the built-in vector operations described above
> additionally work on `svbool_t`.
> The availability of operators on `svbool_t` is independent of
> `__ARM_FEATURE_SVE_BITS`.

#### SVE2

`__ARM_FEATURE_SVE2` is defined to 1 if there is hardware support for
the Armv9-A SVE2 extension (FEAT_SVE2) and if the associated ACLE intrinsics
are available. This implies that `__ARM_FEATURE_SVE` is nonzero.

`__ARM_FEATURE_SVE2p1` is defined to 1 if the FEAT_SVE2p1 instructions
 are available and if the associated [ACLE features]
(#sme-language-extensions-and-intrinsics) are supported.

#### NEON-SVE Bridge macro

`__ARM_NEON_SVE_BRIDGE` is defined to 1 if the [`<arm_neon_sve_bridge.h>`](#arm_neon_sve_bridge.h)
header file is available.

#### Scalable Matrix Extension (SME)

The specification for SME2.1 is in
[**Alpha** state](#current-status-and-anticipated-changes) and the
specification for the rest of SME is in
[**Beta** state](#current-status-and-anticipated-changes).  The
specifications may change or be extended in the future.

ACLE provides [features](#sme-language-extensions-and-intrinsics)
for accessing the Scalable Matrix Extension (SME). Each revision
of SME has an associated preprocessor macro, given in the table below:

| **Feature** | **Macro**                  |
| ----------- | -------------------------- |
| FEAT_SME    | __ARM_FEATURE_SME          |
| FEAT_SME2   | __ARM_FEATURE_SME2         |
| FEAT_SME2p1 | __ARM_FEATURE_SME2p1       |

Each macro is defined if there is hardware support for the associated
architecture feature and if all of the [ACLE
features](#sme-language-extensions-and-intrinsics) that are conditional
on the macro are supported.

In addition, `__ARM_FEATURE_LOCALLY_STREAMING` is defined to 1 if
the [`arm_locally_streaming`](#arm_locally_streaming) attribute
is available.

#### M-profile Vector Extension

`__ARM_FEATURE_MVE` is defined as a bitmap to indicate M-profile Vector
Extension (MVE) support.

| **Bit** | **Value** | **Support**        |
| ------- | --------- | ------------------ |
| 0       | 0x01      | Integer MVE        |
| 1       | 0x02      | Floating-point MVE |

#### Wireless MMX

If Wireless MMX operations are available on the target, `__ARM_WMMX` is
defined to a value that indicates the level of support, corresponding to
the `Tag_WMMX_arch` build attribute.

This specification does not further define source-language features to
support Wireless MMX.

### 16-bit floating-point extensions

<span id="16-bit-floating-point-data-processing-operations"></span>

#### 16-bit floating-point data processing operations

`__ARM_FEATURE_FP16_SCALAR_ARITHMETIC` is defined to `1` if the
16-bit floating-point arithmetic instructions are supported in hardware and
the associated scalar intrinsics defined by ACLE are available. Note that
this implies:

* `__ARM_FP16_FORMAT_IEEE == 1`
* `__ARM_FP16_FORMAT_ALTERNATIVE == 0`
* `__ARM_FP & 0x02 == 1`

`__ARM_FEATURE_FP16_VECTOR_ARITHMETIC` is defined to `1` if the 16-bit
floating-point arithmetic instructions are supported in hardware and the
associated vector intrinsics defined by ACLE are available. Note that
this implies:

* `__ARM_FP16_FORMAT_IEEE == 1`
* `__ARM_FP16_FORMAT_ALTERNATIVE == 0`
* `__ARM_FP & 0x02 == 1`
* `__ARM_NEON_FP & 0x02 == 1`

#### FP16 FML extension

`__ARM_FEATURE_FP16_FML` is defined to 1 if the FP16 multiplication variant
instructions from Armv8.2-A are supported and intrinsics targeting them are
available. This implies that `__ARM_FEATURE_FP16_SCALAR_ARITHMETIC` is
defined to a nonzero value.

#### Half-precision floating-point SME intrinsics

The specification for SME2.1 is in
[**Alpha** state](#current-status-and-anticipated-changes) and may change or be
extended in the future.

`__ARM_FEATURE_SME_F16F16` is defined to `1` if there is hardware support
for the SME2 half-precision (FEAT_SME_F16F16) instructions and if their
associated intrinsics are available.

#### Brain 16-bit floating-point support

`__ARM_BF16_FORMAT_ALTERNATIVE` is defined to 1 if the Arm
alternative [[ARMARM]](#ARMARM) 16-bit brain floating-point format is used. This format
closely resembles the IEEE 754 single-precision format.  As such a brain
half-precision floating point value can be converted to an IEEE 754
single-floating point format by appending 16 zero bits at the end.

`__ARM_FEATURE_BF16_VECTOR_ARITHMETIC` is defined to `1` if there is
hardware support for the Advanced SIMD brain 16-bit floating-point
arithmetic instructions and if the associated ACLE vector intrinsics
are available. This implies:

* `__ARM_FP & 0x02 == 1`
* `__ARM_NEON_FP & 0x02 == 1`

Similarly, `__ARM_FEATURE_SVE_BF16` is defined to `1` if there is hardware
support for the SVE BF16 extensions and if the associated ACLE intrinsics
are available. This implies that `__ARM_FEATURE_BF16_VECTOR_ARITHMETIC`
and `__ARM_FEATURE_SVE` are both nonzero.

See [Half-precision brain
floating-point](#half-precision-brain-floating-point) for details
of half-precision brain floating-point types.

#### Non-widening brain 16-bit floating-point support

The specification for B16B16 is in
[**Alpha** state](#current-status-and-anticipated-changes) and may change or be
extended in the future.

`__ARM_FEATURE_SVE_B16B16` is defined to `1` if there is hardware support
for the FEAT_SVE_B16B16 instructions and if their associated intrinsics
are available.  Specifically, if this macro is defined to `1`, then:

*    the SVE subset of the FEAT_SVE_B16B16 intrinsics are available in
     [non-streaming statements](#non-streaming-statement)
     if `__ARM_FEATURE_SVE` is nonzero.

*    the SVE subset of the FEAT_SVE_B16B16 intrinsics are available in
     [streaming-compatible statements](#streaming-compatible-statement)
     if `__ARM_FEATURE_SME` is nonzero.

*    all FEAT_SVE_B16B16 intrinsics are available in
     [streaming statements](#streaming-statement) if `__ARM_FEATURE_SME`
     is nonzero.

`__ARM_FEATURE_SME_B16B16` is defined to `1` if there is hardware support
for the FEAT_SME_B16B16 instructions and if their associated intrinsics
are available.

### Cryptographic extensions

#### “Crypto” extension

NOTE: The `__ARM_FEATURE_CRYPTO` macro is deprecated in favor of the finer
grained feature macros described below.

`__ARM_FEATURE_CRYPTO` is defined to 1 if the Armv8-A Crypto instructions are
supported and intrinsics targeting them are available. These
instructions include AES{E, D}, SHA1{C, P, M} and others. This also implies
`__ARM_FEATURE_AES` and `__ARM_FEATURE_SHA2`.

#### AES extension

`__ARM_FEATURE_AES` is defined to 1 if there is hardware support for the
Advanced SIMD AES Crypto instructions from Armv8-A and if the associated
ACLE intrinsics are available. These instructions are identified by
`FEAT_AES` and `FEAT_PMULL` in [[ARMARMv8]](#ARMARMv8), and they include
AES{E, D}, AESMC, AESIMC and others.

In addition, `__ARM_FEATURE_SVE2_AES` is defined to `1` if there is hardware
support for the SVE2 AES (FEAT_SVE_AES) instructions and if the associated
ACLE intrinsics are available. This implies that `__ARM_FEATURE_AES`
and `__ARM_FEATURE_SVE2` are both nonzero.

#### SHA2 extension

`__ARM_FEATURE_SHA2` is defined to 1 if the SHA1 & SHA2-256 Crypto
instructions from Armv8-A are supported and intrinsics targeting them
are available. These instructions are identified by `FEAT_SHA1` and
`FEAT_SHA256` in [[ARMARMv8]](#ARMARMv8), and they include SHA1{C, P,
M}, SHA256H, SHA256H2... and others.

#### SHA512 extension

`__ARM_FEATURE_SHA512` is defined to 1 if the SHA2-512 Crypto instructions
from Armv8.2-A are supported and intrinsics targeting them are
available. These instructions are identified by `FEAT_SHA512` in
[[ARMARMv82]](#ARMARMv82), and they include SHA1{C, P, M}, SHA256H,
SHA256H2, ..., SHA512H, SHA512H2, SHA512SU0... and others. Note:
`FEAT_SHA512` requires both `FEAT_SHA1` and `FEAT_SHA256`.

#### SHA3 extension

`__ARM_FEATURE_SHA3` is defined to 1 if there is hardware support for
the Advanced SIMD SHA1 & SHA2 Crypto instructions from Armv8-A and the
SHA2 and SHA3 instructions from Armv8.2-A and newer and if the associated
ACLE intrinsics are available. These instructions include AES{E, D}, SHA1{C,
P, M}, RAX, and others.

In addition, `__ARM_FEATURE_SVE2_SHA3` is defined to `1` if there is hardware
support for the SVE2 SHA3 (FEAT_SVE_SHA3) instructions and if the associated
ACLE intrinsics are available. This implies that `__ARM_FEATURE_SHA3` and
`__ARM_FEATURE_SVE2` are both nonzero.

#### SM3 extension

`__ARM_FEATURE_SM3` is defined to 1 if there is hardware support for
Advanced SIMD SM3 Crypto instructions from Armv8.2-A and if the associated
ACLE intrinsics are available. These instructions include SM3{TT1A,
TT1B}, and others.

In addition, `__ARM_FEATURE_SVE2_SM3` is defined to `1` if there is hardware
support for the SVE2 SM3 (FEAT_SVE_SM3) instructions and if the associated
ACLE intrinsics are available. This implies that `__ARM_FEATURE_SM3` and
`__ARM_FEATURE_SVE2` are both nonzero.

#### SM4 extension

`__ARM_FEATURE_SM4` is defined to 1 if there is hardware support for the
Advanced SIMD SM4 Crypto instructions from Armv8.2-A and if the associated
ACLE intrinsics are available. These instructions include SM4{E, EKEY}
and others.

In addition, `__ARM_FEATURE_SVE2_SM4` is defined to `1` if there is hardware
support for the SVE2 SM4 (FEAT_SVE_SM4) instructions and if the associated
ACLE intrinsics are available. This implies that `__ARM_FEATURE_SM4` and
`__ARM_FEATURE_SVE2` are both nonzero.

### Floating-point absolute minimum and maximum extension

`__ARM_FEATURE_FAMINMAX` is defined to 1 if there is hardware support for
floating-point absolute minimum and maximum instructions (FEAT_FAMINMAX)
and if the associated ACLE intrinsics are available.

### Lookup table extensions

`__ARM_FEATURE_LUT` is defined to 1 if there is hardware support for
lookup table instructions with 2-bit and 4-bit indices (FEAT_LUT)
and if the associated ACLE intrinsics are available.

`__ARM_FEATURE_SME_LUTv2` is defined to 1 if there is hardware support for
lookup table instructions with 4-bit indices and 8-bit elements (FEAT_SME_LUTv2)
and if the associated ACLE intrinsics are available.

### Modal 8-bit floating point extensions

`__ARM_FEATURE_FP8` is defined to 1 if there is hardware support for FP8 conversion
instructions (FEAT_FP8) and if the associated ACLE intrinsics are available.

`__ARM_FEATURE_FP8FMA` is defined to 1 if there is hardware support for
FP8 multiply-accumulate to half-precision and single-precision instructions
(FEAT_FP8FMA) and if the associated ACLE intrinsics are available.

`__ARM_FEATURE_FP8DOT2` is defined to 1 if there is hardware support for
FP8 2-way dot product to half-precision instructions (FEAT_FP8DOT2)
and if the associated ACLE intrinsics are available.

`__ARM_FEATURE_FP8DOT4` is defined to 1 if there is hardware support for
FP8 4-way dot product to single-precision instructions (FEAT_FP8DOT4)
and if the associated ACLE intrinsics are available.

`__ARM_FEATURE_SSVE_FP8DOT4` is defined to 1 if there is hardware support for
SVE2 FP8 4-way dot product to single-precision instructions
in Streaming SVE mode (FEAT_SSVE_FP8DOT4) and if the associated ACLE
intrinsics are available.

`__ARM_FEATURE_SSVE_FP8DOT2` is defined to 1 if there is hardware support for
SVE2 FP8 2-way dot product to half-precision instructions
in Streaming SVE mode (FEAT_SSVE_FP8DOT2) and if the associated ACLE intrinsics
are available.

`__ARM_FEATURE_SSVE_FP8FMA` is defined to 1 if there is hardware support for
SVE2 FP8 multiply-accumulate to half-precision and single-precision
instructions in Streaming SVE mode (FEAT_SSVE_FP8FMA) and if the associated
ACLE intrinsics are available.

`__ARM_FEATURE_SME_F8F32` is defined to 1 if there is hardware support for SME2
FP8 dot product, multiply-accumulate, and outer product to single-precision
instructions (FEAT_SME_F8F32) and if the associated ACLE intrinsics are
available.

`__ARM_FEATURE_SME_F8F16` is defined to 1 if there is hardware support for SME2
FP8 dot product, multiply-accumulate, and outer product to half-precision
instructions (FEAT_SME_F8F16) and if the associated ACLE intrinsics are
available.

### Other floating-point and vector extensions

#### Fused multiply-accumulate (FMA)

`__ARM_FEATURE_FMA` is defined to 1 if the hardware floating-point
architecture supports fused floating-point multiply-accumulate, that is,
without intermediate rounding. Note that C implementations are
encouraged [[C99]](#C99) (7.12) to ensure that <math.h> defines `FP_FAST_FMAF` or
`FP_FAST_FMA`, which can be tested by portable C code. A C
implementation on Arm might define these macros by testing
`__ARM_FEATURE_FMA` and `__ARM_FP`.

This macro implies support for floating-point instructions but it
does not in itself imply support for vector instructions.  See [Neon
floating-point](#neon-floating-point) for the conditions under
which vector fused multiply-accumulate operations are available.

#### Directed rounding

`__ARM_FEATURE_DIRECTED_ROUNDING` is defined to 1 if the directed
rounding and conversion vector instructions are supported and rounding
and conversion intrinsics are available. This is only available when
`__ARM_ARCH >= 8`.

#### Armv8.5-A Floating-point rounding extension

`__ARM_FEATURE_FRINT`  is defined to 1 if the Armv8.5-A rounding number
instructions are supported and the scalar and vector intrinsics are available.
This macro may only ever be defined in the AArch64 execution state.
The scalar intrinsics are specified in [Floating-point data-processing
intrinsics](#floating-point-data-processing-intrinsics) and are not expected
to be for general use.  They are defined for uses that require the specialist
rounding behavior of the relevant instructions.
The vector intrinsics are specified in the Arm Neon Intrinsics Reference
Architecture Specification [[Neon]](#Neon).

#### Javascript floating-point conversion

`__ARM_FEATURE_JCVT` is defined to 1 if the FJCVTZS (AArch64)
or VJCVT (AArch32) instruction and the [associated
intrinsic](#floating-point-data-processing-intrinsics) are available.

#### Numeric maximum and minimum

`__ARM_FEATURE_NUMERIC_MAXMIN` is defined to 1 if the IEEE 754-2008
compliant floating point maximum and minimum vector instructions are
supported and intrinsics targeting these instructions are available. This
is only available when `__ARM_ARCH >= 8`.

#### Rounding doubling multiplies

`__ARM_FEATURE_QRDMX` is defined to 1 if SQRDMLAH and SQRDMLSH
instructions and their associated intrinsics are available.

#### Dot Product extension

`__ARM_FEATURE_DOTPROD`  is defined if the dot product data manipulation
instructions are supported and the vector intrinsics are available. Note that
this implies:

  * `__ARM_NEON == 1`

#### Complex number intrinsics

`__ARM_FEATURE_COMPLEX` is defined if the complex addition and complex
multiply-accumulate vector instructions are supported. Note that this implies:

  * `__ARM_NEON == 1`

These instructions require that the input vectors are organized such that the
real and imaginary parts of the complex number are stored in alternating sequences:
real, imag, real, imag, ... etc.

#### Matrix Multiply Intrinsics

##### Multiplication of 8-bit integer matrices

`__ARM_FEATURE_MATMUL_INT8` is defined to `1` if there is hardware support
for the Advanced SIMD integer matrix multiply instructions are if the
associated ACLE intrinsics are available. This implies that `__ARM_NEON` is
nonzero.

In addition, `__ARM_FEATURE_SVE_MATMUL_INT8` is defined to `1` if there
is hardware support for the SVE forms of these instructions and if the
associated ACLE intrinsics are available. This implies that
`__ARM_FEATURE_MATMUL_INT8` and `__ARM_FEATURE_SVE` are both nonzero.

##### Multiplication of 32-bit floating-point matrices

`__ARM_FEATURE_SVE_MATMUL_FP32` is defined to `1` if there is hardware support
for the SVE 32-bit floating-point matrix multiply (FEAT_F32MM) instructions
and if the associated ACLE intrinsics are available. This implies that
`__ARM_FEATURE_SVE` is nonzero.

##### Multiplication of 64-bit floating-point matrices

`__ARM_FEATURE_SVE_MATMUL_FP64` is defined to `1` if there is hardware support
for the SVE 64-bit floating-point matrix multiply (FEAT_F64MM) instructions
and if the associated ACLE intrinsics are available. This implies that
`__ARM_FEATURE_SVE` is nonzero.

#### Bit permute extension

`__ARM_FEATURE_SVE2_BITPERM` is defined to 1 if there is hardware support for
the SVE2 bit permute (FEAT_SVE_BitPerm) instructions and if the associated
ACLE intrinsics are available. This implies that `__ARM_FEATURE_SVE2` is
nonzero.

<span id="16-bit-to-64-bit-integer-widening-outer-product-intrinsics"></span>

#### 16-bit to 64-bit integer widening outer product intrinsics

The specification for SME is in
[**Beta** state](#current-status-and-anticipated-changes) and may change or be
extended in the future.

`__ARM_FEATURE_SME_I16I64` is defined to `1` if there is hardware
support for the SME 16-bit to 64-bit integer widening outer product
(FEAT_SME_I16I64) instructions and if their associated intrinsics are
available. This implies that `__ARM_FEATURE_SME` is nonzero.

#### Double precision floating-point outer product intrinsics

The specification for SME is in
[**Beta** state](#current-status-and-anticipated-changes) and may change or be
extended in the future.

`__ARM_FEATURE_SME_F64F64` is defined to `1` if there is hardware
support for the SME double precision floating-point outer product
(FEAT_SME_F64F64) instructions and if their associated intrinsics are
available. This implies that `__ARM_FEATURE_SME` is nonzero.

## Floating-point model

These macros test the floating-point model implemented by the compiler
and libraries. The model determines the guarantees on arithmetic and
exceptions.

`__ARM_FP_FAST` is defined to 1 if floating-point optimizations may
occur such that the computed results are different from those prescribed
by the order of operations according to the C standard. Examples of such
optimizations would be reassociation of expressions to reduce depth, and
replacement of a division by constant with multiplication by its
reciprocal.

`__ARM_FP_FENV_ROUNDING` is defined to 1 if the implementation allows
the rounding to be configured at runtime using the standard C
fesetround() function and will apply this rounding to future
floating-point operations. The rounding mode applies to both scalar
floating-point and Neon.

The floating-point implementation might or might not support denormal
values. If denormal values are not supported then they are flushed to
zero.

Implementations may also define the following macros in appropriate
floating-point modes:

`__STDC_IEC_559__` is defined if the implementation conforms to IEC
This implies support for floating-point exception status flags,
including the inexact exception. This macro is specified by [[C99]](#C99)
(6.10.8).

`__SUPPORT_SNAN__` is defined if the implementation supports
signalling NaNs. This macro is specified by the C standards proposal
WG14 N965 Optional support for Signaling NaNs. (Note: this was not
adopted into C11.)

## Procedure call standard

`__ARM_PCS` is defined to 1 if the default procedure calling standard
for the translation unit conforms to the base PCS defined in [[AAPCS]](#AAPCS).
This is supported on AArch32 only.

`__ARM_PCS_VFP` is defined to 1 if the default is to pass
floating-point parameters in hardware floating-point registers using the
VFP variant PCS defined in [[AAPCS]](#AAPCS). This is supported on AArch32 only.

`__ARM_PCS_AAPCS64` is defined to 1 if the default procedure calling
standard for the translation unit conforms to the [[AAPCS64]](#AAPCS64).

Note that this should reflect the implementation default for the
translation unit. Implementations which allow the PCS to be set for a
function, class or namespace are not expected to redefine the macro
within that scope.

## Position-independent code

`__ARM_ROPI` is defined to 1 if the translation unit is being compiled in
read-only position independent mode. In this mode, all read-only data and
functions are at a link-time constant offset from the program counter.

`__ARM_RWPI` is defined to 1 if the translation unit is being compiled in
read-write position independent mode. In this mode, all writable data is at a
link-time constant offset from the static base register defined in [[AAPCS]](#AAPCS).

The ROPI and RWPI position independence modes are compatible with each other,
so the `__ARM_ROPI` and `__ARM_RWPI` macros may be defined at the same
time.

## Coprocessor intrinsics

`__ARM_FEATURE_COPROC` is defined as a bitmap to indicate the presence of
coprocessor intrinsics for the target architecture. If `__ARM_FEATURE_COPROC`
is undefined or zero, that means there is no support for coprocessor intrinsics
on the target architecture. The following bits are used:

| **Bit** | **Value** | **Intrinsics Available**                                                                |
| ------- | --------- | --------------------------------------------------------------------------------------- |
| 0       | 0x1       | __arm_cdp __arm_ldc, __arm_ldcl, __arm_stc, __arm_stcl, __arm_mcr and __arm_mrc         |
| 1       | 0x2       | __arm_cdp2, __arm_ldc2, __arm_stc2, __arm_ldc2l, __arm_stc2l, __arm_mcr2 and __arm_mrc2 |
| 2       | 0x4       | __arm_mcrr and __arm_mrrc                                                               |
| 3       | 0x8       | __arm_mcrr2 and __arm_mrrc2                                                             |

## Custom Datapath Extension

`__ARM_FEATURE_CDE` is defined to 1 if the Arm Custom Datapath Extension
(CDE) is supported.

`__ARM_FEATURE_CDE_COPROC` is a bitmap indicating the CDE coprocessors
available.  The following bits are used:

| **Bit** | **Value** | **CDE Coprocessor available**     |
| ------- | --------- | --------------------------------- |
| 0       | 0x01      | `p0`                              |
| 1       | 0x02      | `p1`                              |
| 2       | 0x04      | `p2`                              |
| 3       | 0x08      | `p3`                              |
| 4       | 0x10      | `p4`                              |
| 5       | 0x20      | `p5`                              |
| 6       | 0x40      | `p6`                              |
| 7       | 0x80      | `p7`                              |

## Mapping of object build attributes to predefines

This section is provided for guidance. Details of build attributes can
be found in [[BA]](#BA).

| **Tag no.**              | **Tag**                      | **Predefined macro**              |
| ------------------------ | ---------------------------- | --------------------------------- |
| 6                        | `Tag_CPU_arch`               | `__ARM_ARCH`, `__ARM_FEATURE_DSP` |
| 7                        | `Tag_CPU_arch_profile`       | `__ARM_PROFILE`                   |
| 8                        | `Tag_ARM_ISA_use`            | `__ARM_ISA_ARM`                   |
| 9                        | `Tag_THUMB_ISA_use`          | `__ARM_ISA_THUMB`                 |
| 11                       | `Tag_WMMX_arch`              | `__ARM_WMMX`                      |
| 18                       | `Tag_ABI_PCS_wchar_t`        | `__ARM_SIZEOF_WCHAR_T`            |
| 20                       | `Tag_ABI_FP_denormal`        |                                   |
| 21                       | `Tag_ABI_FP_exceptions`      |                                   |
| 22                       | `Tag_ABI_FP_user_exceptions` |                                   |
| 23                       | `Tag_ABI_FP_number_model`    |                                   |
| 26                       | `Tag_ABI_enum_size`          | `__ARM_SIZEOF_MINIMAL_ENUM`       |
| 34                       | `Tag_CPU_unaligned_access`   | `__ARM_FEATURE_UNALIGNED`         |
| 36                       | `Tag_FP_HP_extension`        | `__ARM_FP16_FORMAT_IEEE`          |
|                          |                              | `__ARM_FP16_FORMAT_ALTERNATIVE`   |
| 38                       | `Tag_ABI_FP_16bit_for`       | `__ARM_FP16_FORMAT_IEEE`          |
|                          |                              | `__ARM_FP16_FORMAT_ALTERNATIVE`   |

## Summary of predefined macros

| **Macro name**                                                                                                                                          | **Meaning**                                                                                        | **Example** |
|---------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|-------------|
| [`__ARM_32BIT_STATE`](#instruction-set-architecture-a32t32a64)                                                                                          | Code is for AArch32 state                                                                          | 1           |
| [`__ARM_64BIT_STATE`](#instruction-set-architecture-a32t32a64)                                                                                          | Code is for AArch64 state                                                                          | 1           |
| [`__ARM_ACLE`](#testing-for-arm-c-language-extensions)                                                                                                  | Indicates ACLE implemented                                                                         | 101         |
| [`__ARM_ALIGN_MAX_PWR`](#alignment-of-static-objects)                                                                                                   | Log of maximum alignment of static object                                                          | 20          |
| [`__ARM_ALIGN_MAX_STACK_PWR`](#alignment-of-stack-objects)                                                                                              | Log of maximum alignment of stack object                                                           | 3           |
| [`__ARM_ARCH`](#arm-architecture-level)                                                                                                                 | Arm architecture level                                                                             | 7           |
| [`__ARM_ARCH_ISA_A64`](#instruction-set-architecture-a32t32a64)                                                                                         | AArch64 ISA present                                                                                | 1           |
| [`__ARM_ARCH_ISA_ARM`](#instruction-set-architecture-a32t32a64)                                                                                         | Arm instruction set present                                                                        | 1           |
| [`__ARM_ARCH_ISA_THUMB`](#instruction-set-architecture-a32t32a64)                                                                                       | T32 instruction set present                                                                        | 2           |
| [`__ARM_ARCH_PROFILE`](#architectural-profile-a-r-m-or-pre-cortex)                                                                                      | Architecture profile                                                                               | `'A'`       |
| [`__ARM_BF16_FORMAT_ALTERNATIVE`](#brain-16-bit-floating-point-support)                                                                                 | 16-bit brain floating-point, alternative format                                                    | 1           |
| [`__ARM_BIG_ENDIAN`](#endianness)                                                                                                                       | Memory is big-endian                                                                               | 1           |
| [`__ARM_FEATURE_AES`](#aes-extension)                                                                                                                   | AES Crypto extension (Arm v8-A)                                                                    | 1           |
| [`__ARM_FEATURE_ATOMICS`](#large-system-extensions)                                                                                                     | Large System Extensions                                                                            | 1           |
| [`__ARM_FEATURE_BF16`](#brain-16-bit-floating-point-support)                                                                                            | 16-bit brain floating-point, vector instruction                                                    | 1           |
| [`__ARM_FEATURE_BTI_DEFAULT`](#branch-target-identification)                                                                                            | Branch Target Identification                                                                       | 1           |
| [`__ARM_FEATURE_CDE`](#custom-datapath-extension)                                                                                                       | Custom Datapath Extension                                                                          | 0x01        |
| [`__ARM_FEATURE_CDE_COPROC`](#custom-datapath-extension)                                                                                                | Custom Datapath Extension                                                                          | 0xf         |
| [`__ARM_FEATURE_CLZ`](#clz)                                                                                                                             | CLZ instruction                                                                                    | 1           |
| [`__ARM_FEATURE_COMPLEX`](#complex-number-intrinsics)                                                                                                   | Armv8.3-A extension                                                                                | 1           |
| [`__ARM_FEATURE_COPROC`](#coprocessor-intrinsics)                                                                                                       | Coprocessor Intrinsics                                                                             | 1           |
| [`__ARM_FEATURE_CRC32`](#crc32-extension)                                                                                                               | CRC32 extension                                                                                    | 1           |
| [`__ARM_FEATURE_CRYPTO`](#crypto-extension)                                                                                                             | Crypto extension                                                                                   | 1           |
| [`__ARM_FEATURE_DIRECTED_ROUNDING`](#directed-rounding)                                                                                                 | Directed Rounding                                                                                  | 1           |
| [`__ARM_FEATURE_DOTPROD`](#availability-of-dot-product-intrinsics)                                                                                      | Dot product extension (ARM v8.2-A)                                                                 | 1           |
| [`__ARM_FEATURE_DSP`](#dsp-instructions)                                                                                                                | DSP instructions (Arm v5E) (32-bit-only)                                                           | 1           |
| [`__ARM_FEATURE_FAMINMAX`](#floating-point-absolute-minimum-and-maximum-extension)                                                                      | Floating-point absolute minimum and maximum extension                                              | 1           |
| [`__ARM_FEATURE_FMA`](#fused-multiply-accumulate-fma)                                                                                                   | Floating-point fused multiply-accumulate                                                           | 1           |
| [`__ARM_FEATURE_FP16_FML`](#fp16-fml-extension)                                                                                                         | FP16 FML extension (Arm v8.4-A, optional Armv8.2-A, Armv8.3-A)                                     | 1           |
| [`__ARM_FEATURE_FP8`](#modal-8-bit-floating-point-extensions)                                                                                           | Modal 8-bit floating-point extensions                                                              | 1           |
| [`__ARM_FEATURE_FP8DOT2`](#modal-8-bit-floating-point-extensions)                                                                                       | Modal 8-bit floating-point extensions                                                              | 1           |
| [`__ARM_FEATURE_FP8DOT4`](#modal-8-bit-floating-point-extensions)                                                                                       | Modal 8-bit floating-point extensions                                                              | 1           |
| [`__ARM_FEATURE_FP8FMA`](#modal-8-bit-floating-point-extensions)                                                                                        | Modal 8-bit floating-point extensions                                                              | 1           |
| [`__ARM_FEATURE_FRINT`](#availability-of-armv8.5-a-floating-point-rounding-intrinsics)                                                                  | Floating-point rounding extension (Arm v8.5-A)                                                     | 1           |
| [`__ARM_FEATURE_IDIV`](#hardware-integer-divide)                                                                                                        | Hardware Integer Divide                                                                            | 1           |
| [`__ARM_FEATURE_JCVT`](#javascript-floating-point-conversion)                                                                                           | Javascript conversion (ARMv8.3-A)                                                                  | 1           |
| [`__ARM_FEATURE_LDREX`](#ldrexstrex) *(Deprecated)*                                                                                                     | Load/store exclusive instructions                                                                  | 0x0F        |
| [`__ARM_FEATURE_LUT`](#lookup-table-extensions)                                                                                                         | Lookup table extensions (FEAT_LUT)                                                                 | 1           |
| [`__ARM_FEATURE_MATMUL_INT8`](#availability-of-armv8.6-a-integer-matrix-multiply-intrinsics)                                                            | Integer Matrix Multiply extension (Armv8.6-A, optional Armv8.2-A, Armv8.3-A, Armv8.4-A, Armv8.5-A) | 1           |
| [`__ARM_FEATURE_MEMORY_TAGGING`](#memory-tagging)                                                                                                       | Memory Tagging (Armv8.5-A)                                                                         | 1           |
| [`__ARM_FEATURE_MOPS`](#memcpy-family-of-memory-operations-standarization-instructions---mops)                                                          | `memcpy`, `memset`, and `memmove` family of operations standardization instructions               | 1           |
| [`__ARM_FEATURE_MVE`](#m-profile-vector-extension)                                                                                                      | M-profile Vector Extension                                                                         | 1           |
| [`__ARM_FEATURE_NUMERIC_MAXMIN`](#numeric-maximum-and-minimum)                                                                                          | Numeric Maximum and Minimum                                                                        | 1           |
| [`__ARM_FEATURE_PAC_DEFAULT`](#pointer-authentication)                                                                                                  | Pointer authentication protection                                                                  | 0x5         |
| [`__ARM_FEATURE_PAUTH`](#pointer-authentication)                                                                                                        | Pointer Authentication Extension (FEAT_PAuth)                                                      | 1           |
| [`__ARM_FEATURE_PAUTH_LR`](#pointer-authentication)                                                                                                     | Armv9.5-A Enhancements to Pointer Authentication Extension (FEAT_PAuth_LR)                         | 1           |
| [`__ARM_FEATURE_QBIT`](#q-saturation-flag)                                                                                                              | Q (saturation) flag (32-bit-only)                                                                  | 1           |
| [`__ARM_FEATURE_QRDMX`](#rounding-doubling-multiplies)                                                                                                  | SQRDMLxH instructions and associated intrinsics availability                                       | 1           |
| [`__ARM_FEATURE_RCPC`](#rcpc)                                                                                                                           | Release Consistent processor consistent Model (64-bit-only)                      | 1           |
| [`__ARM_FEATURE_RNG`](#random-number-generation-extension)                                                                                              | Random Number Generation Extension (Armv8.5-A)                                                     | 1           |
| [`__ARM_FEATURE_SAT`](#saturation-instructions)                                                                                                         | Width-specified saturation instructions (32-bit-only)                                              | 1           |
| [`__ARM_FEATURE_SHA2`](#sha2-extension)                                                                                                                 | SHA2 Crypto extension (Arm v8-A)                                                                   | 1           |
| [`__ARM_FEATURE_SHA3`](#sha3-extension)                                                                                                                 | SHA3 Crypto extension (Arm v8.4-A)                                                                 | 1           |
| [`__ARM_FEATURE_SHA512`](#sha512-extension)                                                                                                             | SHA2 Crypto ext. (Arm v8.4-A, optional Armv8.2-A, Armv8.3-A)                                       | 1           |
| [`__ARM_FEATURE_SIMD32`](#32-bit-simd-instructions)                                                                                                     | 32-bit SIMD instructions (Armv6) (32-bit-only)                                                     | 1           |
| [`__ARM_FEATURE_SM3`](#sm3-extension)                                                                                                                   | SM3 Crypto extension (Arm v8.4-A, optional Armv8.2-A, Armv8.3-A)                                   | 1           |
| [`__ARM_FEATURE_SM4`](#sm4-extension)                                                                                                                   | SM4 Crypto extension (Arm v8.4-A, optional Armv8.2-A, Armv8.3-A)                                   | 1           |
| [`__ARM_FEATURE_SME`](#scalable-matrix-extension-sme)                                                                                                   | Scalable Matrix Extension (FEAT_SME)                                                               | 1           |
| [`__ARM_FEATURE_SME2`](#scalable-matrix-extension-sme)                                                                                                  | Scalable Matrix Extension (FEAT_SME2)                                                              | 1           |
| [`__ARM_FEATURE_SME_B16B16`](#non-widening-brain-16-bit-floating-point-support)                                                                         | Non-widening brain 16-bit floating-point SME intrinsics (FEAT_SME_B16B16)                          | 1           |
| [`__ARM_FEATURE_SME_F16F16`](#half-precision-floating-point-sme-intrinsics)                                                                             | Half-precision floating-point SME intrinsics (FEAT_SME_F16F16)                                     | 1           |
| [`__ARM_FEATURE_SME_F64F64`](#double-precision-floating-point-outer-product-intrinsics)                                                                 | Double precision floating-point outer product intrinsics (FEAT_SME_F64F64)                         | 1           |
| [`__ARM_FEATURE_SME_F8F16`](#modal-8-bit-floating-point-extensions)                                                                                     | Modal 8-bit floating-point extensions                                                              | 1           |
| [`__ARM_FEATURE_SME_F8F32`](#modal-8-bit-floating-point-extensions)                                                                                     | Modal 8-bit floating-point extensions                                                              | 1           |
| [`__ARM_FEATURE_SME_I16I64`](#16-bit-to-64-bit-integer-widening-outer-product-intrinsics)                                                               | 16-bit to 64-bit integer widening outer product intrinsics (FEAT_SME_I16I64)                       | 1           |
| [`__ARM_FEATURE_SME_LOCALLY_STREAMING`](#scalable-matrix-extension-sme)                                                                                 | Support for the `arm_locally_streaming` attribute                                                  | 1           |
| [`__ARM_FEATURE_SME_LUTv2`](#lookup-table-extensions)                                                                                                   | Lookup table extensions (FEAT_SME_LUTv2)                                                           | 1           |
| [`__ARM_FEATURE_SSVE_FP8DOT2`](#modal-8-bit-floating-point-extensions)                                                                                  | Modal 8-bit floating-point extensions                                                              | 1           |
| [`__ARM_FEATURE_SSVE_FP8DOT4`](#modal-8-bit-floating-point-extensions)                                                                                  | Modal 8-bit floating-point extensions                                                              | 1           |
| [`__ARM_FEATURE_SSVE_FP8FMA`](#modal-8-bit-floating-point-extensions)                                                                                   | Modal 8-bit floating-point extensions                                                              | 1           |
| [`__ARM_FEATURE_SVE`](#scalable-vector-extension-sve)                                                                                                   | Scalable Vector Extension (FEAT_SVE)                                                               | 1           |
| [`__ARM_FEATURE_SVE_B16B16`](#non-widening-brain-16-bit-floating-point-support)                                                                         | Non-widening brain 16-bit floating-point intrinsics (FEAT_SVE_B16B16)                              | 1           |
| [`__ARM_FEATURE_SVE_BF16`](#brain-16-bit-floating-point-support)                                                                                        | SVE support for the 16-bit brain floating-point extension (FEAT_BF16)                              | 1           |
| [`__ARM_FEATURE_SVE_BITS`](#scalable-vector-extension-sve)                                                                                              | The number of bits in an SVE vector, when known in advance                                         | 256         |
| [`__ARM_FEATURE_SVE_MATMUL_FP32`](#multiplication-of-32-bit-floating-point-matrices)                                                                    | 32-bit floating-point matrix multiply extension (FEAT_F32MM)                                       | 1           |
| [`__ARM_FEATURE_SVE_MATMUL_FP64`](#multiplication-of-64-bit-floating-point-matrices)                                                                    | 64-bit floating-point matrix multiply extension (FEAT_F64MM)                                       | 1           |
| [`__ARM_FEATURE_SVE_MATMUL_INT8`](#multiplication-of-8-bit-integer-matrices)                                                                            | SVE support for the integer matrix multiply extension (FEAT_I8MM)                                  | 1           |
| [`__ARM_FEATURE_SVE_PREDICATE_OPERATORS`](#scalable-vector-extension-sve)                                                                               | Level of support for C and C++ operators on SVE vector types                                        | 1           |
| [`__ARM_FEATURE_SVE_VECTOR_OPERATORS`](#scalable-vector-extension-sve)                                                                                  | Level of support for C and C++ operators on SVE predicate types                                     | 1           |
| [`__ARM_FEATURE_SVE2`](#sve2)                                                                                                                           | SVE version 2 (FEAT_SVE2)                                                                          | 1           |
| [`__ARM_FEATURE_SVE2_AES`](#aes-extension)                                                                                                              | SVE2 support for the AES cryptographic extension (FEAT_SVE_AES)                                     | 1           |
| [`__ARM_FEATURE_SVE2_BITPERM`](#bit-permute-extension)                                                                                                  | SVE2 bit permute extension (FEAT_SVE2_BitPerm)                                                     | 1           |
| [`__ARM_FEATURE_SVE2_SHA3`](#sha3-extension)                                                                                                            | SVE2 support for the SHA3 cryptographic extension (FEAT_SVE_SHA3)                                   | 1           |
| [`__ARM_FEATURE_SVE2_SM3`](#sm3-extension)                                                                                                              | SVE2 support for the SM3 cryptographic extension (FEAT_SVE_SM3)                                     | 1           |
| [`__ARM_FEATURE_SVE2_SM4`](#sm4-extension)                                                                                                              | SVE2 support for the SM4 cryptographic extension (FEAT_SVE_SM4)                                     | 1           |
| [`__ARM_FEATURE_SVE2p1`](#sve2)                                                                                                                         | SVE version 2.1 (FEAT_SVE2p1)
| [`__ARM_FEATURE_SYSREG128`](#bit-system-registers)                                                                                                      | Support for 128-bit system registers (FEAT_SYSREG128)                                              | 1           |
| [`__ARM_FEATURE_UNALIGNED`](#unaligned-access-supported-in-hardware)                                                                                    | Hardware support for unaligned access                                                              | 1           |
| [`__ARM_FP`](#hardware-floating-point)                                                                                                                  | Hardware floating-point                                                                            | 1           |
| [`__ARM_FP16_ARGS`](#half-precision-argument-and-result)                                                                                                | `__fp16` argument and result                                                                       | 0x0C        |
| [`__ARM_FP16_FORMAT_ALTERNATIVE`](#half-precision-16-bit-floating-point-format)                                                                         | 16-bit floating-point, alternative format                                                          | 1           |
| [`__ARM_FP16_FORMAT_IEEE`](#half-precision-16-bit-floating-point-format)                                                                                | 16-bit floating-point, IEEE format                                                                 | 1           |
| [`__ARM_FP_FAST`](#floating-point-model)                                                                                                                | Accuracy-losing optimizations                                                                      | 1           |
| [`__ARM_FP_FENV_ROUNDING`](#floating-point-model)                                                                                                       | Rounding is configurable at runtime                                                                | 1           |
| [`__ARM_NEON`](#advanced-simd-architecture-extension-neon)                                                                                              | Advanced SIMD (Neon) extension                                                                     | 1           |
| [`__ARM_NEON_FP`](#neon-floating-point)                                                                                                                 | Advanced SIMD (Neon) floating-point                                                                | 0x04        |
| [`__ARM_NEON_SVE_BRIDGE`](#neon-sve-bridge-macro)                                                                                                       | Availability of [`arm_neon_sve_brdge.h`](#arm_neon_sve_bridge.h)                                   | 1           |
| [`__ARM_PCS`](#procedure-call-standard)                                                                                                                 | Arm procedure call standard (32-bit-only)                                                          | 0x01        |
| [`__ARM_PCS_AAPCS64`](#procedure-call-standard)                                                                                                         | Arm PCS for AArch64.                                                                               | 1           |
| [`__ARM_PCS_VFP`](#procedure-call-standard)                                                                                                             | Arm PCS hardware FP variant in use (32-bit-only)                                                   | 1           |
| [`__ARM_ROPI`](#position-independent-code)                                                                                                              | Read-only PIC in use                                                                               | 1           |
| [`__ARM_RWPI`](#position-independent-code)                                                                                                              | Read-write PIC in use                                                                              | 1           |
| [`__ARM_SIZEOF_MINIMAL_ENUM`](#implementation-defined-type-properties)                                                                                  | Size of minimal enumeration type: 1 or 4                                                           | 1           |
| [`__ARM_SIZEOF_WCHAR_T`](#implementation-defined-type-properties)                                                                                       | Size of `wchar_t`: 2 or 4                                                                          | 2           |
| [`__ARM_WMMX`](#wireless-mmx)                                                                                                                           | Wireless MMX extension (32-bit-only)                                                               | 1           |

# Attributes and pragmas

## Attribute syntax

This section describes ACLE features that use GNU-style attributes.
The general rules for attribute syntax are described in the GCC
documentation <https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html>.
Briefly, for this declaration:

``` c
  A int B x C, D y E;
```

attribute `A` applies to both `x` and `y`; `B` and `C` apply to
`x` only, and `D` and `E` apply to `y` only. Programmers are
recommended to keep declarations simple if attributes are used.

Unless otherwise stated, all attribute arguments must be compile-time
constants.

In addition to the GNU-style attributes described in this section,
ACLE also uses [keyword attributes](#keyword-attributes).

## Hardware/software floating-point calling convention

The AArch32 PCS defines a base standard, as well as several variants.

On targets with hardware FP the AAPCS provides for procedure calls to
use either integer or floating-point argument and result registers. ACLE
allows this to be selectable per function.

``` c
    __attribute__((pcs("aapcs")))
```

applied to a function, selects software (integer) FP calling convention.

``` c
    __attribute__((pcs("aapcs-vfp")))
```

applied to a function, selects hardware FP calling convention.

The AArch64 PCS standard variants do not change how parameters are
passed, so no PCS attributes are supported.

The pcs attribute applies to functions and function types.
Implementations are allowed to treat the procedure call specification as
part of the type, that is, as a language linkage in the sense of [C++ \#1].

## Target selection

The following target selection attributes are supported:

``` c
    __attribute__((target("arm")))
```

when applied to a function, forces A32 state code generation.

``` c
    __attribute__((target("thumb")))
```

when applied to a function, forces T32 state code generation.

The implementation must generate code in the required state unless it is
impossible to do so. For example, on an Armv5 or Armv6 target with VFP
(and without the T32 instruction set), if a function is forced to
T32 state, any floating-point operations or intrinsics that are only
available in A32 state must be generated as calls to library functions
or compiler-generated functions.

This attribute does not apply to AArch64.

## Function Multi Versioning

The specification for Function Multi Versioning is in [**Beta**
state](#current-status-and-anticipated-changes) and might change or be
extended in the future.

Function Multi Versioning provides a convenient way to select the most
appropriate version of a function at runtime. All versions of the
function may be in the final binary. The compiler generates all
supported versions and the runtime makes the selection at load time.

The following attributes trigger the multi version code generation:
`__attribute__((target_version("name")))` and
`__attribute__((target_clones("name",...)))`.

* These attributes can be mixed with each other.
* The `default` version means the version of the function that would
  be generated without these attributes.
* `name` is the dependent features from the tables below.
  * If a feature depends on another feature as defined by the Architecture
    Reference Manual then no need to explicitly state in the attribute[^fmv-note-names].
* The dependent features could be joined by the `+` sign.
* None of these attributes will enable the corresponding ACLE feature(s)
  associated to the `name` expressed in the attribute.
* These attributes have no effect on the calling convention.
* All versions must use the same calling convention.
* If only the `default` version exist it should be linked directly.
* FMV may be disabled in compile time by a compiler flag. In this
  case the `default` version shall be used.

[^fmv-note-names]: For example the `sve_bf16` feature depends on `sve`
  but it is enough to say `target_version("sve_bf16")` in the code.

The attribute `__attribute__((target_version("name")))` expresses the
following:

* when applied to a function it becomes one of the versions. Function
  with the same name may exist with multiple versions in the same
  or in different translation units.
* One `default` version of the function is required to be provided
  in one of the translation units.
  * Implicitly, without this attribute,
  * or explicitly providing the `default` in the attribute.
* All instances of the versions shall share the same function
  signature and calling convention.
* All the function versions must be declared at the translation
  unit in which the definition of the default version resides.

The attribute `__attribute__((target_clones("name",...)))` expresses the
following:

* when applied to a function the compiler emits multiple versions
  based on the arguments.
  * One of them is implicitly the `default`.
  * If the `default` matches with another explicitly provided
    version in the same translation unit, then the compiler can
    emit only one function instead of the two. The explicitly
    provided version shall be preferred.
* If a name is not recognized the compiler should ignore it[^fmv-note-ignore].

[^fmv-note-ignore]: The intention is to support the usecase of newer code if
  compiled with an older compiler. The compiler may provide diagnostic messages
  and could block the compilation (for instance, if the `-pedantic` flag is
  present).

`__HAVE_FUNCTION_MULTI_VERSIONING` is defined to 1 if the
versioning mechanism described in this section is supported by the
compiler and it is enabled.

`__FUNCTION_MULTI_VERSIONING_SUPPORT_LEVEL` is defined to the currently supported
version of the ACLE. The value and the format are the same as the `__ARM_ACLE`.

For example, it can be implemented as:

``` c
#define __FUNCTION_MULTI_VERSIONING_SUPPORT_LEVEL __ARM_ACLE_VERSION(2024, 3, 0)
```

### Name mangling

The `"default"` version is mangled with `".default"` on top of the
language-specific name mangling. All versioned functions with their mangled names
are always resolvable.
A function is expected to be resolvable with the original mangled name of the function.

The mangling function is compatible with the mangling for version information of
the [[cxxabi]](#cxxabi), and it is defined as follows:

```
<variant name> := <c/c++mangling> `.` <vendor specific suffix>
<c/c++ mangling> := function name mangling for c/c++
<vendor specific suffix> := `_` followed by token obtained from the tables below and prefixed with `M`
```

If multiple features are requested then those shall be appended in lexicographic
order and prefixed with `M`. The mangled name shall contain a unique set of
features (duplication of features is not allowed).

For example:
``` c
__attribute__((target_clones("crc32", "aes+sha1")))
int foo(){..}
```
will produce these mangled names for C language: `foo.default`, `foo._Mcrc32`,
`foo._MaesMsha1` while `foo` is a callable external symbol which leads to one
of the versioned functions.

### Mapping

The following table lists the architectures feature mapping for AArch32

   | **Priority** | **Architecture name**            | **Name**        | **Dependent feature registers** |
   | ------------ | -------------------------------- | --------------- | ------------------------------- |
   | 0            | N/A                              | default         | N/A                             |
   | 90           | CRC32 instructions               | crc             | ```ID_ISAR5.CRC32 == 0b0001```  |
   | 100          | SHA1 instructions                | sha1            | ```ID_ISAR5.SHA1 == 0b0001```   |
   | 110          | SHA2 instructions                | sha2            | ```ID_ISAR5.SHA2 == 0b0001```   |
   | 120          | AES instructions                 | aes             | ```ID_ISAR5.AES >= 0b0001```    |
   | 130          | VMULL (polynomial) instructions  | vmull           | ```ID_ISAR5.AES == 0b0002```    |

The following table lists the architectures feature mapping for AArch64

   | **Priority**  | **Architecture name**    | **Name**      | **Dependent feature registers**           |
   | ------------- | ------------------------ | ------------- | ----------------------------------------- |
   | 0             | N/A                      | default       | N/A                                       |
   | 10            | `FEAT_RNG`               | rng           | ```ID_AA64ISAR0_EL1.RNDR >= 0b0001```     |
   | 20            | `FEAT_FlagM`             | flagm         | ```ID_AA64ISAR0_EL1.TS >= 0b0001```       |
   | 30            | `FEAT_FlagM2`            | flagm2        | ```ID_AA64ISAR0_EL1.TS >= 0b0010```       |
   | 80            | `FEAT_LSE`               | lse           | ```ID_AA64ISAR0_EL1.Atomic >= 0b0010```   |
   | 90            | Floating-point           | fp            | ```ID_AA64PFR0_EL1.FP != 0b1111```        |
   | 100           | `FEAT_AdvSIMD`           | simd          | ```ID_AA64PFR0_EL1.AdvSIMD != 0b1111```   |
   | 104           | `FEAT_DotProd`           | dotprod       | ```ID_AA64ISAR0_EL1.DP >= 0b0001```       |
   | 106           | `FEAT_SM3`, `FEAT_SM4`   | sm4           | ```ID_AA64ISAR0_EL1.SM4 >= 0b0001```      |
   | 108           | `FEAT_RDM`               | rdm, rdma     | ```ID_AA64ISAR0_EL1.RDM >= 0b0001```      |
   | 110           | `FEAT_CRC32`             | crc           | ```ID_AA64ISAR0_EL1.CRC32 >= 0b0001```    |
   | 130           | `FEAT_SHA1`, `FEAT_SHA256` | sha2        | ```ID_AA64ISAR0_EL1.SHA2 >= 0b0001```     |
   | 140           | `FEAT_SHA512`, `FEAT_SHA3` | sha3        | ```ID_AA64ISAR0_EL1.SHA3 >= 0b0001```     |
   | 150           | `FEAT_AES`, `FEAT_PMULL` | aes           | ```ID_AA64ISAR0_EL1.AES >= 0b0010```      |
   | 170           | `FEAT_FP16`              | fp16          | ```ID_AA64PFR0_EL1.FP == 0b0001```        |
   | 175           | `FEAT_FHM`               | fp16fml       | ```ID_AA64ISAR0_EL1.FHM >= 0b0001```      |
   | 180           | `FEAT_DIT`               | dit           | ```ID_AA64PFR0_EL1.DIT >= 0b0001```       |
   | 190           | `FEAT_DPB`               | dpb           | ```ID_AA64ISAR1_EL1.DPB >= 0b0001```      |
   | 200           | `FEAT_DPB2`              | dpb2          | ```ID_AA64ISAR1_EL1.DPB >= 0b0010```      |
   | 210           | `FEAT_JSCVT`             | jscvt         | ```ID_AA64ISAR1_EL1.JSCVT >= 0b0001```    |
   | 220           | `FEAT_FCMA`              | fcma          | ```ID_AA64ISAR1_EL1.FCMA >= 0b0001```     |
   | 230           | `FEAT_LRCPC`             | rcpc          | ```ID_AA64ISAR1_EL1.LRCPC >= 0b0001```    |
   | 240           | `FEAT_LRCPC2`            | rcpc2         | ```ID_AA64ISAR1_EL1.LRCPC >= 0b0010```    |
   | 241           | `FEAT_LRCPC3`            | rcpc3         | ```ID_AA64ISAR1_EL1.LRCPC >= 0b0011```    |
   | 250           | `FEAT_FRINTTS`           | frintts       | ```ID_AA64ISAR1_EL1.FRINTTS >= 0b0001```  |
   | 270           | `FEAT_I8MM`              | i8mm          | ```ID_AA64ISAR1_EL1.I8MM >= 0b0001```     |
   | 280           | `FEAT_BF16`              | bf16          | ```ID_AA64ISAR1_EL1.BF16 >= 0b0001```     |
   | 310           | `FEAT_SVE`               | sve           | ```ID_AA64PFR0_EL1.SVE >= 0b0001```       |
   | 350           | `FEAT_F32MM`             | f32mm         | ```ID_AA64ZFR0_EL1.F32MM >= 0b00001```    |
   | 360           | `FEAT_F64MM`             | f64mm         | ```ID_AA64ZFR0_EL1.F64MM >= 0b00001```    |
   | 370           | `FEAT_SVE2`              | sve2          | ```ID_AA64ZFR0_EL1.SVEver >= 0b0001```    |
   | 380           | `FEAT_SVE_AES`, <br> `FEAT_SVE_PMULL128` | sve2-aes | ```ID_AA64ZFR0_EL1.AES >= 0b0010``` |
   | 400           | `FEAT_SVE_BitPerm`       | sve2-bitperm  | ```ID_AA64ZFR0_EL1.BitPerm >= 0b0001```   |
   | 410           | `FEAT_SVE_SHA3`          | sve2-sha3     | ```ID_AA64ZFR0_EL1.SHA3 >= 0b0001```      |
   | 420           | `FEAT_SM3`, `FEAT_SVE_SM4` | sve2-sm4    | ```ID_AA64ZFR0_EL1.SM4 >= 0b0001```       |
   | 430           | `FEAT_SME`               | sme           | ```ID_AA64PFR1_EL1.SME >= 0b0001```       |
   | 440           | `FEAT_MTE`, `FEAT_MTE2`  | memtag        | ```ID_AA64PFR1_EL1.MTE >= 0b0010```       |
   | 470           | `FEAT_SB`                | sb            | ```ID_AA64ISAR1_EL1.SB >= 0b0001```       |
   | 480           | `FEAT_SPECRES`           | predres       | ```ID_AA64ISAR1_EL1.SPECRES >= 0b0001```  |
   | 490           | `FEAT_SSBS`, `FEAT_SSBS2`| ssbs          | ```ID_AA64PFR1_EL1.SSBS >= 0b0010```      |
   | 510           | `FEAT_BTI`               | bti           | ```ID_AA64PFR1_EL1.BT >= 0b0001```        |
   | 520           | `FEAT_LS64`, `FEAT_LS64_V`, <br> `FEAT_LS64_ACCDATA` | ls64 | ```ID_AA64ISAR1_EL1.LS64 >= 0b0011``` |
   | 550           | `FEAT_WFxT`              | wfxt          | ```ID_AA64ISAR2_EL1.WFxT >= 0b0010```     |
   | 560           | `FEAT_SME_F64F64`        | sme-f64f64    | ```ID_AA64SMFR0_EL1.F64F64 == 0b1```      |
   | 570           | `FEAT_SME_I16I64`        | sme-i16i64    | ```ID_AA64SMFR0_EL1.I16I64 == 0b1111```   |
   | 580           | `FEAT_SME2`              | sme2          | ```ID_AA64PFR1_EL1.SMEver >= 0b0001```    |
   | 650           | `FEAT_MOPS`              | mops          | ```ID_AA64ISAR2_EL1.MOPS >= 0b0001```     |
   | 9995          | N/A                      | priorityE     | N/A                                       |
   | 9996          | N/A                      | priorityD     | N/A                                       |
   | 9997          | N/A                      | priorityC     | N/A                                       |
   | 9998          | N/A                      | priorityB     | N/A                                       |
   | 9999          | N/A                      | priorityA     | N/A                                       |

### Selection

The following rules shall be followed by all implementations:

1. Implementation of
the selection algorithm is platform dependent, where with platform means
CPU/Vendor/OS as in the target triplet.
2. The selection is permanent for the
lifetime of the process.
3. Among any two versions, the higher priority version is determined by
identifying the highest priority feature that is specified in exactly one of
the versions, and selecting that version.
4. The selection algorithm must select the highest priority versions whose
dependent features are all available.
5. The feature names priorityA, ..., priorityE can be added to a version to
change the selection order according to the above rules.

## Weak linkage

`__attribute__((weak))` can be attached to declarations and
definitions to indicate that they have weak static linkage (`STB_WEAK` in
ELF objects). As definitions, they can be overridden by other
definitions of the same symbol. As references, they do not need to be
satisfied and will be resolved to zero if a definition is not present.

### Patchable constants

In addition, this specification requires that weakly defined initialized
constants are not used for constant propagation, allowing the value to
be safely changed by patching after the object is produced.

## Alignment

The new standards for C [[C11]](#C11) (6.7.5) and C++ [[CPP11]](#CPP11) (7.6.2) add syntax for
aligning objects and types. ACLE provides an alternative syntax
described in this section.

### Alignment attribute

`__attribute__((aligned(N)))` can be associated with data, functions,
types and fields. N must be an integral constant expression and must be
a power of 2, for example 1, 2, 4, 8. The maximum alignment depends on the
storage class of the object being aligned. The size of a data type is
always a multiple of its alignment. This is a consequence of the rule in
C that the spacing between array elements is equal to the element size.

The aligned attribute does not act as a type qualifier. For example,
given

``` c
  char x __attribute__((aligned(8)));
  int y __attribute__((aligned(1)));
```

the type of `&x` is `char *` and the type of `&y` is `int *`. The
following declarations are equivalent:

``` c
  struct S x __attribute__((aligned(16))); /* ACLE */

  struct S _Alignas(16) x/* C11 */

  #include <stdalign.h> /* C11 (alternative) */
  struct S alignas(16) x;

  struct S alignas(16) x; /* C++11 */
```

### Alignment of static objects

The macro `__ARM_ALIGN_MAX_PWR` indicates (as the exponent of a power
of 2) the maximum available alignment of static data -- for example 4 for
16-byte alignment. So the following is always valid:

``` c
  int x __attribute__((aligned(1 << __ARM_ALIGN_MAX_PWR)));
```

or, using the C11/C++11 syntax:

``` c
  alignas(1 << __ARM_ALIGN_MAX_PWR) int x;
```

Since an alignment request on an object does not change its type or
size, x in this example would have type int and size 4.

There is in principle no limit on the alignment of static objects,
within the constraints of available memory. In the Arm ABI an object
with a requested alignment would go into an ELF section with at least as
strict an alignment requirement. However, an implementation supporting
position-independent dynamic objects or overlays may need to place
restrictions on their alignment demands.

### Alignment of stack objects

It must be possible to align any local object up to the stack alignment
as specified in the AAPCS for AArch32 (that is, 8 bytes) or as specified in
AAPCS64 for AArch64 (that is, 16 bytes) this being also the maximal
alignment of any native type.

An implementation may, but is not required to, permit the allocation of
local objects with greater alignment, for example 16 or 32 bytes for AArch32.
(This would involve some runtime adjustment such that the object address
was not a fixed offset from the stack pointer on entry.)

If a program requests alignment greater than the implementation
supports, it is recommended that the compiler warn but not fault this.
Programmers should expect over-alignment of local objects to be treated
as a hint.

The macro `__ARM_ALIGN_MAX_STACK_PWR` indicates (as the exponent of
a power of 2) the maximum available stack alignment. For example, a
value of 3 indicates 8-byte alignment.

### Procedure calls

For procedure calls, where a parameter has aligned type, data should be
passed as if it was a basic type of the given type and alignment. For
example, given the aligned type:

``` c
  struct S { int a[2]; } __attribute__((aligned(8)));
```

the second argument of:

``` c
  f(int, struct S);
```

should be passed as if it were:

``` c
  f(int, long long);
```

which means that in AArch32 AAPCS the second parameter is in `R2/R3`
rather than `R1/R2`.

### Alignment of C heap storage

The standard C allocation functions [[C99]](#C99) (7.20.3), such as malloc(),
return storage aligned to the normal maximal alignment, that is, the largest
alignment of any (standard) type.

Implementations may, but are not required to, provide a function to
return heap storage of greater alignment. Suitable functions are:

``` c
  int posix_memalign(void **memptr, size_t alignment, size_t size );
```

as defined in [[POSIX]](#POSIX), or:

``` c
  void *aligned_alloc(size_t alignment, size_t size);
```

as defined in [[C11]](#C11) (7.22.3.1).

### Alignment of C++ heap allocation

In C++, an allocation (with new) knows the object's type. If the type
is aligned, the allocation should also be aligned. There are two cases
to consider depending on whether the user has provided an allocation
function.

If the user has provided an allocation function for an object or array
of over-aligned type, it is that function's responsibility to return
suitably aligned storage. The size requested by the runtime library will
be a multiple of the alignment (trivially so, for the non-array case).

(The AArch32 C++ ABI does not explicitly deal with the runtime behavior
when dealing with arrays of alignment greater than 8. In this situation,
any cookie will be 8 bytes as usual, immediately preceding the array;
this means that the cookie is not necessarily at the address seen by the
allocation and deallocation functions. Implementations will need to make
some adjustments before and after calls to the ABI-defined C++ runtime,
or may provide additional non-standard runtime helper functions.)
Example:

``` c
  struct float4 {
    void *operator new[](size_t s) {
      void *p;
      posix_memalign(&p, 16, s);
      return p;
    }
    float data[4];
  } __attribute__((aligned(16)));
```

If the user has not provided their own allocation function, the behavior
is implementation-defined.

The generic itanium C++ ABI, which we use in AArch64, already handles
arrays with arbitrarily aligned elements

## Scalable Vector Extension procedure call standard attribute

On SVE enabled AArch64 targets, the [[AAPCS64]](#AAPCS64) allows procedure
calls to use the SVE calling convention. If a subroutine takes at least one
argument in scalable vector registers or scalable predicate registers, or if
the subroutine is a function that returns results in such registers, the
subroutine must ensure that the entire contents of `z8-z23` and `p4-15` are
preserved across the call. This calling convention is described in sections
6.1.3 and 6.1.4 of [AAPCS64](#AAPCS64) (see [release 2022Q1](https://github.com/ARM-software/abi-aa/releases/tag/2022Q1)).

The ACLE allows this to be enforced per function and adds the following
function attribute to a function declaration or definition:

``` c
    __attribute__(("aarch64_sve_pcs"))
```

## Other attributes

The following attributes should be supported and their definitions
follow [[GCC]](#GCC). These attributes are not specific to Arm or the Arm ABI.

`alias`, `common`, `nocommon`, `noinline`, `packed`, `section`,
`visibility`, `weak`

Some specific requirements on the weak attribute are detailed in
[Weak linkage](#weak-linkage).

# Synchronization, barrier, and hint intrinsics

## Introduction

This section provides intrinsics for managing data that may be accessed
concurrently between processors, or between a processor and a device.
Some intrinsics atomically update data, while others place barriers
around accesses to data to ensure that accesses are visible in the
correct order.

Memory prefetch intrinsics are also described in this section.

## Atomic update primitives

### C/C++ standard atomic primitives

The new C and C++ standards [[C11]](#C11) (7.17), [[CPP11]](#CPP11) (clause 29) provide a
comprehensive library of atomic operations and barriers, including
operations to read and write data with particular ordering requirements.
Programmers are recommended to use this where available.

### IA-64/GCC atomic update primitives

The `__sync` family of intrinsics (introduced in [[IA-64]](#IA-64) (section 7.4),
and as documented in the GCC documentation) may be provided, especially
if the C/C++ atomics are not available, and are recommended as being
portable and widely understood. These may be expanded inline, or call
library functions. Note that, unusually, these intrinsics are
polymorphic they will specialize to instructions suitable for the size
of their arguments.

## Memory barriers

Memory barriers ensure specific ordering properties between memory
accesses. For more details on memory barriers, see [ARMARM] (A3.8.3).
The intrinsics in this section are available for all targets.
They may be no-ops (that is, generate no code, but possibly act as a code
motion barrier in compilers) on targets where the relevant instructions
do not exist, but only if the property they guarantee would have held
anyway. On targets where the relevant instructions exist but are
implemented as no-ops, these intrinsics generate the instructions.

The memory barrier intrinsics take a numeric argument indicating the
scope and access type of the barrier, as shown in the following table.
(The assembler mnemonics for these numbers, as shown in the table, are
not available in the intrinsics.) The argument should be an integral
constant expression within the required range see
[Constant arguments to intrinsics](#constant-arguments-to-intrinsics).

| **Argument** | **Mnemonic** | **Domain**      | **Ordered Accesses (before-after)** |
| ------------ | ------------ | --------------- | ----------------------------------- |
| 15           | SY           | Full system     | Any-Any                             |
| 14           | ST           | Full system     | Store-Store                         |
| 13           | LD           | Full system     | Load-Load, Load-Store               |
| 11           | ISH          | Inner shareable | Any-Any                             |
| 10           | ISHST        | Inner shareable | Store-Store                         |
| 9            | ISHLD        | Inner shareable | Load-Load, Load-Store               |
| 7            | NSH or UN    | Non-shareable   | Any-Any                             |
| 6            | NSHST        | Non-shareable   | Store-Store                         |
| 5            | NSHLD        | Non-shareable   | Load-Load, Load-Store               |
| 3            | OSH          | Outer shareable | Any-Any                             |
| 2            | OSHST        | Outer shareable | Store-Store                         |
| 1            | OSHLD        | Outer shareable | Load-Load, Load-Store               |

The following memory barrier intrinsics are available:

``` c
    void __dmb(/*constant*/ unsigned int);
```

Generates a DMB (data memory barrier) instruction or equivalent CP15
instruction. DMB ensures the observed ordering of memory accesses.
Memory accesses of the specified type issued before the DMB are
guaranteed to be observed (in the specified scope) before memory
accesses issued after the DMB. For example, DMB should be used between
storing data, and updating a flag variable that makes that data
available to another core.

The `__dmb()` intrinsic also acts as a compiler memory barrier of the
appropriate type.

``` c
  void __dsb(/*constant*/ unsigned int);
```

Generates a DSB (data synchronization barrier) instruction or equivalent
CP15 instruction. DSB ensures the completion of memory accesses. A DSB
behaves as the equivalent DMB and has additional properties. After a DSB
instruction completes, all memory accesses of the specified type issued
before the DSB are guaranteed to have completed.

The `__dsb()` intrinsic also acts as a compiler memory barrier of the
appropriate type.

``` c
  void __isb(/*constant*/ unsigned int);
```

Generates an ISB (instruction synchronization barrier) instruction or
equivalent CP15 instruction. This instruction flushes the processor
pipeline fetch buffers, so that following instructions are fetched from
cache or memory. An ISB is needed after some system maintenance
operations.

An ISB is also needed before transferring control to code that has been
loaded or modified in memory, for example by an overlay mechanism or
just-in-time code generator. (Note that if instruction and data caches
are separate, privileged cache maintenance operations would be needed in
order to unify the caches.)

The only supported argument for the `__isb()` intrinsic is 15,
corresponding to the SY (full system) scope of the ISB instruction.

### Examples

In this example, process `P1` makes some data available to process `P2`
and sets a flag to indicate this.

``` c
  P1:

    value = x;
    /* issue full-system memory barrier for previous store:
       setting of flag is guaranteed not to be observed before
       write to value */
    __dmb(14);
    flag = true;

  P2:

    /* busy-wait until the data is available */
    while (!flag) {}
    /* issue full-system memory barrier: read of value is guaranteed
       not to be observed by memory system before read of flag */
    __dmb(15);
    /* use value */;
```

In this example, process `P1` makes data available to `P2` by putting
it on a queue.

``` c
  P1:

    work = new WorkItem;
    work->payload = x;
    /* issue full-system memory barrier for previous store:
       consumer cannot observe work item on queue before write to
       work item's payload */
    __dmb(14);
    queue_head = work;

  P2:

    /* busy-wait until work item appears */
    while (!(work = queue_head)) {}
    /* no barrier needed: load of payload is data-dependent */
    /* use work->payload */
```

## Hints

The intrinsics in this section are available for all targets. They may
be no-ops (that is, generate no code, but possibly act as a code motion
barrier in compilers) on targets where the relevant instructions do not
exist. On targets where the relevant instructions exist but are
implemented as no-ops, these intrinsics generate the instructions.

``` c
  void __wfi(void);
```

Generates a WFI (wait for interrupt) hint instruction, or nothing. The
WFI instruction allows (but does not require) the processor to enter a
low-power state until one of a number of asynchronous events occurs.

``` c
  void __wfe(void);
```

Generates a WFE (wait for event) hint instruction, or nothing. The WFE
instruction allows (but does not require) the processor to enter a
low-power state until some event occurs such as a SEV being issued by
another processor.

``` c
  void __sev(void);
```

Generates a SEV (send a global event) hint instruction. This causes an
event to be signaled to all processors in a multiprocessor system. It is
a NOP on a uniprocessor system.

``` c
  void __sevl(void);
```

Generates a send a local event hint instruction. This causes an event
to be signaled to only the processor executing this instruction. In a
multiprocessor system, it is not required to affect the other
processors.

``` c
  void __yield(void);
```

Generates a YIELD hint instruction. This enables multithreading software
to indicate to the hardware that it is performing a task, for example a
spin-lock, that could be swapped out to improve overall system
performance.

``` c
  void __dbg(/*constant*/ unsigned int);
```

Generates a DBG instruction. This provides a hint to debugging and
related systems. The argument must be a constant integer from 0 to 15
inclusive. See implementation documentation for the effect (if any) of
this instruction and the meaning of the argument. This is available only
when compiling for AArch32.

## Swap

`__swp` is available for all targets. This intrinsic expands to a
sequence equivalent to the deprecated (and possibly unavailable) SWP
instruction.

``` c
  uint32_t __swp(uint32_t, volatile void *);
```

Unconditionally stores a new value at the given address, and returns the
old value.

As with the IA-64/GCC primitives described in 0, the `__swp` intrinsic
is polymorphic. The second argument must provide the address of a
byte-sized object or an aligned word-sized object and it must be
possible to determine the size of this object from the argument
expression.

This intrinsic is implemented by LDREX/STREX (or LDREXB/STREXB) where
available, as if by

``` c
  uint32_t __swp(uint32_t x, volatile uint32_t *p) {
    uint32_t v;
    /* use LDREX/STREX intrinsics not specified by ACLE */
    do v = __ldrex(p); while (__strex(x, p));
    return v;
  }
```

or alternatively,

``` c
  uint32_t __swp(uint32_t x, uint32_t *p) {
    uint32_t v;
    /* use IA-64/GCC atomic builtins */
    do v = *p; while (!__sync_bool_compare_and_swap(p, v, x));
    return v;
  }
```

It is recommended that compilers should produce a
downgradeable/upgradeable warning on encountering the `__swp` intrinsic.

Only if load-store exclusive instructions are not available will the
intrinsic use the SWP/SWPB instructions.

It is strongly recommended to use standard and flexible atomic
primitives such as those available in the C++ <atomic> header. `__swp`
is provided solely to allow straightforward (and possibly automated)
replacement of explicit use of SWP in inline assembler. SWP is obsolete
in the Arm architecture, and in recent versions of the architecture, may
be configured to be unavailable in user-mode. (Aside: unconditional
atomic swap is also less powerful as a synchronization primitive than
load-exclusive/store-conditional.)

## Memory prefetch intrinsics

Intrinsics are provided to prefetch data or instructions. The size of
the data or function is ignored. Note that the intrinsics may be
implemented as no-ops (that is, not generate a prefetch instruction, if none
is available). Also, even where the architecture does provide a prefetch
instruction, a particular implementation may implement the instruction
as a no-op (that is, the instruction has no effect).

### Data prefetch

``` c
  void __pld(void const volatile *addr);
```

Generates a data prefetch instruction, if available. The argument should
be any expression that may designate a data address. The data is
prefetched to the innermost level of cache, for reading.

``` c
  void __pldx(/*constant*/ unsigned int /*access_kind*/,
              /*constant*/ unsigned int /*cache_level*/,
              /*constant*/ unsigned int /*retention_policy*/,
              void const volatile *addr);
```

Generates a data prefetch instruction. This intrinsic allows the
specification of the expected access kind (read or write), the cache
level to load the data, the data retention policy (temporal or
streaming), The relevant arguments can only be one of the following
values.

| **Access Kind** | **Value** | **Summary**                              |
| --------------- | --------- | ---------------------------------------- |
| PLD             | 0         | Fetch the addressed location for reading |
| PST             | 1         | Fetch the addressed location for writing |

| Cache Level | Value | Summary                                                |
| ----------- | ----- | ------------------------------------------------------ |
| L1          | 0     | Fetch the addressed location to L1 cache               |
| L2          | 1     | Fetch the addressed location to L2 cache               |
| L3          | 2     | Fetch the addressed location to L3 cache               |
| SLC         | 3     | Fetch the addressed location to the System-Level Cache |

| **Retention Policy** | **Value** | **Summary**                                                                |
| -------------------- | --------- | -------------------------------------------------------------------------- |
| KEEP                 | 0         | Temporal fetch of the addressed location (that is, allocate in cache normally) |
| STRM                 | 1         | Streaming fetch of the addressed location (that is, memory used only once)     |

### Instruction prefetch

``` c
  void __pli(T addr);
```

Generates a code prefetch instruction, if available. If a specific code
prefetch instruction is not available, this intrinsic may generate a
data-prefetch instruction to fetch the addressed code to the innermost
level of unified cache. It will not fetch code to data-cache in a split
cache level.

``` c
  void __plix(/*constant*/ unsigned int /*cache_level*/,
              /*constant*/ unsigned int /*retention_policy*/,
              T addr);
```

Generates a code prefetch instruction. This intrinsic allows the
specification of the cache level to load the code, the retention policy
(temporal or streaming). The relevant arguments can have the same values
as in `__pldx`.

`__pldx` and `__plix` arguments cache level and retention policy
are ignored on unsupported targets.

## NOP

``` c
  void __nop(void);
```

Generates an unspecified no-op instruction. Note that not all
architectures provide a distinguished NOP instruction. On those that do,
it is unspecified whether this intrinsic generates it or another
instruction. It is not guaranteed that inserting this instruction will
increase execution time.

# Data-processing intrinsics

The intrinsics in this section are provided for algorithm optimization.

The `<arm_acle.h>` header should be included before using these
intrinsics.

Implementations are not required to introduce precisely the instructions
whose names match the intrinsics. However, implementations should aim to
ensure that a computation expressed compactly with intrinsics will
generate a similarly compact sequence of machine code. In general, C's
as-if rule [[C99]](#C99) (5.1.2.3) applies, meaning that the compiled code must
behave *as if* the instruction had been generated.

In general, these intrinsics are aimed at DSP algorithm optimization on
M-profile and R-profile. Use on A-profile is deprecated. However, the
miscellaneous intrinsics and CRC32 intrinsics described in [Miscellaneous
data-processing intrinsics](#miscellaneous-data-processing-intrinsics)
and [CRC32 intrinsics](#crc32-intrinsics) respectively are suitable
for all profiles.

## Programmer's model of global state

### The Q (saturation) flag

The Q flag is a cumulative (sticky) saturation bit in the APSR
(Application Program Status Register) indicating that an operation
saturated, or in some cases, overflowed. It is set on saturation by most
intrinsics in the DSP and SIMD intrinsic sets, though some SIMD
intrinsics feature saturating operations which do not set the Q flag.

[[AAPCS]](#AAPCS) (5.1.1) states:

The N, Z, C, V and Q flags (bits 27-31) and the GE[3:0] bits (bits
16-19) are undefined on entry to or return from a public interface.

Note that this does not state that these bits (in particular the Q flag)
are undefined across any C/C++ function call boundary only across a
public interface. The Q and GE bits could be manipulated in
well-defined ways by local functions, for example when constructing
functions to be used in DSP algorithms.

Implementations must avoid introducing instructions (such as SSAT/USAT,
or SMLABB) which affect the Q flag, if the programmer is testing whether
the Q flag was set by explicit use of intrinsics and if the
implementation's introduction of an instruction may affect the value
seen. The implementation might choose to model the definition and use
(liveness) of the Q flag in the way that it models the liveness of any
visible variable, or it might suppress introduction of Q-affecting
instructions in any routine in which the Q flag is tested.

ACLE does not define how or whether the Q flag is preserved across
function call boundaries. (This is seen as an area for future
specification.)

In general, the Q flag should appear to C/C++ code in a similar way to
the standard floating-point cumulative exception flags, as global (or
thread-local) state that can be tested, set or reset through an API.

The following intrinsics are available when `__ARM_FEATURE_QBIT` is
defined:

int ```__saturation_occurred(void);```

Returns 1 if the Q flag is set, 0 if not.

void ```__set_saturation_occurred(int);```

Sets or resets the Q flag according to the LSB of the value.
`__set_saturation_occurred(0)` might be used before performing a
sequence of operations after which the Q flag is tested. (In general,
the Q flag cannot be assumed to be unset at the start of a function.)

void ```__ignore_saturation(void);```

This intrinsic is a hint and may be ignored. It indicates to the
compiler that the value of the Q flag is not live (needed) at or
subsequent to the program point at which the intrinsic occurs. It may
allow the compiler to remove preceding instructions, or to change the
instruction sequence in such a way as to result in a different value of
the Q flag. (A specific example is that it may recognize clipping idioms
in C code and implement them with an instruction such as SSAT that may
set the Q flag.)

### The GE flags

The GE (Greater than or Equal to) flags are four bits in the APSR. They
are used with the 32-bit SIMD intrinsics described in
[32-bit SIMD Operations](#32-bit-simd-operations).

There are four GE flags, one for each 8-bit lane of a 32-bit SIMD
operation. Certain non-saturating 32-bit SIMD intrinsics set the GE bits
to indicate overflow of addition or subtraction. For 4x8-bit operations
the GE bits are set one for each byte. For 2x16-bit operations the GE
bits are paired together, one for the high halfword and the other pair
for the low halfword. The only supported way to read or use the GE bits
(in this specification) is by using the `__sel` intrinsic, see
[Parallel selection](#parallel-selection).

### Floating-point environment

An implementation should implement the features of <fenv.h> for
accessing the floating-point runtime environment. Programmers should use
this rather than accessing the VFP FPSCR directly. For example, on a
target supporting VFP the cumulative exception flags (for example IXC, OFC) can
be read from the FPSCR by using the fetestexcept() function, and the
rounding mode (RMode) bits can be read using the fegetround() function.

ACLE does not support changing the DN, FZ or AHP bits at runtime.

VFP short vector mode (enabled by setting the Stride and Len bits) is
deprecated, and is unavailable on later VFP implementations. ACLE
provides no support for this mode.

## Miscellaneous data-processing intrinsics

The following intrinsics perform general data-processing operations.
They have no effect on global state.

\[Note: documentation of the `__nop` intrinsic has moved to [NOP](#nop)]

For completeness and to aid portability between LP64 and LLP64
models, ACLE also defines intrinsics with `l` suffix.

``` c
  uint32_t __ror(uint32_t x, uint32_t y);
  unsigned long __rorl(unsigned long x, uint32_t y);
  uint64_t __rorll(uint64_t x, uint32_t y);
```

Rotates the argument `x` right by `y` bits. `y` can take any value.
These intrinsics are available on all targets.

``` c
  unsigned int __clz(uint32_t x);
  unsigned int __clzl(unsigned long x);
  unsigned int __clzll(uint64_t x);
```

Returns the number of leading zero bits in `x`. When `x` is zero it
returns the argument width, that is, 32 or 64. These intrinsics are available
on all targets. On targets without the CLZ instruction it should be
implemented as an instruction sequence or a call to such a sequence. A
suitable sequence can be found in [Warren](#Warren) (fig. 5-7). Hardware support
for these intrinsics is indicated by `__ARM_FEATURE_CLZ`.

``` c
  unsigned int __cls(uint32_t x);
  unsigned int __clsl(unsigned long x);
  unsigned int __clsll(uint64_t x);
```

Returns the number of leading sign bits in `x`. When `x` is zero it
returns the argument width - 1, that is, 31 or 63. These intrinsics are
available on all targets. On targets without the CLZ instruction it
should be implemented as an instruction sequence or a call to such a
sequence. Fast hardware implementation (using a CLS instruction or a short code
sequence involving the CLZ instruction) is indicated by
`__ARM_FEATURE_CLZ`.

``` c
  uint32_t __rev(uint32_t);
  unsigned long __revl(unsigned long);
  uint64_t __revll(uint64_t);
```

Reverses the byte order within a word or doubleword. These intrinsics
are available on all targets and should be expanded to an efficient
straight-line code sequence on targets without byte reversal
instructions.

``` c
  uint32_t __rev16(uint32_t);
  unsigned long __rev16l(unsigned long);
  uint64_t __rev16ll(uint64_t);
```

Reverses the byte order within each halfword of a word. For example,
`0x12345678` becomes `0x34127856`. These intrinsics are available on
all targets and should be expanded to an efficient straight-line code
sequence on targets without byte reversal instructions.

``` c
  int16_t __revsh(int16_t);
```

Reverses the byte order in a 16-bit value and returns the signed 16-bit result.
For example, `0x0080` becomes `0x8000`. This intrinsic is available on
all targets and should be expanded to an efficient straight-line code
sequence on targets without byte reversal instructions.

``` c
  uint32_t __rbit(uint32_t x);
  unsigned long __rbitl(unsigned long x);
  uint64_t __rbitll(uint64_t x);
```

Reverses the bits in `x`. These intrinsics are only available on targets
with the RBIT instruction.

### Examples

``` c
  #ifdef __ARM_BIG_ENDIAN
  #define htonl(x) (uint32_t)(x)
  #define htons(x) (uint16_t)(x)
  #else /* little-endian */
  #define htonl(x) __rev(x)
  #define htons(x) (uint16_t)__revsh(x)
  #endif /* endianness */
  #define ntohl(x) htonl(x)
  #define ntohs(x) htons(x)

  /* Count leading sign bits */
  inline unsigned int count_sign(int32_t x) { return __clz(x ^ (x << 1)); }

  /* Count trailing zeroes */
  inline unsigned int count_trail(uint32_t x) {
  #if (__ARM_ARCH >= 6 && __ARM_ISA_THUMB >= 2) || __ARM_ARCH >= 7
  /* RBIT is available */
    return __clz(__rbit(x));
  #else
    unsigned int n = __clz(x & -x);   /* get the position of the last bit */
    return n == 32 ? n : (31-n);
  #endif
  }
```

## 16-bit multiplications

The intrinsics in this section provide direct access to the 16x16 and
16x32 bit multiplies introduced in Armv5E. Compilers are also
encouraged to exploit these instructions from C code. These intrinsics
are available when `__ARM_FEATURE_DSP` is defined, and are not
available on non-5E targets. These multiplies cannot overflow.

``` c
  int32_t __smulbb(int32_t, int32_t);
```

Multiplies two 16-bit signed integers, that is, the low halfwords of the
operands.

``` c
  int32_t __smulbt(int32_t, int32_t);
```

Multiplies the low halfword of the first operand and the high halfword
of the second operand.

``` c
  int32_t __smultb(int32_t, int32_t);
```

Multiplies the high halfword of the first operand and the low halfword
of the second operand.

``` c
  int32_t __smultt(int32_t, int32_t);
```

Multiplies the high halfwords of the operands.

``` c
  int32_t __smulwb(int32_t, int32_t);
```

Multiplies the 32-bit signed first operand with the low halfword (as a
16-bit signed integer) of the second operand. Return the top 32 bits of
the 48-bit product.

``` c
  int32_t __smulwt(int32_t, int32_t);
```

Multiplies the 32-bit signed first operand with the high halfword (as a
16-bit signed integer) of the second operand. Return the top 32 bits of
the 48-bit product.

## Saturating intrinsics

### Width-specified saturation intrinsics

These intrinsics are available when `__ARM_FEATURE_SAT` is defined.
They saturate a 32-bit value at a given bit position. The saturation
width must be an integral constant expression |--| see
[Constant arguments to intrinsics](#constant-arguments-to-intrinsics).

``` c
  int32_t __ssat(int32_t, /*constant*/ unsigned int);
```

Saturates a signed integer to the given bit width in the range 1 to 32.
For example, the result of saturation to 8-bit width will be in the
range -128 to 127. The Q flag is set if the operation saturates.

``` c
  uint32_t __usat(int32_t, /*constant*/ unsigned int);
```

Saturates a signed integer to an unsigned (non-negative) integer of a
bit width in the range 0 to 31. For example, the result of saturation to
8-bit width is in the range 0 to 255, with all negative inputs going to
zero. The Q flag is set if the operation saturates.

### Saturating addition and subtraction intrinsics

These intrinsics are available when `__ARM_FEATURE_DSP` is defined.

The saturating intrinsics operate on 32-bit signed integer data. There
are no special saturated or fixed point types.

``` c
  int32_t __qadd(int32_t, int32_t);
```

Adds two 32-bit signed integers, with saturation. Sets the Q flag if the
addition saturates.

``` c
  int32_t __qsub(int32_t, int32_t);
```

Subtracts two 32-bit signed integers, with saturation. Sets the Q flag
if the subtraction saturates.

``` c
  int32_t __qdbl(int32_t);
```

Doubles a signed 32-bit number, with saturation. `__qdbl(x)` is equal to
`__qadd(x,x)` except that the argument x is evaluated only once. Sets
the Q flag if the addition saturates.

### Accumulating multiplications

These intrinsics are available when `__ARM_FEATURE_DSP` is defined.

``` c
  int32_t __smlabb(int32_t, int32_t, int32_t);
```

Multiplies two 16-bit signed integers, the low halfwords of the first
two operands, and adds to the third operand. Sets the Q flag if the
addition overflows. (Note that the addition is the usual 32-bit modulo
addition which wraps on overflow, not a saturating addition. The
multiplication cannot overflow.)

``` c
  int32_t __smlabt(int32_t, int32_t, int32_t);
```

Multiplies the low halfword of the first operand and the high halfword
of the second operand, and adds to the third operand, as for `__smlabb`.

``` c
  int32_t __smlatb(int32_t, int32_t, int32_t);
```

Multiplies the high halfword of the first operand and the low halfword
of the second operand, and adds to the third operand, as for `__smlabb`.

``` c
  int32_t __smlatt(int32_t, int32_t, int32_t);
```

Multiplies the high halfwords of the first two operands and adds to the
third operand, as for `__smlabb`.

``` c
  int32_t __smlawb(int32_t, int32_t, int32_t);
```

Multiplies the 32-bit signed first operand with the low halfword (as a
16-bit signed integer) of the second operand. Adds the top 32 bits of
the 48-bit product to the third operand. Sets the Q flag if the addition
overflows. (See note for `__smlabb`).

``` c
  int32_t __smlawt(int32_t, int32_t, int32_t);
```

Multiplies the 32-bit signed first operand with the high halfword (as a
16-bit signed integer) of the second operand and adds the top 32 bits of
the 48-bit result to the third operand as for `__smlawb`.

### Examples

The ACLE DSP intrinsics can be used to define ETSI/ITU-T basic
operations [[G.191]](#G.191):

``` c
    #include <arm_acle.h>
    inline int32_t L_add(int32_t x, int32_t y) { return __qadd(x, y); }
    inline int32_t L_negate(int32_t x) { return __qsub(0, x); }
    inline int32_t L_mult(int16_t x, int16_t y) { return __qdbl(x*y); }
    inline int16_t add(int16_t x, int16_t y) { return (int16_t)(__qadd(x<<16, y<<16) >> 16); }
    inline int16_t norm_l(int32_t x) { return __clz(x ^ (x<<1)) & 31; }
    ...
```

This example assumes the implementation preserves the Q flag on return
from an inline function.

<span id="32-bit-simd-operations"></span>

## 32-bit SIMD Operations

### Availability

Armv6 introduced instructions to perform 32-bit SIMD operations (that is,
two 16-bit operations or four 8-bit operations) on the Arm
general-purpose registers. These instructions are not related to the
much more versatile Advanced SIMD (Neon) extension, whose support is
described in [Advanced SIMD (Neon) intrinsics](#advanced-simd-neon-intrinsics).

The 32-bit SIMD intrinsics are available on targets featuring Armv6 and
upwards, including the A and R profiles. In the M profile they are
available in the Armv7E-M architecture. Availability of the 32-bit SIMD
intrinsics implies availability of the saturating intrinsics.

Availability of the SIMD intrinsics is indicated by the
`__ARM_FEATURE_SIMD32` predefine.

To access the intrinsics, the `<arm_acle.h>` header should be included.

### Data types for 32-bit SIMD intrinsics

The header `<arm_acle.h>` should be included before using these
intrinsics.

The SIMD intrinsics generally operate on and return 32-bit words
consisting of two 16-bit or four 8-bit values. These are represented as
`int16x2_t` and `int8x4_t` below for illustration. Some intrinsics also
feature scalar accumulator operands and/or results.

When defining the intrinsics, implementations can define SIMD operands
using a 32-bit integral type (such as `unsigned int`).

The header `<arm_acle.h>` defines typedefs `int16x2_t`, `uint16x2_t`,
`int8x4_t`, and `uint8x4_t`. These should be defined as 32-bit integral
types of the appropriate sign. There are no intrinsics provided to pack
or unpack values of these types. This can be done with shifting and
masking operations.

### Use of the Q flag by 32-bit SIMD intrinsics

Some 32-bit SIMD instructions may set the Q flag described in
[The Q (saturation) flag](#the-q-saturation-flag). The behavior of the
intrinsics matches that of the instructions.

Generally, instructions that perform lane-by-lane saturating operations
do not set the Q flag. For example, `__qadd16` does not set the Q flag,
even if saturation occurs in one or more lanes.

The explicit saturation operations `__ssat` and `__usat` set the Q flag
if saturation occurs. Similarly, `__ssat16` and `__usat16` set the Q
flag if saturation occurs in either lane.

Some instructions, such as `__smlad`, set the Q flag if overflow occurs
on an accumulation, even though the accumulation is not a saturating
operation (that is, does not clip its result to the limits of the type).

### Parallel 16-bit saturation

These intrinsics are available when `__ARM_FEATURE_SIMD32` is defined.
They saturate two 16-bit values to a given bit width as for the `__ssat`
and `__usat` intrinsics defined in [Width-specified saturation
intrinsics](#width-specified-saturation-intrinsics).

``` c
  int16x2_t __ssat16(int16x2_t, /*constant*/ unsigned int);
```

Saturates two 16-bit signed values to a width in the range 1 to 16. The
Q flag is set if either operation saturates.

``` c
  int16x2_t __usat16(int16x2_t, /*constant */ unsigned int);
```

Saturates two 16-bit signed values to a bit width in the range 0 to 15.
The input values are signed and the output values are non-negative, with
all negative inputs going to zero. The Q flag is set if either operation
saturates.

### Packing and unpacking

These intrinsics are available when `__ARM_FEATURE_SIMD32` is defined.

``` c
  int16x2_t __sxtab16(int16x2_t, int8x4_t);
```

Two values (at bit positions 0..7 and 16..23) are extracted from the
second operand, sign-extended to 16 bits, and added to the first
operand.

``` c
  int16x2_t __sxtb16(int8x4_t);
```

Two values (at bit positions 0..7 and 16..23) are extracted from the
first operand, sign-extended to 16 bits, and returned as the result.

``` c
  uint16x2_t __uxtab16(uint16x2_t, uint8x4_t);
```

Two values (at bit positions 0..7 and 16..23) are extracted from the
second operand, zero-extended to 16 bits, and added to the first
operand.

``` c
  uint16x2_t __uxtb16(uint8x4_t);
```

Two values (at bit positions 0..7 and 16..23) are extracted from the
first operand, zero-extended to 16 bits, and returned as the result.

### Parallel selection

This intrinsic is available when `__ARM_FEATURE_SIMD32` is defined.

``` c
  uint8x4_t __sel(uint8x4_t, uint8x4_t);
```

Selects each byte of the result from either the first operand or the
second operand, according to the values of the GE bits. For each result
byte, if the corresponding GE bit is set then the byte from the first
operand is used, otherwise the byte from the second operand is used.
Because of the way that `int16x2_t` operations set two (duplicate) GE
bits per value, the `__sel` intrinsic works equally well on
`(u)int16x2_t` and `(u)int8x4_t` data.

### Parallel 8-bit addition and subtraction

These intrinsics are available when `__ARM_FEATURE_SIMD32` is defined.
Each intrinsic performs 8-bit parallel addition or subtraction. In some
cases the result may be halved or saturated.

``` c
  int8x4_t __qadd8(int8x4_t, int8x4_t);
```

4x8-bit addition, saturated to the range `-2**7` to `2**7-1`.

``` c
  int8x4_t __qsub8(int8x4_t, int8x4_t);
```

4x8-bit subtraction, with saturation.

``` c
  int8x4_t __sadd8(int8x4_t, int8x4_t);
```

4x8-bit signed addition. The GE bits are set according to the results.

``` c
  int8x4_t __shadd8(int8x4_t, int8x4_t);
```

4x8-bit signed addition, halving the results.

``` c
  int8x4_t __shsub8(int8x4_t, int8x4_t);
```

4x8-bit signed subtraction, halving the results.

``` c
  int8x4_t __ssub8(int8x4_t, int8x4_t);
```

4x8-bit signed subtraction. The GE bits are set according to the
results.

``` c
  uint8x4_t __uadd8(uint8x4_t, uint8x4_t);
```

4x8-bit unsigned addition. The GE bits are set according to the results.

``` c
  uint8x4_t __uhadd8(uint8x4_t, uint8x4_t);
```

4x8-bit unsigned addition, halving the results.

``` c
  uint8x4_t __uhsub8(uint8x4_t, uint8x4_t);
```

4x8-bit unsigned subtraction, halving the results.

``` c
  uint8x4_t __uqadd8(uint8x4_t, uint8x4_t);
```

4x8-bit unsigned addition, saturating to the range `0` to `2**8-1`.

``` c
  uint8x4_t __uqsub8(uint8x4_t, uint8x4_t);
```

4x8-bit unsigned subtraction, saturating to the range `0` to `2**8-1`.

``` c
  uint8x4_t __usub8(uint8x4_t, uint8x4_t);
```

4x8-bit unsigned subtraction. The GE bits are set according to the
results.

### Sum of 8-bit absolute differences

These intrinsics are available when `__ARM_FEATURE_SIMD32` is defined.
They perform an 8-bit sum-of-absolute differences operation, typically
used in motion estimation.

``` c
  uint32_t __usad8(uint8x4_t, uint8x4_t);
```

Performs 4x8-bit unsigned subtraction, and adds the absolute values of
the differences together, returning the result as a single unsigned
integer.

``` c
  uint32_t __usada8(uint8x4_t, uint8x4_t, uint32_t);
```

Performs 4x8-bit unsigned subtraction, adds the absolute values of the
differences together, and adds the result to the third operand.

### Parallel 16-bit addition and subtraction

These intrinsics are available when `__ARM_FEATURE_SIMD32` is defined.
Each intrinsic performs 16-bit parallel addition and/or subtraction. In
some cases the result may be halved or saturated.

``` c
  int16x2_t __qadd16(int16x2_t, int16x2_t);
```

2x16-bit addition, saturated to the range `-2**15` to `2**15-1`.

``` c
  int16x2_t __qasx(int16x2_t, int16x2_t);
```

Exchanges halfwords of second operand, adds high halfwords and subtracts
low halfwords, saturating in each case.

``` c
  int16x2_t __qsax(int16x2_t, int16x2_t);
```

Exchanges halfwords of second operand, subtracts high halfwords and adds
low halfwords, saturating in each case.

``` c
  int16x2_t __qsub16(int16x2_t, int16x2_t);
```

2x16-bit subtraction, with saturation.

``` c
  int16x2_t __sadd16(int16x2_t, int16x2_t);
```

2x16-bit signed addition. The GE bits are set according to the results.

``` c
  int16x2_t __sasx(int16x2_t, int16x2_t);
```

Exchanges halfwords of the second operand, adds high halfwords and
subtracts low halfwords. The GE bits are set according to the results.

``` c
  int16x2_t __shadd16(int16x2_t, int16x2_t);
```

2x16-bit signed addition, halving the results.

``` c
  int16x2_t __shasx(int16x2_t, int16x2_t);
```

Exchanges halfwords of the second operand, adds high halfwords and
subtract low halfwords, halving the results.

``` c
  int16x2_t __shsax(int16x2_t, int16x2_t);
```

Exchanges halfwords of the second operand, subtracts high halfwords and
add low halfwords, halving the results.

``` c
  int16x2_t __shsub16(int16x2_t, int16x2_t);
```

2x16-bit signed subtraction, halving the results.

``` c
  int16x2_t __ssax(int16x2_t, int16x2_t);
```

Exchanges halfwords of the second operand, subtracts high halfwords and
adds low halfwords. The GE bits are set according to the results.

``` c
  int16x2_t __ssub16(int16x2_t, int16x2_t);
```

2x16-bit signed subtraction. The GE bits are set according to the
results.

``` c
  uint16x2_t __uadd16(uint16x2_t, uint16x2_t);
```

2x16-bit unsigned addition. The GE bits are set according to the
results.

``` c
  uint16x2_t __uasx(uint16x2_t, uint16x2_t);
```

Exchanges halfwords of the second operand, adds high halfwords and
subtracts low halfwords. The GE bits are set according to the results of
unsigned addition.

``` c
  uint16x2_t __uhadd16(uint16x2_t, uint16x2_t);
```

2x16-bit unsigned addition, halving the results.

``` c
  uint16x2_t __uhasx(uint16x2_t, uint16x2_t);
```

Exchanges halfwords of the second operand, adds high halfwords and
subtracts low halfwords, halving the results.

``` c
  uint16x2_t __uhsax(uint16x2_t, uint16x2_t);
```

Exchanges halfwords of the second operand, subtracts high halfwords and
adds low halfwords, halving the results.

``` c
  uint16x2_t __uhsub16(uint16x2_t, uint16x2_t);
```

2x16-bit unsigned subtraction, halving the results.

``` c
  uint16x2_t __uqadd16(uint16x2_t, uint16x2_t);
```

2x16-bit unsigned addition, saturating to the range `0` to `2**16-1`.

``` c
  uint16x2_t __uqasx(uint16x2_t, uint16x2_t);
```

Exchanges halfwords of the second operand, and performs saturating
unsigned addition on the high halfwords and saturating unsigned
subtraction on the low halfwords.

``` c
  uint16x2_t __uqsax(uint16x2_t, uint16x2_t);
```

Exchanges halfwords of the second operand, and performs saturating
unsigned subtraction on the high halfwords and saturating unsigned
addition on the low halfwords.

``` c
  uint16x2_t __uqsub16(uint16x2_t, uint16x2_t);
```

2x16-bit unsigned subtraction, saturating to the range `0` to `2**16-1`.

``` c
  uint16x2_t __usax(uint16x2_t, uint16x2_t);
```

Exchanges the halfwords of the second operand, subtracts the high
halfwords and adds the low halfwords. Sets the GE bits according to the
results of unsigned addition.

``` c
  uint16x2_t __usub16(uint16x2_t, uint16x2_t);
```

2x16-bit unsigned subtraction. The GE bits are set according to the
results.

### Parallel 16-bit multiplication

These intrinsics are available when `__ARM_FEATURE_SIMD32` is defined.
Each intrinsic performs two 16-bit multiplications.

``` c
  int32_t __smlad(int16x2_t, int16x2_t, int32_t);
```

Performs 2x16-bit multiplication and adds both results to the third
operand. Sets the Q flag if the addition overflows. (Overflow cannot
occur during the multiplications.)

``` c
  int32_t __smladx(int16x2_t, int16x2_t, int32_t);
```

Exchanges the halfwords of the second operand, performs 2x16-bit
multiplication, and adds both results to the third operand. Sets the Q
flag if the addition overflows. (Overflow cannot occur during the
multiplications.)

``` c
  int64_t __smlald(int16x2_t, int16x2_t, int64_t);
```

Performs 2x16-bit multiplication and adds both results to the 64-bit
third operand. Overflow in the addition is not detected.

``` c
  int64_t __smlaldx(int16x2_t, int16x2_t, int64_t);
```

Exchanges the halfwords of the second operand, performs 2x16-bit
multiplication and adds both results to the 64-bit third operand.
Overflow in the addition is not detected.

``` c
  int32_t __smlsd(int16x2_t, int16x2_t, int32_t);
```

Performs two 16-bit signed multiplications. Takes the difference of the
products, subtracting the high-halfword product from the low-halfword
product, and adds the difference to the third operand. Sets the Q flag
if the addition overflows. (Overflow cannot occur during the
multiplications or the subtraction.)

``` c
  int32_t __smlsdx(int16x2_t, int16x2_t, int32_t);
```

Performs two 16-bit signed multiplications. The product of the high
halfword of the first operand and the low halfword of the second operand
is subtracted from the product of the low halfword of the first operand
and the high halfword of the second operand, and the difference is added
to the third operand. Sets the Q flag if the addition overflows.
(Overflow cannot occur during the multiplications or the subtraction.)

``` c
  int64_t __smlsld(int16x2_t, int16x2_t, int64_t);
```

Perform two 16-bit signed multiplications. Take the difference of the
products, subtracting the high-halfword product from the low-halfword
product, and add the difference to the third operand. Overflow in the
64-bit addition is not detected. (Overflow cannot occur during the
multiplications or the subtraction.)

``` c
  int64_t __smlsldx(int16x2_t, int16x2_t, int64_t);
```

Perform two 16-bit signed multiplications. The product of the high
halfword of the first operand and the low halfword of the second operand
is subtracted from the product of the low halfword of the first operand
and the high halfword of the second operand, and the difference is added
to the third operand. Overflow in the 64-bit addition is not detected.
(Overflow cannot occur during the multiplications or the subtraction.)

``` c
  int32_t __smuad(int16x2_t, int16x2_t);
```

Perform 2x16-bit signed multiplications, adding the products together.
Set the Q flag if the addition overflows.

``` c
  int32_t __smuadx(int16x2_t, int16x2_t);
```

Exchange the halfwords of the second operand (or equivalently, the first
operand), perform 2x16-bit signed multiplications, and add the products
together. Set the Q flag if the addition overflows.

``` c
  int32_t __smusd(int16x2_t, int16x2_t);
```

Perform two 16-bit signed multiplications. Take the difference of the
products, subtracting the high-halfword product from the low-halfword
product.

``` c
  int32_t __smusdx(int16x2_t, int16x2_t);
```

Perform two 16-bit signed multiplications. The product of the high
halfword of the first operand and the low halfword of the second operand
is subtracted from the product of the low halfword of the first operand
and the high halfword of the second operand.

### Examples

Taking the elementwise maximum of two SIMD values each of which consists
of four 8-bit signed numbers:

``` c
  int8x4_t max8x4(int8x4_t x, int8x4_t y) { __ssub8(x, y); return __sel(x, y); }
```

As described in :ref:sec-Parallel-selection, where SIMD values
consist of two 16-bit unsigned numbers:

``` c
  int16x2_t max16x2(int16x2_t x, int16x2_t y) { __usub16(x, y); return __sel(x, y); }
```

Note that even though the result of the subtraction is not used, the
compiler must still generate the instruction, because of its side-effect
on the GE bits which are tested by the `__sel()` intrinsic.

## Floating-point data-processing intrinsics

The intrinsics in this section provide direct access to selected
floating-point instructions. They are defined only if the appropriate
precision is available in hardware, as indicated by `__ARM_FP` (see
[Hardware floating point](#hardware-floating-point)).

``` c
  double __sqrt(double x);
  float __sqrtf(float x);
```

The `__sqrt` intrinsics compute the square root of their operand. They
have no effect on errno. Negative values produce a default NaN
result and possible floating-point exception as described in [ARMARM]
(A2.7.7).

``` c
  double __fma(double x, double y, double z);
  float __fmaf(float x, float y, float z);
```

The `__fma` intrinsics compute `(x*y)+z`, without intermediate rounding.
These intrinsics are available only if `__ARM_FEATURE_FMA` is defined.
On a Standard C implementation it should not normally be necessary to
use these intrinsics, because the fma functions defined in [C99] (7.12.13)
should expand directly to the instructions if available.

``` c
  float __rintnf (float);
  double __rintn (double);
```

The `__rintn` intrinsics perform a floating point round to integral, to
nearest with ties to even. The `__rintn` intrinsic is available when
`__ARM_FEATURE_DIRECTED_ROUNDING` is defined to 1. For other rounding
modes like |lsquo| to nearest with ties to away |rsquo| it is strongly recommended
that C99 standard functions be used. To achieve a floating point convert
to integer, rounding to |lsquo| nearest with ties to even |rsquo| operation, use these
rounding functions with a type-cast to integral values. For example:

``` c
  (int) __rintnf (a);
```

maps to a floating point convert to signed integer, rounding to nearest
with ties to even operation.

``` c
  int32_t __jcvt (double);
```

Converts a double-precision floating-point number to a 32-bit signed
integer following the Javascript Convert instruction semantics [[ARMARMv83]](#ARMARMv83).
The `__jcvt` intrinsic is available if `__ARM_FEATURE_JCVT` is defined.

``` c
  float __rint32zf (float);
  double __rint32z (double);
  float __rint64zf (float);
  double __rint64z (double);
  float __rint32xf (float);
  double __rint32x (double);
  float __rint64xf (float);
  double __rint64x (double);
```

These intrinsics round their floating-point argument to a floating-point value
that would be representable in a 32-bit or 64-bit signed integer type.
Out-of-Range values are forced to the Most Negative Integer representable in
the target size, and an Invalid Operation Floating-Point Exception is
generated.  The rounding mode can be either the ambient rounding mode
(for example `__rint32xf`) or towards zero (for example `__rint32zf`).

These instructions are introduced in the Armv8.5-A extensions
[[ARMARMv85]](#ARMARMv85) and are available only in the AArch64 execution state.
The intrinsics are available when `__ARM_FEATURE_FRINT` is defined.

## Random number generation intrinsics

The Random number generation intrinsics provide access to the Random Number
instructions introduced in Armv8.5-A.  These intrinsics are only defined for
the AArch64 execution state and are available when `__ARM_FEATURE_RNG`
is defined.

``` c
  int __rndr (uint64_t *);
```

Stores a 64-bit random number into the object pointed to by the argument and
returns zero.
If the implementation could not generate a random number  within a reasonable
period of time the object pointed to by the input is set to zero and a non-zero
value is returned.

``` c
  int __rndrrs (uint64_t *);
```

Reseeds the random number generator.  After that stores a 64-bit random number
into the object pointed to by the argument and returns zero.
If the implementation could not generate a random number within a reasonable
period of time the object pointed to by the input is set to zero and a
non-zero value is returned.

These intrinsics have side-effects on the system beyond their results.
Implementations must preserve them even if the results of the intrinsics are
unused.

To access these intrinsics, `<arm_acle.h>` should be included.

## CRC32 intrinsics

CRC32 intrinsics provide direct access to CRC32 instructions
CRC32{C}{B, H, W, X} in both Armv8 AArch32 and AArch64 execution states.
These intrinsics are available when `__ARM_FEATURE_CRC32` is defined.

``` c
  uint32_t __crc32b (uint32_t a, uint8_t b);
```

Performs CRC-32 checksum from bytes.

``` c
  uint32_t __crc32h (uint32_t a, uint16_t b);
```

Performs CRC-32 checksum from half-words.

``` c
  uint32_t __crc32w (uint32_t a, uint32_t b);
```

Performs CRC-32 checksum from words.

``` c
  uint32_t __crc32d (uint32_t a, uint64_t b);
```

Performs CRC-32 checksum from double words.

``` c
  uint32_t __crc32cb (uint32_t a, uint8_t b);
```

Performs CRC-32C checksum from bytes.

``` c
  uint32_t __crc32ch (uint32_t a, uint16_t b);
```

Performs CRC-32C checksum from half-words.

``` c
  uint32_t __crc32cw (uint32_t a, uint32_t b);
```

Performs CRC-32C checksum from words.

``` c
  uint32_t __crc32cd (uint32_t a, uint64_t b);
```

Performs CRC-32C checksum from double words.

To access these intrinsics, `<arm_acle.h>` should be included.

## Load/store 64 Byte intrinsics

These intrinsics provide direct access to the Armv8.7-A `LD64B`,
`ST64B`, `ST64BV` and `ST64BV0` instructions for atomic 64-byte
access to device memory.
These intrinsics are available when `__ARM_FEATURE_LS64` is defined.

The header `<arm_acle.h>` defines these intrinsics, and also the
data type `data512_t` that they use.

The type `data512_t` is a 64-byte structure type containing a single
member `val` which is an array of 8 `uint64_t`, as if declared
like this:

``` c
  typedef struct {
      uint64_t val[8];
  } data512_t;
```

The following intrinsics are defined on this data type. In all cases,
the address `addr` must be aligned to a multiple of 64 bytes.

``` c
  data512_t __arm_ld64b(const void *addr);
```

Loads 64 bytes of data atomically from the address `addr`. The
address must be in a memory region that supports 64-byte load/store
operations.

``` c
  void __arm_st64b(void *addr, data512_t value);
```

Stores the 64 bytes in `value` atomically to the address `addr`. The
address must be in a memory region that supports 64-byte load/store
operations.

``` c
  uint64_t __arm_st64bv(void *addr, data512_t value);
```

Attempts to store the 64 bytes in `value` atomically to the address
`addr`.  It returns a 64-bit value from the response of the device
written to.

``` c
  uint64_t __arm_st64bv0(void *addr, data512_t value);
```

Performs the same operation as `__arm_st64bv`, except that the data
stored to memory is modified by replacing the low 32 bits of
`value.val[0]` with the contents of the `ACCDATA_EL1` system register.
The returned value is the same as for `__arm_st64bv`.

# Custom Datapath Extension

The intrinsics in this section provide access to instructions in the
Custom Datapath Extension.

The `<arm_cde.h>` header should be included before using these
intrinsics.  The header is available when the `__ARM_FEATURE_CDE` feature
macro is defined.

The intrinsics are stateless and pure, meaning an implementation is permitted
to discard an invocation of an intrinsic whose result is unused without
considering side-effects.

## CDE intrinsics

The following intrinsics are available when `__ARM_FEATURE_CDE` is defined.
These intrinsics use the `coproc` and `imm` compile-time constants to
generate the corresponding CDE instructions.
The `coproc` argument indicates the CDE coprocessor to use.  The range of
available coprocessors is indicated by the bitmap `__ARM_FEATURE_CDE_COPROC`,
described in [Custom Datapath Extension](#custom-datapath-extension).
The `imm` argument must fit within the immediate range of the corresponding CDE
instruction.  Values for these arguments outside these ranges must be rejected.

``` c
  uint32_t __arm_cx1(int coproc, uint32_t imm);
  uint32_t __arm_cx1a(int coproc, uint32_t acc, uint32_t imm);
  uint32_t __arm_cx2(int coproc, uint32_t n, uint32_t imm);
  uint32_t __arm_cx2a(int coproc, uint32_t acc, uint32_t n, uint32_t imm);
  uint32_t __arm_cx3(int coproc, uint32_t n, uint32_t m, uint32_t imm);
  uint32_t __arm_cx3a(int coproc, uint32_t acc, uint32_t n, uint32_t m, uint32_t imm);

  uint64_t __arm_cx1d(int coproc, uint32_t imm);
  uint64_t __arm_cx1da(int coproc, uint64_t acc, uint32_t imm);
  uint64_t __arm_cx2d(int coproc, uint32_t n, uint32_t imm);
  uint64_t __arm_cx2da(int coproc, uint64_t acc, uint32_t n, uint32_t imm);
  uint64_t __arm_cx3d(int coproc, uint32_t n, uint32_t m, uint32_t imm);
  uint64_t __arm_cx3da(int coproc, uint64_t acc, uint32_t n, uint32_t m, uint32_t imm);
```

The following intrinsics are also available when `__ARM_FEATURE_CDE` is defined,
providing access to the CDE instructions that read and write the
floating-point registers:

``` c
  uint32_t __arm_vcx1_u32(int coproc, uint32_t imm);
  uint32_t __arm_vcx1a_u32(int coproc, uint32_t acc, uint32_t imm);
  uint32_t __arm_vcx2_u32(int coproc, uint32_t n, uint32_t imm);
  uint32_t __arm_vcx2a_u32(int coproc, uint32_t acc, uint32_t n, uint32_t imm);
  uint32_t __arm_vcx3_u32(int coproc, uint32_t n, uint32_t m, uint32_t imm);
  uint32_t __arm_vcx3a_u32(int coproc, uint32_t acc, uint32_t n, uint32_t m, uint32_t imm);
```

In addition, the following intrinsics can be used to generate the D-register forms
of the instructions:

``` c
  uint64_t __arm_vcx1d_u64(int coproc, uint32_t imm);
  uint64_t __arm_vcx1da_u64(int coproc, uint64_t acc, uint32_t imm);
  uint64_t __arm_vcx2d_u64(int coproc, uint64_t m, uint32_t imm);
  uint64_t __arm_vcx2da_u64(int coproc, uint64_t acc, uint64_t m, uint32_t imm);
  uint64_t __arm_vcx3d_u64(int coproc, uint64_t n, uint64_t m, uint32_t imm);
  uint64_t __arm_vcx3da_u64(int coproc, uint64_t acc, uint64_t n, uint64_t m, uint32_t imm);
```

The above intrinsics use the `uint32_t` and `uint64_t` types as general
container types.

The following intrinsics can be used to generate CDE instructions that use the
MVE Q registers.

``` c
  uint8x16_t __arm_vcx1q_u8 (int coproc, uint32_t imm);
  T __arm_vcx1qa(int coproc, T acc, uint32_t imm);
  T __arm_vcx2q(int coproc, T n, uint32_t imm);
  uint8x16_t __arm_vcx2q_u8(int coproc, T n, uint32_t imm);
  T __arm_vcx2qa(int coproc, T acc, U n, uint32_t imm);
  T __arm_vcx3q(int coproc, T n, U m, uint32_t imm);
  uint8x16_t __arm_vcx3q_u8(int coproc, T n, U m, uint32_t imm);
  T __arm_vcx3qa(int coproc, T acc, U n, V m, uint32_t imm);

  T __arm_vcx1q_m(int coproc, T inactive, uint32_t imm, mve_pred16_t p);
  T __arm_vcx2q_m(int coproc, T inactive, U n, uint32_t imm, mve_pred16_t p);
  T __arm_vcx3q_m(int coproc, T inactive, U n, V m, uint32_t imm, mve_pred16_t p);

  T __arm_vcx1qa_m(int coproc, T acc, uint32_t imm, mve_pred16_t p);
  T __arm_vcx2qa_m(int coproc, T acc, U n, uint32_t imm, mve_pred16_t p);
  T __arm_vcx3qa_m(int coproc, T acc, U n, V m, uint32_t imm, mve_pred16_t p);
```

These intrinsics are polymorphic in the `T`, `U` and `V` types, which
must be of size 128 bits.
The `__arm_vcx1q_u8`, `__arm_vcx2q_u8` and `__arm_vcx3q_u8` intrinsics
return a container vector of 16 bytes that can be reinterpreted to other
vector types as needed using the intrinsics below:

``` c
  uint16x8_t __arm_vreinterpretq_u16_u8 (uint8x16_t in);
  int16x8_t __arm_vreinterpretq_s16_u8 (uint8x16_t in);
  uint32x4_t __arm_vreinterpretq_u32_u8 (uint8x16_t in);
  int32x4_t __arm_vreinterpretq_s32_u8 (uint8x16_t in);
  uint64x2_t __arm_vreinterpretq_u64_u8 (uint8x16_t in);
  int64x2_t __arm_vreinterpretq_s64_u8 (uint8x16_t in);
  float16x8_t __arm_vreinterpretq_f16_u8 (uint8x16_t in);
  float32x4_t __arm_vreinterpretq_f32_u8 (uint8x16_t in);
  float64x2_t __arm_vreinterpretq_f64_u8 (uint8x16_t in);
```

The parameter `inactive` can be set to an uninitialized (don't care) value
using the MVE `vuninitializedq` family of intrinsics.

# Memory tagging intrinsics

The intrinsics in this section provide access to the
Memory Tagging Extension (MTE) introduced with the Armv8.5-A [[ARMARMv85]](#ARMARMv85) architecture.

The `<arm_acle.h>` header should be included before using these intrinsics.

These intrinsics are expected to be used in system code, including freestanding
environments.  As such, implementations must guarantee that no new linking
dependencies to runtime support libraries will occur when these
intrinsics are used.

## Memory tagging

Memory tagging is a lightweight, probabilistic version of a lock and key
system where one of a limited set of lock values can be associated with
the memory locations forming part of an allocation, and the equivalent key
is stored in unused high bits of addresses used as references
to that allocation. On each use of a reference the key is checked to make
sure that it matches with the lock before an access is made.

When allocating memory, programmers must assign a lock to that section of memory.
When freeing an allocation, programmers must change the lock value so that
further referencing using the previous key has a reasonable probability of
failure.

The intrinsics specified below support creation, storage,
and retrieval of the lock values, leaving software to select and set the values
on allocation and deallocation. The intrinsics are expected to help protect
heap allocations.

The lock is referred in the text below as `allocation tag` and the key as
`logical address tag` (or in short `logical tag`).

## Terms and implementation details

The memory system is extended with a new physical address space containing
an allocation tag for each 16-byte granule of memory in the existing data
physical address space. All loads and stores to  memory must pass a
valid logical address tag as part of the reference. However, SP- and PC-relative
addresses are not checked. The logical tag is held in the upper bits of
the reference.  There are 16 available logical tags that can be used.

## MTE intrinsics

These intrinsics are available when `__ARM_FEATURE_MEMORY_TAGGING` is defined.
Type T below can be any type.
Where the function return type is specified as T, the return type is determined
from the input argument which must be also be specified as of type T.
If the input argument T has qualifiers `const` or  `volatile`, the return
type T will also have the `const` or `volatile` qualifier.

``` c
  T* __arm_mte_create_random_tag(T* src, uint64_t mask);
```

This intrinsic returns a pointer containing a randomly created logical address tag.
The first argument is a pointer `src` containing  an address.
The second argument is a `mask`, where the lower 16 bits specify logical tags
which must be excluded from consideration.
The intrinsic returns a pointer which is a copy of the input address but also
contains a randomly created logical tag (in the upper bits), that excludes any
logical tags specified by the `mask`.
A `mask` of zero excludes no tags.

``` c
  T* __arm_mte_increment_tag(T* src, unsigned offset);
```

This intrinsic returns a pointer which is a copy of the input pointer `src`
but with the logical address tag part offset by a specified offset value.
The first argument is a pointer `src` containing  an address and a logical tag.
The second argument is an offset which must be a compile time constant value
in the range [0,15].
The intrinsic adds `offset` to the logical tag part of `src`
returning a pointer with the incremented logical tag.
If adding the offset increments the logical tag beyond the valid 16 tags,
the value is wrapped around.

``` c
  uint64_t __arm_mte_exclude_tag(T* src, uint64_t excluded);
```

This intrinsic adds a logical tag to the set of excluded logical tags.
The first argument is a pointer `src` containing  an address and a logical tag.
The second argument `excluded` is a mask where the lower 16 bits specify
logical tags which are in current excluded set.
The intrinsic adds the logical tag of `src` to the set specified by `excluded`
and returns the new excluded tag set.

``` c
  void __arm_mte_set_tag(T* tag_address);
```

This intrinsic stores an allocation tag, computed from the logical tag,
to the tag memory thereby setting the allocation tag for the 16-byte
granule of memory.
The argument is a pointer `tag_address` containing  a logical tag and an address.
The address must be 16-byte aligned.
The type of the pointer is ignored (that is, allocation tag is set only for a
single granule even if the pointer points  to a type that is greater than 16 bytes).
These intrinsics generate an unchecked access to memory.

``` c
  T* __arm_mte_get_tag(T* address);
```

This intrinsic loads the allocation tag from tag memory and returns the
corresponding logical tag as part of the returned pointer value.
The argument is a pointer `address` containing an address from which
allocation tag memory is read.
The pointer `address`  need not be 16-byte aligned as it applies
to the 16-byte naturally aligned granule containing the un-aligned pointer.
The return value is a pointer whose address part comes from `address`
and the logical tag value is the value computed from the allocation
tag that was read from tag memory.

``` c
  ptrdiff_t __arm_mte_ptrdiff(T* a, T* b);
```

The intrinsic calculates the difference between the address parts of the
two pointers, ignoring the tags.
The return value is the sign-extended result of the computation.
The tag bits in the input pointers are ignored for this operation.

# State management

The specification for SME is in
[**Beta** state](#current-status-and-anticipated-changes) and may change or be
extended in the future.

## Introduction

ACLE often uses normal C and C++ objects to represent architectural state.
These objects are passed to intrinsics and returned from intrinsics in
the same way as they would be for a normal function.

For example, ACLE defines an `svbool_t` type to represent the
contents of an SVE predicate register. SVE intrinsics that read
a predicate register have an `svbool_t` argument for that register.
SVE intrinsics that write to a predicate register have an `svbool_t`
return type for that register.

SVE provides 16 predicate registers, but this number is not exposed to
C and C++ code. Instead, the program can have as many `svbool_t` objects
as it needs, and it is the compiler's responsibility to manage the
register allocation.

However, there are some pieces of architectural state for which this
approach is not suitable. For example, [SME's ZA](#za-storage) is a
single piece of storage: there are not multiple ZAs, and so it does
not make sense for a C or C++ function to have multiple ZA objects.
It would also be inefficient to copy state from one ZA object to another.

ACLE models this kind of architectural state using [keyword
attributes](#keyword-attributes) rather than types and objects.
The main purpose of these keyword attributes is to establish the following
binary choices for a given piece of architectural state S:

<span id="shares-state"></span><span id="uses-state"></span>

1.  A function with a given type either shares S with its caller,
    or it does not.

2.  A given function definition either uses S internally, or it does not.

A function definition that shares S with its caller also (implicitly) uses
S internally.

<span id="new-state-scope"></span>

A function definition that uses S internally but does not share S with
its caller is said to create a “new scope” for S.

ACLE uses strings to identify each piece of state that is managed in
this way. The strings are listed in the table below.

<span id="state-strings"></span>

| **String** | **State**          | **State macro**   | **Feature macro**    |
| ---------- | ------------------ | ----------------- | -------------------- |
| `"za"`     | SME's ZA storage   | `__ARM_STATE_ZA`  | `__ARM_FEATURE_SME`  |
| `"zt0"`    | SME2's ZT0         | `__ARM_STATE_ZT0` | `__ARM_FEATURE_SME2` |

For each string, there are two associated macros:

*   a so-called “state macro” that compilers predefine if they recognize
    the string

*   a so-called “feature macro” that compilers predefine if they can compile
    functions that use the state

A compiler that predefines the feature macro must also predefine the
state macro.

For example, `__ARM_STATE_ZA` allows declarations of functions that share ZA.
`__ARM_FEATURE_SME` allows function definitions to use ZA internally.

The strings are case-sensitive. For example, `"za"` cannot be written `"ZA"`.

## Ways of sharing state

ACLE identifies several different ways in which a callee can share
state with its caller. Each one has an associated [keyword
attribute](#keyword-attributes):

*   `__arm_in`: the callee takes the state as input and returns with
    the state unchanged. This is similar to a const reference in C++.

*   `__arm_out`: the callee ignores the incoming state and returns new state.
    This is similar to a function return value.

*   `__arm_inout`: the callee takes the state as input and returns new state.
    This is similar to a non-const reference in C++.

*   `__arm_preserves`: the callee does not read the incoming state and
    returns with the state unchanged.

Each keyword attribute takes a comma-separated list of state strings as
an argument. The list must be non-empty.

For example:

``` c
   void f() __arm_inout("za") __arm_preserves("zt0");
```

says that `f` uses ZA to receive data from callers and to pass data
back to callers. `f` also promises to preserve the contents of ZT0.

A program is [ill-formed](#ill-formed) if a function type has two
attributes that specify different behavior for the same piece of state.
For example, a program is ill-formed if a function type has both
`__arm_in("za")` and `__arm_out("za")`, or both `__arm_in("za")`
and `__arm_inout("za")`.

The same information may be specified multiple times. For example:

``` c
  void f() __arm_in("za", "za") __arm_in("za");
```

is well-formed.

Two function types are incompatible if they handle a piece of
architectural state differently. For example:

``` c
   void f1() __arm_in("za");
   void f2() __arm_out("za");
   void f3() __arm_inout("za");
   void f4() __arm_preserves("za");
   void f5();

   void (*ptr1)() __arm_in("za");
   void (*ptr2)() __arm_out("za");
   void (*ptr3)() __arm_inout("za");
   void (*ptr4)() __arm_preserves("za");
   void (*ptr5)();

   void test() {
     ptr1 = f1;    // OK
     ptr2 = f1;    // Invalid
     ptr3 = f1;    // Invalid
     ptr4 = f1;    // Invalid
     ptr5 = f1;    // Invalid

     ptr1 = f2;    // Invalid
     ptr2 = f2;    // OK
     ptr3 = f2;    // Invalid
     ptr4 = f2;    // Invalid
     ptr5 = f2;    // Invalid

     ptr1 = f3;    // Invalid
     ptr2 = f3;    // Invalid
     ptr3 = f3;    // OK
     ptr4 = f3;    // Invalid
     ptr5 = f3;    // Invalid

     ptr1 = f4;    // Invalid
     ptr2 = f4;    // Invalid
     ptr3 = f4;    // Invalid
     ptr4 = f4;    // OK
     ptr5 = f4;    // Invalid

     ptr1 = f5;    // Invalid
     ptr2 = f5;    // Invalid
     ptr3 = f5;    // Invalid
     ptr4 = f5;    // Invalid
     ptr5 = f5;    // OK
   }
```

`__arm_in` and `__arm_preserves` both guarantee that a function leaves
the contents of the state unchanged on return. Functions are not
[ill-formed](#ill-formed) if they write to such state, but they must ensure
that the cumulative effect of such writes is to leave the state unchanged.

A program is [ill-formed](#ill-formed) if a function that does not [use
state](#uses-state) S contains a call to a function that shares S with
its caller. This is conceptually similar to an undefined variable in
C. For example:

``` c
   void callee() __arm_inout("za");
   void caller() {
     callee(); // Ill-formed, caller does not use ZA
   }
```

If a C or C++ function F [uses state](#uses-state) S internally and calls
a function F2 that does not share S with its callers, the call to F2 has
no effect on F's S state. The compiler must ensure this by [restoring
the old contents of S](#za-implementation-notes) after the call to F2,
if such a restoration is necessary. For example:

``` c
   void za_callee() __arm_inout("za");
   void za_caller() __arm_inout("za") {
     za_callee();
     printf("Here\n"); // Does not change za_caller's ZA state
     za_callee();
   }
```

## Mapping to the Procedure Call Standard

[[AAPCS64]](#AAPCS64) classifies functions as having one of the following
interfaces:

<span id="private-za"></span>

*   a “private-ZA” interface

*   a “shared-ZA” interface

If a C or C++ function F forms part of the object code's ABI, that
object code function has a shared-ZA interface if and only if at least
one of the following is true:

*   F shares ZA with its caller

*   F shares ZT0 with its caller

All other functions have a private-ZA interface.

## Function definitions

<span id="arm_new"></span>

The [keyword attribute](#keyword-attributes) `__arm_new(...)`
applies to function definitions. It specifies that the function
creates a [new scope](#new-state-scope) for the given state. `...` is a
comma-separated list of [state strings](#state-strings). The list
must be non-empty.

Each piece of state specified by `__arm_new` is zero-initialized.

This attribute does not change a function's binary interface. If the
function forms part of the object code's ABI, that object code function
has the same interface as it would have had without `__arm_new`.

A program is [ill-formed](#ill-formed) if a function definition F
uses `__arm_new` for some state that F also [shares](#shares-state)
with its caller. For example:

``` c
  __arm_new("za") void f1() __arm_in("za") { ... }     // Invalid
  __arm_new("za") void f2() __arm_out("za") { ... }    // Invalid
  __arm_new("za") void f3() __arm_inout("za") { ... }  // Invalid
  __arm_new("za") void f4() __arm_inout("zt0") { ... } // OK
  __arm_new("zt0") void f5() __arm_inout("za") { ... } // OK
```

## Inline assembly

Some ACLE implementations might support the GNU inline asm extension.
For implementations that do, suppose that an inline asm occurs in a
function F that [uses state](#uses-state) S. There are then two
possibilities:

*   S is not an input to the asm and S is not an output from the asm.
    The contents of S immediately after executing the asm's instructions
    are the same as the contents of S immediately before executing the
    instructions. This is the default assumption.

*   S might be an input to the asm, might be an output from the asm,
    and might be changed by the asm's instructions. This is indicated by
    adding S's string to the asm's clobber list. For example, if an asm's
    clobber list includes `"za"`, ZA might be an input to the asm,
    an output from the asm, or something that the asm changes.

If instead the inline asm occurs in a function that does not [use
state](#uses-state) S, the two possibilities are:

*   S is not an input to the asm and S is not an output from the asm.
    The contents of S immediately after executing the asm's instructions
    are the same as the contents of S immediately before executing the
    instructions. This is the default assumption.

*   S is not an input to the asm and S is not an output from the asm.
    However, the contents of S after executing the asm's instructions might
    be different from the contents of S before executing the instructions.
    This is indicated by adding S's string to the asm's clobber list.

    If an asm takes this option for state that is controlled by PSTATE.ZA,
    the asm itself is responsible for handling the [[AAPCS64]](#AAPCS64)
    lazy save scheme.

[[AAPCS64]](#AAPCS64) defines three possible states for ZA:
“off”, “dormant” or “active”. These states describe the values
of two things:

*   the PSTATE.ZA bit

*   the TPIDR2_EL0 register

ZA is guaranteed to be active on entry to an inline asm A in a
function F if at least one of the following is true:

*   F [uses `"za"`](#uses-state) and A's clobber list includes `"za"`.

*   F [uses `"zt0"`](#uses-state) and A's clobber list includes `"zt0"`.

Otherwise, ZA can be in any state on entry to A if at least one of the
following is true:

*   F [uses](#uses-state) `"za"`

*   F [uses](#uses-state) `"zt0"`

Otherwise, ZA can be off or dormant on entry to A, as for what AAPCS64
calls “private-ZA” functions.

If ZA is active on entry to A then A's instructions must ensure that
ZA is also active when the asm finishes.

Similarly, if ZA is off on entry to A then A's instructions must ensure
that ZA is off when the asm finishes.

If ZA is dormant on entry to A and A's clobber list does not include `"za"`,
A's instructions must ensure that ZA is dormant when the asm finishes.

Otherwise, if ZA is dormant on entry to A and A's clobber list
includes `"za"`, A's instructions can leave ZA unchanged or in
the off state (A's choice).  In the latter case, A's instructions
must commit the lazy save that was pending on entry to A.

The table below summarizes the possible ZA states on entry to an
inline asm A in a function F. It also specifies what the state
is required to be when A finishes; it is the asm's responsibility
to ensure this. Since PSTATE.ZA controls both ZA and ZT0, the rules
depend on ZT0 as well as ZA.

| **ZA state before A** | **ZA state after A** | **Possible if…**                       |
| --------------------- | -------------------- | -------------------------------------- |
| off                   | off                  | F's uses and A's clobbers are disjoint |
| dormant               | dormant              | " " "                                  |
| dormant               | off                  | " " ", and A clobbers `"za"`           |
| active                | active               | F uses `"za"` and/or `"zt0"`           |

The [`__ARM_STATE` macros](#state-strings) indicate whether a compiler
is guaranteed to support a particular clobber string. For example,
the following code is a safe way to indicate that an asm might commit
a lazy ZA save:

``` c
  // Function foo doesn't use ZA or ZT0.
  void foo() {
    ...
    asm volatile("bl something"
                 ::: ...call-clobbered registers...
#ifdef __ARM_STATE_ZA
                     , "za"
#endif
                );
    ...
  }
```

## Implementation notes

<span id="za-implementation-notes"></span>

A piece of state S can be said to be “live” at a point P during the
execution of a function F if:

*   F [uses](#uses-state) S; and

*   a random, exogenous change to S at P could change the behavior
    of the program.

If S is live before a call from F to a function F2 that does not share S
with its caller, the compiler must arrange for S to be preserved around
the call to F2. One way to do this is to save S before the call and
restore it afterwards. However, if S is ZA and F2 is a private-ZA
function, the compiler can instead make use of the lazy-save scheme
described in [[AAPCS64]](#AAPCS64).

For example, the code below shows a function that uses ZA and ZT0
internally. The comments describe when ZA should be saved and restored:

``` c
  void f_shares_zt0() __arm_inout("zt0");
  void f_shares_za() __arm_inout("za");
  void f_private();

  void setup_za() __arm_out("za");
  void use_za() __arm_in("za");

  __arm_new("za", "zt0") void test() {
    f_private();     // ZA is not live, no save necessary

    setup_za();      // ZA is live after this call
    f_shares_zt0();  // The compiler should save and restore ZA
                     // around the call ("caller-save")
    f_shares_za();   // ZA is live before and after this call
    f_private();     // The compiler should preserve ZA across the call
                     // It can use the lazy-save mechanism
    use_za();        // ZA is no longer live after this call

    f_private();     // ZA is not live, no save necessary
  }
```

ZT0 cannot be saved lazily, so if ZT0 is live before a call to a
function that does not share ZT0, the compiler must save and restore
ZT0 around the call. For example:

``` c
  void setup_zt0() __arm_out("zt0");
  void use_zt0() __arm_in("zt0");
  void f_private();

  __arm_new("zt0") void test() {
    f_private();     // ZT0 is not live, no save necessary

    setup_zt0();     // ZT0 is live after this call
    f_private();     // The compiler should save and restore ZT0
                     // around the call ("caller-save")
    use_zt0();       // ZT0 is no longer live after this call

    f_private();     // ZT0 is not live, no save necessary
  }
```

# System register access

## Special register intrinsics

Intrinsics are provided to read and write system and coprocessor
registers, collectively referred to as special register.

``` c
  uint32_t __arm_rsr(const char *special_register);
```

Reads a 32-bit system register.

``` c
  uint64_t __arm_rsr64(const char *special_register);
```

Reads a 64-bit system register.

``` c
  __uint128_t __arm_rsr128(const char *special_register);
```

Reads a 128-bit system register. Only available if `__ARM_FEATURE_SYSREG128` is
defined to 1.

``` c
  void* __arm_rsrp(const char *special_register);
```

Reads a system register containing an address.

``` c
  float __arm_rsrf(const char *special_register);
```

Reads a 32-bit coprocessor register containing a floating point value.

``` c
  double __arm_rsrf64(const char *special_register);
```

Reads a 64-bit coprocessor register containing a floating point value.

``` c
  void __arm_wsr(const char *special_register, uint32_t value);
```

Writes a 32-bit system register.

``` c
  void __arm_wsr64(const char *special_register, uint64_t value);
```

Writes a 64-bit system register.

``` c
  void __arm_wsr128(const char *special_register, __uint128_t value);
```

Writes a 128-bit system register. Only available if `__ARM_FEATURE_SYSREG128` is
defined to 1.

``` c
  void __arm_wsrp(const char *special_register, const void *value);
```

Writes a system register containing an address.

``` c
  void __arm_wsrf(const char *special_register, float value);
```

Writes a floating point value to a 32-bit coprocessor register.

``` c
  void __arm_wsrf64(const char *special_register, double value);
```

Writes a floating point value to a 64-bit coprocessor register.

## Special register designations

The `special_register` parameter must be a compile time string literal.
This means that the implementation can determine the register being
accessed at compile-time and produce the correct instruction without
having to resort to self-modifying code. All register specifiers are
case-insensitive (so "apsr" is equivalent to "APSR"). The string literal
should have one of the forms described below.

### AArch32 32-bit coprocessor register

When specifying a 32-bit coprocessor register to `__arm_rsr`,
`__arm_rsrp`, `__arm_rsrf`, `__arm_wsr`, `__arm_wsrp`, or
`__arm_wsrf`:

``` c
  cp<coprocessor>:<opc1>:c<CRn>:c<CRm>:<opc2>
```

Or (equivalently):

``` c
  p<coprocessor>:<opc1>:c<CRn>:c<CRm>:<opc2>
```

Where:

* `<coprocessor>` is a decimal integer in the range `[0, 15]`
* `<opc1>`, `<opc2>` are decimal integers in the range `[0, 7]`
* `<CRn>`, `<CRm>` are decimal integers in the range `[0, 15]`.

The values of the register specifiers will be as described in [[ARMARM]](#ARMARM)
or the Technical Reference Manual (TRM) for the specific processor.

So to read MIDR:

``` c
  unsigned int midr = __arm_rsr("cp15:0:c0:c0:0");
```

ACLE does not specify predefined strings for the system coprocessor
register names documented in the Arm Architecture Reference Manual (for example “ MIDR ”).

### AArch32 32-bit system register

When specifying a 32-bit system register to `__arm_rsr`, `__arm_rsrp`,
`__arm_wsr`, or `__arm_wsrp`, one of:

* The values accepted in the `spec_reg` field of the MRS
  instruction [[ARMARM]](#ARMARM) (B6.1.5), for example CPSR.
* The values accepted in the  `spec_reg` field of the MSR
  (immediate) instruction [[ARMARM]](#ARMARM) (B6.1.6).
* The values accepted in the `spec_reg` field of the VMRS
  instruction [[ARMARM]](#ARMARM) (B6.1.14), for example FPSID.
* The values accepted in the `spec_reg` field of the VMSR
  instruction [[ARMARM]](#ARMARM) (B6.1.15), for example FPSCR.
* The values accepted in the `spec_reg` field of the MSR and MRS
  instructions with virtualization extensions [[ARMARM]](#ARMARM)  (B1.7), for example
  `ELR_Hyp`.
* The values specified in Special register encodings used in
  Armv7-M  system instructions. [[ARMv7M]](#ARMv7M) (B5.1.1), for example  PRIMASK.

### AArch32 64-bit coprocessor register

When specifying a 64-bit coprocessor register to `__arm_rsr64`,
`__arm_rsrf64`, `__arm_wsr64`, or `__arm_wsrf64`

``` c
  cp<coprocessor>:<opc1>:c<CRm>
```

Or (equivalently):

``` c
  p<coprocessor>:<opc1>:c<Rm>
```

Where:

* `<coprocessor>` is a decimal  integer in the range `[0, 15]`
* `<opc1>` is a decimal integer in  the range `[0, 7]`
* `<CRm>` is a decimal integer in the  range `[0, 15]`

### AArch64 system register

When specifying a system register to `__arm_rsr`, `__arm_rsr64`, `__arm_rsr128`,
`__arm_rsrp`, `__arm_wsr`, `__arm_wsr64`,`__arm_wsr128` or `__arm_wsrp`:

``` c
  "o0:op1:CRn:CRm:op2"
```

Where:

* `<o0>` is a decimal integer in the range `[0, 3]`
* `<op1>`, `<op2>` are decimal integers in the range `[0, 7]`
* `<CRm>`, `<CRn>` are decimal integers in the range `[0, 15]`

### AArch64 processor state field

When specifying a processor state field to `__arm_rsr`, `__arm_rsp`,
`__arm_wsr`, or `__arm_wsrp`, one of the values accepted in the
pstatefield of the MSR (immediate) instruction [[ARMARMv8]](#ARMARMv8) (C5.6.130).

## Coprocessor Intrinsics

### AArch32 coprocessor intrinsics

In the intrinsics below `coproc`, `opc1`, `opc2`, `CRn` and `CRd` are
all compile time integer constants with appropriate values as defined by the
coprocessor for the intended architecture.

The argument order for all intrinsics is the same as the operand order for the
instruction as described in the Arm Architecture Reference Manual, with the exception of `MRC`/
`MRC2`/ `MRRC`/`MRRC2` which omit the Arm register arguments and instead
returns a value and `MCRR`/`MCRR2` which accepts a single 64 bit unsigned
integer instead of two 32-bit unsigned integers.

### AArch32 Data-processing coprocessor intrinsics

Intrinsics are provided to create coprocessor data-processing
instructions as follows:

| **Intrinsics**                                        | **Equivalent Instruction**             |
| ----------------------------------------------------- | -------------------------------------- |
| void __arm_cdp(coproc, opc1, CRd, CRn, CRm, opc2)     | CDP coproc, opc1, CRd, CRn, CRm, opc2  |
| void __arm_cdp2(coproc, opc1, CRd, CRn, CRm, opc2)    | CDP2 coproc, opc1, CRd, CRn, CRm, opc2 |

#### AArch32 Memory coprocessor transfer intrinsics

Intrinsics are provided to create coprocessor memory transfer
instructions as follows:

| **Intrinsics**                                   | **Equivalent Instruction** |
| ------------------------------------------------ | -------------------------- |
| void __arm_ldc(coproc, CRd, const void* p)       | LDC coproc, CRd, [...]     |
| void __arm_ldcl(coproc, CRd, const void* p)      | LDCL coproc, CRd, [...]    |
| void __arm_ldc2(coproc, CRd, const void* p)      | LDC2 coproc, CRd, [...]    |
| void __arm_ldc2l(coproc, CRd, const void* p)     | LDC2L coproc, CRd, [...]   |
| void __arm_stc(coproc, CRd, void* p)             | STC coproc, CRd, [...]     |
| void __arm_stcl(coproc, CRd, void* p)            | STCL coproc, CRd, [...]    |
| void __arm_stc2(coproc, CRd, void* p)            | STC2 coproc, CRd, [...]    |
| void __arm_stc2l(coproc, CRd, void* p)           | STC2L coproc, CRd, [...]   |

### AArch32 Integer to coprocessor transfer intrinsics

Intrinsics are provided to map to coprocessor to core register transfer
instructions as follows:

| **Intrinsics**                                                    | **Equivalent Instruction**            |
| ----------------------------------------------------------------- | ------------------------------------- |
| void __arm_mcr(coproc, opc1, uint32_t value, CRn, CRm, opc2)      | MCR coproc, opc1, Rt, CRn, CRm, opc2  |
| void __arm_mcr2(coproc, opc1, uint32_t value, CRn, CRm, opc2)     | MCR2 coproc, opc1, Rt, CRn, CRm, opc2 |
| uint32_t __arm_mrc(coproc, opc1, CRn, CRm, opc2)                  | MRC coproc, opc1, Rt, CRn, CRm, opc2  |
| uint32_t __arm_mrc2(coproc, opc1, CRn, CRm, opc2)                 | MRC2 coproc, opc1, Rt, CRn, CRm, opc2 |
| void __arm_mcrr(coproc, opc1, uint64_t value, CRm)                | MCRR coproc, opc1, Rt, Rt2, CRm       |
| void __arm_mcrr2(coproc, opc1, uint64_t value, CRm)               | MCRR2 coproc, opc1, Rt, Rt2, CRm      |
| uint64_t __arm_mrrc(coproc, opc1, CRm)                            | MRRC coproc, opc1, Rt, Rt2, CRm       |
| uint64_t __arm_mrrc2(coproc, opc1, CRm)                           | MRRC2 coproc, opc1, Rt, Rt2, CRm      |

The intrinsics `__arm_mcrr`/`__arm_mcrr2` accept a single unsigned 64-bit
integer value instead of two 32-bit integers.  The low half of the value goes
in register `Rt` and the high half goes in `Rt2`.  Likewise for
`__arm_mrrc`/`__arm_mrrc2` which return an unsigned 64-bit integer.

## Unspecified behavior

ACLE does not specify how the implementation should behave in the
following cases:

* When merging multiple reads/writes of the same register.

* When writing to a read-only register, or a register that is
  undefined on the architecture being compiled for.

* When reading or writing to a register which the implementation
  models by some other means (this covers – but is not limited to –
  reading/writing cp10 and cp11 registers when VFP is enabled, and
  reading/writing the CPSR).

* When reading or writing a register using one of these
  intrinsics with an inappropriate type for the value being read or
  written to.

* When writing to a coprocessor register that carries out a 
  "System operation".

* When using a register specifier which doesn't apply to the
  targetted architecture.

# Instruction generation

## Instruction generation, arranged by instruction

The following table indicates how instructions may be generated by
intrinsics, and/or C code. The table includes integer data processing
and certain system instructions.

Compilers are encouraged to use opportunities to combine instructions,
or to use shifted/rotated operands where available. In general,
intrinsics are not provided for accumulating variants of instructions in
cases where the accumulation is a simple addition (or subtraction)
following the instruction.

The table indicates which architectures the instruction is supported on,
as follows:

Architecture 8 means Armv8-A AArch32 and AArch64, 8-32
means Armv8-AArch32 only.  8-64 means Armv8-AArch64 only.

Architecture 7 means Armv7-A and Armv7-R.

In the sequence of Arm architectures { 5, 5TE, 6, 6T2, 7 }
each architecture includes its predecessor instruction set.

In the sequence of Thumb-only architectures { 6-M, 7-M, 7E-M }
each architecture includes its predecessor instruction set.

7MP are the Armv7 architectures that implement the Multiprocessing Extensions.

| **Instruction** | **Flags** | **Arch.**     | **Intrinsic or C code**                               |
| --------------- | --------- | ------------- | ----------------------------------------------------- |
| BKPT            |           | 5             | none                                                  |
| BFC             |           | 6T2, 7-M      | C                                                     |
| BFI             |           | 6T2, 7-M      | C                                                     |
| CLZ             |           | 5             | `__clz`, `__builtin_clz`                              |
| DBG             |           | 7, 7-M        | `__dbg`                                               |
| DMB             |           | 8,7, 6-M      | `__dmb`                                               |
| DSB             |           | 8, 7, 6-M     | `__dsb`                                               |
| FRINT32Z        |           | 8-64          | `__rint32zf`, `__rint32z`                             |
| FRINT64Z        |           | 8-64          | `__rint64zf`, `__rint64z`                             |
| FRINT32X        |           | 8-64          | `__rint32xf`, `__rint32x`                             |
| FRINT64X        |           | 8-64          | `__rint64xf`, `__rint64x`                             |
| ISB             |           | 8, 7, 6-M     | `__isb`                                               |
| LDREX           |           | 6, 7-M        | `__sync_xxx`                                          |
| LDRT            |           | all           | none                                                  |
| MCR/MRC         |           | all           | see [System register access](#system-register-access) |
| MSR/MRS         |           | 6-M           | see [System register access](#system-register-access) |
| MSRR/MRRS       |           | 8-64          | see [System register access](#system-register-access) |
| PKHBT           |           | 6             | C                                                     |
| PKHTB           |           | 6             | C                                                     |
| PLD             |           | 8-32,5TE, 7-M | `__pld`                                               |
| PLDW            |           | 7-MP          | `__pldx`                                              |
| PLI             |           | 8-32,7        | `__pli`                                               |
| QADD            | Q         | 5E, 7E-M      | `__qadd`                                              |
| QADD16          |           | 6, 7E-M       | `__qadd16`                                            |
| QADD8           |           | 6, 7E-M       | `__qadd8`                                             |
| QASX            |           | 6, 7E-M       | `__qasx`                                              |
| QDADD           | Q         | 5E, 7E-M      | `__qadd(__qdbl)`                                      |
| QDSUB           | Q         | 5E, 7E-M      | `__qsub(__qdbl)`                                      |
| QSAX            |           | 6, 7E-M       | `__qsax`                                              |
| QSUB            | Q         | 5E, 7E-M      | `__qsub`                                              |
| QSUB16          |           | 6, 7E-M       | `__qsub16`                                            |
| QSUB8           |           | 6, 7E-M       | `__qsub8`                                             |
| RBIT            |           | 8,6T2, 7-M    | `__rbit`, `__builtin_rbit`                            |
| REV             |           | 8,6, 6-M      | `__rev`, `__builtin_bswap32`                          |
| REV16           |           | 8,6, 6-M      | `__rev16`                                             |
| REVSH           |           | 6, 6-M        | `__revsh`                                             |
| ROR             |           | all           | `__ror`                                               |
| SADD16          | GE        | 6, 7E-M       | `__sadd16`                                            |
| SADD8           | GE        | 6, 7E-M       | `__sadd8`                                             |
| SASX            | GE        | 6, 7E-M       | `__sasx`                                              |
| SBFX            |           | 8,6T2, 7-M    | C                                                     |
| SDIV            |           | 7-M+          | C                                                     |
| SEL             | (GE)      | 6, 7E-M       | `__sel`                                               |
| SETEND          |           | 6             | n/a                                                   |
| SEV             |           | 8,6K,6-M,7-M  | `__sev`                                               |
| SHADD16         |           | 6, 7E-M       | `__shadd16`                                           |
| SHADD8          |           | 6, 7E-M       | `__shadd8`                                            |
| SHASX           |           | 6, 7E-M       | `__shasx`                                             |
| SHSAX           |           | 6, 7E-M       | `__shsax`                                             |
| SHSUB16         |           | 6, 7E-M       | `__shsub16`                                           |
| SHSUB8          |           | 6, 7E-M       | `__shsub8`                                            |
| SMC             |           | 8,6Z, T2      | none                                                  |
| SMI             |           | 6Z, T2        | none                                                  |
| SMLABB          | Q         | 5E, 7E-M      | `__smlabb`                                            |
| SMLABT          | Q         | 5E, 7E-M      | `__smlabt`                                            |
| SMLAD           | Q         | 6, 7E-M       | `__smlad`                                             |
| SMLADX          | Q         | 6, 7E-M       | `__smladx`                                            |
| SMLAL           |           | all, 7-M      | C                                                     |
| SMLALBB         |           | 5E, 7E-M      | `__smulbb` and C                                      |
| SMLALBT         |           | 5E, 7E-M      | `__smulbt` and C                                      |
| SMLALTB         |           | 5E, 7E-M      | `__smultb` and C                                      |
| SMLALTT         |           | 5E, 7E-M      | `__smultt` and C                                      |
| SMLALD          |           | 6, 7E-M       | `__smlald`                                            |
| SMLALDX         |           | 6, 7E-M       | `__smlaldx`                                           |
| SMLATB          | Q         | 5E, 7E-M      | `__smlatb`                                            |
| SMLATT          | Q         | 5E, 7E-M      | `__smlatt`                                            |
| SMLAWB          | Q         | 5E, 7E-M      | `__smlawb`                                            |
| SMLAWT          | Q         | 5E, 7E-M      | `__smlawt`                                            |
| SMLSD           | Q         | 6, 7E-M       | `__smlsd`                                             |
| SMLSDX          | Q         | 6, 7E-M       | `__smlsdx`                                            |
| SMLSLD          |           | 6, 7E-M       | `__smlsld`                                            |
| SMLSLDX         |           | 6, 7E-M       | `__smlsldx`                                           |
| SMMLA           |           | 6, 7E-M       | C                                                     |
| SMMLAR          |           | 6, 7E-M       | C                                                     |
| SMMLS           |           | 6, 7E-M       | C                                                     |
| SMMLSR          |           | 6, 7E-M       | C                                                     |
| SMMUL           |           | 6, 7E-M       | C                                                     |
| SMMULR          |           | 6, 7E-M       | C                                                     |
| SMUAD           | Q         | 6, 7E-M       | `__smuad`                                             |
| SMUADX          | Q         | 6, 7E-M       | `__smuadx`                                            |
| SMULBB          |           | 5E, 7E-M      | `__smulbb;` C                                         |
| SMULBT          |           | 5E, 7E-M      | `__smulbt` ; C                                        |
| SMULTB          |           | 5E, 7E-M      | `__smultb;` C                                         |
| SMULTT          |           | 5E, 7E-M      | `__smultt;` C                                         |
| SMULL           |           | all, 7-M      | C                                                     |
| SMULWB          |           | 5E, 7E-M      | `__smulwb;` C                                         |
| SMULWT          |           | 5E, 7E-M      | `__smulwt;` C                                         |
| SMUSD           |           | 6, 7E-M       | `__smusd`                                             |
| SMUSDX          |           | 6, 7E-M       | `__smusd`                                             |
| SSAT            | Q         | 6, 7-M        | `__ssat`                                              |
| SSAT16          | Q         | 6, 7E-M       | `__ssat16`                                            |
| SSAX            | GE        | 6, 7E-M       | `__ssax`                                              |
| SSUB16          | GE        | 6, 7E-M       | `__ssub16`                                            |
| SSUB8           | GE        | 6, 7E-M       | `__ssub8`                                             |
| STREX           |           | 6, 7-M        | `__sync_xxx`                                          |
| STRT            |           | all           | none                                                  |
| SVC             |           | all           | none                                                  |
| SWP             |           | A32 only      | `__swp` [deprecated; see [Swap](#swap)]               |
| SXTAB           |           | 6, 7E-M       | `(int8_t)x` + a                                       |
| SXTAB16         |           | 6, 7E-M       | `__sxtab16`                                           |
| SXTAH           |           | 6, 7E-M       | `(int16_t)x` + a                                      |
| SXTB            |           | 8,6, 6-M      | `(int8_t)x`                                           |
| SXTB16          |           | 6, 7E-M       | `__sxtb16`                                            |
| SXTH            |           | 8,6, 6-M      | `(int16_t)x`                                          |
| UADD16          | GE        | 6, 7E-M       | `__uadd16`                                            |
| UADD8           | GE        | 6, 7E-M       | `__uadd8`                                             |
| UASX            | GE        | 6, 7E-M       | `__uasx`                                              |
| UBFX            |           | 8,6T2, 7-M    | C                                                     |
| UDIV            |           | 7-M+          | C                                                     |
| UHADD16         |           | 6, 7E-M       | `__uhadd16`                                           |
| UHADD8          |           | 6, 7E-M       | `__uhadd8`                                            |
| UHASX           |           | 6, 7E-M       | `__uhasx`                                             |
| UHSAX           |           | 6, 7E-M       | `__uhsax`                                             |
| UHSUB16         |           | 6, 7E-M       | `__uhsub16`                                           |
| UHSUB8          |           | 6, 7E-M       | `__uhsub8`                                            |
| UMAAL           |           | 6, 7E-M       | C                                                     |
| UMLAL           |           | all, 7-M      | `acc += (uint64_t)x * y`                              |
| UMULL           |           | all, 7-M      | C                                                     |
| UQADD16         |           | 6, 7E-M       | `__uqadd16`                                           |
| UQADD8          |           | 6, 7E-M       | `__uqadd8`                                            |
| UQASX           |           | 6, 7E-M       | `__uqasx`                                             |
| UQSAX           |           | 6, 7E-M       | `__uqsax`                                             |
| UQSUB16         |           | 6, 7E-M       | `__uqsub16`                                           |
| UQSUB8          |           | 6, 7E-M       | `__uqsub8`                                            |
| USAD8           |           | 6, 7E-M       | `__usad8`                                             |
| USADA8          |           | 6, 7E-M       | `__usad8 + acc`                                       |
| USAT            | Q         | 6, 7-M        | `__usat`                                              |
| USAT16          | Q         | 6, 7E-M       | `__usat16`                                            |
| USAX            |           | 6, 7E-M       | `__usax`                                              |
| USUB16          |           | 6, 7E-M       | `__usub16`                                            |
| USUB8           |           | 6, 7E-M       | `__usub8`                                             |
| UXTAB           |           | 6, 7E-M       | `(uint8_t)x + i`                                      |
| UXTAB16         |           | 6, 7E-M       | `__uxtab16`                                           |
| UXTAH           |           | 6, 7E-M       | `(uint16_t)x + i`                                     |
| UXTB16          |           | 6, 7E-M       | `__uxtb16`                                            |
| UXTH            |           | 8,6, 6-M      | `(uint16_t)x`                                         |
| VFMA            |           | VFPv4         | `fma`, `__fma`                                        |
| VSQRT           |           | VFP           | `sqrt`, `__sqrt`                                      |
| WFE             |           | 8,6K, 6-M     | `__wfe`                                               |
| WFI             |           | 8,6K, 6-M     | `__wfi`                                               |
| YIELD           |           | 8,6K, 6-M     | `__yield`                                             |

# About FP8 intrinsics

The specification for FP8 intrinsics is in
[**Alpha** state](#current-status-and-anticipated-changes).

Each 8-bit floating point intrinsic call has a parameter to define the format
and scale of the operands, and the overflow behavior, as applicable to each
operation. This parameter is typically declared as `fpm_t fpm`.

```c
  typedef uint64_t fpm_t;
```

The bits of an argument to an `fpm` parameter are interpreted as follows:

| **Bit range** | **Name**       | **Meaning**                                                        |
| ------------- | -------------- | ------------------------------------------------------------------ |
| 0-2           | `src1_format`  | first source operand format:  0 - FP8 E5M2, 1 - FP8 E4M3           |
| 3-5           | `src2_format`  | second source operand format: 0 - FP8 E5M2, 1 - FP8 E4M3           |
| 6-8           | `dst_format`   | destination format: 0  - FP8 E5M2, 1 - FP8 E4M3                    |
| 9-13          |                | must be zero                                                       |
| 14            | `overflow_mul` | overflow behavior for multiplication instructions:                 |
|               |                |   0 - generate infinity, 1 - generate maximum normal number        |
| 15            | `overflow_cvt` | overflow behavior for conversion instructions:                     |
|               |                |   0 - generate infinity or NaN, 1 - generate maximum normal number |
| 16-22         | `lscale`       | downscaling value                                                  |
| 23            |                | must be zero                                                       |
| 24-31         | `nscale`       | scaling value for conversions                                      |
| 32-37         | `lscale2`      | downscaling value for conversions of the second input stream       |
| 38-63         |                | must be zero                                                       |

Bit patterns other than as described above are invalid. Passing an invalid value as an argument
to an FP8 intrinsic results in undefined behavior.

The ACLE declares several helper types and intrinsics to
facilitate construction of `fpm` arguments. The helper intrinsics do not have
side effects and their return values depend only on their parameters.

Passing an out of range argument to a helper intrinsic results in the intrinsic
returning an indeterminate value. Passing such an indeterminate value as
an argument to an FP8 intrinsic results in undefined behavior.

The helper types and intrinsics are available after including any of
[`<arm_neon.h>`](#arm_neon.h), [`<arm_sve.h>`](#arm_sve.h), or
[`<arm_sme.h>`](#arm_sme.h).

Note: where a helper intrinsic description refers to "updating the FP8 mode" it
means the intrinsic only modifies the bits of the input `fpm_t` parameter that
correspond to the new mode and returns the resulting value. No side effects
(such as changing processor state) occur.

Individual FP8 intrinsics are described in their respective
Advanced SIMD (NEON), SVE, and SME sections.

## Support enumerations

```c
enum __ARM_FPM_FORMAT {
  __ARM_FPM_E5M2,
  __ARM_FPM_E4M3,
};

enum __ARM_FPM_OVERFLOW {
  __ARM_FPM_INFNAN,
  __ARM_FPM_SATURATE,
};
```

## Helper intrinsics

```c
  fpm_t __arm_fpm_init();
```
Initializes a value, suitable for use as an `fpm` argument ("FP8 mode").
The value corresponds to a mode of operation where:
  * The source and destination operands are interpreted as E5M2.
  * Overflow behavior is to yield infinity or NaN (depending on operation).
  * No scaling occurs.

```c
  fpm_t __arm_set_fpm_src1_format(fpm_t fpm, enum __ARM_FPM_FORMAT format);
  fpm_t __arm_set_fpm_src2_format(fpm_t fpm, enum __ARM_FPM_FORMAT format);
```
Updates the FP8 mode to set the first or the second source operand format,
respectively.

```c
  fpm_t __arm_set_fpm_dst_format(fpm_t fpm,  enum __ARM_FPM_FORMAT format);
```
Updates the FP8 mode to set the destination format.

```c
  fpm_t __arm_set_fpm_overflow_cvt(fpm_t fpm, enum __ARM_FPM_OVERFLOW behavior);
```
Updates the FP8 mode to set the overflow behavior for conversion operations.

``` c
  fpm_t __arm_set_fpm_overflow_mul(fpm_t fpm, enum __ARM_FPM_OVERFLOW behavior);
```
Updates the FP8 mode to set the overflow behavior for multiplicative
operations.

``` c
  fpm_t __arm_set_fpm_lscale(fpm_t fpm, uint64_t scale);
```
Updates the FP8 mode to set the downscaling value subtracted from:
* The product or the sum-of-products exponent, for multiplication instructions
  with FP8 operands.
* The result exponent, for instructions converting the first FP8
  input data stream to other floating-point formats.

The valid range for the `scale` parameter is [0, 127], inclusive.

``` c
  fpm_t __arm_set_fpm_lscale2(fpm_t fpm, uint64_t scale);
```
Updates the FP8 mode to set the downscaling value subtracted from the
result exponent for instructions converting the second FP8 input data
stream to other floating-point formats.

The valid range for the `scale` parameter is [0, 63], inclusive.

``` c
  fpm_t __arm_set_fpm_nscale(fpm_t fpm,  int64_t scale);
```
Updates the FP8 mode to set the scaling value added to the operand's
exponent for instructions converting other floating-point formats to an
FP8 format.

The valid range for the `scale` parameter is [-128, 127], inclusive.

# Advanced SIMD (Neon) intrinsics

## Introduction

The Advanced SIMD instructions provide packed Single Instruction
Multiple Data (SIMD) and single-element scalar operations on a range
of integer and floating-point types.

Neon is an implementation of the Advanced SIMD instructions which is
provided as an extension for some Cortex-A Series processors. Where this
document refers to Neon instructions, such instructions refer to the Advanced
SIMD instructions as described by the Arm Architecture Reference Manual
[[ARMARMv8]](#ARMARMv8).

The Advanced SIMD extension provides for arithmetic, logical and saturated
arithmetic operations on 8-bit, 16-bit and 32-bit integers (and sometimes
on 64-bit integers) and on 32-bit and 64-bit floating-point data, arranged
in 64-bit and 128-bit vectors.

The intrinsics in this section provide C and C++ programmers with a
simple programming model allowing easy access to code-generation of the
Advanced SIMD instructions for both AArch64 and AArch32 execution states.

<span id="neon-intrinsics-concepts"></span>

### Concepts

The Advanced SIMD instructions are designed to improve the performance of
multimedia and signal processing algorithms by operating on 64-bit or 128-bit
*vectors* of *elements* of the same *scalar* data type.

For example, `uint16x4_t` is a 64-bit vector type consisting of four
elements of the scalar `uint16_t` data type. Likewise, `uint16x8_t` is
a 128-bit vector type consisting of eight `uint16_t` elements.

In a vector programming model, operations are performed in parallel across
the elements of the vector. For example, `vmul_u16(a, b)` is a vector
intrinsic which takes two `uint16x4_t` vector arguments `a` and `b`,
and returns the result of multiplying corresponding elements from each vector
together.

The Advanced SIMD extension also provides support for *vector-by-lane*
and *vector-by-scalar* operations. In these operations, a scalar value
is extracted from one element of a vector input, or provided directly,
duplicated to create a new vector with the same number of elements as an
input vector, and an operation is performed in parallel between
this new vector and other input vectors.

For example, `vmul_lane_u16(a, b, 1)`, is a vector-by-lane intrinsic
which takes two `uint16x4_t` vector elements. From `b`, element
`1` is extracted, a new vector is formed which consists of four
copies of element `1` of `b`, and this new vector is multiplied by
`a`.

*Reduction*, *cross-lane*, and *pairwise* vector operations work on pairs
of elements within a vector, or across the whole of a single vector
performing the same operation between elements of that vector. For example,
`vaddv_u16(a)` is a reduction intrinsic which takes a `uint16x4_t`
vector, adds each of the four `uint16_t` elements together, and returns
a `uint16_t` result containing the sum.

### Vector data types

Vector data types are named as a lane type and a multiple. Lane type
names are based on the types defined in `<stdint.h>`. For example,
`int16x4_t` is a vector of four `int16_t` values. The base types are
`int8_t`, `uint8_t`, `int16_t`, `uint16_t`, `int32_t`, `uint32_t`,
`int64_t`, `uint64_t`, `float16_t`, `float32_t`, `poly8_t`, `poly16_t`,
`poly64_t`, `poly128_t`, and `bfloat16_t`. The multiples are such that the
resulting vector types are 64-bit and 128-bit. In AArch64, `float64_t`
and `mfloat8_t` are also base types.

Not all types can be used in all operations. Generally, the operations
available on a type correspond to the operations available on the
corresponding scalar type.

ACLE does not define whether `int64x1_t` is the same type as `int64_t`,
or whether `uint64x1_t` is the same type as `uint64_t`, or whether
`poly64x1_t` is the same as `poly64_t` for example for C++ overloading
purposes.

float16 types are only available when the `__fp16` type is defined, that is,
when supported by the hardware.

bfloat types are only available when the `__bf16` type is defined, that is,
when supported by the hardware. The bfloat types are all opaque types. That is,
they can only be used by intrinsics.

The FP8 types are all opaque types. That is, they can only be used by
intrinsics.

### Advanced SIMD Scalar data types

AArch64 supports Advanced SIMD scalar operations that work on standard
scalar data types viz. `int8_t`, `uint8_t`, `int16_t`, `uint16_t`,
`int32_t`, `uint32_t`, `int64_t`, `uint64_t`, `float32_t`,
`float64_t`.

### Vector array data types

Array types are defined for multiples of 2, 3 or 4 of all the vector
types, for use in load and store operations, in table-lookup operations,
and as the result type of operations that return a pair of vectors. For
a vector type `<type>_t` the corresponding array type is
`<type>x<length>_t`. Concretely, an array type is a structure containing
a single array element called val.

For example an array of two `int16x4_t` types is `int16x4x2_t`, and is
represented as

``` c
  struct int16x4x2_t { int16x4_t val[2]; };
```

Note that this array of two 64-bit vector types is distinct from the
128-bit vector type `int16x8_t`.

### Scalar data types

For consistency, `<arm_neon.h>` defines some additional scalar data types
to match the vector types.

`float32_t` is defined as an alias for `float`.

If the `__fp16` type is defined, `float16_t` is defined as an alias for
it.

If the `__bf16` type is defined, `bfloat16_t` is defined as an alias for it.

If the `__mfp8` type is defined, `mfloat8_t` is defined as an alias for it.

`poly8_t`, `poly16_t`, `poly64_t` and `poly128_t` are defined as
unsigned integer types. It is unspecified whether these are the same type as
`uint8_t`, `uint16_t`, `uint64_t` and `uint128_t` for overloading and
mangling purposes.

`float64_t` is defined as an alias for `double`.

<span id="16-bit-floating-point-arithmetic-scalar-intrinsics"></span>

### 16-bit floating-point arithmetic scalar intrinsics

The architecture extensions introduced by Armv8.2-A [[ARMARMv82]](#ARMARMv82) provide a set
of data processing instructions which operate on 16-bit floating-point
quantities. These instructions are available in both AArch64 and AArch32
execution states, for both Advanced SIMD and scalar floating-point values.

ACLE defines two sets of intrinsics which correspond to these data
processing instructions; a set of scalar intrinsics, and a set of
vector intrinsics.

The intrinsics introduced in this section use the data types defined
by ACLE. In particular, scalar intrinsics use the `float16_t` type
defined by ACLE as an alias for the `__fp16` type, and vector intrinsics
use the `float16x4_t` and `float16x8_t` vector types.

Where the scalar 16-bit floating point intrinsics are available,
an implementation is required to ensure that including
`<arm_neon.h>` has the effect of also including `<arm_fp16.h>`.

To only enable support for the scalar 16-bit floating-point intrinsics,
the header `<arm_fp16.h>` may be included directly.

<span id="16-bit-brain-floating-point-arithmetic-scalar-intrinsics"></span>

### 16-bit brain floating-point arithmetic scalar intrinsics

The architecture extensions introduced by Armv8.6-A [[Bfloat16]](#Bfloat16) provide a set
of data processing instructions which operate on brain 16-bit floating-point
quantities. These instructions are available in both AArch64 and AArch32
execution states, for both Advanced SIMD and scalar floating-point values.

The brain 16-bit floating-point format (bfloat) differs from the older 16-bit
floating-point format (float16) in that the former has an 8-bit exponent similar
to a single-precision floating-point format but has a 7-bit fraction.

ACLE defines two sets of intrinsics which correspond to these data
processing instructions; a set of scalar intrinsics, and a set of
vector intrinsics.

The intrinsics introduced in this section use the data types defined
by ACLE. In particular, scalar intrinsics use the `bfloat16_t` type
defined by ACLE as an alias for the `__bf16` type, and vector intrinsics
use the `bfloat16x4_t` and `bfloat16x8_t` vector types.

Where the 16-bit brain floating point intrinsics are available,
an implementation is required to ensure that including
`<arm_neon.h>` has the effect of also including `<arm_bf16.h>`.

To only enable support for the 16-bit brain floating-point intrinsics,
the header `<arm_bf16.h>` may be included directly.

When `__ARM_BF16_FORMAT_ALTERNATIVE` is defined to `1` then these types are
storage only and cannot be used with anything other than ACLE intrinsics.  The
underlying type for them is `uint16_t`.

### Operations on data types

ACLE does not define implicit conversion between different data types.
For example:

``` c
  int32x4_t x;
  uint32x4_t y = x; // No representation change
  float32x4_t z = x; // Conversion of integer to floating type
```

Is not portable. Use the `vreinterpret` intrinsics to convert from one
vector type to another without changing representation, and use the `vcvt`
intrinsics to convert between integer and floating types; for example:

``` c
  int32x4_t x;
  uint32x4_t y = vreinterpretq_u32_s32(x);
  float32x4_t z = vcvt_f32_s32(x);
```

ACLE does not define static construction of vector types. For instance:

``` c
  int32x4_t x = { 1, 2, 3, 4 };
```

Is not portable. Use the `vcreate` or `vdup` intrinsics to construct values
from scalars.

In C++, ACLE does not define whether Advanced SIMD data types are POD types
or whether they can be inherited from.

### Compatibility with other vector programming models

ACLE does not specify how the Advanced SIMD Intrinsics interoperate with
alternative vector programming models. Consequently, programmers should
take particular care when combining the Advanced SIMD Intrinsics
programming model with such programming models.

For example, the GCC vector extensions permit initialising a variable using
array syntax, as so

``` c
  #include "arm_neon.h"
  ...
  uint32x2_t x = {0, 1}; // GCC extension.
  uint32_t y = vget_lane_s32 (x, 0); // ACLE Neon Intrinsic.
```

But the definition of the GCC vector extensions is such that the value
stored in y will depend on both the target architecture (AArch32 or AArch64)
and whether the program is running in big- or little-endian mode.

It is recommended that Advanced SIMD Intrinsics be used consistently:

``` c
  #include "arm_neon.h"
  ...
  const int temp[2] = {0, 1};
  uint32x2_t x = vld1_s32 (temp);
  uint32_t y = vget_lane_s32 (x, 0);
```

## Availability of Advanced SIMD intrinsics and Extensions

### Availability of Advanced SIMD intrinsics

Advanced SIMD support is available if the `__ARM_NEON` macro is
predefined (see [Advanced SIMD architecture extension
(Neon)](#advanced-simd-architecture-extension-neon)). In order
to access the Advanced SIMD intrinsics, it is necessary to include
the `<arm_neon.h>` header.

``` c
  #if __ARM_NEON
  #include <arm_neon.h>
    /* Advanced SIMD intrinsics are now available to use.  */
  #endif
```

Some intrinsics are only available when compiling for the AArch64
execution state. This can be determined using the `__ARM_64BIT_STATE`
predefined macro (see [Instruction set
architecture (A32/T32/A64)](#instruction-set-architecture-a32t32a64)).

### Availability of 16-bit floating-point vector interchange types

When the 16-bit floating-point data type `__fp16` is available as an
interchange type for scalar values, it is also available in the vector
interchange types `float16x4_t` and `float16x8_t`. When the vector
interchange types are available, conversion intrinsics between
vector of `__fp16` and vector of `float` types are provided.

This is indicated by the setting of bit 1 in `__ARM_NEON_FP`
(see [Neon floating-point](#neon-floating-point)).

``` c
  #if __ARM_NEON_FP & 0x1
    /* 16-bit floating point vector types are available.  */
    float16x8_t storage;
  #endif
```

### Availability of fused multiply-accumulate intrinsics

Whenever fused multiply-accumulate is available for scalar operations, it is
also available as a vector operation in the Advanced SIMD extension. When
a vector fused multiply-accumulate is available, intrinsics are defined to
access it.

This is indicated by `__ARM_FEATURE_FMA` (see [Fused multiply-accumulate
(FMA)](#fused-multiply-accumulate-fma)).

``` c
  #if __ARM_FEATURE_FMA
    /* Fused multiply-accumulate intrinsics are available.  */
    float32x4_t a, b, c;
    vfma_f32 (a, b, c);
  #endif
```

### Availability of Armv8.1-A Advanced SIMD intrinsics

The Armv8.1-A [[ARMARMv81]](#ARMARMv81) architecture introduces two new instructions:
SQRDMLAH and SQRDMLSH. ACLE specifies vector and vector-by-lane intrinsics to
access these instructions where they are available in hardware.

This is indicated by `__ARM_FEATURE_QRDMX` (see [Rounding doubling
multiplies](#rounding-doubling-multiplies)). :

``` c
  #if __ARM_FEATURE_QRDMX
    /* Armv8.1-A RDMA extensions are available.  */
    int16x4_t a, b, c;
    vqrdmlah_s16 (a, b, c);
  #endif
```

### Availability of 16-bit floating-point arithmetic intrinsics

Armv8.2-A [[ARMARMv82]](#ARMARMv82) introduces new data processing instructions which
operate on 16-bit floating point data in the IEEE754-2008 [IEEE-FP]
format. ACLE specifies intrinsics which map to the vector forms of these
instructions where they are available in hardware.

This is indicated by `__ARM_FEATURE_FP16_VECTOR_ARITHMETIC`
(see [16-bit floating-point data processing
operations](#16-bit-floating-point-data-processing-operations)). :

``` c
  #if __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
    float16x8_t a, b;
    vaddq_f16 (a, b);
  #endif
```

ACLE also specifies intrinsics which map to the scalar forms of these
instructions, see [16-bit floating-point arithmetic scalar
intrinsics](#16-bit-floating-point-arithmetic-scalar-intrinsics).
Availability of the scalar intrinsics is indicated by
`__ARM_FEATURE_FP16_SCALAR_ARITHMETIC`.

``` c
  #if __ARM_FEATURE_FP16_SCALAR_ARITHMETIC
    float16_t a, b;
    vaddh_f16 (a, b);
  #endif
```

### Availability of 16-bit brain floating-point arithmetic intrinsics

Armv8.2-A [[ARMARMv82]](#ARMARMv82) introduces new data processing instructions which
operate on 16-bit brain floating point data as described in the Arm
Architecture Reference Manual. ACLE specifies intrinsics which map to the vector
forms of these instructions where they are available in hardware.

This is indicated by `__ARM_FEATURE_BF16_VECTOR_ARITHMETIC`
(see [Brain 16-bit floating-point
support](#brain-16-bit-floating-point-support)).

``` c
  #if __ARM_FEATURE_BF16_VECTOR_ARITHMETIC
    float32x2_t res = {0};
    bfloat16x4_t a' = vld1_bf16 (a);
    bfloat16x4_t b' = vld1_bf16 (b);
    res = vdot_bf16 (res, a', b');
  #endif
```

ACLE also specifies intrinsics which map to the scalar forms of these
instructions, see [16-bit brain floating-point arithmetic scalar
intrinsics](#16-bit-brain-floating-point-arithmetic-scalar-intrinsics).
Availability of the scalar intrinsics is indicated by
`__ARM_FEATURE_BF16_SCALAR_ARITHMETIC`.

``` c
  #if __ARM_FEATURE_BF16_SCALAR_ARITHMETIC
    bfloat16_t a;
    float32_t b = ..;
    a = b<convert> (b);
  #endif
```

### Availability of Armv8.4-A Advanced SIMD intrinsics

New Crypto and FP16 Floating Point Multiplication Variant instructions in
Armv8.4-A:

* New SHA512 crypto instructions (available if `__ARM_FEATURE_SHA512`)
* New SHA3 crypto instructions (available if `__ARM_FEATURE_SHA3`)
* SM3 crypto instructions (available if `__ARM_FEATURE_SM3`)
* SM4 crypto instructions (available if `__ARM_FEATURE_SM4`)
* New FML[A\|S] instructions (available if `__ARM_FEATURE_FP16_FML`).

These instructions have been backported as optional instructions to Armv8.2-A
and Armv8.3-A.

### Availability of Dot Product intrinsics

The architecture extensions introduced by Armv8.2-A provide a set of dot product
instructions which operate on 8-bit sub-element quantities. These instructions
are available in both AArch64 and AArch32 execution states using
Advanced SIMD instructions. These intrinsics are available
when `__ARM_FEATURE_DOTPROD` is defined (see [Dot Product
extension](#dot-product-extension)). :

``` c
  #if __ARM_FEATURE_DOTPROD
    uint8x8_t a, b;
    vdot_u8 (a, b);
  #endif
```

### Availability of Armv8.5-A floating-point rounding intrinsics

The architecture extensions introduced by Armv8.5-A provide a set of
floating-point rounding instructions that round a floating-point number to an
to a floating-point value that would be representable in a 32-bit or 64-bit
signed integer type.
NaNs, Infinities and Out-of-Range values are forced to the
Most Negative Integer representable in the target size, and an
Invalid Operation Floating-Point Exception is generated.
These instructions are available only in the AArch64 execution state.
The intrinsics for these are available when `__ARM_FEATURE_FRINT` is defined.
The Advanced SIMD intrinsics are specified in the Arm Neon Intrinsics
Reference Architecture Specification [[Neon]](#Neon).

### Availability of Armv8.6-A Integer Matrix Multiply intrinsics

The architecture extensions introduced by Armv8.6-A provide a set of
integer matrix multiplication and mixed sign dot product instructions.
These instructions are optional from Armv8.2-A to Armv8.5-A.

These intrinsics are available when `__ARM_FEATURE_MATMUL_INT8` is defined
(see [Matrix Multiply Intrinsics](#matrix-multiply-intrinsics)).

## Specification of Advanced SIMD intrinsics

The Advanced SIMD intrinsics are specified in the Arm Neon Intrinsics
Reference Architecture Specification [[Neon]](#Neon).

The behavior of an intrinsic is specified to be equivalent to the
AArch64 instruction it is mapped to in [[Neon]](#Neon). Intrinsics are specified
as a mapping between their name, arguments and return values and the AArch64
instruction and assembler operands which they are equivalent to.

A compiler may make use of the as-if rule from C [[C99]](#C99) (5.1.2.3) to perform
optimizations which preserve the instruction semantics.

## Undefined behavior

Care should be taken by compiler implementers not to introduce the concept of
undefined behavior to the semantics of an intrinsic. For example, the
`vabsd_s64` intrinsic has well defined behaviour for all input values,
while the C99 `llabs` has undefined behaviour if the result would not
be representable in a `long long` type. It would thus be incorrect to
implement `vabsd_s64` as a wrapper function or macro around `llabs`.

## Alignment assertions

The AArch32 Neon load and store instructions provide for alignment
assertions, which may speed up access to aligned data (and will fault
access to unaligned data). The Advanced SIMD intrinsics do not directly
provide a means for asserting alignment.

# SVE language extensions and intrinsics

## SVE introduction

The Scalable Vector Extension (SVE) was introduced as an optional extension
to the Arm8.2-A architecture. Its associated feature flag is FEAT_SVE.
SVE has since been extended further by features such as Armv8.6-A's
matrix multiplication extensions and Armv9-A's SVE2.

For brevity, this document generally uses “SVE” to refer to the original
FEAT_SVE version of SVE and all subsequent extensions to it. For example,
references to “SVE” include “SVE2” except whether otherwise noted.

ACLE defines a set of C and C++ types and accessors for SVE vectors
and predicates. It also defines intrinsics for almost all SVE
instructions. [Mapping of SVE instructions to
intrinsics](#mapping-of-sve-instructions-to-intrinsics) lists each SVE
instruction and links to the corresponding ACLE intrinsic (if one exists).

However, the intrinsic interface is more general than the underlying
architecture, so not every intrinsic maps directly to an architectural
instruction. The intention is to provide a regular interface and leave
the ACLE implementation to pick the best mapping to SVE instructions.

## SVE types

### Overview of SVE types

SVE is a “vector-length agnostic” architecture. Instead of mandating a
particular vector length, it allows implementations to choose any
multiple of 128 bits up to the architectural maximum of 2048 bits. It
also allows higher exception levels to constrain the vector lengths of
lower exception levels. The effective vector length is therefore not a
compile-time constant and can in principle change during execution.

Although the architectural increment is 128 bits, it is often more
natural to think in terms of 64-bit quantities. The term “VG” (“vector
granules”) refers to the current number of 64-bit elements in an SVE
vector, so that the number of usable bits in a vector is VG×64.
Predicates have one bit for each vector byte, so the number of
usable bits in a predicate is VG×8.

Therefore, code that makes direct use of SVE instructions requires access
to vector types that have VG×64 bits and predicate types that have VG×8
bits, but without the value of VG being fixed. Ideally it should be
possible to pass and return these types by value, like it is for other
(fixed-length) vector extensions. However, standard C and C++ do not
provide variable-length types that are both self-contained (rather than
dependent on separate storage) and suitable for passing and returning by
value. (For example, C's variable-length arrays are self-contained but
are not valid return types. C++'s `std::string` can store variable-length
data and is suitable for passing and returning by value, but it relies
on separately-allocated storage.) This means that there is no existing
mechanism that maps directly to the concept of an SVE vector or predicate.

Any approach to defining the types would fall into one of three
categories:

1.  Limit the types in such a way that there is no concept of size.

2.  Define the size of the types to be variable.

3.  Define the size of the types to be constant, with the constant being
    large enough for all possible VG or with the types pointing to
    separate memory (as for classes like `std::string`).

ACLE takes the first approach and classifies SVE vectors and
predicates as belonging to a new category of type called “sizeless types”.
The next section describes these types in more detail.

### Sizeless types

For the reasons explained in the previous section, ACLE defines a
new category of type called “sizeless types”. They are less restrictive
than the standard “incomplete types” but more restrictive than ”complete
types”. SVE vectors and predicates have sizeless type.

#### Informal definition of sizeless types

Informally, sizeless types can be used in the following situations:

*   as the type of an object with automatic storage duration;

*   as a function parameter or return type;

*   as a type name in a `_Generic` association;

*   as the type in a `(type) {value}` compound literal;

*   as the type in a C++ `type()` expression;

*   as the target of a pointer or reference type; and

*   as a template type argument.

Sizeless types may not be used in the following situations:

*   as the type of a variable with static or thread-local storage
    duration (regardless of whether the variable is being defined or just
    declared);

*   as the type of an array element;

*   as the operand to a `new` expression; and

*   as the type of object being deleted by a `delete` expression.

In all other respects, sizeless types have the same restrictions as the
standard-defined “incomplete types”. This specifically includes (but is
not limited to) the following:

*   The argument to `sizeof` and `_Alignof` cannot be a sizeless
    type, or an object of sizeless type.

*   It is not possible to perform arithmetic on pointers to sizeless
    types. (This affects the `+`, `-`, `++` and `--` operators.)

*   Members of unions, structures and classes cannot have sizeless type.

*   `_Atomic` variables cannot have sizeless type.

*   It is not possible to throw or catch objects of sizeless type.

*   Lambda expressions cannot capture sizeless types by value, although
    they can capture them by reference. (This is a corollary of not
    allowing member variables to have sizeless type.)

*   Standard library containers like `std::vector` cannot have a
    sizeless `value_type`.

#### Formal definition of sizeless types

[Sizeless types in C](#sizeless-types-in-c) gives a more formal
definition of sizeless types for C, in the form of an edit to the
standard. [Sizeless types in C++](#sizeless-types-in-cxx) gives the
corresponding changes for C++. Implementations should correctly compile
any code that follows these rules, but they do not need to report a
diagnostic for invalid uses of sizeless types. Whether they report a
diagnostic or not is a quality of implementation issue.
(Note: future versions of ACLE might have stricter diagnostic
requirements.)

##### Sizeless types in C

This section specifies the behavior of sizeless types as an edit to the
N1570 version of the C standard.

**6.2.5 Types**

> In 6.2.5/1, replace:
>
> > At various points within a translation unit an object type may
> > be *incomplete* ...
>
> onwards with:
>
> > Object types are further partitioned into *sized* and *sizeless*;
> > all basic and derived types defined in this standard are sized,
> > but an implementation may provide additional sizeless types.
>
> and add two additional clauses:
>
> > *   At various points within a translation unit an object type
> >     may be *indefinite* (lacking sufficient information to
> >     construct an object of that type) or *definite* (having
> >     sufficient information). An object type is said to be
> >     *complete* if it is both sized and definite; all other object
> >     types are said to be *incomplete*. Complete types have
> >     sufficient information to determine the size of an object of
> >     that type while incomplete types do not.
> >
> > *   Arrays, structures, unions and enumerated types are always
> >     sized, so for them the term *incomplete* is equivalent to (and
> >     used interchangeably with) the term *indefinite*.
>
> Change 6.2.5/19 to:
>
> > The `void` type comprises an empty set of values; it is a
> > sized indefinite object type that cannot be completed (made
> > definite).
>
> Replace *incomplete* with *indefinite* and *complete* with *definite* in
> 6.2.5/37, which describes how a type's state can change throughout a
> translation unit.

**6.3.2.1 Lvalues, arrays, and function designators**

> Replace *incomplete* with *indefinite* in 6.3.2.1/1, so that sizeless
> definite types are modifiable lvalues.
>
> Make the same replacement in 6.3.2.1/2, to prevent undefined
> behavior when lvalues have sizeless definite type.

**6.5.1.1 Generic selection**

> Replace *complete object type* with *definite object type* in 6.5.1.1/2,
> so that the type name in a generic association can be a sizeless
> definite type.

**6.5.2.2 Function calls**

> Replace *complete object type* with *definite object type* in 6.5.2.2/1,
> so that functions can return sizeless definite types.
>
> Make the same change in 6.5.2.2/4, so that arguments can also have
> sizeless definite type.

**6.5.2.5 Compound literals**

> Replace *complete object type* with *definite object type* in 6.5.2.5/1,
> so that compound literals can have sizeless definite type.

**6.7 Declarations**

> Insert the following new clause after 6.7/4:
>
> > *   If an identifier for an object does not have automatic storage
> >     duration, its type must be sized rather than sizeless.
>
> Replace *complete* with *definite* in 6.7/7, which describes when the
> type of an object becomes definite.

**6.7.6.3 Function declarators (including prototypes)**

> Replace *incomplete type* with *indefinite type* in 6.7.6.3/4, so that
> parameters can also have sizeless definite type.
>
> Make the same change in 6.7.6.3/12, which allows even indefinite
> types to be function parameters if no function definition is
> present.

**6.7.9 Initialization**

> Replace *complete object type* with *definite object type* in 6.7.9/3,
> to allow initialization of identifiers with sizeless definite type.

**6.9.1 Function definitions**

> Replace *complete object type* with *definite object type* in 6.9.1/3,
> so that functions can return sizeless definite types.
>
> Make the same change in 6.9.1/7, so that adjusted parameter types
> can be sizeless definite types.

**J.2 Undefined behavior**

> Update the entries that refer to the clauses above.

<span id="sizeless-types-in-cxx"></span>

##### Sizeless types in C++

This section specifies the behavior of sizeless types as an edit to the
N3797 version of the C++ standard.

**3.1 Declarations and definitions [basic.def]**

> Replace *incomplete type* with *indefinite type* in 3.1/5, so that
> objects can have sizeless definite type in some situations. Add a
> new clause immediately afterwards:
>
> > *   A program is ill-formed if any declaration of an object gives
> >     it both a sizeless type and either static or thread-local
> >     storage duration.

**3.9 Types [basic.types]**

> Replace 3.9/5 with these clauses:
>
> > *   A class that has been declared but not defined, an
> >     enumeration type in certain contexts, or an array of unknown
> >     size or of indefinite element type, is an *indefinite object type*.
> >     Indefinite object types and the void types are *indefinite types*.
> >     Objects shall not be defined to have an indefinite type.
> >
> > *   Object and void types are further partitioned into *sized*
> >     and *sizeless*; all basic and derived types defined in this
> >     standard are sized, but an implementation may provide
> >     additional sizeless types.
> >
> > *   An object or void type is said to be *complete* if it is both
> >     sized and definite; all other object and void types are said
> >     to be *incomplete*. The term *completely-defined object type*
> >     is synonymous with *complete object type*.
> >
> > *   Arrays, class types and enumeration types are always sized,
> >     so for them the term *incomplete* is equivalent to (and used
> >     interchangeably with) the term *indefinite*.
>
> Replace *incomplete types* with *indefinite types* in 3.9/7, which is
> simply a cross-reference note.

**3.9.1 Fundamental Types [basic.fundamental]**

> Replace the second sentence of 3.9.1/9 with:
>
> > The `void` type is a sized indefinite type that cannot be
> > completed (made definite).

**3.9.2. Compound Types [basic.compound]**

> Add “(including indefinite types)” after “Pointers to incomplete
> types” in 3.9.2/3, to emphasize that pointers to incomplete types
> are more restricted than pointers to complete types, even if the
> types are definite.

**3.10 Lvalues and rvalues [basic.lval]**

> Replace *complete types* with *definite types* and *incomplete types*
> with *indefinite types* in 3.10/4, so that prvalues can be sizeless
> definite types.
>
> Replace *incomplete* with *indefinite* and *complete* with *definite*
> in 3.10/7, which describes the modifiability of a pointer and the
> object to which it points.

**4.1 Lvalue-to-rvalue conversion [conv.lval]**

> Replace *incomplete type* with *indefinite type* in 4.1/1, so that
> glvalues of sizeless definite type can be converted to prvalues.

**5.2.2 Function call [expr.call]**

> Replace *completely-defined object type* with *definite object type*
> and *incomplete class type* with *indefinite class type*,
> so that parameters can have sizeless definite type.
>
> Replace *incomplete* with *indefinite* and *complete* with *definite*
> in 5.2.2/11, so that functions can return sizeless definite types.

**5.2.3 Explicit type conversion (function notation) [expr.type.conv]**

> Replace *complete object type* with *definite object type* in 5.2.3/2,
> so that the `T()` notation extends to sizeless definite types.

**5.3.1 Unary operators [expr.unary.op]**

> Replace *incomplete type* with *indefinite type* in 5.3.1/1. This simply
> updates a cross-reference to the 4.1 change above.

**5.3.5 Delete [expr.delete]**

> Insert the following after the first sentence of 5.3.5/2 (which
> describes the implicit conversion of an object type to a pointer type):
>
> > The type of the operand must now be a pointer to a sized type,
> > otherwise the program is ill-formed.

**8.3.4 Arrays [dcl.array]**

> In 8.3.4/1, add *a sizeless type* to the list of types that the
> element type `T` cannot have.

**9.4.2 Static data members [class.static.data]**

> Replace *an incomplete type* with *a sized indefinite type* in 9.4.2/2,
> so that static data members cannot be declared with sizeless type.
>
> Add a new final clause:
>
> > * A static data member shall not have sizeless type.

**14.3.1 Template type parameters [temp.arg.type]**

> Add “(including an indefinite type)” after “an incomplete type” in
> the note describing template type arguments, to emphasize that the
> arguments can be sizeless.

**20.10.4.3 Type properties [meta.unary.prop]**

> Replace *complete* with *definite* in 20.10.4.3/3, so that the
> situations in which an implementation may implicitly instantiate
> template arguments remain the same as before.

**20.10.6 Relationships between types [meta.rel]**

> Replace *complete* with *definite* in 20.10.6/2, so that these
> metaprogramming facilities extend to sized definite types.

**20.10.7.5 Pointer modifications [meta.trans.ptr]**

> Likewise replace *complete* with *definite* in the initial table, so
> that these metaprogramming facilities also extend to sized definite types.

#### Interaction between sizeless types and other extensions

It is not feasible to reconcile the definition of sizeless types with
each individual current and future extension to C and C++. Therefore,
the default position is that extensions to C and C++ should treat sizeless
types as incomplete types unless otherwise specified.

### Scalar types defined by `<arm_sve.h>`

[`<arm_sve.h>`](#arm_sve.h) includes `<stdint.h>` and so provides
standard types such as `uint32_t`. When included from C code, the header
also includes `<stdbool.h>` and so provides the `bool` type.

In addition, the header file defines the following scalar data types:

| **Scalar type** | **Definition**         |
| --------------- | ---------------------- |
| `float16_t`     | equivalent to `__fp16` |
| `float32_t`     | equivalent to `float`  |
| `float64_t`     | equivalent to `double` |
| `mfloat8_t`     | equivalent to `__mfp8` |

If the feature macro `__ARM_FEATURE_BF16_SCALAR_ARITHMETIC` is
defined, [`<arm_sve.h>`](#arm_sve.h) also includes
[`<arm_bf16.h>`](#arm_bf16.h), which defines the scalar 16-bit brain
floating-point type `__bf16`. Then, under the control of the same feature
macro, `<arm_sve.h>` defines an alias of `__bf16` called `bfloat16_t`.

### SVE vector types

[`<arm_sve.h>`](#arm_sve.h) defines the following sizeless types for
single vectors:

| **Signed integer**   | **Unsigned integer** | **Floating-point**   |                      |
| -------------------- | -------------------- | -------------------- | -------------------- |
| `svint8_t`           | `svuint8_t`          |                      | `svmfloat8_t`        |
| `svint16_t`          | `svuint16_t`         | `svfloat16_t`        | `svbfloat16_t`       |
| `svint32_t`          | `svuint32_t`         | `svfloat32_t`        |                      |
| `svint64_t`          | `svuint64_t`         | `svfloat64_t`        |                      |

Each type `svBASE_t` is an opaque length-agnostic vector of `BASE_t`
elements. The types in each row have the same number of elements and
have twice as many elements as the types in the row below them.

`svbfloat16_t` is only available if the header file also provides a
definition of `bfloat16_t` (see [Scalar types defined by
`<arm_sve.h>`](#scalar-types-defined-by-arm_sve.h)). The other
types are available unconditionally.


[`<arm_sve.h>`](#arm_sve.h) also defines tuples of two, three, and four
vectors, as follows:

| **Signed integer**   | **Unsigned integer** | **Floating-point**    |                      |
| -------------------- | -------------------- | --------------------- | -------------------- |
| `svint8x2_t`         | `svuint8x2_t`        |                       | `svmfloat8x2_t`      |
| `svint16x2_t`        | `svuint16x2_t`       | `svfloat16x2_t`       | `svbfloat16x2_t`     |
| `svint32x2_t`        | `svuint32x2_t`       | `svfloat32x2_t`       |                      |
| `svint64x2_t`        | `svuint64x2_t`       | `svfloat64x2_t`       |                      |
|                      |                      |                       |                      |
| `svint8x3_t`         | `svuint8x3_t`        |                       | `svmfloat8x3_t`      |
| `svint16x3_t`        | `svuint16x3_t`       | `svfloat16x3_t`       | `svbfloat16x3_t`     |
| `svint32x3_t`        | `svuint32x3_t`       | `svfloat32x3_t`       |                      |
| `svint64x3_t`        | `svuint64x3_t`       | `svfloat64x3_t`       |                      |
|                      |                      |                       |                      |
| `svint8x4_t`         | `svuint8x4_t`        |                       | `svmfloat8x4_t`      |
| `svint16x4_t`        | `svuint16x4_t`       | `svfloat16x4_t`       | `svbfloat16x4_t`     |
| `svint32x4_t`        | `svuint32x4_t`       | `svfloat32x4_t`       |                      |
| `svint64x4_t`        | `svuint64x4_t`       | `svfloat64x4_t`       |                      |

Each `svBASExN_t` is an opaque sizeless type that conceptually
contains a sequence of N `svBASE_t`s, indexed starting at 0. It is
available whenever the corresponding single-vector type is.

ACLE provides the following intrinsics for creating and accessing
these tuple types:

<!-- Trailing whitespace is deliberate here -->
[`svcreate2(svBASE_t x0, svBASE_t x1)`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcreate2)  
[`svcreate3(svBASE_t x0, svBASE_t x1, svBASE_t x2)`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcreate3)  
[`svcreate4(svBASE_t x0, svBASE_t x1, svBASE_t x2, svBASE_t x3)`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcreate4)

> `svcreateN` returns a `svBASExN_t` in which the vector at index M has the
> value given by `xM`.

<!-- Trailing whitespace is deliberate here -->
[`svset2(svBASEx2_t tuple, uint64_t imm_index, svBASE_t x)`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svset2)  
[`svset3(svBASEx3_t tuple, uint64_t imm_index, svBASE_t x)`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svset3)  
[`svset4(svBASEx4_t tuple, uint64_t imm_index, svBASE_t x)`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svset4)

> `svsetN` returns a copy of `tuple` in which the vector at index
> `imm_index` has the value given by `x`. `imm_index` must be an
> integer constant expression in the range [0, N-1].

<!-- Trailing whitespace is deliberate here -->
[`svget2(svBASEx2_t tuple, uint64_t imm_index)`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svget2)  
[`svget3(svBASEx3_t tuple, uint64_t imm_index)`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svget3)  
[`svget4(svBASEx4_t tuple, uint64_t imm_index)`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svget4)

> `svgetN` returns the value of vector `imm_index` in `tuple`. `imm_index`
> must be an integer constant expression in the range [0, N-1].

It is also possible to create completely-undefined vectors and tuples of
vectors using [`svundef`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svundef_),
[`svundef2`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svundef2),
[`svundef3`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svundef3) and
[`svundef4`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svundef4).

ACLE provides two sets of intrinsics for converting between vector types
and between vector tuple types:

*   The [`svreinterpret`](#sve-reinterpret-intrinsics) intrinsics simply
    reinterpret a vector (or vector tuple) of one type as a vector (or
    vector tuple) of another type, without changing any of the bits.

*   The [`svcvt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcvt_)
    intrinsics instead perform numerical conversion from one type to another,
    such as converting integers to floating-point values.

To avoid any ambiguity between the two operations, ACLE does not allow
C-style casting from one vector type to another.

### SVE predicate types

[`<arm_sve.h>`](#arm_sve.h) defines a single sizeless predicate type
`svbool_t`, which has enough bits to control an operation on a vector
of bytes.

The main use of predicates is to select elements in a vector. When the
elements in the vector have *N* bytes, only the low bit in each sequence
of *N* predicate bits is significant. For example, with bits of a predicate
numbered from the least significant bit upwards, the elements selected by
each bit are as follows:

|                            | **bit 0** | **bit 1** | **bit 2** | **bit 3** | **bit 4** | **bit 5** | **bit 6** | **bit 7** | **bit 8** |
| -------------------------: | :-------: | :-------: | :-------: | :-------: | :-------: | :-------: | :-------: | :-------: | :-------: |
| **svuint8_t** element      | 0         | 1         | 2         | 3         | 4         | 5         | 6         | 7         | 8         |
| **svuint16_t** element     | 0         | -         | 1         | -         | 2         | -         | 3         | -         | 4         |
| **svuint32_t** element     | 0         | -         | -         | -         | 1         | -         | -         | -         | 2         |
| **svuint64_t** element     | 0         | -         | -         | -         | -         | -         | -         | -         | 1         |

### Fixed-length SVE types

#### Introduction to fixed-length SVE types

As described in [Overview of SVE types](#overview-of-sve-types),
SVE is a “length-agnostic” architecture that supports a range of
different vector register sizes. Some SVE ACLE code might be written
to work with all of these register sizes; such code is fully
“length-agnostic”. Other SVE ACLE code might instead require the
register size to belong to a restricted set. Possible restrictions
include imposing a minimum register size, a maximum register size, a
power-of-two register size, or a single exact register size. This is a
choice for the programmer to make. For example, the program snippet:

``` c
  svfloat32_t data = svld1(svptrue_pat_b32(SV_VL16), ptr);
```

loads no data when the vector registers are smaller than 512 bits, so in
practice the code is likely to require a register size of 512 bits or more.

Similarly, for any given piece of source code (whether it uses ACLE
or not), a code generator might produce SVE object code that only correctly
implements the source code for certain runtime register sizes. The code
is likely to abort or malfunction if the registers have a different
size. For example, if the code generator assumes that the vector register
size is exactly 256 bits, it might use:

``` asm
  ADD X1, X2, #32
```

instead of:

``` asm
  ADDVL X1, X2, #1
```

Let SourceVL be the set of vector register sizes supported by a piece of
SVE ACLE source code and ObjectVL be the set of vector register sizes
for which the object code correctly implements the source code. In both
cases, the set might be the set of all possible register sizes (referred
to as “unrestricted” below).

In general, object code created from SVE ACLE source code only works
correctly when the runtime register size belongs to the intersection of
SourceVL and ObjectVL. The behavior in other cases is undefined.

The compiler might impose a fixed ObjectVL set for all code or provide a
level of user control. It might also allow ObjectVL to vary within the
program, either within the same translation unit or between different
translation units. Whether and how this happens is currently outside the
scope of ACLE.

The combination of a singleton SourceVL and an unrestricted
ObjectVL makes sense: ACLE source code written for a single register
size can still be compiled correctly without knowing what that size is,
just like an assembler can assemble SVE code without knowing what
register sizes the assembly code supports. Similarly, the combination of
a singleton ObjectVL and an unrestricted SourceVL makes sense: ACLE
source code written for all register sizes can still be compiled for
only a single register size, perhaps to try to improve the performance
of surrounding code. Other combinations are also possible.

This section describes ACLE features related to singleton ObjectVLs.
They are intended to help cases in which SourceVL is the same singleton.

All the features are optional: a conforming ACLE implementation does not
need to provide them.

Note: the types defined in [SVE vector types](#sve-vector-types) and
[SVE predicate types](#sve-predicate-types) are always sizeless types and
are subject to the same restrictions for all SourceVL and for all ObjectVL.

#### The `__ARM_FEATURE_SVE_BITS` macro

As an optional extension, an ACLE implementation may set the
preprocessor macro:

``` c
  __ARM_FEATURE_SVE_BITS
```

to a nonzero value N provided that:

*   ObjectVL (see [Introduction to fixed-length SVE
    types](#introduction-to-fixed-length-sve-types)
    is a singleton vector register size of N bits; and

*   it is possible to apply the `arm_sve_vector_bits(N)` attribute to
    SVE vector types and SVE predicate types, as described in
    [The `arm_sve_vector_bits` attribute](#the-arm_sve_vector_bits-attribute).

If the implementation allows ObjectVL to be changed within a translation
unit, it must ensure that the value of the macro remains accurate after
each change. `__ARM_FEATURE_SVE_BITS` would then have different values
at different points in a translation unit.

Defining the macro to zero has the same meaning as not defining it all.

#### The `arm_sve_vector_bits` attribute

##### Syntax and requirements

An ACLE implementation can choose to provide the following GNU-style type
attribute:

``` c
  __attribute__((arm_sve_vector_bits(...arguments...)))
```

ACLE only defines the effect of the attribute if all of the
following are true:

1.  the attribute is attached to a single SVE vector type (such as
    `svint32_t`) or to the SVE predicate type `svbool_t`;

2.  the arguments consist of a single nonzero integer constant expression
    (referred to as N below); and

3.  `N==__ARM_FEATURE_SVE_BITS`.

In other cases the implementation must do one of the following:

*   Ignore the attribute; a warning would then be appropriate, but is not
    required.

*   Reject the program with a diagnostic.

*   Extend requirement (3) above to support other values of N besides
    `__ARM_FEATURE_SVE_BITS`.

*   Process the attribute in accordance with a later revision of ACLE.

##### General `arm_sve_vector_bits` behavior

Let VLST be a valid type:

``` c
  VLAT __attribute__((arm_sve_vector_bits(N)))
```

for some SVE vector type or SVE predicate type VLAT. VLST is then a
fixed-length version of VLAT that is specialized for an N-bit SVE
target. It is a normal sized (rather than sizeless) type, so unlike
VLAT, it can be used as the type of a global variable, class member,
`constexpr`, and so on. For example:

``` c
  #if __ARM_FEATURE_SVE_BITS==512
  typedef svint32_t vec __attribute__((arm_sve_vector_bits(512)));
  typedef svbool_t pred __attribute__((arm_sve_vector_bits(512)));
  #endif
```

creates a type called `vec` that acts a fixed-length version of
`svint32_t` and a type called `pred` that acts as a fixed-length
version of `svbool_t`. Both types are normal sized types; `vec`
contains exactly 512 bits (64 bytes) and `pred` contains exactly 64
bits (8 bytes):

``` c
  #if __ARM_FEATURE_SVE_BITS==512
  typedef svint32_t vec __attribute__((arm_sve_vector_bits(512)));
  typedef svbool_t pred __attribute__((arm_sve_vector_bits(512)));

  svint32_t g1;  // Invalid, svint32_t is sizeless
  vec g2;        // OK
  svbool_t g3;   // Invalid, svbool_t is sizeless
  pred g4;       // OK

  struct wrap1 { svint32_t x; };  // Invalid, svint32_t is sizeless
  struct wrap2 { vec x; };        // OK
  struct wrap3 { svbool_t x; };   // Invalid, svbool_t is sizeless
  struct wrap4 { pred x; };       // OK

  size_t size1 = sizeof(svint32_t);  // Invalid, svint32_t is sizeless
  size_t size2 = sizeof(vec);        // OK, equals 64
  size_t size3 = sizeof(svbool_t);   // Invalid, svbool_t is sizeless
  size_t size4 = sizeof(pred);       // OK, equals 8
  #endif
```

The following rules apply to both vector and predicate VLST types:

*   Whenever `__ARM_FEATURE_SVE_BITS==N`, VLST implicitly converts to
    VLAT and VLAT implicitly converts to VLST. In C++, these conversions
    have a rank just below derived-to-base conversion.

    This behavior makes it possible to use VLST with ACLE intrinsics that
    operate on VLAT. For example:

    ``` c
      #if __ARM_FEATURE_SVE_BITS==512
      typedef svbool_t pred __attribute__((arm_sve_vector_bits(512)));
      pred f(pred x, pred y) { return svbrka_z(x, y); }
      #endif
    ```

*   A conditional expression of the form `C ? E1 : E2` is ill-formed if:

    *   E1 has type VLAT or cv-qualified VLAT and E2 has type VLST or
        cv-qualified VLST; or

    *   E1 has type VLST or cv-qualified VLST and E2 has type VLAT or
        cv-qualified VLAT.

    However, the implementation does not need to diagnose these cases.

    This rule avoids any ambiguity about whether the result of the
    conditional expression is sized or sizeless. For example:

    ``` c
      #if __ARM_FEATURE_SVE_BITS==512
      typedef svint32_t vec __attribute__((arm_sve_vector_bits(512)));
      auto f(bool cond, vec x, svint32_t y) { return cond ? x : y; }
      #endif
    ```

    is ill-formed because it is not clear whether the type of the result
    should come from `x` or `y`.

*   VLST maps to the same AAPCS64 ABI type as VLAT. For example:

    ``` c
      svint32_t __attribute__((arm_sve_vector_bits(128)))
    ```

    maps to the same AAPCS64 type as `svint32_t`, rather than to the
    same AAPCS64 type as the `arm_neon.h` type `int32x4_t`.

*   An object type “requires size N” if:

    *   it is an SVE vector type or SVE predicate type that has the
        attribute `arm_sve_vector_bits(N)`;

    *   it is an array type whose element type requires size N; or

    *   it is a class or struct and:

        *   at least one non-static member has a type that requires size N; or

        *   a base type requires size N

    Note: this definition specifically excludes reference and pointer types.

*   A function type “requires size N” if the return type requires size N
    or if at least one parameter type requires size N.

*   A program is ill-formed if:

    *   any function type requires two different sizes N1 and N2.

    *   `__ARM_FEATURE_SVE_BITS!=N` when defining a function whose type
        requires size N.

    *   `__ARM_FEATURE_SVE_BITS!=N` when calling a function whose type
        requires size N. (Note that this explicitly excludes parameters
        passed through “`...`”.)

    *   an object whose type requires some size N is passed to an
        [unprototyped function](#unprototyped-function).

    However, the implementation does not need to diagnose these cases.

    These rules only have an effect if an implementation allows the
    register size to vary within a translation unit. The aim is to forbid
    function definitions and function calls that have no mapping to the
    AAPCS64 calling conventions. For example, if an implementation
    supports some form of pragma that changes `__ARM_FEATURE_SVE_BITS`
    within a translation unit:

    ``` c
      ...pragma that changes __ARM_FEATURE_SVE_BITS to 256...

      typedef svfloat32_t vec256 __attribute__((arm_sve_vector_bits(256)));

      ...pragma that changes __ARM_FEATURE_SVE_BITS to 512...

      typedef svbool_t bool512 __attribute__((arm_sve_vector_bits(512)));
      struct mix1 { bool512 a; vec256 b; };  // OK
      struct mix2 { bool512 a; vec256 *b; }; // OK
      union mix3 { bool512 a; vec256 b; };   // OK
      typedef bool512 (*callback)(vec256);   // Invalid, requires sizes 256, 512
      bool512 f1(vec256);                    // Invalid, requires sizes 256, 512
      vec256 f2();                           // OK, just a declaration
      vec256 f3() { ... }                    // Invalid, requires size 256
      void f4(struct mix1 m) { ... }         // Invalid, requires sizes 256, 512
      void f5(struct mix2 m) { ... }         // OK, just requires size 512
      void f6(union mix3 m) { ... }          // OK, no size requirements
      bool512 f7() { ... }                   // OK, just requires size 512
      void f8(bool512 *x, vec256 *y) { ... } // OK, no size requirements
    ```

See [`arm_sve_vector_bits` behavior specific to
vectors](#arm_sve_vector_bits-behavior-specific-to-vectors)
for additional rules that apply specifically to vectors and
[`arm_sve_vector_bits` behavior specific to
predicates](#arm_sve_vector_bits-behavior-specific-to-predicates)
for additional rules that apply specifically to predicates.

##### `arm_sve_vector_bits` behavior specific to vectors

If VLAT is an SVE vector type `svBASE_t` and VLST is a valid type:

``` c
  VLAT __attribute__((arm_sve_vector_bits(N)))
```

then VLST is a sized type that has the following properties:

``` c
  sizeof(VLST) == N/8
  alignof(VLST) == 16
```

If in addition the implementation defines the preprocessor macro

``` c
  __ARM_FEATURE_SVE_VECTOR_OPERATORS
```

and if VLAT is not `svbfloat16_t`, then:

*   The GNU `__attribute__((vector_size))` extension is available.

*   VLST supports the same forms of elementwise initialization as:

    ``` c
      BASE_t __attribute__((vector_size(N/8)))
    ```

    (referred to as GNUT below). For example:

    ``` c
      #if __ARM_FEATURE_SVE_BITS==256 && __ARM_FEATURE_SVE_VECTOR_OPERATORS
      svint64_t vec __attribute__((arm_sve_vector_bits(256))) = { 0, 1, 2, 3 };
      #endif
    ```

*   VLST supports the same built-in C and C++ operators as GNUT. Any
    result that has type GNUT for GNUT operators has type VLST for VLST
    operators. For example:

    ``` c
      #if __ARM_FEATURE_SVE_BITS==512 && __ARM_FEATURE_SVE_VECTOR_OPERATORS
      typedef svint32_t vec __attribute__((arm_sve_vector_bits(512)));
      auto f(vec x, vec y) { return x + y; }    // Returns a vec.
      #endif
    ```

*   Whenever `__ARM_FEATURE_SVE_BITS==N`, GNUT implicitly converts to
    VLAT and VLAT implicitly converts to GNUT. In C++, these conversions
    have a rank just below derived-to-base conversion.

    This behavior makes it possible to use GNUT with ACLE intrinsics that
    operate on VLAT. For example:

    ``` c
      typedef int8_t vec __attribute__((vector_size(32)));
      #if __ARM_FEATURE_SVE_BITS==256 && __ARM_FEATURE_SVE_VECTOR_OPERATORS
      vec f(vec x) { return svasrd_x(svptrue_b8(), x, 1); }
      #endif
    ```

*   Irrespective of `__ARM_FEATURE_SVE_BITS`, GNUT implicitly converts
    to VLST and VLST implicitly converts to GNUT. In C++, these
    conversions again have a rank just below derived-to-base conversion.

    This behavior makes it possible to use VLST with existing interfaces
    that operate on GNUT. For example:

    ``` c
      typedef int8_t vec1 __attribute__((vector_size(32)));
      void f(vec1);
      #if __ARM_FEATURE_SVE_BITS==256 && __ARM_FEATURE_SVE_VECTOR_OPERATORS
      typedef svint8_t vec2 __attribute__((arm_sve_vector_bits(256)));
      void g(vec2 x) { f(x); }    // OK
      #endif
    ```

    Also, if an implementation supports some form of pragma that changes
    `__ARM_FEATURE_SVE_BITS` within a translation unit:

    ``` c
      #ifdef __ARM_FEATURE_SVE_VECTOR_OPERATORS
      ...pragma that changes __ARM_FEATURE_SVE_BITS to 256...

      int8_t x __attribute__((vector_size(32)));
      svint8_t y __attribute__((arm_sve_vector_bits(256)));

      ...pragma that changes __ARM_FEATURE_SVE_BITS to 512...

      void f() { x = y; }    // OK
      #endif
    ```

*   A conditional expression of the form `C ? E1 : E2` is ill-formed if:

    *   E1 has type VLAT or cv-qualified VLAT and E2 has type GNUT or
        cv-qualified GNUT; or

    *   E1 has type GNUT or cv-qualified GNUT and E2 has type VLAT or
        cv-qualified VLAT.

    However, the implementation does not need to diagnose these cases.

    This rule avoids any ambiguity about whether the result of the
    conditional expression is sized or sizeless. For example:

    ``` c
      #if __ARM_FEATURE_SVE_BITS==512 && __ARM_FEATURE_SVE_VECTOR_OPERATORS
      typedef int32_t vec __attribute__((vector_size(64)));
      auto f(bool cond, vec x, svint32_t y) { return cond ? x : y; }
      #endif
    ```

    is ill-formed because it is not clear whether the type of the result
    should come from `x` or `y`. The choice would affect the ABI of
    the function.

*   A binary expression of the form `E1 op E2` or a conditional expression
    of the form `C ? E1 : E2` is ill-formed if:

    *   E1 has type VLST or cv-qualified VLST and E2 has type GNUT or
        cv-qualified GNUT; or

    *   E1 has type GNUT or cv-qualified GNUT and E2 has type VLST or
        cv-qualified VLST.

    However, the implementation does not need to diagnose these cases.

    This rule avoids any ambiguity about whether the result of the
    expression is a GNU or SVE type. For example:

    ``` c
      #if __ARM_FEATURE_SVE_BITS==512 && __ARM_FEATURE_SVE_VECTOR_OPERATORS
      typedef int32_t vec1 __attribute__((vector_size(64)));
      typedef svint32_t vec2 __attribute__((arm_sve_vector_bits(512)));
      auto f(vec1 x, vec2 y) { return x + y; }
      #endif
    ```

    is ill-formed because it is not clear whether the type of the result
    should come from `x` or `y`. The choice would affect the ABI of
    the function.

##### `arm_sve_vector_bits` behavior specific to predicates

Let VLST be a valid type:

``` c
  svbool_t __attribute__((arm_sve_vector_bits(N)))
```

VLST is then a sized type that has the following properties:

``` c
  sizeof(VLST) == N/64
  alignof(VLST) == 2
```

If in addition the implementation defines the preprocessor macro

``` c
  __ARM_FEATURE_SVE_PREDICATE_OPERATORS
```

then:

*   The GNU `__attribute__((vector_size))` extension is available.

*   VLST supports the same forms of elementwise initialization as the
    vector type:

    ``` c
      uint8_t __attribute__((vector_size(N/8)))
    ```

    except that the elements have type `bool` instead of `uint8_t`.

*   VLST supports the following operators, all of which take arguments of
    type VLST and return either a VLST or a reference to a VLST:

    *   unary `~`

    *   binary `&`, `|` and `^`

    *   assignments `&=`, `|=` and `^=`

    *   comparisons `<`, `<=`, `==`, `!=`, `>=` and `>`

    All operators behave analogously to GNU vectors. For example:

    ``` c
      #if __ARM_FEATURE_SVE_BITS==256 && __ARM_FEATURE_SVE_PREDICATE_OPERATORS
      typedef svbool_t pred __attribute__((arm_sve_vector_bits(256)));
      auto f(pred x, pred y) { return x & y; }    // Returns a pred
      #endif
    ```

*   VLST supports the array subscript operator `[]` in a way that
    behaves analogously to GNU vectors, except that it is not possible to
    take the address of the result. For example:

    ``` c
      #if __ARM_FEATURE_SVE_BITS==256 && __ARM_FEATURE_SVE_PREDICATE_OPERATORS
      typedef svbool_t pred __attribute__((arm_sve_vector_bits(256)));
      pred x;
      bool f() { x[1] = true; return x[0]; }
      #endif
    ```

*   Within a byte, subscripts count from the least significant bit. For
    example:

    ``` c
      #if __ARM_FEATURE_SVE_BITS==256 && __ARM_FEATURE_SVE_PREDICATE_OPERATORS
      svbool_t p __attribute__((arm_sve_vector_bits(256))) = { 0, 1 };
      #endif
    ```

    sets the first byte of `p` to 2 for both big- and little-endian targets.

An implementation can choose to provide other operators too, but it does not
need to do so.

Note that, at the time of writing, the GNU `vector_size` extension is
not defined for `bool` elements, nor for packed vectors of single bits.
The definition above is intended to be a conservative subset of what such
an extension might provide.

##### C++ mangling of fixed-length SVE types

Let VLST be a valid C++ type:

``` c
  VLAT __attribute__((arm_sve_vector_bits(N)))
```

for some SVE vector type or SVE predicate type VLAT. VLST is mangled in
the same way as a template:

``` c
  template<typename, unsigned> struct __SVE_VLS;
```

with the arguments:

``` c
  __SVE_VLS<VLAT, N>
```

For example:

``` c
  #if __ARM_FEATURE_SVE_BITS==512
  // Mangled as 9__SVE_VLSIu11__SVInt32_tLj512EE
  typedef svint32_t vec __attribute__((arm_sve_vector_bits(512)));
  // Mangled as 9__SVE_VLSIu10__SVBool_tLj512EE
  typedef svbool_t pred __attribute__((arm_sve_vector_bits(512)));
  #endif
```

## SVE enum declarations

The following enum enumerates all the possible patterns returned by a PTRUE:

``` c
  enum svpattern
  {
    SV_POW2 = 0,
    SV_VL1 = 1,
    SV_VL2 = 2,
    SV_VL3 = 3,
    SV_VL4 = 4,
    SV_VL5 = 5,
    SV_VL6 = 6,
    SV_VL7 = 7,
    SV_VL8 = 8,
    SV_VL16 = 9,
    SV_VL32 = 10,
    SV_VL64 = 11,
    SV_VL128 = 12,
    SV_VL256 = 13,
    SV_MUL4 = 29,
    SV_MUL3 = 30,
    SV_ALL = 31
  };
```

The following enum lists the possible prefetch types:

``` c
  enum svprfop
  {
    SV_PLDL1KEEP = 0,
    SV_PLDL1STRM = 1,
    SV_PLDL2KEEP = 2,
    SV_PLDL2STRM = 3,
    SV_PLDL3KEEP = 4,
    SV_PLDL3STRM = 5,
    SV_PSTL1KEEP = 8,
    SV_PSTL1STRM = 9,
    SV_PSTL2KEEP = 10,
    SV_PSTL2STRM = 11,
    SV_PSTL3KEEP = 12,
    SV_PSTL3STRM = 13
  };
```

Both enums are defined by [`<arm_sve.h>`](#arm_sve.h).

## SVE intrinsics

### SVE naming convention

The SVE ACLE intrinsics have the form:

``` c
  svbase[_disambiguator][_type0][_type1]...[_predication]
```

where the individual parts are as follows:

**base**

> For most intrinsics this is the lower-case name of an SVE
> instruction, but with some adjustments:
>
> *   The most common change is to drop `F`, `S` and `U` if they
>     stand for “floating-point”, “signed” and “unsigned” respectively,
>     in cases where this would duplicate information in the type
>     suffixes below.
>
> *   Simple non-extending loads and non-truncating stores drop the
>     size suffix (`B`, `H`, `W` or `D`), which would always duplicate
>     information in the suffixes.
>
> *   Conversely, extending loads always specify an explicit extension
>     type, since this information is not available in the suffixes.
>     A sign-extending load has the same base as the architectural
>     instruction (for instance, `ld1sb`) while a zero-extending load replaces
>     the `s` with a `u` (for instance, `ld1ub` for a zero-extending `LD1B`).
>     Thus [`svld1ub_u32`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1ub_u32)
>     zero-extends 8-bit data to a vector of
>     `uint32_t`s while [`svld1sb_u32`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1sb_u32)
>     sign-extends 8-bit data to a vector of `uint32_t`s.

**disambiguator**

> This field distinguishes between different forms of an intrinsic.
> There are several common uses:
>
> *   Load, store, prefetch, and ADR intrinsics use this field to
>     distinguish between different addressing modes. See
>     [SVE addressing modes](#sve-addressing-modes) for a detailed
>     description of these modes.
>
> *   Arithmetic operations use the disambiguator `_n` when the final
>     operand is a scalar rather than a vector. See [SVE operations involving
>     vectors and scalars](#sve-operations-involving-vectors-and-scalars)
>     for more information about these operations.
>
> *   Some predicate-based operations use the disambiguator `_pat` to
>     show that they operate on an explicit constant predicate pattern
>     like `MUL3` instead of either an all-true predicate or an `svbool_t`.

<!-- Trailing whitespace is deliberate here -->
**type0**  
**type1**  
...

> These fields list the types of vectors and predicates, starting with
> the return type and continuing with the argument types. They do not
> include the types of vector bases and displacements, which form part
> of the addressing mode disambiguator instead. They also do not
> include argument types that are uniquely determined by the previous
> argument types and return type.
>
> For vectors the field is a type category followed by an element size
> in bits:
>
> | **Type category**            | **8-bit** | **16-bit** | **32-bit** | **64-bit** |
> | ---------------------------- | --------- | ---------- | ---------- | ---------- |
> | signed integers              | `s8`      | `s16`      | `s32`      | `s64`      |
> | unsigned integers            | `u8`      | `u16`      | `u32`      | `u64`      |
> | floating-point numbers       |           | `f16`      | `f32`      | `f64`      |
> | brain floating-point numbers |           | `bf16`     |            |            |
>
> For predicates the suffix is `b` followed by the size of the
> associated data elements in bits, or simply `b` if the operation
> does not assume a particular element size. For example, the intrinsic
> for
>
> ``` asm
>   PTRUE Pd.B
> ```
>
> is [`svptrue_b8`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svptrue_b8)
> while the intrinsic for
>
> ``` asm
>   PTRUE Pd.H
> ```
>
> is [`svptrue_b16`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svptrue_b16)
> The intrinsic for:
>
> ``` asm
>   PFALSE Pd.B
> ```
>
> is [`svpfalse_b`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svpfalse_b)
> rather than `svpfalse_b8` since the result is suitable for all element sizes.

**predication**

> This suffix describes the inactive elements in the result of a
> predicated operation. It can be one of the following:
>
> **`z`**
>
> > Zero predication: set all inactive elements of the result to zero.
>
> **`m`**
>
> > Merge predication: copy all inactive elements from the first
> > vector argument.
> >
> > Unary operations have a separate vector argument that comes
> > before the general predicate; for example:
> >
> > ``` asm
> >   CLZ Zd.H, Pg/M, Zs.H
> > ```
> >
> > corresponds to:
> >
> > ``` c
> >   Zd = svclz_u16_m(Zd, Pg, Zs);
> > ```
> >
> > The argument does not need to be syntactically related to the result;
> > calls such as:
> >
> > ``` c
> >   Zd = svclz_u16_m(svadd_u16_z(...), Pg, Zs);
> > ```
> >
> > are also valid.
> >
> > Binary and ternary operations reuse the first argument to the
> > operation as the merge input; for example:
> >
> > ``` asm
> >   ADD Zd.S, Pg/M, Zd.S, Zs2.S
> > ```
> >
> > corresponds to:
> >
> > ``` c
> >   Zd = svadd_u32_m(Pg, Zd, Zs2);
> > ```
> >
> > where the `Zd` argument supplies both the values of inactive
> > elements and the first operand to the addition. Again, the merge
> > input does not need to be syntactically related to the result.
>
> **`x`**
>
> > “Don't-care” predication: set the inactive elements to
> > **unknown** values.
> >
> > Warning: these values could be arbitrary register contents left
> > around from a previous operation, so accidentally using the inactive
> > elements could lead to data leakage.
> >
> > This form of predication removes the need to choose between
> > zeroing and merging in cases where the inactive elements are
> > unimportant. The code generator can then pick whichever form of
> > instruction seems to give the best code. This includes using
> > unpredicated instructions, where available and suitable.
>
> Predicated loads, predicated comparisons and predicated string match
> operations are always zeroing operations, so for brevity, the
> corresponding intrinsics have no predication suffix.

### Overloaded aliases of SVE intrinsics

The intrinsic names that are described in [SVE naming
convention](#sve-naming-convention) often carry information that is
obvious from the types of the arguments. For example, `svclz_u16_z`
always takes a `svuint16_t` and no other form of `svclz_type_z` does.
ACLE therefore defines shorter, overloaded, aliases that are compatible
with both C++ overloading and C `_Generic` associations. At a
minimum, this means that all overloaded forms of an intrinsic have the
same number of arguments and that it is possible to select the correct
overload by considering each argument from left to right.

(Although the overloading scheme is compatible with `_Generic`, a C
implementation can use other implementation-specific ways of achieving
the same effect.)

The usual integer promotions mean that overloading based on scalar
integer types can be non-obvious. For example, in the C++ code:

``` c
  int f(unsigned char) { return 1; }
  int f(int) { return 2; }
  int g1(unsigned char c) { return f(c); }
  int g2(unsigned char c) { return f(c + 1); }
```

`g1` returns 1 but `g2` returns 2. A cast would be required to make
`g2` use the `unsigned char` version of `f` instead of the `int` version.
For this reason, ACLE does not use overloading of scalar arguments
alone to determine the type of a vector result. Intrinsics like `svdup`
and `svindex` (whose only arguments are scalar) always require a suffix
indicating the return type.

Overloaded aliases are always a full intrinsic name with parts of the
suffix removed. The rest of this document refers to both the full
intrinsic name and its overloaded alias by enclosing the elided suffix
characters in square brackets. For example:

``` c
  svclz[_u16]_m
```

says that the full name is `svclz_u16_m` and that its overloaded alias
is `svclz_m`.

### SVE addressing modes

Load, store, prefetch, and ADR intrinsics have different forms for
different addressing modes. The exact set of addressing modes depends on
the particular operation, but they always have a base component and may
also have a displacement component.

The base may be either a single C pointer or a vector of address values.
In the latter case, the address values may be 32 or 64 bits in size.
Addressing modes with vector bases use the disambiguator `[_xNNbase]`,
where `xNN` is the type of the address vector elements.

The displacement, if present, may be a 64-bit scalar or a vector of
32-bit or 64-bit elements. There are five forms in total, with the
following disambiguators:

**`_offset`**

> The displacement is a 64-bit scalar byte count.

**`_index`**

> The displacement is a 64-bit scalar element count. For example, if an
> intrinsic loads 16-bit elements from memory, an `_index` displacement
> of 1 is equivalent to an `_offset` displacement of 2.

**`_vnum`**

> The displacement is a 64-bit scalar that counts a single vector's
> worth of elements. For example, if an intrinsic loads one or more full
> vectors from memory, a `_vnum` displacement of 1 is equivalent to
> an `_offset` displacement of VG×8 (the number of bytes in an SVE
> vector). If an intrinsic loads 16-bit elements and extends them to
> 32 bits, a `_vnum` displacement of 1 is equivalent to an `_offset`
> displacement of VG×4 (half the number of bytes in an SVE vector).
>
> This form corresponds to the `MUL VL` addressing mode. However,
> the displacement argument can be any scalar value; it does not need
> to be a constant in a particular range.

**`_[xNN]offset`**

> The displacement is a vector of type `xNN` and each element specifies
> a separate byte count. In other words:
>
> *   `_[s32]offset` specifies a vector of signed 32-bit byte counts
>     and is equivalent to the `SXTW` addressing mode.
>
> *   `_[u32]offset` specifies a vector of unsigned 32-bit byte counts
>      and is equivalent to the `UXTW` addressing mode.
>
> *   `_[s64]offset` and `_[u64]offset` both specify vectors of 64-bit byte
>     counts; the sign is unimportant in this case.

**`_[xNN]index`**

> Similar to `_[xNN]offset`, but each element specifies an element
> count rather than a byte count, in the same way as for `_index`.

These displacements do not need to be constant and they do not need to
be within a specific range.

For example, the simplest load addressing mode is:

``` c
  svint16_t svld1[_s16](svbool_t pg, const int16_t *base)
```

which loads N elements from `base[0]` to `base[N-1]` inclusive.

It is possible to apply a displacement measured in whole vectors using:

``` c
  svint16_t svld1_vnum[_s16](svbool_t pg, const int16_t *base, int64_t vnum)
```

which loads N elements from `base[N*vnum]` to `base[N*vnum+N-1]` inclusive.

The following intrinsic instead takes a vector of offsets, measured in bytes:

``` c
  svuint32_t svld1_gather_[s32]offset[_u32](svbool_t pg, const uint32_t *base,
                                            svint32_t offsets)
```

In this case the address of element i is:

``` c
  (int32_t *)((uintptr_t)base + offsets[i])
```

For:

``` c
  svuint32_t svld1_gather_[s32]index[_u32](svbool_t pg, const uint32_t *base,
                                           svint32_t indices)
```

the address of element i is simply `&base[indices[i]]`.

The following intrinsic is an example of one that combines a vector base
with a scalar index:

``` c
  svint32_t svld1_gather[_u32base]_index_s32(svbool_t pg, svuint32_t bases,
                                             int64_t index)
```

The address of element i is:

``` c
  ((int32_t *)(uintptr_t)bases[i]) + index
```

### SVE operations involving vectors and scalars

Some of the SVE instructions have immediate forms; for example:

``` c
  ADD Zd.S, Zd.S, #1
```

adds 1 to every element of `Zd.S`. ACLE extends this approach to
all arithmetic operations and to all scalar inputs (not just immediates).
The implementation can then use immediate forms where possible or duplicate
the scalar into a vector otherwise.

For example:

``` c
  svint32_t x;
  ...
  x = svadd[_n_s32]_x(pg, x, 1);
```

adds 1 to every active element of `x` while:

``` c
  svfloat64_t x;
  double *ptr;
  ...
  x = svadd[_n_f64]_x(pg, x, *ptr);
```

adds `*ptr` to every active element of `x`. The first example is
likely to use the immediate form of ADD while the latter is likely to
use LD1RD.

In a vector operation, the disambiguator `_n` indicates that the final
operand is a scalar rather than a vector.

### Immediate arguments to SVE intrinsics

Some intrinsics take enumeration values as arguments. These enumerations
must always be integer constant expressions that specify a valid
enumeration value.

A few intrinsics take general integer immediates as arguments. In the
[intrinsics documentation](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiessimdisa=[sve,sve2]),
these arguments always start with the prefix `imm`. Immediate arguments
must be integer constant expressions within a certain range (which is
the same as the range of the underlying SVE instruction).

### Faults and exceptions in SVE intrinsics

Loads and stores can trigger faults in the same way as normal pointer
dereferences. Exactly what happens then depends on the host environment
and is out of scope for this document. However, these faults should be
symptoms of a program going wrong rather than something that the
programmer deliberately planted. The implementation can therefore remove
or reorder potentially faulting operations as long as:

*   doing so would not cause a previously non-faulting program to fault;
    and

*   faults do not move between C++ exception blocks, in cases where
    faults are reported as exceptions.

Also, many floating-point operations can raise IEEE exceptions. A
similar set of rules apply there: the implementation can remove or
reorder operations that might raise an IEEE exception if:

*   doing so would not cause a program to raise IEEE exceptions in cases
    where it would not previously;

*   IEEE exceptions do not move between C++ exception blocks, in cases
    where IEEE exceptions are reported as C++ exceptions; and

*   IEEE exceptions do not move across functions that manipulate the IEEE
    exception state.

For example, the compiler can remove a floating-point addition whose
result is not used. It can also reorder independent floating-point
operations, even if that would change the order that exceptions occur.
It cannot however move floating-point addition across a direct or
indirect call to `feclearexcept` unless it can prove that the addition
would not raise an exception.

Many code generators have a mode that ignores IEEE exceptions. The
floating-point restrictions above would not apply when such a mode is in
effect.

### First-faulting and non-faulting loads

SVE provides load instructions in which only the first active element
can fault, and others in which no elements can fault. A special register
called the first-fault register (FFR) records which elements were loaded
successfully. The FFR describes all loads that have executed since the
last write to the register.

If a first-faulting or non-faulting load does not load an active element
due to a potential fault, it clears the FFR from that element onwards.
Those elements of the returned vector then have an unknown value.
Elements also have an unknown value if the associated FFR element was
*already* clear before the instruction started.

For example, in:

``` asm
  SETFFR
  LDFF1D Z0.D, P0/Z, [X0]
  LDFF1D Z1.D, P1/Z, [X1]
  LDFF1D Z2.D, P2/Z, [X2]
  RDFFR P3.B
```

the load of `Z0.D` might suppress the load of `[X0, #16]` due to a
potential fault. It would then clear bit 16 onwards of the FFR and leave
elements 2 onwards of `Z0.D` in an unknown state. The same elements of
`Z1.D` and `Z2.D` would then also be unknown, regardless of whether
the loads based on `X1` or `X2` might fault. At the end of the
sequence, `P3.B` indicates which elements of `Z0.D`, `Z1.D` and
`Z2.D` are valid.

In this sequence, the leading inactive elements of `Z0.D` are
guaranteed to be zero and the first active element is guaranteed to be
valid (assuming that the first element did not trigger a fault). The
same guarantees apply to `Z1.D` only if the first active element of
`P1` is guaranteed to be earlier than the second active element of
`P0`. In this sense, the contents of `Z0.D`, `Z1.D` and `Z2.D`
do depend on the order of the instructions, since the guarantees would
be different if the loads had a different order. However, the point of
the loads is to try to access more than the first active element, so
these relationships are not useful in practice.

ACLE therefore divides first-faulting and non-faulting loads (but
not normal loads) into “FFR groups”. Each group begins and ends with an
intrinsic that explicitly reads from or writes to the FFR. More precisely,
ACLE introduces a global “first-fault register token” (FFRT) that identifies
the current FFR group. This FFRT is a purely conceptual construct and contains
three pieces of information:

| **Identifier** | **Contents**                                                   |
| -------------- | -------------------------------------------------------------- |
| *nwrite*       | the number of explicit writes to the FFR                       |
| *lastwrite*    | the last value written to the FFR                              |
| *nread*        | the number of explicit reads from the FFR since the last write |

There are only two possible ways of modifying this FFRT:

1.  Increment *nwrite* by one, set *lastwrite* to a given value, and set
    *nread* to zero.

2.  Increment *nread* by one.

Intrinsics that explicitly write to the FFR do the first operation.
Intrinsics that explicitly read from the FFR do the second operation.
First-faulting and non-faulting loads read from the FFRT and depend on
its value, but they do not write to it.

One consequence of this arrangement is that an intrinsic that writes to
the FFR is only dead if there are no further references to the FFRT in
the program. However, the normal “as if” rules apply, so the implementation
can produce an empty code sequence for the write if doing so would not
affect the behavior of the program. Similarly, if a first-faulting or
non-faulting load follows an intrinsic that explicitly reads from the FFR,
without an intervening write, the load keeps the read intrinsic alive
even if the result of that read is unused. Again, the normal “as if”
rules mean that the implementation can produce an empty code sequence
for the read if doing so would not affect the behavior of the program.

These FFRT dependencies are the only FFR-based ones that the implementation
needs to consider when optimizing first-faulting and non-faulting loads;
in all other respects the implementation can treat the loads like normal
loads. This includes removing loads whose results are not used,
suppressing loads of individual elements if their values do not matter,
or reordering loads within a group (subject to the usual rules for
normal loads). In practice the value of the FFR before a load does still
affect which elements of the load result are defined, and in practice
the loads do still write to the FFR, but the input program does not
control these effects directly.

Assuming `float64_t` data, the C version of the code above would be:

``` c
  svfloat64_t z0, z1, z2;
  svbool_t p0, p1, p2, p3;
  double *x0, *x1, *x2;
  ...
  svsetffr();
  z0 = svldff1[_f64](p0, x0);
  z1 = svldff1[_f64](p1, x1);
  z2 = svldff1[_f64](p2, x2);
  p3 = svrdffr();
```

### SVE reinterpret intrinsics

The `svreinterpret` intrinsics for vector types and vector tuple types take the form

``` c
svreinterpret_type0[_type1_xN]
```

where `N` refers to the number of elements in a tuple type (2, 3, or 4).

For example:
``` c
svuin16_t svreinterpret_u16_s32(svint32_t op);
svuin16_t svreinterpret_u16(svint32_t op);
svuin16x2_t svreinterpret_u16_s32_x2(svint32x2_t op);
svuin16x2_t svreinterpret_u16(svint32x2_t op);
```

A list of SVE reinterpret intrinsics can be found on [developer.arm.com](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svreinterpret).

### List of SVE intrinsics

The list of SVE intrinsics can be found on
[developer.arm.com](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiessimdisa=[sve,sve2]).
This list includes SVE2 and other SVE extensions (such as the 32-bit
matrix multiply extensions).

The tick boxes on the left can be used to narrow the displayed
intrinsics to particular data types and element sizes. Below that is an
instruction group hierarchy that groups the intrinsics based on the
operation that they perform.

### Mapping of SVE instructions to intrinsics

#### List of instructions

This section contains a list of all SVE instructions. For each one it
gives a reference to the associated ACLE intrinsic or explains why no
such intrinsic exists. The list includes SVE2 and other SVE extensions
(such as the 32-bit matrix multiply extensions).

| **Instruction**                      | **Intrinsic** |
| ------------------------------------ | ------------- |
| ABS                                  | [`svabs`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svabs) |
| ADCLB                                | [`svadclb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svadclb) |
| ADCLT                                | [`svadclt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svadclt) |
| ADD (immediate)                      | [`svadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svadd[) |
| ADD (vectors, predicated)            | [`svadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svadd[) |
| ADD (vectors, unpredicated)          | [`svadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svadd[) |
| ADDHNB                               | [`svaddhnb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svaddhnb) |
| ADDHNT                               | [`svaddhnt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svaddhnt) |
| ADDP                                 | [`svaddp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int,uint]&q=svaddp) |
| ADDPL                                | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| ADDVL                                | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| ADR                                  | [`svadrb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svadrb), [`svadrh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svadrh), [`svadrw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svadrw), [`svadrd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svadrd) |
| AESD                                 | [`svaesd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svaesd) |
| AESE                                 | [`svaese`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svaese) |
| AESIMC                               | [`svaesimc`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svaesimc) |
| AESMC                                | [`svaesmc`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svaesmc) |
| AND (immediate)                      | [`svand`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int,uint]&q=svand[) |
| AND (predicates)                     | [`svand`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svand) |
| AND (vectors, predicated)            | [`svand`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int,uint]&q=svand[) |
| AND (vectors, unpredicated)          | [`svand`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int,uint]&q=svand[) |
| ANDS                                 | [`svand`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svand) |
| ANDV                                 | [`svandv`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svandv) |
| ASR (immediate, predicated)          | [`svasr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svasr[) |
| ASR (immediate, unpredicated)        | [`svasr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svasr[) |
| ASR (vectors)                        | [`svasr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svasr[) |
| ASR (wide elements, predicated)      | [`svasr_wide`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svasr_wide) |
| ASR (wide elements, unpredicated)    | [`svasr_wide`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svasr_wide) |
| ASRD                                 | [`svasrd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svasrd) |
| ASRR                                 | [`svasr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svasr) (optimization of `_x` forms) |
| BCAX                                 | [`svbcax`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbcax) |
| BDEP                                 | [`svbdep`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbdep) |
| BEXT                                 | [`svbext`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbext) |
| BFCVT                                | [`svcvt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcvt_bf16) |
| BFCVTNT                              | [`svcvtnt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcvtnt_bf16) |
| BFDOT                                | [`svbfdot`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbfdot) |
| BFMLALB                              | [`svbfmlalb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbfmlalb) |
| BFMLALT                              | [`svbfmlalt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbfmlalt) |
| BFMMLA                               | [`svbfmmla`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbfmmla) |
| BGRP                                 | [`svbgrp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbgrp) |
| BIC (immediate)                      | [`svbic`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int,uint]&q=svbic[) |
| BIC (predicates)                     | [`svbic`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svbic) |
| BIC (vectors, predicated)            | [`svbic`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int,uint]&q=svbic[) |
| BIC (vectors, unpredicated)          | [`svbic`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int,uint]&q=svbic[) |
| BICS                                 | [`svbic`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svbic) |
| BRKA                                 | [`svbrka`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbrka) |
| BRKAS                                | [`svbrka`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbrka) |
| BRKB                                 | [`svbrkb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbrkb) |
| BRKBS                                | [`svbrkb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbrkb) |
| BRKN                                 | [`svbrkn`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbrkn) |
| BRKNS                                | [`svbrkn`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbrkn) |
| BRKPA                                | [`svbrkpa`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbrkpa) |
| BRKPAS                               | [`svbrkpa`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbrkpa) |
| BRKPB                                | [`svbrkpb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbrkpb) |
| BRKPBS                               | [`svbrkpb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbrkpb) |
| BSL                                  | [`svbsl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbsl[) |
| BSL1N                                | [`svbsl1n`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbsl1n) |
| BSL2N                                | [`svbsl2n`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svbsl2n) |
| CADD                                 | [`svcadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcadd) |
| CDOT (indexed)                       | [`svcdot_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcdot_lane) |
| CDOT (vectors)                       | [`svcdot`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcdot[) |
| CLASTA (SIMD & FP scalar)            | [`svclasta`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svclasta) |
| CLASTA (scalar)                      | [`svclasta`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svclasta) |
| CLASTA (vectors)                     | [`svclasta`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svclasta) |
| CLASTB (SIMD & FP scalar)            | [`svclastb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svclastb) |
| CLASTB (scalar)                      | [`svclastb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svclastb) |
| CLASTB (vectors)                     | [`svclastb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svclastb) |
| CLS                                  | [`svcls`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcls) |
| CLZ                                  | [`svclz`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svclz) |
| CMLA (indexed)                       | [`svcmla_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int,uint]&q=svcmla_lane) |
| CMLA (vectors)                       | [`svcmla`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int,uint]&q=svcmla[) |
| CMPEQ (immediate)                    | [`svcmpeq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svcmpeq[) |
| CMPEQ (vectors)                      | [`svcmpeq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svcmpeq[) |
| CMPEQ (wide elements)                | [`svcmpeq_wide`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcmpeq_wide) |
| CMPGE (immediate)                    | [`svcmpge`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svcmpge[) |
| CMPGE (vectors)                      | [`svcmpge`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svcmpge[) |
| CMPGE (wide elements)                | [`svcmpge_wide`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svcmpge_wide) |
| CMPGT (immediate)                    | [`svcmpgt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svcmpgt[) |
| CMPGT (vectors)                      | [`svcmpgt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svcmpgt[) |
| CMPGT (wide elements)                | [`svcmpgt_wide`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svcmpgt_wide) |
| CMPHI (immediate)                    | [`svcmpgt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svcmpgt[) |
| CMPHI (vectors)                      | [`svcmpgt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svcmpgt[) |
| CMPHI (wide elements)                | [`svcmpgt_wide`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svcmpgt_wide) |
| CMPHS (immediate)                    | [`svcmpge`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svcmpge[) |
| CMPHS (vectors)                      | [`svcmpge`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svcmpge[) |
| CMPHS (wide elements)                | [`svcmpge_wide`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svcmpge_wide) |
| CMPLE (immediate)                    | [`svcmple`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svcmple[) |
| CMPLE (vectors)                      | [`svcmple`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svcmple[) |
| CMPLE (wide elements)                | [`svcmple_wide`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svcmple_wide) |
| CMPLO (immediate)                    | [`svcmplt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svcmplt[) |
| CMPLO (vectors)                      | [`svcmplt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svcmplt[) |
| CMPLO (wide elements)                | [`svcmplt_wide`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svcmplt_wide) |
| CMPLS (immediate)                    | [`svcmple`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svcmple[) |
| CMPLS (vectors)                      | [`svcmple`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svcmple[) |
| CMPLS (wide elements)                | [`svcmple_wide`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svcmple_wide) |
| CMPLT (immediate)                    | [`svcmplt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svcmplt[) |
| CMPLT (vectors)                      | [`svcmplt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svcmplt[) |
| CMPLT (wide elements)                | [`svcmplt_wide`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svcmplt_wide) |
| CMPNE (immediate)                    | [`svcmpne`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svcmpne[) |
| CMPNE (vectors)                      | [`svcmpne`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svcmpne[) |
| CMPNE (wide elements)                | [`svcmpne_wide`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svcmpne_wide) |
| CNOT                                 | [`svcnot`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcnot) |
| CNT                                  | [`svcnt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcnt[) |
| CNTB                                 | [`svcntb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcntb) |
| CNTD                                 | [`svcntd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcntd) |
| CNTH                                 | [`svcnth`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcnth) |
| CNTP                                 | [`svcntp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcntp) |
| CNTW                                 | [`svcntw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcntw) |
| COMPACT                              | [`svcompact`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcompact) |
| CPY (SIMD & FP scalar)               | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdup[_n]) (predicated forms) |
| CPY (immediate)                      | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdup[_n]) (predicated forms) |
| CPY (scalar)                         | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdup[_n]) (predicated forms) |
| CTERMEQ                              | See [CTERMEQ and CTERMNE](#ctermeq-and-ctermne) |
| CTERMNE                              | See [CTERMEQ and CTERMNE](#ctermeq-and-ctermne) |
| DECB                                 | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| DECD (scalar)                        | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| DECD (vector)                        | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| DECH (scalar)                        | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| DECH (vector)                        | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| DECP (scalar)                        | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| DECP (vector)                        | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| DECW (scalar)                        | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| DECW (vector)                        | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| DUP (immediate)                      | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdup[_n]), [`svdupq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdupq[_n]) |
| DUP (indexed)                        | [`svdup_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdup_lane), [`svdupq_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdupq_lane) |
| DUP (scalar)                         | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdup[_n]), [`svdupq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdupq[_n]) |
| DUPM                                 | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdup[_n]), [`svdupq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdupq[_n]) |
| EON                                  | [`sveor`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int,uint]&q=sveor[) |
| EOR (immediate)                      | [`sveor`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int,uint]&q=sveor[) |
| EOR (predicates)                     | [`sveor`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=sveor) |
| EOR (vectors, predicated)            | [`sveor`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int,uint]&q=sveor[) |
| EOR (vectors, unpredicated)          | [`sveor`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int,uint]&q=sveor[) |
| EOR3                                 | [`sveor3`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=sveor3) |
| EORBT                                | [`sveorbt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=sveorbt) |
| EORS                                 | [`sveor`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=sveor) |
| EORTB                                | [`sveortb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=sveortb) |
| EORV                                 | [`sveorv`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=sveorv) |
| EXT                                  | [`svext`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svext[) |
| FABD                                 | [`svabd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svabd[) |
| FABS                                 | [`svabs`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svabs) |
| FACGE                                | [`svacge`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svacge) |
| FACGT                                | [`svacgt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svacgt) |
| FACLE                                | [`svacle`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svacle) |
| FACLT                                | [`svaclt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svaclt) |
| FADD (immediate)                     | [`svadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svadd[) |
| FADD (vectors, predicated)           | [`svadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svadd[) |
| FADD (vectors, unpredicated)         | [`svadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svadd[) |
| FADDA                                | [`svadda`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svadda) |
| FADDP                                | [`svaddp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svaddp) |
| FADDV                                | [`svaddv`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svaddv) |
| FCADD                                | [`svcadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svcadd) |
| FCMEQ (vectors)                      | [`svcmpeq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svcmpeq) |
| FCMEQ (zero)                         | [`svcmpeq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svcmpeq) |
| FCMGE (vectors)                      | [`svcmpge`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svcmpge) |
| FCMGE (zero)                         | [`svcmpge`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svcmpge) |
| FCMGT (vectors)                      | [`svcmpgt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svcmpgt) |
| FCMGT (zero)                         | [`svcmpgt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svcmpgt) |
| FCMLA (indexed)                      | [`svcmla`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svcmla) |
| FCMLA (vectors)                      | [`svcmla`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svcmla) |
| FCMLE (vectors)                      | [`svcmple`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svcmple) |
| FCMLE (zero)                         | [`svcmple`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svcmple) |
| FCMLT (vectors)                      | [`svcmplt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svcmplt) |
| FCMLT (zero)                         | [`svcmplt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svcmplt) |
| FCMNE (vectors)                      | [`svcmpne`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svcmpne) |
| FCMNE (zero)                         | [`svcmpne`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svcmpne) |
| FCMUO                                | [`svcmpuo`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svcmpuo) |
| FCPY                                 | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svdup) (predicated forms) |
| FCVT                                 | [`svcvt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcvt_) |
| FCVTLT                               | [`svcvtlt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcvtlt) |
| FCVTNT                               | [`svcvtnt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcvtnt_f) |
| FCVTX                                | [`svcvtx`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcvtx_) |
| FCVTXNT                              | [`svcvtxnt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcvtxnt) |
| FCVTZS                               | [`svcvt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcvt_) |
| FCVTZU                               | [`svcvt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcvt_) |
| FDIV                                 | [`svdiv`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svdiv[) |
| FDIVR                                | [`svdivr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svdivr) |
| FDUP                                 | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svdup[_n]) |
| FEXPA                                | [`svexpa`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svexpa) |
| FLOGB                                | [`svlogb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svlogb) |
| FMAD                                 | [`svmad`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmad) |
| FMAX (immediate)                     | [`svmax`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmax[) |
| FMAX (vectors)                       | [`svmax`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmax[) |
| FMAXNM (immediate)                   | [`svmaxnm`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmaxnm[) |
| FMAXNM (vectors)                     | [`svmaxnm`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmaxnm[) |
| FMAXNMP                              | [`svmaxnmp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmaxnmp) |
| FMAXNMV                              | [`svmaxnmv`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmaxnmv) |
| FMAXP                                | [`svmaxp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmaxp) |
| FMAXV                                | [`svmaxv`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmaxv) |
| FMIN (immediate)                     | [`svmin`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmin[) |
| FMIN (vectors)                       | [`svmin`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmin[) |
| FMINNM (immediate)                   | [`svminnm`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svminnm[) |
| FMINNM (vectors)                     | [`svminnm`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svminnm[) |
| FMINNMP                              | [`svminnmp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svminnmp) |
| FMINNMV                              | [`svminnmv`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svminnmv) |
| FMINP                                | [`svminp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svminp) |
| FMINV                                | [`svminv`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svminv) |
| FMLA (indexed)                       | [`svmla`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmla[) |
| FMLA (vectors)                       | [`svmla`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmla[) |
| FMLALB (indexed)                     | [`svmlalb_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmlalb_lane) |
| FMLALB (vectors)                     | [`svmlalb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmlalb[) |
| FMLALT (indexed)                     | [`svmlalt_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmlalt_lane) |
| FMLALT (vectors)                     | [`svmlalt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmlalt[) |
| FMLS (indexed)                       | [`svmls_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmls_lane) |
| FMLS (vectors)                       | [`svmls`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmls[) |
| FMLSLB (indexed)                     | [`svmlslb_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmlslb_lane) |
| FMLSLB (vectors)                     | [`svmlslb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmlslb[) |
| FMLSLT (indexed)                     | [`svmlslt_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmlslt_lane) |
| FMLSLT (vectors)                     | [`svmlslt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmlslt[) |
| FMMLA                                | [`svmmla`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmmla) |
| FMOV (immediate, predicated)         | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svdup[_n]) |
| FMOV (immediate, unpredicated)       | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svdup[_n]) |
| FMOV (zero, predicated)              | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svdup[_n]) |
| FMOV (zero, unpredicated)            | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svdup[_n]) |
| FMSB                                 | [`svmsb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmsb) |
| FMUL (immediate)                     | [`svmul`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmul[) |
| FMUL (indexed)                       | [`svmul`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmul[) |
| FMUL (vectors, predicated)           | [`svmul`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmul[) |
| FMUL (vectors, unpredicated)         | [`svmul`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmul[) |
| FMULX                                | [`svmulx`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svmulx) |
| FNEG                                 | [`svneg`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svneg) |
| FNMAD                                | [`svnmad`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svnmad) |
| FNMLA                                | [`svnmla`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svnmla) |
| FNMLS                                | [`svnmls`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svnmls) |
| FNMSB                                | [`svnmsb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svnmsb) |
| FRECPE                               | [`svrecpe`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svrecpe) |
| FRECPS                               | [`svrecps`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svrecps) |
| FRECPX                               | [`svrecpx`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svrecpx) |
| FRINTA                               | [`svrinta`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svrinta) |
| FRINTI                               | [`svrinti`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svrinti) |
| FRINTM                               | [`svrintm`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svrintm) |
| FRINTN                               | [`svrintn`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svrintn) |
| FRINTP                               | [`svrintp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svrintp) |
| FRINTX                               | [`svrintx`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svrintx) |
| FRINTZ                               | [`svrintz`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svrintz) |
| FRSQRTE                              | [`svrsqrte`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svrsqrte) |
| FRSQRTS                              | [`svrsqrts`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svrsqrts) |
| FSCALE                               | [`svscale`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svscale) |
| FSQRT                                | [`svsqrt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svsqrt) |
| FSUB (immediate)                     | [`svsub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svsub[) |
| FSUB (vectors, predicated)           | [`svsub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svsub[) |
| FSUB (vectors, unpredicated)         | [`svsub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svsub[) |
| FSUBR (immediate)                    | [`svsubr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svsubr) |
| FSUBR (vectors)                      | [`svsubr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svsubr) |
| FTMAD                                | [`svtmad`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svtmad) |
| FTSMUL                               | [`svtsmul`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svtsmul) |
| FTSSEL                               | [`svtssel`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[float]&q=svtssel) |
| HISTCNT                              | [`svhistcnt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svhistcnt) |
| HISTSEG                              | [`svhistseg`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svhistseg) |
| INCB                                 | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| INCD (scalar)                        | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| INCD (vector)                        | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| INCH (scalar)                        | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| INCH (vector)                        | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| INCP (scalar)                        | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| INCP (vector)                        | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| INCW (scalar)                        | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| INCW (vector)                        | See [ADDPL, ADDVL, INC and DEC](#addpl-addvl-inc-and-dec) |
| INDEX (immediate, scalar)            | [`svindex`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svindex) |
| INDEX (immediates)                   | [`svindex`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svindex) |
| INDEX (scalar, immediate)            | [`svindex`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svindex) |
| INDEX (scalars)                      | [`svindex`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svindex) |
| INSR (SIMD & FP scalar)              | [`svinsr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svinsr) |
| INSR (scalar)                        | [`svinsr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svinsr) |
| LASTA (SIMD & FP scalar)             | [`svlasta`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svlasta) |
| LASTA (scalar)                       | [`svlasta`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svlasta) |
| LASTB (SIMD & FP scalar)             | [`svlastb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svlastb) |
| LASTB (scalar)                       | [`svlastb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svlastb) |
| LD1B (scalar plus immediate)         | [`svld1_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svld1_vnum), [`svld1ub_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1ub_vnum) |
| LD1B (scalar plus scalar)            | [`svld1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svld1[), [`svld1ub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#&q=svld1ub) |
| LD1B (scalar plus vector)            | [`svld1ub_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1ub_gather_[) |
| LD1B (vector plus immediate)         | [`svld1ub_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1ub_gather[) |
| LD1D (scalar plus immediate)         | [`svld1_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svld1_vnum) |
| LD1D (scalar plus scalar)            | [`svld1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svld1[) |
| LD1D (scalar plus vector)            | [`svld1_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svld1_gather_[) |
| LD1D (vector plus immediate)         | [`svld1_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svld1_gather[) |
| LD1H (scalar plus immediate)         | [`svld1_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svld1_vnum), [`svld1uh_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1uh_vnum) |
| LD1H (scalar plus scalar)            | [`svld1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svld1[), [`svld1uh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#&q=svld1uh) |
| LD1H (scalar plus vector)            | [`svld1uh_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1uh_gather_[) |
| LD1H (vector plus immediate)         | [`svld1uh_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1uh_gather[) |
| LD1RB                                | See [SVE LD1R instructions](#sve-ld1r-instructions) |
| LD1RD                                | See [SVE LD1R instructions](#sve-ld1r-instructions) |
| LD1RH                                | See [SVE LD1R instructions](#sve-ld1r-instructions) |
| LD1ROB (scalar plus immediate)       | [`svld1ro`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svld1ro) |
| LD1ROB (scalar plus scalar)          | [`svld1ro`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svld1ro) |
| LD1ROD (scalar plus immediate)       | [`svld1ro`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svld1ro) |
| LD1ROD (scalar plus scalar)          | [`svld1ro`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svld1ro) |
| LD1ROH (scalar plus immediate)       | [`svld1ro`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svld1ro) |
| LD1ROH (scalar plus scalar)          | [`svld1ro`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svld1ro) |
| LD1ROW (scalar plus immediate)       | [`svld1ro`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svld1ro) |
| LD1ROW (scalar plus scalar)          | [`svld1ro`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svld1ro) |
| LD1RQB (scalar plus immediate)       | [`svld1rq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svld1rq), [`svdupq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svdupq) |
| LD1RQB (scalar plus scalar)          | [`svld1rq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svld1rq), [`svdupq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svdupq) |
| LD1RQD (scalar plus immediate)       | [`svld1rq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svld1rq), [`svdupq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svdupq) |
| LD1RQD (scalar plus scalar)          | [`svld1rq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svld1rq), [`svdupq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svdupq) |
| LD1RQH (scalar plus immediate)       | [`svld1rq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svld1rq), [`svdupq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svdupq) |
| LD1RQH (scalar plus scalar)          | [`svld1rq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svld1rq), [`svdupq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svdupq) |
| LD1RQW (scalar plus immediate)       | [`svld1rq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svld1rq), [`svdupq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svdupq) |
| LD1RQW (scalar plus scalar)          | [`svld1rq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svld1rq), [`svdupq`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svdupq) |
| LD1RSB                               | See [SVE LD1R instructions](#sve-ld1r-instructions) |
| LD1RSH                               | See [SVE LD1R instructions](#sve-ld1r-instructions) |
| LD1RSW                               | See [SVE LD1R instructions](#sve-ld1r-instructions) |
| LD1RW                                | See [SVE LD1R instructions](#sve-ld1r-instructions) |
| LD1SB (scalar plus immediate)        | [`svld1sb_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1sb_vnum) |
| LD1SB (scalar plus scalar)           | [`svld1sb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1sb) |
| LD1SB (scalar plus vector)           | [`svld1sb_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1sb_gather_[) |
| LD1SB (vector plus immediate)        | [`svld1sb_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1sb_gather[) |
| LD1SH (scalar plus immediate)        | [`svld1sh_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1sh_vnum) |
| LD1SH (scalar plus scalar)           | [`svld1sh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1sh) |
| LD1SH (scalar plus vector)           | [`svld1sh_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1sh_gather_[) |
| LD1SH (vector plus immediate)        | [`svld1sh_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1sh_gather[) |
| LD1SW (scalar plus immediate)        | [`svld1sw_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1sw_vnum) |
| LD1SW (scalar plus scalar)           | [`svld1sw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1sw) |
| LD1SW (scalar plus vector)           | [`svld1sw_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1sw_gather_[) |
| LD1SW (vector plus immediate)        | [`svld1sw_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1sw_gather[) |
| LD1W (scalar plus immediate)         | [`svld1_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svld1_vnum), [`svld1uw_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1uw_vnum) |
| LD1W (scalar plus scalar)            | [`svld1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svld1[), [`svld1uw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#&q=svld1uw) |
| LD1W (scalar plus vector)            | [`svld1_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svld1_gather_[), [`svld1uw_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1uw_gather_[) |
| LD1W (vector plus immediate)         | [`svld1_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svld1_gather[), [`svld1uw_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svld1uw_gather[) |
| LD2B (scalar plus immediate)         | [`svld2_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svld2_vnum) |
| LD2B (scalar plus scalar)            | [`svld2`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svld2[) |
| LD2D (scalar plus immediate)         | [`svld2_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svld2_vnum) |
| LD2D (scalar plus scalar)            | [`svld2`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svld2[) |
| LD2H (scalar plus immediate)         | [`svld2_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svld2_vnum) |
| LD2H (scalar plus scalar)            | [`svld2`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svld2[) |
| LD2W (scalar plus immediate)         | [`svld2_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svld2_vnum) |
| LD2W (scalar plus scalar)            | [`svld2`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svld2[) |
| LD3B (scalar plus immediate)         | [`svld3_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svld3_vnum) |
| LD3B (scalar plus scalar)            | [`svld3`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svld3[) |
| LD3D (scalar plus immediate)         | [`svld3_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svld3_vnum) |
| LD3D (scalar plus scalar)            | [`svld3`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svld3[) |
| LD3H (scalar plus immediate)         | [`svld3_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svld3_vnum) |
| LD3H (scalar plus scalar)            | [`svld3`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svld3[) |
| LD3W (scalar plus immediate)         | [`svld3_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svld3_vnum) |
| LD3W (scalar plus scalar)            | [`svld3`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svld3[) |
| LD4B (scalar plus immediate)         | [`svld4_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svld4_vnum) |
| LD4B (scalar plus scalar)            | [`svld4`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svld4[) |
| LD4D (scalar plus immediate)         | [`svld4_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svld4_vnum) |
| LD4D (scalar plus scalar)            | [`svld4`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svld4[) |
| LD4H (scalar plus immediate)         | [`svld4_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svld4_vnum) |
| LD4H (scalar plus scalar)            | [`svld4`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svld4[) |
| LD4W (scalar plus immediate)         | [`svld4_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svld4_vnum) |
| LD4W (scalar plus scalar)            | [`svld4`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svld4[) |
| LDFF1B (scalar plus scalar)          | [`svldff1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svldff1[), [`svldff1ub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1ub) |
| LDFF1B (scalar plus vector)          | [`svldff1ub_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1ub_gather_[) |
| LDFF1B (vector plus immediate)       | [`svldff1ub_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1ub_gather[) |
| LDFF1D (scalar plus scalar)          | [`svldff1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svldff1[) |
| LDFF1D (scalar plus vector)          | [`svldff1_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svldff1_gather_[) |
| LDFF1D (vector plus immediate)       | [`svldff1_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svldff1_gather[) |
| LDFF1H (scalar plus scalar)          | [`svldff1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svldff1[), [`svldff1uh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1uh) |
| LDFF1H (scalar plus vector)          | [`svldff1uh_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1uh_gather_[) |
| LDFF1H (vector plus immediate)       | [`svldff1uh_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1uh_gather[) |
| LDFF1SB (scalar plus scalar)         | [`svldff1sb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1sb) |
| LDFF1SB (scalar plus vector)         | [`svldff1sb_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1sb_gather_[) |
| LDFF1SB (vector plus immediate)      | [`svldff1sb_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1sb_gather[) |
| LDFF1SH (scalar plus scalar)         | [`svldff1sh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1sh) |
| LDFF1SH (scalar plus vector)         | [`svldff1sh_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1sh_gather_[) |
| LDFF1SH (vector plus immediate)      | [`svldff1sh_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1sh_gather[) |
| LDFF1SW (scalar plus scalar)         | [`svldff1sw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1sw) |
| LDFF1SW (scalar plus vector)         | [`svldff1sw_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1sw_gather_[) |
| LDFF1SW (vector plus immediate)      | [`svldff1sw_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1sw_gather[) |
| LDFF1W (scalar plus scalar)          | [`svldff1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svldff1[), [`svldff1uw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1uw) |
| LDFF1W (scalar plus vector)          | [`svldff1_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svldff1_gather_[), [`svldff1uw_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1uw_gather_[) |
| LDFF1W (vector plus immediate)       | [`svldff1_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svldff1_gather[), [`svldff1uw_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldff1uw_gather[) |
| LDNF1B                               | [`svldnf1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svldnf1[), [`svldnf1ub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldnf1ub) |
| LDNF1D                               | [`svldnf1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svldnf1[) |
| LDNF1H                               | [`svldnf1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svldnf1[), [`svldnf1uh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldnf1uh) |
| LDNF1SB                              | [`svldnf1sb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldnf1sb) |
| LDNF1SH                              | [`svldnf1sh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldnf1sh) |
| LDNF1SW                              | [`svldnf1sw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldnf1sw) |
| LDNF1W                               | [`svldnf1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svldnf1[), [`svldnf1uw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldnf1uw) |
| LDNT1B (scalar plus immediate)       | [`svldnt1_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svldnt1_vnum) |
| LDNT1B (scalar plus scalar)          | [`svldnt1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svldnt1[) |
| LDNT1B (vector plus scalar)          | [`svldnt1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldnt1_gather), [`svldnt1ub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldnt1ub) |
| LDNT1D (scalar plus immediate)       | [`svldnt1_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svldnt1_vnum) |
| LDNT1D (scalar plus scalar)          | [`svldnt1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[64]&q=svldnt1[) |
| LDNT1D (vector plus scalar)          | [`svldnt1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldnt1_gather) |
| LDNT1H (scalar plus immediate)       | [`svldnt1_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svldnt1_vnum) |
| LDNT1H (scalar plus scalar)          | [`svldnt1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[16]&q=svldnt1[) |
| LDNT1H (vector plus scalar)          | [`svldnt1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldnt1_gather), [`svldnt1uh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldnt1uh) |
| LDNT1SB                              | [`svldnt1sb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldnt1sb) |
| LDNT1SH                              | [`svldnt1sh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldnt1sh) |
| LDNT1SW                              | [`svldnt1sw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldnt1sw) |
| LDNT1W (scalar plus immediate)       | [`svldnt1_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svldnt1_vnum) |
| LDNT1W (scalar plus scalar)          | [`svldnt1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[32]&q=svldnt1[) |
| LDNT1W (vector plus scalar)          | [`svldnt1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldnt1_gather), [`svldnt1uw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svldnt1uw) |
| LDR (predicate)                      | See [SVE LDR and STR](#sve-ldr-and-str) |
| LDR (vector)                         | See [SVE LDR and STR](#sve-ldr-and-str) |
| LSL (immediate, predicated)          | [`svlsl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svlsl[) |
| LSL (immediate, unpredicated)        | [`svlsl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svlsl[) |
| LSL (vectors)                        | [`svlsl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svlsl[) |
| LSL (wide elements, predicated)      | [`svlsl_wide`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svlsl_wide) |
| LSL (wide elements, unpredicated)    | [`svlsl_wide`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svlsl_wide) |
| LSLR                                 | [`svlsl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svlsl[) (optimization of `_x` forms) |
| LSR (immediate, predicated)          | [`svlsr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svlsr[) |
| LSR (immediate, unpredicated)        | [`svlsr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svlsr[) |
| LSR (vectors)                        | [`svlsr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svlsr[) |
| LSR (wide elements, predicated)      | [`svlsr_wide`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svlsr_wide) |
| LSR (wide elements, unpredicated)    | [`svlsr_wide`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svlsr_wide) |
| LSRR                                 | [`svlsr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svlsr[) (optimization of `_x` forms) |
| MAD                                  | [`svmad`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svmad) |
| MATCH                                | [`svmatch`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svmatch) |
| MLA (indexed)                        | [`svmla_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svmla_lane) |
| MLA (vectors)                        | [`svmla`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svmla[) |
| MLS (indexed)                        | [`svmls_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svmls_lane) |
| MLS (vectors)                        | [`svmls`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svmls[) |
| MOV (SIMD & FP scalar, predicated)   | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdup[_n]) |
| MOV (SIMD & FP scalar, unpredicated) | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdup[_n]) |
| MOV (bitmask immediate)              | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdup[_n]) |
| MOV (immediate, predicated)          | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdup[_n]) |
| MOV (immediate, unpredicated)        | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdup[_n]) |
| MOV (predicate, predicated, merging) | [`svsel`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svsel) |
| MOV (predicate, predicated, zeroing) | [`svmov`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svmov) |
| MOV (predicate, unpredicated)        | See [SVE MOV](#sve-mov) |
| MOV (scalar, predicated)             | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdup[_n]) |
| MOV (scalar, unpredicated)           | [`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdup[_n]) |
| MOV (vector, predicated)             | [`svsel`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int,float,bfloat]&q=svsel) |
| MOV (vector, unpredicated)           | See [SVE MOV](#sve-mov) |
| MOVPRFX (predicated)                 | See [MOVPRFX](#movprfx) |
| MOVPRFX (unpredicated)               | See [MOVPRFX](#movprfx) |
| MOVS (predicated)                    | [`svmov`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svmov) |
| MOVS (unpredicated)                  | See [SVE MOV](#sve-mov) |
| MSB                                  | [`svmsb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svmsb) |
| MUL (immediate)                      | [`svmul`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svmul[) |
| MUL (indexed)                        | [`svmul_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svmul_lane) |
| MUL (vectors, predicated)            | [`svmul`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svmul[) |
| MUL (vectors, unpredicated)          | [`svmul`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svmul[) |
| NAND                                 | [`svnand`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svnand) |
| NANDS                                | [`svnand`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svnand) |
| NBSL                                 | [`svnbsl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svnbsl) |
| NEG                                  | [`svneg`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svneg) |
| NMATCH                               | [`svnmatch`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svnmatch) |
| NOR                                  | [`svnor`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svnor) |
| NORS                                 | [`svnor`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svnor) |
| NOT (predicate)                      | [`svnot`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svnot) |
| NOT (vector)                         | [`svnot`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svnot) |
| NOTS                                 | [`svnot`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svnot) |
| ORN (immediate)                      | [`svorr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int,uint]&q=svorr[) |
| ORN (predicates)                     | [`svorn`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svorn) |
| ORNS                                 | [`svorn`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svorn) |
| ORR (immediate)                      | [`svorr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int,uint]&q=svorr[) |
| ORR (predicates)                     | [`svorr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svorr) |
| ORR (vectors, predicated)            | [`svorr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int,uint]&q=svorr[) |
| ORR (vectors, unpredicated)          | [`svorr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int,uint]&q=svorr[) |
| ORRS                                 | [`svorr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svorr) |
| ORV                                  | [`svorv`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svorv) |
| PFALSE                               | [`svpfalse`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svpfalse) |
| PFIRST                               | [`svpfirst`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svpfirst) |
| PMUL                                 | [`svpmul`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svpmul[) |
| PMULLB                               | [`svpmullb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svpmullb[), [`svpmullb_pair`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svpmullb_pair) |
| PMULLT                               | [`svpmullt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svpmullt[), [`svpmullt_pair`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svpmullt_pair) |
| PNEXT                                | [`svpnext`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svpnext) |
| PRFB (scalar plus immediate)         | [`svprfb_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svprfb_vnum) |
| PRFB (scalar plus scalar)            | [`svprfb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svprfb) |
| PRFB (scalar plus vector)            | [`svprfb_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svprfb_gather_[) |
| PRFB (vector plus immediate)         | [`svprfb_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svprfb_gather[) |
| PRFD (scalar plus immediate)         | [`svprfd_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svprfd_vnum) |
| PRFD (scalar plus scalar)            | [`svprfd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svprfd) |
| PRFD (scalar plus vector)            | [`svprfd_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svprfd_gather_[) |
| PRFD (vector plus immediate)         | [`svprfd_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svprfd_gather[) |
| PRFH (scalar plus immediate)         | [`svprfh_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svprfh_vnum) |
| PRFH (scalar plus scalar)            | [`svprfh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svprfh) |
| PRFH (scalar plus vector)            | [`svprfh_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svprfh_gather_[) |
| PRFH (vector plus immediate)         | [`svprfh_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svprfh_gather[) |
| PRFW (scalar plus immediate)         | [`svprfw_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svprfw_vnum) |
| PRFW (scalar plus scalar)            | [`svprfw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svprfw) |
| PRFW (scalar plus vector)            | [`svprfw_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svprfw_gather_[) |
| PRFW (vector plus immediate)         | [`svprfw_gather`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svprfw_gather[) |
| PTEST                                | [`svptest`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svptest) |
| PTRUE                                | [`svptrue`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svptrue) |
| PTRUES                               | [`svptrue`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svptrue) |
| PUNPKHI                              | [`svunpkhi`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svunpkhi) |
| PUNPKLO                              | [`svunpklo`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svunpklo) |
| RADDHNB                              | [`svraddhnb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svraddhnb) |
| RADDHNT                              | [`svraddhnt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svraddhnt) |
| RAX1                                 | [`svrax1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svrax1) |
| RBIT                                 | [`svrbit`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svrbit) |
| RDFFR (predicated)                   | [`svrdffr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svrdffr) |
| RDFFR (unpredicated)                 | [`svrdffr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svrdffr) |
| RDFFRS                               | [`svrdffr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svrdffr) |
| RDVL                                 | See [RDVL](#rdvl) |
| REV (predicate)                      | [`svrev`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svrev) |
| REV (vector)                         | [`svrev`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int,float,bfloat]&q=svrev) |
| REVB                                 | [`svrevb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svrevb) |
| REVH                                 | [`svrevh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svrevh) |
| REVW                                 | [`svrevw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svrevw) |
| RSHRNB                               | [`svrshrnb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svrshrnb) |
| RSHRNT                               | [`svrshrnt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svrshrnt) |
| RSUBHNB                              | [`svrsubhnb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svrsubhnb) |
| RSUBHNT                              | [`svrsubhnt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svrsubhnt) |
| SABA                                 | [`svaba`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svaba[) |
| SABALB                               | [`svabalb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svabalb) |
| SABALT                               | [`svabalt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svabalt) |
| SABD                                 | [`svabd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svabd[) |
| SABDLB                               | [`svabdlb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svabdlb) |
| SABDLT                               | [`svabdlt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svabdlt) |
| SADALP                               | [`svadalp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svadalp) |
| SADDLB                               | [`svaddlb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svaddlb[) |
| SADDLBT                              | [`svaddlbt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svaddlbt) |
| SADDLT                               | [`svaddlt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svaddlt) |
| SADDV                                | [`svaddv`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svaddv) |
| SADDWB                               | [`svaddwb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svaddwb) |
| SADDWT                               | [`svaddwt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svaddwt) |
| SBCLB                                | [`svsbclb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svsbclb) |
| SBCLT                                | [`svsbclt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svsbclt) |
| SCVTF                                | [`svcvt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcvt_) |
| SDIV                                 | [`svdiv`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svdiv[) |
| SDIVR                                | [`svdivr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svdivr) |
| SDOT (indexed)                       | [`svdot_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svdot_lane) |
| SDOT (vectors)                       | [`svdot`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svdot[) |
| SEL (predicates)                     | [`svsel`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svsel) |
| SEL (vectors)                        | [`svsel`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int,float,bfloat]&q=svsel) |
| SETFFR                               | [`svsetffr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svsetffr) |
| SHADD                                | [`svhadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svhadd) |
| SHRNB                                | [`svshrnb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svshrnb) |
| SHRNT                                | [`svshrnt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svshrnt) |
| SHSUB                                | [`svhsub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svhsub[) |
| SHSUBR                               | [`svhsubr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svhsubr) |
| SLI                                  | [`svsli`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svsli) |
| SM4E                                 | [`svsm4e`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svsm4e[) |
| SM4EKEY                              | [`svsm4ekey`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svsm4ekey) |
| SMAX (immediate)                     | [`svmax`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmax[) |
| SMAX (vectors)                       | [`svmax`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmax[) |
| SMAXP                                | [`svmaxp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmaxp) |
| SMAXV                                | [`svmaxv`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmaxv) |
| SMIN (immediate)                     | [`svmin`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmin[) |
| SMIN (vectors)                       | [`svmin`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmin[) |
| SMINP                                | [`svminp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svminp) |
| SMINV                                | [`svminv`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svminv) |
| SMLALB (indexed)                     | [`svmlalb_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmlalb_lane) |
| SMLALB (vectors)                     | [`svmlalb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmlalb[) |
| SMLALT (indexed)                     | [`svmlalt_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmlalt_lane) |
| SMLALT (vectors)                     | [`svmlalt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmlalt[) |
| SMLSLB (indexed)                     | [`svmlslb_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmlslb_lane) |
| SMLSLB (vectors)                     | [`svmlslb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmlslb[) |
| SMLSLT (indexed)                     | [`svmlslt_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmlslt_lane) |
| SMLSLT (vectors)                     | [`svmlslt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmlslt[) |
| SMMLA                                | [`svmmla`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmmla) |
| SMULH (predicated)                   | [`svmulh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmulh) |
| SMULH (unpredicated)                 | [`svmulh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmulh) |
| SMULLB (indexed)                     | [`svmullb_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmullb_lane) |
| SMULLB (vectors)                     | [`svmullb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmullb[) |
| SMULLT (indexed)                     | [`svmullt_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmullt_lane) |
| SMULLT (vectors)                     | [`svmullt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmullt[) |
| SPLICE                               | [`svsplice`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svsplice) |
| SQABS                                | [`svqabs`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqabs) |
| SQADD (immediate)                    | [`svqadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqadd) |
| SQADD (vectors, predicated)          | [`svqadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqadd) |
| SQADD (vectors, unpredicated)        | [`svqadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqadd) |
| SQCADD                               | [`svqcadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqcadd) |
| SQDECB                               | [`svqdecb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdecb) |
| SQDECD (scalar)                      | [`svqdecd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdecd) |
| SQDECD (vector)                      | [`svqdecd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdecd) |
| SQDECH (scalar)                      | [`svqdech`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdech) |
| SQDECH (vector)                      | [`svqdech`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdech) |
| SQDECP (scalar)                      | [`svqdecp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdecp) |
| SQDECP (vector)                      | [`svqdecp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdecp) |
| SQDECW (scalar)                      | [`svqdecw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdecw) |
| SQDECW (vector)                      | [`svqdecw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdecw) |
| SQDMLALB (indexed)                   | [`svqdmlalb_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdmlalb_lane) |
| SQDMLALB (vectors)                   | [`svqdmlalb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdmlalb[) |
| SQDMLALBT                            | [`svqdmlalbt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdmlalbt) |
| SQDMLALT (indexed)                   | [`svqdmlalt_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdmlalt_lane) |
| SQDMLALT (vectors)                   | [`svqdmlalt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdmlalt[) |
| SQDMLSLB (indexed)                   | [`svqdmlslb_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdmlslb_lane) |
| SQDMLSLB (vectors)                   | [`svqdmlslb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdmlslb[) |
| SQDMLSLBT                            | [`svqdmlslbt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdmlslbt) |
| SQDMLSLT (indexed)                   | [`svqdmlslt_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdmlslt_lane) |
| SQDMLSLT (vectors)                   | [`svqdmlslt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdmlslt[) |
| SQDMULH (indexed)                    | [`svqdmulh_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdmulh_lane) |
| SQDMULH (vectors)                    | [`svqdmulh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdmulh[) |
| SQDMULLB (indexed)                   | [`svqdmullb_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdmullb_lane) |
| SQDMULLB (vectors)                   | [`svqdmullb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdmullb[) |
| SQDMULLT (indexed)                   | [`svqdmullt_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdmullt_lane) |
| SQDMULLT (vectors)                   | [`svqdmullt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqdmullt[) |
| SQINCB                               | [`svqincb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqincb) |
| SQINCD (scalar)                      | [`svqincd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqincd) |
| SQINCD (vector)                      | [`svqincd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqincd) |
| SQINCH (scalar)                      | [`svqinch`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqinch) |
| SQINCH (vector)                      | [`svqinch`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqinch) |
| SQINCP (scalar)                      | [`svqincp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqincp) |
| SQINCP (vector)                      | [`svqincp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqincp) |
| SQINCW (scalar)                      | [`svqincw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqincw) |
| SQINCW (vector)                      | [`svqincw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqincw) |
| SQNEG                                | [`svqneg`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqneg) |
| SQRDCMLAH (indexed)                  | [`svqrdcmlah_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqrdcmlah_lane) |
| SQRDCMLAH (vectors)                  | [`svqrdcmlah`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqrdcmlah[) |
| SQRDMLAH (indexed)                   | [`svqrdmlah_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqrdmlah_lane) |
| SQRDMLAH (vectors)                   | [`svqrdmlah`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqrdmlah[) |
| SQRDMLSH (indexed)                   | [`svqrdmlsh_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqrdmlsh_lane) |
| SQRDMLSH (vectors)                   | [`svqrdmlsh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqrdmlsh[) |
| SQRDMULH (indexed)                   | [`svqrdmulh_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqrdmulh_lane) |
| SQRDMULH (vectors)                   | [`svqrdmulh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqrdmulh[) |
| SQRSHL                               | [`svqrshl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqrshl[) |
| SQRSHLR                              | [`svqrshl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqrshl[) |
| SQRSHRNB                             | [`svqrshrnb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqrshrnb) |
| SQRSHRNT                             | [`svqrshrnt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqrshrnt) |
| SQRSHRUNB                            | [`svqrshrunb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svqrshrunb) |
| SQRSHRUNT                            | [`svqrshrunt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svqrshrunt) |
| SQSHL (immediate)                    | [`svqshl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqshl[) |
| SQSHL (vectors)                      | [`svqshl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqshl[) |
| SQSHLR                               | [`svqshl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqshl[) |
| SQSHLU                               | [`svqshlu`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#&q=svqshlu) |
| SQSHRNB                              | [`svqshrnb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqshrnb) |
| SQSHRNT                              | [`svqshrnt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqshrnt) |
| SQSHRUNB                             | [`svqshrunb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svqshrunb) |
| SQSHRUNT                             | [`svqshrunt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svqshrunt) |
| SQSUB (immediate)                    | [`svqsub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqsub[) |
| SQSUB (vectors, predicated)          | [`svqsub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqsub[) |
| SQSUB (vectors, unpredicated)        | [`svqsub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqsub[) |
| SQSUBR                               | [`svqsubr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqsubr) |
| SQXTNB                               | [`svqxtnb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqxtnb) |
| SQXTNT                               | [`svqxtnt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svqxtnt) |
| SQXTUNB                              | [`svqxtunb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svqxtunb) |
| SQXTUNT                              | [`svqxtunt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svqxtunt) |
| SRHADD                               | [`svrhadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svrhadd) |
| SRI                                  | [`svsri`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svsri) |
| SRSHL                                | [`svrshl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svrshl) |
| SRSHLR                               | [`svrshl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svrshl) |
| SRSHR                                | [`svrshr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svrshr[) |
| SRSRA                                | [`svrsra`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svrsra) |
| SSHLLB                               | [`svshllb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svshllb), [`svmovlb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmovlb) |
| SSHLLT                               | [`svshllt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svshllt), [`svmovlt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svmovlt) |
| SSRA                                 | [`svsra`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svsra) |
| SSUBLB                               | [`svsublb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svsublb[) |
| SSUBLBT                              | [`svsublbt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svsublbt) |
| SSUBLT                               | [`svsublt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svsublt[) |
| SSUBLTB                              | [`svsubltb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svsubltb) |
| SSUBWB                               | [`svsubwb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svsubwb) |
| SSUBWT                               | [`svsubwt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svsubwt) |
| ST1B (scalar plus immediate)         | [`svst1_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1_vnum), [`svst1b_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1b_vnum) |
| ST1B (scalar plus scalar)            | [`svst1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1[), [`svst1b`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1b) |
| ST1B (scalar plus vector)            | [`svst1b_scatter`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1b_scatter_[) |
| ST1B (vector plus immediate)         | [`svst1b_scatter`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1b_scatter[) |
| ST1D (scalar plus immediate)         | [`svst1_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1_vnum) |
| ST1D (scalar plus scalar)            | [`svst1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1[) |
| ST1D (scalar plus vector)            | [`svst1_scatter`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1_scatter_[) |
| ST1D (vector plus immediate)         | [`svst1_scatter`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1_scatter[) |
| ST1H (scalar plus immediate)         | [`svst1_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1_vnum), [`svst1h_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1h_vnum) |
| ST1H (scalar plus scalar)            | [`svst1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1[), [`svst1h`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1h) |
| ST1H (scalar plus vector)            | [`svst1h_scatter`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1h_scatter_[) |
| ST1H (vector plus immediate)         | [`svst1h_scatter`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1h_scatter[) |
| ST1W (scalar plus immediate)         | [`svst1_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1_vnum), [`svst1w_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1w_vnum) |
| ST1W (scalar plus scalar)            | [`svst1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1[), [`svst1w`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1w) |
| ST1W (scalar plus vector)            | [`svst1_scatter`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1_scatter_[), [`svst1w_scatter`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1w_scatter_[) |
| ST1W (vector plus immediate)         | [`svst1_scatter`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1_scatter[), [`svst1w_scatter`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1w_scatter[) |
| ST2B (scalar plus immediate)         | [`svst2_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst2_vnum) |
| ST2B (scalar plus scalar)            | [`svst2`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst2[) |
| ST2D (scalar plus immediate)         | [`svst2_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst2_vnum) |
| ST2D (scalar plus scalar)            | [`svst2`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst2[) |
| ST2H (scalar plus immediate)         | [`svst2_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst2_vnum) |
| ST2H (scalar plus scalar)            | [`svst2`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst2[) |
| ST2W (scalar plus immediate)         | [`svst2_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst2_vnum) |
| ST2W (scalar plus scalar)            | [`svst2`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst2[) |
| ST3B (scalar plus immediate)         | [`svst3_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst3_vnum) |
| ST3B (scalar plus scalar)            | [`svst3`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst3[) |
| ST3D (scalar plus immediate)         | [`svst3_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst3_vnum) |
| ST3D (scalar plus scalar)            | [`svst3`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst3[) |
| ST3H (scalar plus immediate)         | [`svst3_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst3_vnum) |
| ST3H (scalar plus scalar)            | [`svst3`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst3[) |
| ST3W (scalar plus immediate)         | [`svst3_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst3_vnum) |
| ST3W (scalar plus scalar)            | [`svst3`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst3[) |
| ST4B (scalar plus immediate)         | [`svst4_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst4_vnum) |
| ST4B (scalar plus scalar)            | [`svst4`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst4[) |
| ST4D (scalar plus immediate)         | [`svst4_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst4_vnum) |
| ST4D (scalar plus scalar)            | [`svst4`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst4[) |
| ST4H (scalar plus immediate)         | [`svst4_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst4_vnum) |
| ST4H (scalar plus scalar)            | [`svst4`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst4[) |
| ST4W (scalar plus immediate)         | [`svst4_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst4_vnum) |
| ST4W (scalar plus scalar)            | [`svst4`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst4[) |
| STNT1B (scalar plus immediate)       | [`svstnt1_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svstnt1_vnum) |
| STNT1B (scalar plus scalar)          | [`svstnt1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svstnt1[) |
| STNT1B (vector plus scalar)          | [`svstnt1_scatter`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svstnt1_scatter), [`svstnt1b`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svstnt1b) |
| STNT1D (scalar plus immediate)       | [`svstnt1_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svstnt1_vnum) |
| STNT1D (scalar plus scalar)          | [`svstnt1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svstnt1[) |
| STNT1D (vector plus scalar)          | [`svstnt1_scatter`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svstnt1_scatter) |
| STNT1H (scalar plus immediate)       | [`svstnt1_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svstnt1_vnum) |
| STNT1H (scalar plus scalar)          | [`svstnt1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svstnt1[) |
| STNT1H (vector plus scalar)          | [`svstnt1_scatter`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svstnt1_scatter), [`svstnt1h`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svstnt1h) |
| STNT1W (scalar plus immediate)       | [`svstnt1_vnum`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svstnt1_vnum) |
| STNT1W (scalar plus scalar)          | [`svstnt1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svstnt1[) |
| STNT1W (vector plus scalar)          | [`svstnt1_scatter`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svstnt1_scatter), [`svstnt1w`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svstnt1w) |
| STR (predicate)                      | See [SVE LDR and STR](#sve-ldr-and-str) |
| STR (vector)                         | See [SVE LDR and STR](#sve-ldr-and-str) |
| SUB (immediate)                      | [`svsub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svsub[) |
| SUB (vectors, predicated)            | [`svsub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svsub[) |
| SUB (vectors, unpredicated)          | [`svsub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svsub[) |
| SUBHNB                               | [`svsubhnb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svsubhnb) |
| SUBHNT                               | [`svsubhnt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svsubhnt) |
| SUBR (immediate)                     | [`svsubr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svsubr) |
| SUBR (vectors)                       | [`svsubr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svsubr) |
| SUDOT                                | [`svsudot_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svsudot_lane) |
| SUNPKHI                              | [`svunpkhi`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svunpkhi) |
| SUNPKLO                              | [`svunpklo`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svunpklo) |
| SUQADD                               | [`svuqadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svuqadd) |
| SXTB                                 | [`svextb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svextb) |
| SXTH                                 | [`svexth`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svexth) |
| SXTW                                 | [`svextw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svextw) |
| TBL                                  | [`svtbl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svtbl[), [`svdup_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdup_lane) |
| TBX                                  | [`svtbx`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svtbx) |
| TRN1 (predicates)                    | [`svtrn1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svtrn1) |
| TRN1 (vectors)                       | [`svtrn1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int,float,bfloat]&q=svtrn1) |
| TRN2 (predicates)                    | [`svtrn2`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svtrn2) |
| TRN2 (vectors)                       | [`svtrn2`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int,float,bfloat]&q=svtrn2) |
| UABA                                 | [`svaba`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svaba[) |
| UABALB                               | [`svabalb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svabalb) |
| UABALT                               | [`svabalt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svabalt) |
| UABD                                 | [`svabd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svabd[) |
| UABDLB                               | [`svabdlb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svabdlb) |
| UABDLT                               | [`svabdlt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svabdlt) |
| UADALP                               | [`svadalp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svadalp) |
| UADDLB                               | [`svaddlb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svaddlb[) |
| UADDLT                               | [`svaddlt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svaddlt) |
| UADDV                                | [`svaddv`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int]&q=svaddv) |
| UADDWB                               | [`svaddwb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svaddwb) |
| UADDWT                               | [`svaddwt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svaddwt) |
| UCVTF                                | [`svcvt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svcvt_) |
| UDIV                                 | [`svdiv`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svdiv[) |
| UDIVR                                | [`svdivr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svdivr) |
| UDOT (indexed)                       | [`svdot_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svdot_lane) |
| UDOT (vectors)                       | [`svdot`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svdot[) |
| UHADD                                | [`svhadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svhadd) |
| UHSUB                                | [`svhsub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svhsub[) |
| UHSUBR                               | [`svhsubr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svhsubr) |
| UMAX (immediate)                     | [`svmax`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmax[) |
| UMAX (vectors)                       | [`svmax`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmax[) |
| UMAXP                                | [`svmaxp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmaxp) |
| UMAXV                                | [`svmaxv`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmaxv) |
| UMIN (immediate)                     | [`svmin`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmin[) |
| UMIN (vectors)                       | [`svmin`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmin[) |
| UMINP                                | [`svminp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svminp) |
| UMINV                                | [`svminv`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svminv) |
| UMLALB (indexed)                     | [`svmlalb_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmlalb_lane) |
| UMLALB (vectors)                     | [`svmlalb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmlalb[) |
| UMLALT (indexed)                     | [`svmlalt_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmlalt_lane) |
| UMLALT (vectors)                     | [`svmlalt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmlalt[) |
| UMLSLB (indexed)                     | [`svmlslb_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmlslb_lane) |
| UMLSLB (vectors)                     | [`svmlslb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmlslb[) |
| UMLSLT (indexed)                     | [`svmlslt_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmlslt_lane) |
| UMLSLT (vectors)                     | [`svmlslt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmlslt[) |
| UMMLA                                | [`svmmla`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmmla) |
| UMULH (predicated)                   | [`svmulh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmulh) |
| UMULH (unpredicated)                 | [`svmulh`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmulh) |
| UMULLB (indexed)                     | [`svmullb_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmullb_lane) |
| UMULLB (vectors)                     | [`svmullb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmullb[) |
| UMULLT (indexed)                     | [`svmullt_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmullt_lane) |
| UMULLT (vectors)                     | [`svmullt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmullt[) |
| UQADD (immediate)                    | [`svqadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqadd[) |
| UQADD (vectors, predicated)          | [`svqadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqadd) |
| UQADD (vectors, unpredicated)        | [`svqadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqadd[) |
| UQDECB                               | [`svqdecb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqdecb) |
| UQDECD (scalar)                      | [`svqdecd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqdecd) |
| UQDECD (vector)                      | [`svqdecd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqdecd) |
| UQDECH (scalar)                      | [`svqdech`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqdech) |
| UQDECH (vector)                      | [`svqdech`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqdech) |
| UQDECP (scalar)                      | [`svqdecp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqdecp) |
| UQDECP (vector)                      | [`svqdecp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqdecp) |
| UQDECW (scalar)                      | [`svqdecw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqdecw) |
| UQDECW (vector)                      | [`svqdecw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqdecw) |
| UQINCB                               | [`svqincb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqincb) |
| UQINCD (scalar)                      | [`svqincd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqincd) |
| UQINCD (vector)                      | [`svqincd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqincd) |
| UQINCH (scalar)                      | [`svqinch`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqinch) |
| UQINCH (vector)                      | [`svqinch`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqinch) |
| UQINCP (scalar)                      | [`svqincp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqincp) |
| UQINCP (vector)                      | [`svqincp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqincp) |
| UQINCW (scalar)                      | [`svqincw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqincw) |
| UQINCW (vector)                      | [`svqincw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqincw) |
| UQRSHL                               | [`svqrshl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqrshl[) |
| UQRSHLR                              | [`svqrshl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqrshl[) |
| UQRSHRNB                             | [`svqrshrnb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqrshrnb) |
| UQRSHRNT                             | [`svqrshrnt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqrshrnt) |
| UQSHL (immediate)                    | [`svqshl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqshl[) |
| UQSHL (vectors)                      | [`svqshl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqshl[) |
| UQSHLR                               | [`svqshl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqshl[) |
| UQSHRNB                              | [`svqshrnb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqshrnb) |
| UQSHRNT                              | [`svqshrnt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqshrnt) |
| UQSUB (immediate)                    | [`svqsub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqsub[) |
| UQSUB (vectors, predicated)          | [`svqsub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqsub[) |
| UQSUB (vectors, unpredicated)        | [`svqsub`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqsub[) |
| UQSUBR                               | [`svqsubr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqsubr) |
| UQXTNB                               | [`svqxtnb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqxtnb) |
| UQXTNT                               | [`svqxtnt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svqxtnt) |
| URECPE                               | [`svrecpe`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svrecpe) |
| URHADD                               | [`svrhadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svrhadd) |
| URSHL                                | [`svrshl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svrshl) |
| URSHLR                               | [`svrshl`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svrshl) |
| URSHR                                | [`svrshr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svrshr[) |
| URSQRTE                              | [`svrsqrte`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svrsqrte) |
| URSRA                                | [`svrsra`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svrsra) |
| USDOT (indexed)                      | [`svusdot_lane`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svusdot_lane) |
| USDOT (vectors)                      | [`svusdot`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svusdot[), [`svsudot`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svsudot[) |
| USHLLB                               | [`svshllb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svshllb), [`svmovlb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmovlb) |
| USHLLT                               | [`svshllt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svshllt), [`svmovlt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svmovlt) |
| USMMLA                               | [`svusmmla`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svusmmla) |
| USQADD                               | [`svsqadd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svsqadd) |
| USRA                                 | [`svsra`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svsra) |
| USUBLB                               | [`svsublb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svsublb[) |
| USUBLT                               | [`svsublt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svsublt[) |
| USUBWB                               | [`svsubwb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svsubwb) |
| USUBWT                               | [`svsubwt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svsubwt) |
| UUNPKHI                              | [`svunpkhi`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svunpkhi) |
| UUNPKLO                              | [`svunpklo`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svunpklo) |
| UXTB                                 | [`svextb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svextb) |
| UXTH                                 | [`svexth`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svexth) |
| UXTW                                 | [`svextw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svextw) |
| UZP1 (predicates)                    | [`svuzp1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svuzp1) |
| UZP1 (vectors)                       | [`svuzp1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int,float,bfloat]&q=svuzp1) |
| UZP2 (predicates)                    | [`svuzp2`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svuzp2) |
| UZP2 (vectors)                       | [`svuzp2`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int,float,bfloat]&q=svuzp2) |
| WHILEGE                              | [`svwhilege`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svwhilege) |
| WHILEGT                              | [`svwhilegt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svwhilegt) |
| WHILEHI                              | [`svwhilegt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svwhilegt) |
| WHILEHS                              | [`svwhilege`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svwhilege) |
| WHILELE                              | [`svwhilele`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svwhilele) |
| WHILELO                              | [`svwhilelt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svwhilelt) |
| WHILELS                              | [`svwhilele`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint]&q=svwhilele) |
| WHILELT                              | [`svwhilelt`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[int]&q=svwhilelt) |
| WHILERW                              | [`svwhilerw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svwhilerw) |
| WHILEWR                              | [`svwhilewr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svwhilewr) |
| WRFFR                                | [`svwrffr`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svwrffr) |
| XAR                                  | [`svxar`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svxar) |
| ZIP1 (predicates)                    | [`svzip1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svzip1) |
| ZIP1 (vectors)                       | [`svzip1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int,float,bfloat]&q=svzip1) |
| ZIP2 (predicates)                    | [`svzip2`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[bool]&q=svzip2) |
| ZIP2 (vectors)                       | [`svzip2`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiesreturnbasetype=[uint,int,float,bfloat]&q=svzip2) |

#### ADDPL, ADDVL, INC and DEC

The architecture provides instructions for adding or subtracting an
element count, where the count might come from a pattern (such as
[`svcntb_pat`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcntb_pat))
or from a predicate
([`svcntp`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcntp)).
For example, INCH adds the number of halfwords in a pattern to a scalar
register or to every element of a vector register.

At the C and C++ level it is usually simpler to write the addition out
normally. Also, having intrinsics that map directly to architectural
instructions like INCH could cause confusion for pointers, since the
instructions would operate on the raw integer value of the pointer. For
example, applying INCH to a pointer to halfwords would effectively
convert the pointer to an integer, add the number of halfwords, and then
convert the result back to a pointer. The pointer would then only
advance by half a vector.

For these reasons there are no dedicated ACLE intrinsics for:

*   ADDPL and ADDVL

*   DECB, DECH, DECW, DECD, and DECP

*   INCB, INCH, INCW, INCD, and INCP

Instead the implementation should use these instructions to optimize things
like:

``` c
  svbool_t p1;
  ...
  x += svcntp_b16(p1, p1);
```

The same concerns do not apply to saturating scalar arithmetic, since
using saturating arithmetic only makes sense for displacements rather
than pointers. There is also no standard way of doing a saturating
addition or subtraction of arbitrary integers. ACLE does therefore
provide intrinsics for:

*   SQDECB, SQDECH, SQDECW, SQDECD, and SQDECP

*   SQINCB, SQINCH, SQINCW, SQINCD, and SQINCP

*   UQDECB, UQDECH, UQDECW, UQDECD, and UQDECP

*   UQINCB, UQINCH, UQINCW, UQINCD, and UQINCP

#### CTERMEQ and CTERMNE

CTERMEQ and CTERMNE provide a way of optimizing conditions such as:

``` c
  svbool_t p1, p2;
  uint64_t x, y;
  ...
  if (svptest_last(p1, p2) && x == y)
    ...stmts...
```

Here the implementation could use PTEST to test whether the last active
element of `p2` is active and follow it by CTERMNE to test whether
`x` is not equal to `y`. The code should then execute `stmts` if the
LT condition holds (that is, if the last element is active and the
“termination condition” `x != y` does not hold).

There are no ACLE intrinsics that perform a combined predicate and scalar
test since the separate tests should be more readable.

#### MOVPRFX

There are no separate ACLE intrinsics for MOVPRFX, but its use
is implicit in many of the zeroing intrinsics. For example,
[`svadd[_s32]_z`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svadd[_s32]_z)
uses a MOVPRFX before the ADD instruction.

The code generator can also use MOVPRFX to optimize calls
to many `_x` and `_m` intrinsics. For example,
[`svdiv[_s32]_x`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdiv[_s32]_x)
can use DIV to tie the result to the first operand, DIVR to tie the
result to the second operand, or a combination of MOVPRFX and DIV
to store the result to a separate register.

#### RDVL

There is no separate ACLE intrinsic for RDVL, but the same functionality
is available though the [`svcntb`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcntb),
[`svcnth`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcnth),
[`svcntw`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcntw), and
[`svcntd`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svcntd)
intrinsics.

#### SVE LD1R instructions

There are no separate ACLE intrinsics for LD1RB, LD1RH, LD1RW, LD1RD,
LD1RSB, LD1RSH, and LD1RSW. However, the code generator can use these
instructions to optimize calls to
[`svdup`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svdup[_n])
in which the scalar argument comes from memory.

#### SVE LDR and STR

There are no separate ACLE intrinsics for SVE LDR and STR instructions,
but the code generator can use these instructions to save and restore
SVE registers, or to optimize calls to intrinsics like
[`svld1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchieselementbitsize=[8]&q=svld1[)
and
[`svst1`](https://developer.arm.com/architectures/instruction-sets/intrinsics/#q=svst1[).

#### SVE MOV

There are no ACLE intrinsics for the unpredicated SVE MOV instructions.
This is because the ACLE intrinsic calls do not imply a particular
register allocation and so the code generator must decide for itself
when move instructions are required.


### SVE2 BFloat16 data-processing instructions.

The specification for B16B16 is in
[**Alpha** state](#current-status-and-anticipated-changes) and may change or be
extended in the future.

The instructions in this section are available when `__ARM_FEATURE_SVE_B16B16`
is non-zero.

#### BFADD, BFSUB

BFloat16 floating-point add and sub (vectors)

``` c
  svbfloat16_t svadd[_bf16]_m (svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
  svbfloat16_t svadd[_bf16]_x (svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
  svbfloat16_t svadd[_bf16]_z (svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
  svbfloat16_t svadd[_n_bf16]_m (svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);
  svbfloat16_t svadd[_n_bf16]_x (svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);
  svbfloat16_t svadd[_n_bf16]_z (svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);

  svbfloat16_t svsub[_bf16]_m (svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
  svbfloat16_t svsub[_bf16]_x (svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
  svbfloat16_t svsub[_bf16]_z (svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
  svbfloat16_t svsub[_n_bf16]_m (svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);
  svbfloat16_t svsub[_n_bf16]_x (svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);
  svbfloat16_t svsub[_n_bf16]_z (svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);
  ```

#### BFCLAMP

BFloat16 Clamp to minimum/maximum vector.

``` c
  svbfloat16_t svclamp[_bf16](svbfloat16_t op, svbfloat16_t min, svbfloat16_t max);
  ```

#### BFMAX, BFMIN

BFloat16 floating-point maximum/minimum (predicated).

 ``` c
   svbfloat16_t svmax[_bf16]_m(svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
   svbfloat16_t svmax[_bf16]_z(svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
   svbfloat16_t svmax[_bf16]_x(svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
   svbfloat16_t svmax[_n_bf16]_m(svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);
   svbfloat16_t svmax[_n_bf16]_z(svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);
   svbfloat16_t svmax[_n_bf16]_x(svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);

   svbfloat16_t svmin[_bf16]_m(svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
   svbfloat16_t svmin[_bf16]_z(svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
   svbfloat16_t svmin[_bf16]_x(svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
   svbfloat16_t svmin[_n_bf16]_m(svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);
   svbfloat16_t svmin[_n_bf16]_z(svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);
   svbfloat16_t svmin[_n_bf16]_x(svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);
   ```

#### BFMAXNM, BFMINNM

BFloat16 floating-point maximum/minimum number (predicated).

 ``` c
   svbfloat16_t svmaxnm[_bf16]_m(svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
   svbfloat16_t svmaxnm[_bf16]_z(svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
   svbfloat16_t svmaxnm[_bf16]_x(svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
   svbfloat16_t svmaxnm[_n_bf16]_m(svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);
   svbfloat16_t svmaxnm[_n_bf16]_z(svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);
   svbfloat16_t svmaxnm[_n_bf16]_x(svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);

   svbfloat16_t svminnm[_bf16]_m(svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
   svbfloat16_t svminnm[_bf16]_z(svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
   svbfloat16_t svminnm[_bf16]_x(svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
   svbfloat16_t svminnm[_n_bf16]_m(svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);
   svbfloat16_t svminnm[_n_bf16]_z(svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);
   svbfloat16_t svminnm[_n_bf16]_x(svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);
   ```

#### BFMLA, BFMLS

BFloat16 floating-point fused multiply add or sub vectors.

 ``` c
   svbfloat16_t svmla[_bf16]_m(svbool_t pg, svbfloat16_t zda, svbfloat16_t zn,
                               svbfloat16_t zm);
   svbfloat16_t svmla[_bf16]_z(svbool_t pg, svbfloat16_t zda, svbfloat16_t zn,
                               svbfloat16_t zm);
   svbfloat16_t svmla[_bf16]_x(svbool_t pg, svbfloat16_t zda, svbfloat16_t zn,
                               svbfloat16_t zm);
   svbfloat16_t svmla[_n_bf16]_m(svbool_t pg, svbfloat16_t zda, svbfloat16_t zn,
                                 bfloat16_t zm);
   svbfloat16_t svmla[_n_bf16]_z(svbool_t pg, svbfloat16_t zda, svbfloat16_t zn,
                                 bfloat16_t zm);
   svbfloat16_t svmla[_n_bf16]_x(svbool_t pg, svbfloat16_t zda, svbfloat16_t zn,
                                 bfloat16_t zm);

   svbfloat16_t svmla_lane[_bf16](svbfloat16_t zda, svbfloat16_t zn,
                                  svbfloat16_t zm, uint64_t imm_idx);

   svbfloat16_t svmls[_bf16]_m(svbool_t pg, svbfloat16_t zda, svbfloat16_t zn,
                               svbfloat16_t zm);
   svbfloat16_t svmls[_bf16]_z(svbool_t pg, svbfloat16_t zda, svbfloat16_t zn,
                               svbfloat16_t zm);
   svbfloat16_t svmls[_bf16]_x(svbool_t pg, svbfloat16_t zda, svbfloat16_t zn,
                               svbfloat16_t zm);
   svbfloat16_t svmls[_n_bf16]_m(svbool_t pg, svbfloat16_t zda, svbfloat16_t zn,
                                 bfloat16_t zm);
   svbfloat16_t svmls[_n_bf16]_z(svbool_t pg, svbfloat16_t zda, svbfloat16_t zn,
                                 bfloat16_t zm);
   svbfloat16_t svmls[_n_bf16]_x(svbool_t pg, svbfloat16_t zda, svbfloat16_t zn,
                                 bfloat16_t zm);

   svbfloat16_t svmls_lane[_bf16](svbfloat16_t zda, svbfloat16_t zn,
                                  svbfloat16_t zm, uint64_t imm_idx);
   ```

#### BFMUL

BFloat16 floating-point multiply vectors.

 ``` c
   svbfloat16_t svmul[_bf16]_m(svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
   svbfloat16_t svmul[_bf16]_x(svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
   svbfloat16_t svmul[_bf16]_z(svbool_t pg, svbfloat16_t zdn, svbfloat16_t zm);
   svbfloat16_t svmul[_n_bf16]_m(svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);
   svbfloat16_t svmul[_n_bf16]_x(svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);
   svbfloat16_t svmul[_n_bf16]_z(svbool_t pg, svbfloat16_t zdn, bfloat16_t zm);

   svbfloat16_t svmul_lane[_bf16](svbfloat16_t zn, svbfloat16_t zm,
                                  uint64_t imm_idx);
   ```

### SVE2.1 instruction intrinsics

The specification for SVE2.1 is in
[**Alpha** state](#current-status-and-anticipated-changes) and may change or be
extended in the future.

The functions in this section are defined by the header file
 [`<arm_sve.h>`](#arm_sve.h) when `__ARM_FEATURE_SVE2p1` is defined.

Some instructions overlap with the SME and SME2 architecture extensions and
are additionally available in Streaming SVE mode when __ARM_FEATURE_SME is
non-zero or __ARM_FEATURE_SME2 are non-zero.
For convenience, the intrinsics for these instructions  are listed in the
 following section.

#### Multi-vector predicates

When `__ARM_FEATURE_SVE2p1` is defined, [`<arm_sve.h>`](#arm_sve.h) defines the
tuple types `svboolx2_t` and `svboolx4_t`.

These are opaque tuple types that can be accessed using the SVE intrinsics
`svsetN`, `svgetN` and `svcreateN`. `svundef2` and `svundef4` are also extended
to work with `svboolx2_t` and `svboolx4_t`.  For example:

``` c
    svbool_t svget2[_b](svboolx2_t tuple, uint64_t imm_index);
    svboolx2_t svset2[_b](svboolx2_t tuple, uint64_t imm_index, svbool_t x);
    svboolx2_t svcreate2[_b](svbool_t x, svbool_t y);
    svboolx2_t svundef2_b();
```

#### ADDQV, FADDQV

Unsigned/FP add reduction of quadword vector segments.

``` c
  // Variants are also available for:
  // _s8, _s16, _u16, _s32, _u32, _s64, _u64,
  // _f16, _f32, _f64
  uint8x16_t svaddqv[_u8](svbool_t pg, svuint8_t zn);
  ```

#### ANDQV, EORQV, ORQV

Reduction of quadword vector segments.

``` c
  // Variants are also available for:
  // _s8, _u16, _s16, _u32, _s32, _u64, _s64
  uint8x16_t svandqv[_u8](svbool_t pg, svuint8_t zn);
  uint8x16_t sveorqv[_u8](svbool_t pg, svuint8_t zn);
  uint8x16_t svorqv[_u8](svbool_t pg, svuint8_t zn);
  ```

#### DUPQ

Broadcast indexed element within each quadword vector segment.

``` c
   // Variants are also available for:
   // _s8, _u16, _s16, _u32, _s32, _u64, _s64
   // _mf8, _bf16, _f16, _f32, _f64
   svuint8_t svdup_laneq[_u8](svuint8_t zn, uint64_t imm_idx);
   ```

#### EXTQ

Extract vector segment from each pair of quadword segments.

``` c
   // Variants are also available for:
   // _s8, _s16, _u16, _s32, _u32, _s64, _u64
   // _mf8, _bf16, _f16, _f32, _f64
   svuint8_t svextq[_u8](svuint8_t zdn, svuint8_t zm, uint64_t imm);
   ```
#### LD1D, LD1W

Contiguous zero-extending load to quadword (single vector).

``` c
   // Variants are also available for:
   // _u32, _s32
   svfloat32_t svld1uwq[_f32](svbool_t, const float32_t *ptr);
   svfloat32_t svld1uwq_vnum[_f32](svbool_t, const float32_t *ptr, int64_t vnum);


   // Variants are also available for:
   // _u64, _s64
   svfloat64_t svld1udq[_f64](svbool_t, const float64_t *ptr);
   svfloat64_t svld1udq_vnum[_f64](svbool_t, const float64_t *ptr, int64_t vnum);
   ```

#### LD1Q

Gather Load Quadword.

``` c
   // Variants are also available for:
   // _u8, _u16, _s16, _u32, _s32, _u64, _s64
   // _mf8, _bf16, _f16, _f32, _f64
   svint8_t svld1q_gather[_u64base]_s8(svbool_t pg, svuint64_t zn);
   svint8_t svld1q_gather[_u64base]_offset_s8(svbool_t pg, svuint64_t zn, int64_t offset);
   svint8_t svld1q_gather_[u64]offset[_s8](svbool_t pg, const int8_t *base, svuint64_t offset);

   // Variants are also available for:
   // _u16, _u32, _s32, _u64, _s64
   // _bf16, _f16, _f32, _f64
   svint16_t svld1q_gather_[u64]index[_s16](svbool_t pg, const int16_t *base, svuint64_t index);
   svint16_t svld1q_gather[_u64base]_index_s16(svbool_t pg, svuint64_t zn, int64_t index);
   ```

#### LD2Q, LD3Q, LD4Q

Contiguous load two, three, or four quadword structures.

``` c
   // Variants are also available for:
   // _u8, _u16, _s16, _u32, _s32, _u64, _s64
   // _mf8, _bf16, _f16, _f32, _f64
   svint8x2_t svld2q[_s8](svbool_t pg, const int8_t *rn);
   svint8x2_t svld2q_vnum[_s8](svbool_t pg, const int8_t *rn, uint64_t vnum);
   svint8x3_t svld3q[_s8](svbool_t pg, const int8_t *rn);
   svint8x3_t svld3q_vnum[_s8](svbool_t pg, const int8_t *rn, uint64_t vnum);
   svint8x4_t svld4q[_s8](svbool_t pg, const int8_t *rn);
   svint8x4_t svld4q_vnum[_s8](svbool_t pg, const int8_t *rn, uint64_t vnum);
   ```

#### UMAXQV, SMAXQV, FMAXQV, UMINQV, SMINQV, FMINQV

Max/Min reduction of quadword vector segments.

``` c
   // Variants are also available for:
   // _s8, _u16, _s16, _u32, _s32, _u64, _s64
   // _f16, _f32, _f64
   uint8x16_t svmaxqv[_u8](svbool_t pg, svuint8_t zn);
   uint8x16_t svminqv[_u8](svbool_t pg, svuint8_t zn);
   ```

#### FMAXNMQV, FMINNMQV

Max/Min recursive reduction of quadword vector segments.

``` c
   // Variants are also available for  _f32, _f64
   float16x8_t svmaxnmqv[_f16](svbool_t pg, svfloat16_t zn);
   float16x8_t svminnmqv[_f16](svbool_t pg, svfloat16_t zn);
   ```

#### PMOV

``` c
   // Variants are available for:
   // _s8, _u16, _s16, _s32, _u32, _s64, _u64
   svbool_t svpmov_lane[_u8](svuint8_t zn, uint64_t imm);

   // Variants are available for:
   // _s8, _s16, _u16, _s32, _u32, _s64, _u64
   svbool_t svpmov[_u8](svuint8_t zn);

   // Variants are available for:
   // _s16, _s32, _u32, _s64, _u64
   svuint16_t svpmov_lane[_u16]_m(svuint16_t zd, svbool_t pn, uint64_t imm);

   // Variants are also available for:
   // _s8, _u16, _s16, _u32, _s32, _u64, _s64
   svuint8_t svpmov_u8_z(svbool_t pn);
   ```

#### ST1D, ST1W

Contiguous store of single vector operand, truncating from quadword.

``` c
   // Variants are also available for:
   // _u32, _s32
   void svst1wq[_f32](svbool_t, const float32_t *ptr, svfloat32_t data);
   void svst1wq_vnum[_f32](svbool_t, const float32_t *ptr, int64_t vnum, svfloat32_t data);
 

   // Variants are also available for:
   // _u64, _s64
   void svst1dq[_f64](svbool_t, const float64_t *ptr, svfloat64_t data);
   void svst1dq_vnum[_f64](svbool_t, const float64_t *ptr, int64_t vnum, svfloat64_t data);
   ```

#### ST1Q

Scatter store quadwords.

``` c
   // Variants are also available for:
   // _u8, _u16, _s16, _u32, _s32, _u64, _s64
   // _mf8, _bf16, _f16, _f32, _f64
   void svst1q_scatter[_u64base][_s8](svbool_t pg, svuint64_t zn, svint8_t data);
   void svst1q_scatter[_u64base]_offset[_s8](svbool_t pg, svuint64_t zn, int64_t offset, svint8_t data);
   void svst1q_scatter_[u64]offset[_s8](svbool_t pg, const uint8_t *base, svuint64_t offset, svint8_t data);

   // Variants are also available for:
   // _u16, _u32, _s32, _u64, _s64
   // _bf16, _f16, _f32, _f64
   void svst1q_scatter_[u64]index[_s16](svbool_t pg, const int16_t *base, svuint64_t index, svint16_t data);
   void svst1q_scatter[_u64base]_index[_s16](svbool_t pg, svuint64_t zn, int64_t index, svint16_t data);
```

#### ST2Q, ST3Q, ST4Q

Contiguous store.

``` c
   // Variants are also available for:
   // _s8 _u16, _s16, _u32, _s32, _u64, _s64
   // _mf8, _bf16, _f16, _f32, _f64
   void svst2q[_u8](svbool_t pg, uint8_t *rn, svuint8x2_t zt);
   void svst2q_vnum[_u8](svbool_t pg, uint8_t *rn, int64_t vnum, svuint8x2_t zt);
   void svst3q[_u8](svbool_t pg, uint8_t *rn, svuint8x3_t zt);
   void svst3q_vnum[_u8](svbool_t pg, uint8_t *rn, int64_t vnum, svuint8x3_t zt);
   void svst4q[_u8](svbool_t pg, uint8_t *rn, svuint8x4_t zt);
   void svst4q_vnum[_u8](svbool_t pg, uint8_t *rn, int64_t vnum, svuint8x4_t zt);
   ```

#### TBLQ

Programmable table lookup within each quadword vector segment (zeroing).

``` c
   // Variants are also available for:
   // _u8, _u16, _s16, _u32, _s32, _u64, _s64
   // _mf8, _bf16, _f16, _f32, _f64
   svint8_t svtblq[_s8](svint8_t zn, svuint8_t zm);
   ```

#### TBXQ

Programmable table lookup within each quadword vector segment (merging).

``` c
   // Variants are also available for:
   // _u8, _u16, _s16, _u32, _s32, _u64, _s64
   // _mf8, _bf16, _f16, _f32, _f64
   svint8_t svtbxq[_s8](svint8_t fallback, svint8_t zn, svuint8_t zm);
   ```

#### UZPQ1, UZPQ2

Concatenate elements within each pair of quadword vector segments.

``` c
   // Variants are also available for:
   // _s8, _u16, _s16, _u32, _s32, _u64, _s64
   // _mf8, _bf16, _f16, _f32, _f64
   svuint8_t svuzpq1[_u8](svuint8_t zn, svuint8_t zm);
   svuint8_t svuzpq2[_u8](svuint8_t zn, svuint8_t zm);
   ```

#### ZIPQ1, ZIPQ2

Interleave elements from halves of each pair of quadword vector segments.

``` c
   // Variants are also available for:
   // _s8, _u16, _s16, _u32, _s32, _u64, _s64
   // _mf8, _bf16, _f16, _f32, _f64
   svuint8_t svzipq1[_u8](svuint8_t zn, svuint8_t zm);
   svuint8_t svzipq2[_u8](svuint8_t zn, svuint8_t zm);
   ```

### SVE2 maximum and minimum absolute value

The intrinsics in this section are defined by the header file
[`<arm_sve.h>`](#arm_sve.h) when either `__ARM_FEATURE_SVE2` or
`__ARM_FEATURE_SME2` is defined to 1, and `__ARM_FEATURE_FAMINMAX`
is defined to 1.

#### FAMAX

Floating-point absolute maximum (predicated).
``` c
  // Variants are also available for: _f32 and _f64
  svfloat16_t svamax[_f16]_m(svbool_t pg, svfloat16_t zn, svfloat16_t zm);
  svfloat16_t svamax[_f16]_x(svbool_t pg, svfloat16_t zn, svfloat16_t zm);
  svfloat16_t svamax[_f16]_z(svbool_t pg, svfloat16_t zn, svfloat16_t zm);

  // Variants are also available for: _f32 and _f64
  svfloat16_t svamax[_n_f16]_m(svbool_t pg, svfloat16_t zn, float16_t zm);
  svfloat16_t svamax[_n_f16]_x(svbool_t pg, svfloat16_t zn, float16_t zm);
  svfloat16_t svamax[_n_f16]_z(svbool_t pg, svfloat16_t zn, float16_t zm);
```

#### FAMIN

Floating-point absolute minimum (predicated).
``` c
  // Variants are also available for: _f32 and _f64
  svfloat16_t svamin[_f16]_m(svbool_t pg, svfloat16_t zn, svfloat16_t zm);
  svfloat16_t svamin[_f16]_x(svbool_t pg, svfloat16_t zn, svfloat16_t zm);
  svfloat16_t svamin[_f16]_z(svbool_t pg, svfloat16_t zn, svfloat16_t zm);

  // Variants are also available for: _f32 and _f64
  svfloat16_t svamin[_n_f16]_m(svbool_t pg, svfloat16_t zn, float16_t zm);
  svfloat16_t svamin[_n_f16]_x(svbool_t pg, svfloat16_t zn, float16_t zm);
  svfloat16_t svamin[_n_f16]_z(svbool_t pg, svfloat16_t zn, float16_t zm);
```

### SVE2 lookup table

The intrinsics in this section are defined by the header file
[`<arm_sve.h>`](#arm_sve.h) when either `__ARM_FEATURE_SVE2` or
`__ARM_FEATURE_SME2` is defined to 1, and `__ARM_FEATURE_LUT`
is defined to 1.

#### LUTI2

Lookup table read with 2-bit indices.
```c
  // Variant is  also available for: _u8
  svint8_t svluti2_lane[_s8](svint8_t table, svuint8_t indices, uint64_t imm_idx);

  // Variant are also available for: _u16, _f16 and _bf16
  svint16_t svluti2_lane[_s16]( svint16_t table, svuint8_t indices, uint64_t imm_idx);
```

#### LUTI4

Lookup table read with 4-bit indices.
```c
  // Variant is also available for: _u8
  svint8_t svluti4_lane[_s8](svint8_t table, svuint8_t indices, uint64_t imm_idx);

  // Variant are also available for: _u16, _f16, _bf16
  svint16_t svluti4_lane[_s16](svint16_t table, svuint8_t indices, uint64_t imm_idx);
  svint16_t svluti4_lane[_s16_x2](svint16x2_t table, svuint8_t indices, uint64_t imm_idx);
```

# SME language extensions and intrinsics

The specification for SME is in
[**Beta** state](#current-status-and-anticipated-changes) and may change or be
extended in the future.

## Controlling the use of streaming mode

### Introduction to streaming and non-streaming mode

<span id="streaming-mode"></span>

The AArch64 architecture defines a concept called “streaming mode”,
controlled by a processor state bit called PSTATE.SM. At any given
point in time, the processor is either in streaming mode (PSTATE.SM==1)
or in non-streaming mode (PSTATE.SM==0). There is an instruction called
SMSTART to enter streaming mode and an instruction called SMSTOP to
return to non-streaming mode.

Streaming mode has three main effects on C and C++ code:

*   It can change the length of SVE vectors and predicates: the length
    of an SVE vector in streaming mode is called the “streaming vector
    length” (SVL), which might be different from the normal non-streaming
    vector length. See [Effect of streaming mode on VL](#effect-of-streaming-mode-on-vl)
    for more details.

*   <span id="streaming-intrinsic"></span>
    Some instructions can only be executed in streaming mode, which means
    that their associated ACLE intrinsics can only be used in streaming mode.
    These intrinsics are called “streaming intrinsics”.

*   <span id="non-streaming-intrinsic"></span>
    Some other instructions can only be executed in non-streaming mode,
    which means that their associated ACLE intrinsics can only be used
    in non-streaming mode. These intrinsics are called
    “non-streaming intrinsics”.

The C and C++ standards define the behavior of programs in terms of
an “abstract machine”. As an extension, the ACLE specification
applies the distinction between streaming mode and non-streaming mode
to this abstract machine: at any given point in time, the abstract
machine is either in streaming mode or in non-streaming mode.

This distinction between processor mode and abstract machine mode is
mostly just a dry specification detail. However, the usual “as if” rule
applies: the processor's actual mode at runtime can be different from
the abstract machine's mode, provided that this does not alter the
behavior of the program. One practical consequence of this is that
C and C++ code does not specify the exact placement of SMSTART and
SMSTOP instructions; the source code simply places limits on where such
instructions go. For example, when stepping through a program in a
debugger, the processor mode might sometimes be different from the one
implied by the source code.

<span id="non-streaming-statement"></span>
<span id="streaming-statement"></span>
<span id="streaming-compatible-statement"></span>

ACLE provides attributes that specify whether the abstract
machine executes statements:

*   in non-streaming mode, in which case they are called “non-streaming
    statements”

*   in streaming mode, in which case they are called “streaming statements”

*   in either mode, in which case they are called “streaming-compatible
    statements”

At present, the classification can only be controlled at function
granularity: the statements in a function are all non-streaming, all
streaming, or all streaming-compatible. When no attribute specifies
otherwise, all statements in a function are non-streaming.

As noted above, this classification affects which intrinsics
the statements can use. It also affects the length of SVE vectors
and predicates.

A program is [ill-formed](#ill-formed) if:

*   a [streaming statement](#streaming-statement) or a
    [streaming-compatible statement](#streaming-compatible-statement)
    contains an [evaluated call](#evaluated-call) to a
    [non-streaming intrinsic](#non-streaming-intrinsic).

*   a [non-streaming statement](#non-streaming-statement) or a
    [streaming-compatible statement](#streaming-compatible-statement)
    contains an [evaluated call](#evaluated-call) to a
    [streaming intrinsic](#streaming-intrinsic).

The current mode of the abstract machine can be queried using
[`__arm_in_streaming_mode`](#arm_in_streaming_mode).

### Changing streaming mode locally

Adding an [`__arm_locally_streaming`](#arm_locally_streaming)
[keyword attribute](#keyword-attributes) to a function specifies
that all the statements in the function are [streaming
statements](#streaming-statement). The program automatically puts
the [abstract machine](#abstract-machine) into streaming mode before
executing the statements and automatically restores the previous mode
afterwards.

This choice is internal to the function definition. It is not
visible to callers and so it can be changed without affecting the
function's binary interface. (In other words, it can be changed
without requiring all callers to be recompiled.)

For example:

``` c
  int nonstreaming_fn(void) {
    return __arm_in_streaming_mode();  // Returns 0
  }

  __arm_locally_streaming int streaming_fn(void)
  { // Function automatically switches into streaming mode on entry
    svsetffr();  // Ill-formed, calls a non-streaming intrinsic
    return __arm_in_streaming_mode();  // Returns 1
  } // Function automatically switches out of streaming mode on return

  int (*ptr1)(void) = nonstreaming_fn; // OK
  int (*ptr2)(void) = streaming_fn;    // OK
```

This approach can be useful when implementing existing APIs,
including when overriding virtual functions. It allows the
use of SME to be an internal implementation detail.

The [`__arm_locally_streaming`](#arm_locally_streaming) [keyword
attribute](#keyword-attributes) is an optional feature; it is only
guaranteed to be present if the implementation predefines the
`__ARM_FEATURE_LOCALLY_STREAMING` macro to a nonzero value.

### Managing streaming mode across function boundaries

In addition to [changing streaming mode locally](#changing-streaming-mode-locally),
ACLE provides [keyword attributes](#keyword-attributes) for managing
streaming mode across function boundaries. This can be useful in the
following example situations:

*   An SME operation is split across several cooperating subroutines
    (as is often the case). The SME operation as a whole is designed
    to execute exclusively in streaming mode, so mid-operation mode
    switches should be avoided for performance reasons.

*   A function provides a public API that is specific to SME.
    Again, callers to such functions would want to avoid the
    overhead of switching modes at function call boundaries.

*   Some functions are compatible with both streaming and
    non-streaming mode. Marking them as “streaming-compatible”
    allows them to be called in either mode, without changing
    the vector length. For example, this could be useful for
    “length agnostic” SVE math routines.

<span id="streaming-type"></span><span id="streaming-compatible-type"></span>

For this reason, the “streaming”, “non-streaming” and
“streaming-compatible” classification extends to function types:

*   By default, function types are “non-streaming types”.

*   Attaching an [`__arm_streaming`](#arm_streaming) [keyword
    attribute](#keyword-attributes) to a function type makes it a
    “streaming type”.

*   Attaching an [`__arm_streaming_compatible`](#arm_streaming_compatible)
    [keyword attribute](#keyword-attributes) to a function type makes it
    a “streaming-compatible type”.

The function type classification decides which mode the
[abstract machine](#abstract-machine) is in on entry to the function and
which mode the abstract machine is in on return from the function. The
program automatically switches mode as necessary before calling a
function and restores the previous mode on return; see
[Changes in streaming mode](#changes-in-streaming-mode) for details.

If the function forms part of the object code's ABI, the function type
classification also determines whether the function has a “non-streaming
interface”, a “streaming interface” or a “streaming-compatible
interface”; see [[AAPCS64]](#AAPCS64) for details.

By default, the classification of a function type carries over to
the classification of the statements in the function's definition,
if any. However, this can be overridden by the
[`__arm_locally_streaming`](#arm_locally_streaming) [keyword
attribute](#keyword-attributes); see [Changing streaming mode
locally](#changing-streaming-mode-locally) for details.

For example:

``` c
  // "n" stands for "non-streaming"
  // "s" stands for "streaming"
  // "sc" stands for "streaming-compatible"

  void n_callee(void);
  void s_callee(void) __arm_streaming;
  void sc_callee(void) __arm_streaming_compatible;

  void (*n_callback)(void);
  void (*s_callback)(void) __arm_streaming;
  void (*sc_callback)(void)  __arm_streaming_compatible;

  int n_caller(void)
  {
    n_callee();        // No mode switch
    (*n_callback)();   // No mode switch
    s_caller();        // Temporarily switches to streaming mode
    (*s_callback)();   // Temporarily switches to streaming mode
    sc_caller();       // No mode switch
    (*sc_callback)();  // No mode switch

    return __arm_in_streaming_mode();  // Returns 0
  }

  int s_caller(void) __arm_streaming
  {
    n_callee();        // Temporarily switches to non-streaming mode
    (*n_callback)();   // Temporarily switches to non-streaming mode
    s_caller();        // No mode switch
    (*s_callback)();   // No mode switch
    sc_caller();       // No mode switch
    (*sc_callback)();  // No mode switch

    return __arm_in_streaming_mode();  // Returns 1
  }

  int sc_caller(void) __arm_streaming_compatible
  {
    n_callee();        // Temporarily switches to non-streaming mode
    (*n_callback)();   // Temporarily switches to non-streaming mode
    s_caller();        // Temporarily switches to streaming mode
    (*s_callback)();   // Temporarily switches to streaming mode
    sc_caller();       // No mode switch
    (*sc_callback)();  // No mode switch

    return __arm_in_streaming_mode();  // Might return 0 or 1
  }
```

A function type in one category is incompatible with a function type in
another category, even if the types are otherwise identical. For example:

``` c
  // "n" stands for "non-streaming"
  // "s" stands for "streaming"
  // "sc" stands for "streaming-compatible"

  void n_callee(void);
  void s_callee(void) __arm_streaming;
  void sc_callee(void) __arm_streaming_compatible;

  void (*n_callback)(void);
  void (*s_callback)(void) __arm_streaming;
  void (*sc_callback)(void) __arm_streaming_compatible;

  void code() {
    n_callback = n_callee;    // OK
    n_callback = s_callee;    // Ill-formed
    n_callback = sc_callee;   // Ill-formed

    s_callback = n_callee;    // Ill-formed
    s_callback = s_callee;    // OK
    s_callback = sc_callee;   // Ill-formed

    sc_callback = n_callee;   // Ill-formed
    sc_callback = s_callee;   // Ill-formed
    sc_callback = sc_callee;  // OK
  }
```

A type that has both an [`__arm_streaming`](#arm_streaming)
[keyword attribute](#keyword-attributes) and an
[`__arm_streaming_compatible`](#arm_streaming_compatible)
[keyword attribute](#keyword-attributes) is [ill-formed](#ill-formed).

### Effect of streaming mode on VL

The value returned by an SVE intrinsic like `svcntb` depends on
whether or not the [abstract machine](#abstract-machine) is in streaming mode:
if the abstract machine is in streaming mode then the returned value
depends on the “streaming vector length” (SVL), otherwise the returned
value depends on the non-streaming vector length.

The runtime size of SVE vector and predicate types varies in the same way.
For example, an `svint8_t` object created while the abstract machine
is in streaming mode will have SVL bits, whereas an `svint8_t` object
created while the abstract machine is in non-streaming mode will have
the size specified by the non-streaming vector length.

The following definitions are useful when describing the consequences
of this behavior on the vector length:

*   <span id="vl-dependent"></span>
    A type T is said to be “VL-dependent” if an object of type T created
    while the [abstract machine](#abstract-machine) is in streaming mode
    has a different size from an object of type T created while the abstract
    machine is in non-streaming mode.

    Pointer and reference types are never VL-dependent. No types are
    VL-dependent if the streaming and non-streaming vector lengths are equal.

*   As a shorthand, an object or value is said to be VL-dependent if its
    type is VL-dependent.

    Like normal objects, a VL-dependent object never changes size after
    it has been created. The “VL-dependent” classification instead
    decides when it is valid to access the object, as described below.

*   <span id="streaming-object"></span>
    A VL-dependent object created while the abstract machine is in
    streaming mode is called a “streaming object”.

*   <span id="non-streaming-object"></span>
    A VL-dependent object created while the abstract machine is in
    non-streaming mode is called a “non-streaming object”.

If any of the following events occurs during the execution of a program,
then the behavior is undefined:

*   The program accesses a [non-streaming object](#non-streaming-object)
    while the [abstract machine](#abstract-machine) is in streaming mode.

*   The program accesses a [streaming object](#streaming-object) while the
    [abstract machine](#abstract-machine) is in non-streaming mode.

### Streaming callers and streaming callees

If, during the execution of a program, a function F1 calls a function F2, then:

*   <span id="streaming-caller"></span>
    <span id="non-streaming-caller"></span>
    F1 is said to be a “streaming caller” if:

    *   F1's statements are [streaming statements](#streaming-statement); or

    *   F1's statements are [streaming-compatible statements](#streaming-compatible-statement)
        and F1's caller is itself a streaming caller.

    Otherwise, F1 is said to be a “non-streaming caller”.

*   <span id="streaming-callee"></span>
    <span id="non-streaming-callee"></span>
    F2 is said to be a “streaming callee” if:

    *   F2 has a [streaming type](#streaming-type); or

    *   F2 has a [streaming-compatible type](#streaming-compatible-type)
        and F1 is a streaming caller.

    Otherwise, F2 is said to be a “non-streaming callee”.

See [Calling restrictions related to streaming mode](#calling-restrictions-related-to-streaming-mode)
for some examples.

### Changes in streaming mode

Calls from a [non-streaming caller](#non-streaming-caller) to a
[streaming callee](#streaming-callee) involve a temporary change
into streaming mode. The [abstract machine](#abstract-machine) enters
streaming mode for the duration of the call and returns to non-streaming
mode afterwards.

Similarly, calls from a [streaming caller](#streaming-caller) to a
[non-streaming callee](#non-streaming-callee) involve a temporary change
out of streaming mode. The [abstract machine](#abstract-machine) leaves
streaming mode for the duration of the call and reenters streaming mode
afterwards.

In both cases, these changes of mode are automatic and it is the compiler's
responsibility to insert the necessary instructions. There are no intrinsics
that map directly to SMSTART and SMSTOP.

Semantically, the sequencing of such calls is as follows:

1.  Evaluate the function arguments according to the normal C/C++ rules
    and create any temporary objects necessary for performing the call.

2.  Switch the abstract machine to the callee's mode.

3.  Call the callee function.

4.  Switch the abstract machine back to the original mode.

5.  Process the value returned by the call (if any).

The intention is that the change in mode binds as closely to the call as
possible.

### Calling restrictions related to streaming mode

If any of the following events occurs during the execution of a program,
then the behavior is undefined:

*   a [streaming caller](#streaming-caller) passes a
    [VL-dependent](#vl-dependent) argument to a
    [non-streaming callee](#non-streaming-callee)

*   a [non-streaming caller](#non-streaming-caller) passes a
    [VL-dependent](#vl-dependent) argument to a
    [streaming callee](#streaming-callee)

*   a [non-streaming callee](#non-streaming-callee) receives a
    [VL-dependent](#vl-dependent) argument and the callee has
    an [`__arm_locally_streaming`](#arm_locally_streaming) [keyword
    attribute](#keyword-attributes)

*   a [streaming callee](#streaming-callee) returns a
    [VL-dependent](#vl-dependent) value to a
    [non-streaming caller](#non-streaming-caller)

*   a [non-streaming callee](#non-streaming-callee) returns a
    [VL-dependent](#vl-dependent) value to a
    [streaming caller](#streaming-caller)

*   a [non-streaming callee](#non-streaming-callee) returns a
    [VL-dependent](#vl-dependent) value and the callee has an
    [`__arm_locally_streaming`](#arm_locally_streaming) [keyword
    attribute](#keyword-attributes)

The following code gives some examples. In each case, the assumption is
that the non-streaming vector length is different from the streaming
vector length:

``` c
  // "n" stands for "non-streaming"
  // "s" stands for "streaming"
  // "sc" stands for "streaming-compatible"
  // "ls" stands for "locally streaming"

  void n_callee(svint8_t);
  void s_callee(svbool_t) __arm_streaming;
  void sc_callee(svint8_t) __arm_streaming_compatible;

  __arm_locally_streaming void ls_callee(svbool_t pg) {
    // Invokes undefined behavior if called.
  }

  void n_caller(void)
  {
    svint8_t i = ...;
    svbool_t b = ...;

    n_callee(i);   // OK: non-streaming callee
    s_callee(b);   // Undefined behavior: streaming callee
    sc_callee(i);  // OK: non-streaming callee
    ls_callee(b);  // call is OK: non-streaming callee. However,
                   //   as noted above, the callee invokes undefined
                   //   behavior internally
  }

  void s_caller(void) __arm_streaming
  {
    svint8_t i = ...;
    svbool_t b = ...;

    n_callee(i);   // Undefined behavior: non-streaming callee
    s_callee(b);   // OK: streaming callee
    sc_callee(i);  // OK: streaming callee
    ls_callee(b);  // Undefined behavior: non-streaming callee
  }

  void sc_caller(void) __arm_streaming_compatible
  {
    svint8_t i = ...;
    svbool_t b = ...;

    n_callee(i);   // Undefined behavior if sc_caller was called
                   //   in streaming mode (but not otherwise)
    s_callee(b);   // Undefined behavior if sc_caller was called
                   //   in non-streaming mode (but not otherwise)
    sc_callee(i);  // OK: keeps current streaming/non-streaming mode
    ls_callee(b);  // Undefined behavior if sc_caller was called
                   //   in streaming mode, but the call itself is
                   //   OK otherwise. As noted above, the callee
                   //   invokes undefined behavior internally
  }
```

If the streaming and non-streaming vector lengths are equal then there
is no undefined behavior in the code above.

### `asm` restrictions related to streaming mode

Some ACLE implementations might support the GNU “inline asm” extension.
If so, the value of PSTATE.SM at the start of such inline asms is
guaranteed to match the mode of the [abstract machine](#abstract-machine).
For example, PSTATE.SM is guaranteed to be 1 at the start of inline asms
in [streaming statements](#streaming-statement) and 0 at the start of
inline asms in [non-streaming statements](#non-streaming-statement).

All inline asms must preserve the value of PSTATE.SM.  Therefore:

*   An asm entered in streaming mode must finish in streaming mode.

*   An asm entered in non-streaming mode must finish in non-streaming mode.

The behavior in other cases is undefined.

An inline asm can temporarily switch mode internally, such as using an
SMSTART/SMSTOP pair. However, such mode switches invalidate all Z and P
register state. The asm's “clobber list” must mention any registers
whose values might be changed by the asm.

## ZA storage

SME provides an area of storage called ZA, of size SVL.B×SVL.B bytes.
It also provides a processor state bit called PSTATE.ZA to control
whether ZA is enabled.

<span id="za-state"></span>

In C and C++ code, access to ZA is controlled at function granularity:
a function either [uses](#uses-state) ZA or it does not. Another way to
say this is that a function either “has ZA state” or it does not.

If a function does have ZA state, the function can either
[share](#shares-state) that ZA state with the function's caller or create
new ZA state “from scratch”. In the latter case, it is the compiler's
responsibility to free up ZA so that the function can use it; see the
description of the lazy saving scheme in [[AAPCS64]](#AAPCS64) for
details about how the compiler does this.

These possibilities give a one-out-of-three choice for how a function
handles ZA:

1.  The function has no [ZA state](#za-state). This is the default.

2.  The function has [ZA state](#za-state) that it shares with its caller.
    This is indicated by adding a [state-sharing
    attribute](#ways-of-sharing-state) to the function type,
    such as `__arm_inout("za")`.

3.  The function has [ZA state](#za-state) that it creates “from scratch” and
    that it does not share with its caller. This is indicated by adding
    [`__arm_new("za")`](#arm_new) to the function definition.

Functions that have ZA state can use the [SME instruction intrinsics](#sme-instruction-intrinsics)
to manipulate that state.

## ZT0 Lookup Table

When ZA storage is enabled, SME2 additionally provides access to a 64-byte large
lookup table called ZT0 which can be accessed through specialized instructions.
ZT0 is architecturally linked to ZA such that changing PSTATE.ZA enables or
disables both ZA and ZT0 simultaneously.

<span id="zt-state"></span>
This means that when the hardware supports SME2, a function that has
[ZA state](#za-state) also has ZT state.


## SME keyword attributes

ACLE adds several SME-related keyword attributes. See [Keyword
attributes](#keyword-attributes) for general remarks about these keywords.

Except where noted otherwise, function types that have an attribute are
incompatible with function types that do not. For example:

``` c
  // "n" stands for "non-streaming"
  // "s" stands for "streaming"

  typedef void (*n_callback_type)(void);
  n_callback_type n_callback_ptr;
  void n_extern_function(void);
  void n_local_function(void) { ... }

  typedef void (*s_callback_type)(void) __arm_streaming;
  s_callback_type s_callback_ptr;
  void s_extern_function(void) __arm_streaming;
  void s_local_function(void) __arm_streaming { ... }

  void foo() {
    n_callback_ptr = n_callback_ptr;     // OK
    n_callback_ptr = n_extern_function;  // OK
    n_callback_ptr = n_local_function;   // OK
    n_callback_ptr = s_callback_ptr;     // Ill-formed
    n_callback_ptr = s_extern_function;  // Ill-formed
    n_callback_ptr = s_local_function;   // Ill-formed

    s_callback_ptr = n_callback_ptr;     // Ill-formed
    s_callback_ptr = n_extern_function;  // Ill-formed
    s_callback_ptr = n_local_function;   // Ill-formed
    s_callback_ptr = s_callback_ptr;     // OK
    s_callback_ptr = s_extern_function;  // OK
    s_callback_ptr = s_local_function;   // OK
  }
```

The function type attributes cannot be used with K&R-style
[unprototyped function](#unprototyped-function) types. For example:

``` c
  #define ATTR __arm_streaming

  typedef int ft1() ATTR;      // Ill-formed in C, C18 and earlier, OK in
                               //   later versions of C and in C++
  int f1() ATTR { ... }        // Likewise
  typedef int ft2(void) ATTR;  // OK
  int f2(void) ATTR { ... }    // OK
```

### SME keyword attributes related to streaming mode

<span id="arm_streaming"></span>

#### `__arm_streaming`

This [keyword attribute](#keyword-attributes) applies to **function types**
and specifies the following:

*   If the function is defined, all statements in that definition are
    [streaming statements](#streaming-statement).

*   The program switches the [abstract machine](#abstract-machine) into
    streaming mode before calling the function and restores the previous
    mode after the function has returned.

*   If the function forms part of the object code's ABI, that object code
    function has a “streaming interface”; see [[AAPCS64]](#AAPCS64) for
    more details.

Using this attribute does not place any restriction on the function's
argument and return types. For example, an `__arm_streaming` function
can take arguments of type `int32x4_t` even though that type is
generally associated with non-streaming Advanced SIMD code.

See [Managing streaming mode across function boundaries](#managing-streaming-mode-across-function-boundaries)
for more information.

<span id="arm_streaming_compatible"></span>

#### `__arm_streaming_compatible`

This [keyword attribute](#keyword-attributes) applies to **function types**
and specifies the following:

*   If the function is defined, all statements in that definition are
    by default [streaming-compatible statements](#streaming-compatible-statement).
    This can be overridden by the [`__arm_locally_streaming`](#arm_locally_streaming)
    keyword attribute.

*   The [abstract machine](#abstract-machine) does not change into or out
    of streaming mode before calling the function and does not (need to)
    restore the previous mode after the function has returned.

*   If the function forms part of the object code's ABI, that object code
    function has a “streaming-compatible interface”; see [[AAPCS64]](#AAPCS64)
    for more details.

Using this attribute does not place any restriction on the function's
argument and return types. For example, an `__arm_streaming_compatible`
function can take arguments of type `int32x4_t` even though that type
is generally associated only with non-streaming Advanced SIMD code.

See [Managing streaming mode across function boundaries](#managing-streaming-mode-across-function-boundaries)
for more information.

<span id="arm_locally_streaming"></span>

#### `__arm_locally_streaming`

This [keyword attribute](#keyword-attributes) is only guaranteed to be
supported by ACLE implementations that predefine the macro
`__ARM_FEATURE_LOCALLY_STREAMING` to a nonzero value.

The attribute applies to **function definitions** and specifies that all
statements in the function definition are [streaming statements](#streaming-statement).
The attribute is redundant (but still valid) for functions that have
an [`__arm_streaming`](#arm_streaming) type.

See [Changing streaming mode locally](#changing-streaming-mode-locally)
for more information.

### C++ mangling of SME keywords

SME keyword attributes which apply to function types must be included
in the name mangling of the type, if the mangling would normally include
the return type of the function.

SME attributes are mangled in the same way as a template:

``` c
  template<typename, uint64_t> __SME_ATTRS;
```

with the arguments:

``` c
  __SME_ATTRS<normal_function_type, sme_state>;
```

where:

* normal_function_type is the function type without any SME attributes.

* sme_state is an unsigned 64-bit integer representing the streaming and ZA
  properties of the function's interface.

The bits are defined as follows:

| **Bits** | **Value** | **Interface Type**             |
| -------- | --------- | ------------------------------ |
| 0        | 0b1       | __arm_streaming                |
| 1        | 0b1       | __arm_streaming_compatible     |
| 2        | 0b1       | __arm_agnostic("sme_za_state") |
| 3-5      | 0b000     | No ZA state (default)          |
|          | 0b001     | __arm_in("za")                 |
|          | 0b010     | __arm_out("za")                |
|          | 0b011     | __arm_inout("za")              |
|          | 0b100     | __arm_preserves("za")          |
| 6-8      | 0b000     | No ZT0 state (default)         |
|          | 0b001     | __arm_in("zt0")                |
|          | 0b010     | __arm_out("zt0")               |
|          | 0b011     | __arm_inout("zt0")             |
|          | 0b100     | __arm_preserves("zt0")         |

Bits 9-63 are defined to be zero by this revision of the ACLE and are reserved
for future type attributes.

For example:

``` c
  // Mangled as _Z1fP11__SME_ATTRSIFu10__SVInt8_tvELj1EE
  void f(svint8_t (*fn)() __arm_streaming) { fn(); }

  // Mangled as _Z1fP11__SME_ATTRSIFu10__SVInt8_tvELj26EE
  void f(svint8_t (*fn)() __arm_streaming_compatible __arm_inout("za")) { fn(); }

  // Mangled as _Z1fP11__SME_ATTRSIFu10__SVInt8_tvELj128EE
  void f(svint8_t (*fn)() __arm_out("zt0")) { fn(); }
```

## SME types

### Predicate-as-counter

SME2 adds a new kind of predicate, named *predicate-as-counter* which is used
for multi-vector predication. It describes a predicate mask that can span
multiple predicate registers with `K` `true` values followed by all `false`
values, or `K` `false` values followed by all `true` values, for a given element
type.

When `__ARM_FEATURE_SME2` is defined,  [`<arm_sme.h>`](#arm_sme.h)  defines a
single sizeless predicate-as-counter type named `svcount_t`.

`svcount_t` and `svbool_t` are both used to represent predicate masks, but
they cannot be used interchangeably.

The ACLE allows these types to be casted from one to another using the
`svcount_t svreinterpret_c(svbool_t)` and `svbool_t svreinterpret_b(svcount_t)`
intrinsics, although the reinterpreted values may not be sensible in the other
format. To safely extract a sensible mask from a `svcount_t`, the `svpext`
functions should be used.

### Multi-vector predicates

When `__ARM_FEATURE_SME2` is defined, [`<arm_sme.h>`](#arm_sme.h) defines the
tuple types `svboolx2_t` and `svboolx4_t`.

These are opaque tuple types that can be accessed using the SVE intrinsics
`svsetN`, `svgetN` and `svcreateN`. `svundef2` and `svundef4` are also extended
to work with `svboolx2_t` and `svboolx4_t`. For example:

``` c
    svbool_t svget2[_b](svboolx2_t tuple, uint64_t imm_index);
    svboolx2_t svset2[_b](svboolx2_t tuple, uint64_t imm_index, svbool_t x);
    svboolx2_t svcreate2[_b](svbool_t x, svbool_t y);
    svboolx2_t svundef2_b();
```

## SME functions and intrinsics

[`<arm_sme.h>`](#arm_sme.h) declares various support functions and
defines various intrinsics. The support functions have
[external linkage](#external-linkage), like standard C functions such
as `memcpy` do. However, as noted in [Intrinsics](#intrinsics), it is
unspecified whether the intrinsics are functions and, if so, what
linkage they have.

There are many more intrinsics than support functions, so everything
described in this section is an intrinsic unless its individual
description says otherwise.

If an intrinsic is implemented as a macro rather than a function,
the macro must behave “as if” it had the prototype and attributes
specified in this section.

### SME PSTATE functions

#### Prototypes

``` c
  bool __arm_has_sme(void) __arm_streaming_compatible;

  bool __arm_in_streaming_mode(void) __arm_streaming_compatible;

  // Function with external linkage.
  void __arm_za_disable(void) __arm_streaming_compatible;
```

#### Semantics

**`__arm_has_sme()`**

> This call returns true if the current thread “has access to SME”;
> see [[AAPCS64]](#AAPCS64) for a more detailed definition of this term.
>
> One way of implementing this function is to call `__arm_sme_state`
> and then return the top bit of X0.  See [[AAPCS64]](#AAPCS64) for
> more details about `__arm_sme_state`.

<span id="arm_in_streaming_mode"></span>

**`__arm_in_streaming_mode()`**

> This call returns true if the [abstract machine](#abstract-machine) is
> in streaming mode. It always returns true when called from [streaming
> statements](#streaming-statement) and it always return false when
> called from [non-streaming statements](#non-streaming-statement).
> However, the call is not semantically a constant expression even in
> those cases.

<span id="arm_za_disable"></span>

**`__arm_za_disable()`**

> This call commits any pending lazy save and turns ZA off;
> see [[AAPCS64]](#AAPCS64) for details.
>
> Note: since this is a [private-ZA](#private-za) function,
> it is valid (though pointless) to call it from a function that has
> [ZA state](#za-state). The compiler would simply reenable ZA after the
> call and reload the saved ZA state.

### SME ZA state assertions

#### Prototypes

``` c
  void svundef_za() __arm_streaming_compatible;
```

#### Semantics

**`svundef_za()`**

> This call asserts that ZA does not currently have any useful data.
> Semantically, it fills ZA with unpredictable data, although from
> a quality of implementation perspective, it should not generate
> any object code.
>
> The call can be used as an optimization hint to the compiler, so that
> the compiler does not insert unnecessary code to save and restore the
> current ZA contents. The call might also be useful for static analysis.


### SME instruction intrinsics

The intrinsics in this section have the following properties in common:

*   Every argument named `tile` or `tile_mask` must be an integer constant
    expression in the range of the underlying instruction.

*   Some SME instructions identify a slice of ZA using the sum of a 32-bit
    general-purpose register and an immediate offset.  The intrinsics for
    these instructions have a 32-bit argument named `slice`, which is
    interpreted as follows:

    *   If the intrinsic also has a `vnum` argument, the ZA slice number
        is calculated by adding `vnum` to `slice`.  Both `slice` and `vnum`
        can be variable.

    *   Otherwise, `slice` specifies the ZA slice number directly; that is,
        it represents the sum of the 32-bit register and the immediate
        offset.  `slice` can be variable.

*   ZA loads and stores do not use typed pointers, since there is
    no C or C++ type information associated with the contents of ZA.

*   Intrinsics have a `_hor` suffix if they operate on horizontal slices
    of a given ZA tile and a `_ver` suffix if they operate on vertical
    slices of a given ZA tile.


SME2 adds operations that work on groups of SVE vectors, ZA tile slices or
ZA array vectors. The intrinsics model this in the following way:

*   Multi-vector operands are groups of SVE data vectors, that use the same
    tuple types as defined in the [SVE ACLE](#sve-vector-types), for example,
    `svint32x2_t` for a multi-vector operand of two 32-bit element vectors, or
    `svint64x4_t` for a multi-vector operand of four 64-bit element vectors.

*   The architecture distinguishes between multi-vector operands with
    consecutive registers and multi-vector operands with strided registers.
    This level of detail is not exposed to the C/C++ intrinsics or types. It is
    left up to the compiler to choose the most optimal form.

*   Intrinsic functions have a `_x2` or `_x4` suffix if the
    function\'s widest type is a vector tuple of 2 or 4 data vectors
    and the function operates purely on vectors, not on the matrix array or
    tile slices. The suffix is only present on overloaded names if it cannot
    be inferred from arguments.

*   Intrinsic functions have a `_vg2` or `_vg4` suffix if the function
    operates on groups of 2 or 4 ZA tile slices.  For example:

``` c
    // Reads 2 consecutive horizontal tile slices from ZA into multi-vector.
    svint8x2_t svread_hor_za8_s8_vg2(uint64_t tile, uint32_t slice)
      __arm_streaming __arm_in("za");
```

*   Intrinsic functions have a `_vg1x2`, `_vg1x4` suffix if the function
    operates on 2 or 4 single-vector groups within the ZA array.

*   Intrinsic functions have a `_vg2x1`, `_vg2x2`, `_vg2x4` suffix if
    the function operates on 1, 2 or 4 double-vector groups within the ZA array.

*   Intrinsic functions have a `_vg4x1`, `_vg4x2`, `_vg4x4` suffix if the
    function operates on 1, 2 or 4 quad-vector groups within the ZA array.
    For example:

``` c
    // SMLAL intrinsic for 2 quad-vector groups.
    void svmla_lane_za32[_s8]_vg4x2(uint32_t slice, svint8x2_t zn,
                                    svint8_t zm, uint64_t imm_idx)
      __arm_streaming __arm_inout("za");
```

*   Intrinsic functions that take a multi-vector operand may have additional
    suffixes to distinguish them from other forms for the same intrinsic:
    *   a `_single` suffix if they take one multi-vector operand and one
        (single) vector operand.
    *   a `_lane` suffix if they take one multi-vector operand and one
        indexed vector operand with an immediate to specify the indexed
        elements.

``` c
    void svmla_za32[_s8]_vg4x2(uint32_t slice, svint8x2_t zn, svint8x2_t zm)
      __arm_streaming __arm_inout("za");

    void svmla[_single]_za32[_s8]_vg4x2(uint32_t slice, svint8x2_t zn,
                                        svint8_t zm)
      __arm_streaming __arm_inout("za");

    void svmla_lane_za32[_s8]_vg4x2(uint32_t slice, svint8x2_t zn,
                                    svint8_t zm, uint64_t imm_idx)
      __arm_streaming __arm_inout("za");
```


#### LD1B, LD1H, LD1W, LD1D, LD1Q

``` c
  // Also for _za16, _za32, _za64 and _za128 (with the same prototype).
  void svld1_hor_za8(uint64_t tile, uint32_t slice, svbool_t pg,
                     const void *ptr)
    __arm_streaming __arm_inout("za");

  // Synthetic intrinsic: adds vnum to slice and vnum * svcntsb() to the
  // address given by ptr.
  //
  // Also for _za16, _za32, _za64 and _za128 (with the same prototype).
  void svld1_hor_vnum_za8(uint64_t tile, uint32_t slice, svbool_t pg,
                          const void *ptr, int64_t vnum)
    __arm_streaming __arm_inout("za");

  // Also for _za16, _za32, _za64 and _za128 (with the same prototype).
  void svld1_ver_za8(uint64_t tile, uint32_t slice, svbool_t pg,
                     const void *ptr)
    __arm_streaming __arm_inout("za");

  // Synthetic intrinsic: adds vnum to slice and vnum * svcntsb() to the
  // address given by ptr.
  //
  // Also for _za16, _za32, _za64 and _za128 (with the same prototype).
  void svld1_ver_vnum_za8(uint64_t tile, uint32_t slice, svbool_t pg,
                          const void *ptr, int64_t vnum)
    __arm_streaming __arm_inout("za");
```

#### LDR

``` c
  void svldr_za(uint32_t slice, const void *ptr)
    __arm_streaming_compatible __arm_inout("za");

  // Adds vnum to slice and vnum * svcntsb() to the address given by ptr.
  // This can be done in a single instruction if vnum is a constant in the
  // range [0, 15].  The intrinsic is synthetic for other vnum parameters.
  void svldr_vnum_za(uint32_t slice, const void *ptr, int64_t vnum)
     __arm_streaming_compatible __arm_inout("za");
```

#### ST1B, ST1H, ST1W, ST1D, ST1Q

``` c
  // Also for _za16, _za32, _za64 and _za128 (with the same prototype).
  void svst1_hor_za8(uint64_t tile, uint32_t slice, svbool_t pg,
                     void *ptr)
    __arm_streaming __arm_in("za");

  // Synthetic intrinsic: adds vnum to slice and vnum * svcntsb() to the
  // address given by ptr.
  //
  // Also for _za16, _za32, _za64 and _za128 (with the same prototype).
  void svst1_hor_vnum_za8(uint64_t tile, uint32_t slice, svbool_t pg,
                          void *ptr, int64_t vnum)
    __arm_streaming __arm_in("za");

  // Also for _za16, _za32, _za64 and _za128 (with the same prototype).
  void svst1_ver_za8(uint64_t tile, uint32_t slice, svbool_t pg,
                     void *ptr)
    __arm_streaming __arm_in("za");

  // Synthetic intrinsic: adds vnum to slice and vnum * svcntsb() to the
  // address given by ptr.
  //
  // Also for _za16, _za32, _za64 and _za128 (with the same prototype).
  void svst1_ver_vnum_za8(uint64_t tile, uint32_t slice, svbool_t pg,
                          void *ptr, int64_t vnum)
    __arm_streaming __arm_in("za");
```

#### STR

``` c
  void svstr_za(uint32_t slice, void *ptr)
    __arm_streaming_compatible __arm_in("za");

  // Adds vnum to slice and vnum * svcntsb() to the address given by ptr.
  // This can be done in a single instruction if vnum is a constant in the
  // range [0, 15].  The intrinsic is synthetic for other vnum parameters.
  void svstr_vnum_za(uint32_t slice, void *ptr, int64_t vnum)
     __arm_streaming_compatible __arm_in("za");
```

#### MOVA

The intrinsics below read horizontal ZA slices. In each case, the type
of the return value and the `zd` parameter vary with the type suffix.
For example, in the `_u8` intrinsic, the return value and the `zd`
parameter both have type `svuint8_t`.

``` c
  // And similarly for u8, mf8
  svint8_t svread_hor_za8[_s8]_m(svint8_t zd, svbool_t pg,
                                 uint64_t tile, uint32_t slice)
    __arm_streaming __arm_in("za");

  // And similarly for u16, bf16 and f16.
  svint16_t svread_hor_za16[_s16]_m(svint16_t zd, svbool_t pg,
                                    uint64_t tile, uint32_t slice)
    __arm_streaming __arm_in("za");

  // And similarly for u32 and f32.
  svint32_t svread_hor_za32[_s32]_m(svint32_t zd, svbool_t pg,
                                    uint64_t tile, uint32_t slice)
    __arm_streaming __arm_in("za");

  // And similarly for u64 and f64.
  svint64_t svread_hor_za64[_s64]_m(svint64_t zd, svbool_t pg,
                                    uint64_t tile, uint32_t slice)
    __arm_streaming __arm_in("za");

  // And similarly for s16, s32, s64, u8, u16, u32, u64, mf8, bf16, f16, f32, f64
  svint8_t svread_hor_za128[_s8]_m(svint8_t zd, svbool_t pg,
                                   uint64_t tile, uint32_t slice)
    __arm_streaming __arm_in("za");
```

Replacing `_hor` with `_ver` gives the associated vertical forms.

The intrinsics below write to horizontal ZA slices. In each case,
the type of the `zn` parameter varies with the type suffix. For example,
the `zn` parameter to the `_u8` intrinsic has type `svuint8_t`.

``` c
  // And similarly for u8, mf8.
  void svwrite_hor_za8[_s8]_m(uint64_t tile, uint32_t slice, svbool_t pg,
                              svint8_t zn)
    __arm_streaming __arm_inout("za");

  // And similarly for u16, bf16 and f16.
  void svwrite_hor_za16[_s16]_m(uint64_t tile, uint32_t slice, svbool_t pg,
                                svint16_t zn)
    __arm_streaming __arm_inout("za");

  // And similarly for u32 and f32.
  void svwrite_hor_za32[_s32]_m(uint64_t tile, uint32_t slice, svbool_t pg,
                                svint32_t zn)
    __arm_streaming __arm_inout("za");

  // And similarly for u64 and f64.
  void svwrite_hor_za64[_s64]_m(uint64_t tile, uint32_t slice, svbool_t pg,
                                svint64_t zn)
    __arm_streaming __arm_inout("za");

  // And similarly for s16, s32, s64, u8, u16, u32, u64, mf8, bf16, f16, f32, f64
  void svwrite_hor_za128[_s8]_m(uint64_t tile, uint32_t slice, svbool_t pg,
                                svint8_t zn)
    __arm_streaming __arm_inout("za");
```

Replacing `_hor` with `_ver` gives the associated vertical forms.

#### ADDHA

``` c
  void svaddha_za32[_s32]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                            svint32_t zn)
    __arm_streaming __arm_inout("za");

  void svaddha_za32[_u32]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                            svuint32_t zn)
    __arm_streaming __arm_inout("za");

  // Only if __ARM_FEATURE_SME_I16I64 != 0
  void svaddha_za64[_s64]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                            svint64_t zn)
    __arm_streaming __arm_inout("za");

  // Only if __ARM_FEATURE_SME_I16I64 != 0
  void svaddha_za64[_u64]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                            svuint64_t zn)
    __arm_streaming __arm_inout("za");
```

#### ADDVA

``` c
  void svaddva_za32[_s32]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                            svint32_t zn)
    __arm_streaming __arm_inout("za");

  void svaddva_za32[_u32]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                            svuint32_t zn)
    __arm_streaming __arm_inout("za");

  // Only if __ARM_FEATURE_SME_I16I64 != 0
  void svaddva_za64[_s64]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                            svint64_t zn)
    __arm_streaming __arm_inout("za");

  // Only if __ARM_FEATURE_SME_I16I64 != 0
  void svaddva_za64[_u64]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                            svuint64_t zn)
    __arm_streaming __arm_inout("za");
```

#### BFMOPA, FMOPA (widening), SMOPA, UMOPA

``` c
  void svmopa_za32[_bf16]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                            svbfloat16_t zn, svbfloat16_t zm)
    __arm_streaming __arm_inout("za");

  void svmopa_za32[_f16]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                           svfloat16_t zn, svfloat16_t zm)
    __arm_streaming __arm_inout("za");

  void svmopa_za32[_s8]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                          svint8_t zn, svint8_t zm)
    __arm_streaming;

  void svmopa_za32[_u8]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                          svuint8_t zn, svuint8_t zm)
    __arm_streaming __arm_inout("za");

  // Only if __ARM_FEATURE_SME_I16I64 != 0
  void svmopa_za64[_s16]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                           svint16_t zn, svint16_t zm)
    __arm_streaming __arm_inout("za");

  // Only if __ARM_FEATURE_SME_I16I64 != 0
  void svmopa_za64[_u16]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                           svuint16_t zn, svuint16_t zm)
    __arm_streaming __arm_inout("za");
```

#### BFMOPA, FMOPA (non-widening)

``` c
  // Variants are also available for:
  //   _za16[_bf16]_m (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16]_m (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za64[_f64]_m (only if __ARM_FEATURE_SME_F64F64 != 0)
  void svmopa_za32[_f32]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                           svfloat32_t zn, svfloat32_t zm)
    __arm_streaming __arm_inout("za");
```

#### BFMOPS, FMOPS (widening), SMOPS, UMOPS

``` c
  void svmops_za32[_bf16]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                            svbfloat16_t zn, svbfloat16_t zm)
    __arm_streaming __arm_inout("za");

  void svmops_za32[_f16]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                           svfloat16_t zn, svfloat16_t zm)
    __arm_streaming __arm_inout("za");

  void svmops_za32[_s8]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                          svint8_t zn, svint8_t zm)
    __arm_streaming __arm_inout("za");

  void svmops_za32[_u8]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                          svuint8_t zn, svuint8_t zm)
    __arm_streaming __arm_inout("za");

  // Only if __ARM_FEATURE_SME_I16I64 != 0
  void svmops_za64[_s16]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                           svint16_t zn, svint16_t zm)
    __arm_streaming __arm_inout("za");

  // Only if __ARM_FEATURE_SME_I16I64 != 0
  void svmops_za64[_u16]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                           svuint16_t zn, svuint16_t zm)
    __arm_streaming __arm_inout("za");
```

#### BFMOPS, FMOPS (non-widening)

``` c
  // Variants are also available for:
  //   _za16[_bf16]_m (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16]_m (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za64[_f64]_m (only if __ARM_FEATURE_SME_F64F64 != 0)
  void svmops_za32[_f32]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                           svfloat32_t zn, svfloat32_t zm)
    __arm_streaming __arm_inout("za");
```

#### RDSVL

The following intrinsics read the length of a streaming vector:

``` c
  // Return the number of bytes in a streaming vector.
  // Equivalent to svcntb() when called in streaming mode.
  uint64_t svcntsb() __arm_streaming_compatible;

  // Return the number of halfwords in a streaming vector.
  // Equivalent to svcnth() when called in streaming mode.
  uint64_t svcntsh() __arm_streaming_compatible;

  // Return the number of words in a streaming vector.
  // Equivalent to svcntw() when called in streaming mode.
  uint64_t svcntsw() __arm_streaming_compatible;

  // Return the number of doublewords in a streaming vector.
  // Equivalent to svcntd() when called in streaming mode.
  uint64_t svcntsd() __arm_streaming_compatible;
```

`svcntsb()` is equivalent to an RDSVL instruction with an immediate
operand of 1. There are no intrinsics that map directly to other
immediate operands, or to the ADDSVL and ADDSPL instructions, but it is
possible to write these operations using normal C arithmetic. For example:

``` c
  x0 = svcntsb();           // corresponds to RDSVL x0, #1
  x0 = svcntsb() * 5;       // can be optimized to RDSVL x0, #5
  x0 = x1 + svcntsb();      // can be optimized to ADDSVL x0, x1, #1
  x0 = x1 - svcntsb() * 3;  // can be optimized to ADDSVL x0, x1, #-3
  x0 = x1 + svcntsd();      // can be optimized to ADDSPL x0, x1, #1
  x0 = x1 - svcntsw();      // can be optimized to ADDSPL x0, x1, #-2
```

#### SUMOPA

``` c
  void svsumopa_za32[_s8]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                            svint8_t zn, svuint8_t zm)
    __arm_streaming __arm_inout("za");

  // Only if __ARM_FEATURE_SME_I16I64 != 0
  void svsumopa_za64[_s16]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                             svint16_t zn, svuint16_t zm)
    __arm_streaming __arm_inout("za");
```

#### SUMOPS

``` c
  void svsumops_za32[_s8]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                            svint8_t zn, svuint8_t zm)
    __arm_streaming __arm_inout("za");

  // Only if __ARM_FEATURE_SME_I16I64 != 0
  void svsumops_za64[_s16]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                             svint16_t zn, svuint16_t zm)
    __arm_streaming __arm_inout("za");
```

#### USMOPA

``` c
  void svusmopa_za32[_u8]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                            svuint8_t zn, svint8_t zm)
    __arm_streaming __arm_inout("za");

  // Only if __ARM_FEATURE_SME_I16I64 != 0
  void svusmopa_za64[_u16]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                             svuint16_t zn, svint16_t zm)
    __arm_streaming __arm_inout("za");
```

#### USMOPS

``` c
  void svusmops_za32[_u8]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                            svuint8_t zn, svint8_t zm)
    __arm_streaming __arm_inout("za");

  // Only if __ARM_FEATURE_SME_I16I64 != 0
  void svusmops_za64[_u16]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                             svuint16_t zn, svint16_t zm)
    __arm_streaming __arm_inout("za");
```

#### ZERO

``` c
  void svzero_mask_za(uint64_t tile_mask)
    __arm_streaming_compatible __arm_inout("za");

  void svzero_za() __arm_streaming_compatible __arm_out("za");
```

### SME2 instruction intrinsics

The intrinsics in this section are defined by the header file
[`<arm_sme.h>`](#arm_sme.h) when `__ARM_FEATURE_SME2` is defined.

#### ADD, SUB (store into ZA, single)

Multi-vector add/sub, storing into ZA

The additional '_write' suffix indicates that the operation is not accumulating;
the result is written directly into ZA.

``` c
  // Variants are available for:
  //   _za32[_s32]
  //   _za32[_u32]
  //   _za64[_s64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svadd_write[_single]_za32[_s32]_vg1x2(uint32_t slice, svint32x2_t zn,
                                             svint32_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_s32]
  //   _za32[_u32]
  //   _za64[_s64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svadd_write[_single]_za32[_s32]_vg1x4(uint32_t slice, svint32x4_t zn,
                                             svint32_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_s32]
  //   _za32[_u32]
  //   _za64[_s64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svsub_write[_single]_za32[_u32]_vg1x2(uint32_t slice, svuint32x2_t zn,
                                             svuint32_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_s32]
  //   _za32[_u32]
  //   _za64[_s64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svsub_write[_single]_za32[_u32]_vg1x4(uint32_t slice, svuint32x4_t zn,
                                             svuint32_t zm)
    __arm_streaming __arm_inout("za");
  ```

#### ADD, SUB (store into ZA, multi)

Multi-vector add/sub, storing into ZA

The additional '_write' suffix indicates that the operation is not accumulating;
the result is written directly into ZA.

``` c
  // Variants are available for:
  //   _za32[_s32]
  //   _za32[_u32]
  //   _za64[_s64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svadd_write_za32[_s32]_vg1x2(uint32_t slice,
                                    svint32x2_t zn, svint32x2_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_s32]
  //   _za32[_u32]
  //   _za64[_s64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svadd_write_za32[_s32]_vg1x4(uint32_t slice,
                                    svint32x4_t zn, svint32x4_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_s32]
  //   _za32[_u32]
  //   _za64[_s64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svsub_write_za32[_u32]_vg1x2(uint32_t slice,
                                    svuint32x2_t zn, svuint32x2_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_s32]
  //   _za32[_u32]
  //   _za64[_s64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svsub_write_za32[_u32]_vg1x4(uint32_t slice,
                                    svuint32x4_t zn, svuint32x4_t zm)
    __arm_streaming __arm_inout("za");
  ```

#### ADD (vectors)

Multi-vector add

``` c
  // Variants are also available for _single_u8_x2, _single_s16_x2,
  // _single_u16_x2, _single_s32_x2, _single_u32_x2, _single_s64_x2 and
  // _single_u64_x2
  svint8x2_t svadd[_single_s8_x2](svint8x2_t zdn, svint8_t zm) __arm_streaming;


  // Variants are also available for _single_u8_x4, _single_s16_x4,
  // _single_u16_x4, _single_s32_x4, _single_u32_x4, _single_s64_x4 and
  // _single_u64_x4
  svint8x4_t svadd[_single_s8_x4](svint8x4_t zdn, svint8_t zm) __arm_streaming;
  ```

#### ADD, SUB, BFADD, BFSUB, FADD, FSUB (accumulate into ZA)

Multi-vector add/sub and accumulate into ZA

``` c
  // Variants are available for:
  //   _za16[_bf16] (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16] (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za32[_f32]
  //   _za32[_s32]
  //   _za32[_u32]
  //   _za64[_f64] (only if __ARM_FEATURE_SME_F64F64 != 0)
  //   _za64[_s64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svadd_za32[_f32]_vg1x2(uint32_t slice, svfloat32x2_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za16[_bf16] (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16] (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za32[_f32]
  //   _za32[_s32]
  //   _za32[_u32]
  //   _za64[_f64] (only if __ARM_FEATURE_SME_F64F64 != 0)
  //   _za64[_s64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svadd_za32[_f32]_vg1x4(uint32_t slice, svfloat32x4_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za16[_bf16] (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16] (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za32[_f32]
  //   _za32[_s32]
  //   _za32[_u32]
  //   _za64[_f64] (only if __ARM_FEATURE_SME_F64F64 != 0)
  //   _za64[_s64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svsub_za32[_f32]_vg1x2(uint32_t slice, svfloat32x2_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za16[_bf16] (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16] (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za32[_f32]
  //   _za32[_s32]
  //   _za32[_u32]
  //   _za64[_f64] (only if __ARM_FEATURE_SME_F64F64 != 0)
  //   _za64[_s64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u64] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svsub_za32[_f32]_vg1x4(uint32_t slice, svfloat32x4_t zm)
    __arm_streaming __arm_inout("za");
  ```

#### BFCVTN, FCVTN

Multi-vector floating-point convert from single-precision to interleaved half-precision/BFloat16

``` c
  // Variants are also available for _f16[_f32_x2]
  svbfloat16_t svcvtn_bf16[_f32_x2](svfloat32x2_t zn) __arm_streaming;
  ```

#### FCVTL

Multi-vector floating-point convert from half-precision to deinterleaved
single-precision.

```
  // Only if __ARM_FEATURE_SME_F16F16 != 0
  svfloat32x2_t svcvtl_f32[_f16_x2](svfloat16_t zn) __arm_streaming;
```

#### FCVT, BFCVT, FCVTZS, FCVTZU, SCVTF, UCVTF

Multi-vector convert to/from floating-point.

``` c
  // Variants are also available for _f16[_f32_x2]
  svbfloat16_t svcvt_bf16[_f32_x2](svfloat32x2_t zn) __arm_streaming;


  // Variants are also available for _f32[_u32_x2], _s32[_f32_x2] and _u32[_f32_x2]
  svfloat32x2_t svcvt_f32[_s32_x2](svint32x2_t zn) __arm_streaming;


  // Variants are also available for _f32[_u32_x4], _s32[_f32_x4] and _u32[_f32_x4]
  svfloat32x4_t svcvt_f32[_s32_x4](svint32x4_t zn) __arm_streaming;

  // Only if __ARM_FEATURE_SME_F16F16 != 0
  svfloat32x2_t svcvt_f32[_f16_x2](svfloat16_t zn) __arm_streaming;
  ```

#### SQCVT, SQCVTU, UQCVT

Multi-vector saturating extract narrow

``` c
  // Variants are also available for _u16[_s32_x2] and _u16[_u32_x2]
  svint16_t svqcvt_s16[_s32_x2](svint32x2_t zn) __arm_streaming;


  // Variants are also available for _u8[_s32_x4], _u8[_u32_x4], _s16[_s64_x4],
  // _u16[_s64_x4] and _u16[_u64_x4]
  svint8_t svqcvt_s8[_s32_x4](svint32x4_t zn) __arm_streaming;
  ```

#### SQCVTN, SQCVTUN, UQCVTN

Multi-vector saturating extract narrow and interleave

``` c
  // Variants are also available for _u8[_s32_x4], _u8[_u32_x4], _s16[_s64_x4],
  // _u16[_s64_x4] and _u16[_u64_x4]
  svint8_t svqcvtn_s8[_s32_x4](svint32x4_t zn) __arm_streaming;
  ```

#### FDOT, BFDOT, SUDOT, USDOT, SDOT, UDOT (store into ZA, single)

Multi-vector dot-product (2-way and 4-way)

``` c
  // Variants are available for:
  //   _za32[_bf16]
  //   _za32[_f16]
  //   _za32[_s8]
  //   _za32[_s16]
  //   _za32[_u8]
  //   _za32[_u16]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svdot[_single]_za32[_bf16]_vg1x2(uint32_t slice, svbfloat16x2_t zn,
                                        svbfloat16_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_bf16]
  //   _za32[_f16]
  //   _za32[_s8]
  //   _za32[_s16]
  //   _za32[_u8]
  //   _za32[_u16]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svdot[_single]_za32[_bf16]_vg1x4(uint32_t slice,
                                        svbfloat16x4_t zn, svbfloat16_t zm)
    __arm_streaming __arm_inout("za");


  void svsudot[_single]_za32[_s8]_vg1x2(uint32_t slice, svint8x2_t zn,
                                        svuint8_t zm)
    __arm_streaming __arm_inout("za");


  void svsudot[_single]_za32[_s8]_vg1x4(uint32_t slice, svint8x4_t zn,
                                        svuint8_t zm)
    __arm_streaming __arm_inout("za");


  void svusdot[_single]_za32[_u8]_vg1x2(uint32_t slice, svuint8x2_t zn,
                                        svint8_t zm)
    __arm_streaming __arm_inout("za");


  void svusdot[_single]_za32[_u8]_vg1x4(uint32_t slice, svuint8x4_t zn,
                                        svint8_t zm)
    __arm_streaming __arm_inout("za");
  ```

#### FDOT, BFDOT, SUDOT, USDOT, SDOT, UDOT (store into ZA, multi)

Multi-vector dot-product (2-way and 4-way)

``` c
  // Variants are available for:
  //   _za32[_bf16]
  //   _za32[_f16]
  //   _za32[_s8]
  //   _za32[_s16]
  //   _za32[_u8]
  //   _za32[_u16]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svdot_za32[_bf16]_vg1x2(uint32_t slice, svbfloat16x2_t zn,
                               svbfloat16x2_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_bf16]
  //   _za32[_f16]
  //   _za32[_s8]
  //   _za32[_s16]
  //   _za32[_u8]
  //   _za32[_u16]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svdot_za32[_bf16]_vg1x4(uint32_t slice, svbfloat16x4_t zn,
                               svbfloat16x4_t zm)
    __arm_streaming __arm_inout("za");


  void svsudot_za32[_s8]_vg1x2(uint32_t slice, svint8x2_t zn, svuint8x2_t zm)
    __arm_streaming __arm_inout("za");


  void svsudot_za32[_s8]_vg1x4(uint32_t slice, svint8x4_t zn, svuint8x4_t zm)
    __arm_streaming __arm_inout("za");


  void svusdot_za32[_u8]_vg1x2(uint32_t slice, svuint8x2_t zn, svint8x2_t zm)
    __arm_streaming __arm_inout("za");


  void svusdot_za32[_u8]_vg1x4(uint32_t slice, svuint8x4_t zn, svint8x4_t zm)
    __arm_streaming __arm_inout("za");
  ```

#### FDOT, BFDOT, SUDOT, USDOT, SDOT, UDOT (store into ZA, indexed)

Multi-vector dot-product (2-way and 4-way)

``` c
  // Variants are available for:
  //   _za32[_bf16]
  //   _za32[_f16]
  //   _za32[_s8]
  //   _za32[_s16]
  //   _za32[_u8]
  //   _za32[_u16]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svdot_lane_za32[_bf16]_vg1x2(uint32_t slice, svbfloat16x2_t zn,
                                    svbfloat16_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_bf16]
  //   _za32[_f16]
  //   _za32[_s8]
  //   _za32[_s16]
  //   _za32[_u8]
  //   _za32[_u16]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svdot_lane_za32[_bf16]_vg1x4(uint32_t slice, svbfloat16x4_t zn,
                                    svbfloat16_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  void svsudot_lane_za32[_s8]_vg1x2(uint32_t slice, svint8x2_t zn, svuint8_t zm,
                                    uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  void svsudot_lane_za32[_s8]_vg1x4(uint32_t slice, svint8x4_t zn, svuint8_t zm,
                                    uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  void svusdot_lane_za32[_u8]_vg1x2(uint32_t slice, svuint8x2_t zn, svint8_t zm,
                                    uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  void svusdot_lane_za32[_u8]_vg1x4(uint32_t slice, svuint8x4_t zn, svint8_t zm,
                                    uint64_t imm_idx)
    __arm_streaming __arm_inout("za");
  ```

#### FVDOT, BFVDOT, SUVDOT, USVDOT, SVDOT, UVDOT

Multi-vector vertical dot-product by indexed element.

``` c
  void svsuvdot_lane_za32[_s8]_vg1x4(uint32_t slice, svint8x4_t zn,
                                     svuint8_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  void svusvdot_lane_za32[_u8]_vg1x4(uint32_t slice, svuint8x4_t zn,
                                     svint8_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za32[_f16], _za32[_s16] and _za32[_u16]
  void svvdot_lane_za32[_bf16]_vg1x2(uint32_t slice, svbfloat16x2_t zn,
                                     svbfloat16_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_s8]
  //   _za32[_u8]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svvdot_lane_za32[_s8]_vg1x4(uint32_t slice, svint8x4_t zn, svint8_t zm,
                                   uint64_t imm_idx)
    __arm_streaming __arm_inout("za");
  ```

#### UMOPA, SMOPA, UMOPS, SMOPS

Integer sum of outer products and accumulate/subtract (2-way)

``` c
  // Variants are also available for _za32[_u16]
  void svmopa_za32[_s16]_m(uint64_t tile, svbool_t pn, svbool_t pm, svint16_t zn,
                           svint16_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za32[_u16]
  void svmops_za32[_s16]_m(uint64_t tile, svbool_t pn, svbool_t pm, svint16_t zn,
                           svint16_t zm)
    __arm_streaming __arm_inout("za");
  ```

#### BMOPA, BMOPS

Bitwise exclusive NOR population count outer product and accumulate/subtract

``` c
  // Variants are also available for _za32[_s32]
  void svbmopa_za32[_u32]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                            svuint32_t zn, svuint32_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za32[_s32]
  void svbmops_za32[_u32]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                            svuint32_t zn, svuint32_t zm)
    __arm_streaming __arm_inout("za");
  ```

#### BFMLA, BFMLS, FMLA, FMLS (single)

Multi-vector floating-point fused multiply-add/subtract

``` c
  // Variants are available for:
  //   _za16[_bf16] (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16] (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za32[_f32]
  //   _za64[_f64] (only if __ARM_FEATURE_SME_F64F64 != 0)
  void svmla[_single]_za32[_f32]_vg1x2(uint32_t slice, svfloat32x2_t zn,
                                       svfloat32_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za16[_bf16] (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16] (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za32[_f32]
  //   _za64[_f64] (only if __ARM_FEATURE_SME_F64F64 != 0)
  void svmla[_single]_za32[_f32]_vg1x4(uint32_t slice, svfloat32x4_t zn,
                                       svfloat32_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za16[_bf16] (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16] (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za32[_f32]
  //   _za64[_f64] (only if __ARM_FEATURE_SME_F64F64 != 0)
  void svmls[_single]_za32[_f32]_vg1x2(uint32_t slice, svfloat32x2_t zn,
                                       svfloat32_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za16[_bf16] (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16] (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za32[_f32]
  //   _za64[_f64] (only if __ARM_FEATURE_SME_F64F64 != 0)
  void svmls[_single]_za32[_f32]_vg1x4(uint32_t slice, svfloat32x4_t zn,
                                       svfloat32_t zm)
    __arm_streaming __arm_inout("za");
  ```

#### BFMLA, BFMLS, FMLA, FMLS (multi)

Multi-vector floating-point fused multiply-add/subtract

``` c
  // Variants are available for:
  //   _za16[_bf16] (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16] (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za32[_f32]
  //   _za64[_f64] (only if __ARM_FEATURE_SME_F64F64 != 0)
  void svmla_za32[_f32]_vg1x2(uint32_t slice, svfloat32x2_t zn,
                              svfloat32x2_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za16[_bf16] (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16] (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za32[_f32]
  //   _za64[_f64] (only if __ARM_FEATURE_SME_F64F64 != 0)
  void svmla_za32[_f32]_vg1x4(uint32_t slice, svfloat32x4_t zn,
                              svfloat32x4_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za16[_bf16] (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16] (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za32[_f32]
  //   _za64[_f64] (only if __ARM_FEATURE_SME_F64F64 != 0)
  void svmls_za32[_f32]_vg1x2(uint32_t slice, svfloat32x2_t zn,
                              svfloat32x2_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za16[_bf16] (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16] (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za32[_f32]
  //   _za64[_f64] (only if __ARM_FEATURE_SME_F64F64 != 0)
  void svmls_za32[_f32]_vg1x4(uint32_t slice, svfloat32x4_t zn,
                              svfloat32x4_t zm)
    __arm_streaming __arm_inout("za");
  ```

#### BFMLA. BFMLS, FMLA, FMLS (indexed)

Multi-vector floating-point fused multiply-add/subtract

``` c
  // Variants are available for:
  //   _za16[_bf16] (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16] (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za32[_f32]
  //   _za64[_f64] (only if __ARM_FEATURE_SME_F64F64 != 0)
  void svmla_lane_za32[_f32]_vg1x2(uint32_t slice, svfloat32x2_t zn,
                                   svfloat32_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za16[_bf16] (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16] (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za32[_f32]
  //   _za64[_f64] (only if __ARM_FEATURE_SME_F64F64 != 0)
  void svmla_lane_za32[_f32]_vg1x4(uint32_t slice, svfloat32x4_t zn,
                                   svfloat32_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za16[_bf16] (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16] (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za32[_f32]
  //   _za64[_f64] (only if __ARM_FEATURE_SME_F64F64 != 0)
  void svmls_lane_za32[_f32]_vg1x2(uint32_t slice, svfloat32x2_t zn,
                                   svfloat32_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za16[_bf16] (only if __ARM_FEATURE_SME_B16B16 != 0)
  //   _za16[_f16] (only if __ARM_FEATURE_SME_F16F16 != 0)
  //   _za32[_f32]
  //   _za64[_f64] (only if __ARM_FEATURE_SME_F64F64 != 0)
  void svmls_lane_za32[_f32]_vg1x4(uint32_t slice, svfloat32x4_t zn,
                                   svfloat32_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");
  ```

#### FMLAL, BFMLAL, SMLAL, UMLAL (single)

Multi-vector multiply-add long (widening)

``` c
  // Variants are also available for _za32[_f16], _za32[_s16] and _za32[_u16]
  void svmla_za32[_bf16]_vg2x1(uint32_t slice, svbfloat16_t zn,
                               svbfloat16_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za32[_f16], _za32[_s16] and _za32[_u16]
  void svmla[_single]_za32[_bf16]_vg2x2(uint32_t slice, svbfloat16x2_t zn,
                                        svbfloat16_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za32[_f16], _za32[_s16] and _za32[_u16]
  void svmla[_single]_za32[_bf16]_vg2x4(uint32_t slice, svbfloat16x4_t zn,
                                        svbfloat16_t zm)
    __arm_streaming __arm_inout("za");
  ```

#### FMLAL, BFMLAL, SMLAL, UMLAL (multi)

Multi-vector multiply-add long (widening)

``` c
  // Variants are also available for _za32[_f16], _za32[_s16] and _za32[_u16]
  void svmla_za32[_bf16]_vg2x2(uint32_t slice, svbfloat16x2_t zn,
                               svbfloat16x2_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za32[_f16], _za32[_s16] and _za32[_u16]
  void svmla_za32[_bf16]_vg2x4(uint32_t slice, svbfloat16x4_t zn,
                               svbfloat16x4_t zm)
    __arm_streaming __arm_inout("za");
  ```

#### FMLAL, BFMLAL, SMLAL, UMLAL (indexed)

Multi-vector multiply-add long (widening)

``` c
  // Variants are also available for _za32[_f16], _za32[_s16] and _za32[_u16]
  void svmla_lane_za32[_bf16]_vg2x1(uint32_t slice, svbfloat16_t zn,
                                    svbfloat16_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za32[_f16], _za32[_s16] and _za32[_u16]
  void svmla_lane_za32[_bf16]_vg2x2(uint32_t slice, svbfloat16x2_t zn,
                                    svbfloat16_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za32[_f16], _za32[_s16] and _za32[_u16]
  void svmla_lane_za32[_bf16]_vg2x4(uint32_t slice, svbfloat16x4_t zn,
                                    svbfloat16_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");
  ```

#### BFMLSL, FMLSL, UMLSL, SMLSL (single)

Multi-vector multiply-subtract long (widening)

``` c
  // Variants are also available for _za32[_f16], _za32[_s16] and _za32[_u16]
  void svmls_za32[_bf16]_vg2x1(uint32_t slice, svbfloat16_t zn,
                               svbfloat16_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za32[_f16], _za32[_s16] and _za32[_u16]
  void svmls[_single]_za32[_bf16]_vg2x2(uint32_t slice, svbfloat16x2_t zn,
                                        svbfloat16_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za32[_f16], _za32[_s16] and _za32[_u16]
  void svmls[_single]_za32[_bf16]_vg2x4(uint32_t slice, svbfloat16x4_t zn,
                                        svbfloat16_t zm)
    __arm_streaming __arm_inout("za");
  ```

#### BFMLSL, FMLSL, UMLSL, SMLSL (multi)

Multi-vector multiply-subtract long (widening)

``` c
  // Variants are also available for _za32[_f16], _za32[_s16] and _za32[_u16]
  void svmls_za32[_bf16]_vg2x2(uint32_t slice, svbfloat16x2_t zn,
                               svbfloat16x2_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za32[_f16], _za32[_s16] and _za32[_u16]
  void svmls_za32[_bf16]_vg2x4(uint32_t slice, svbfloat16x4_t zn,
                               svbfloat16x4_t zm)
    __arm_streaming __arm_inout("za");
  ```

#### BFMLSL, FMLSL, UMLSL, SMLSL (indexed)

Multi-vector multiply-subtract long (widening)

``` c
  // Variants are also available for _za32[_f16], _za32[_s16] and _za32[_u16]
  void svmls_lane_za32[_bf16]_vg2x1(uint32_t slice, svbfloat16_t zn,
                                    svbfloat16_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za32[_f16], _za32[_s16] and _za32[_u16]
  void svmls_lane_za32[_bf16]_vg2x2(uint32_t slice, svbfloat16x2_t zn,
                                    svbfloat16_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za32[_f16], _za32[_s16] and _za32[_u16]
  void svmls_lane_za32[_bf16]_vg2x4(uint32_t slice, svbfloat16x4_t zn,
                                    svbfloat16_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");
  ```

#### UMLALL, SMLALL, USMLALL, SUMLALL (single)

Multi-vector multiply-add long long (widening)

``` c
  // Variants are available for:
  //   _za32[_s8]
  //   _za32[_u8]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svmla_za32[_s8]_vg4x1(uint32_t slice, svint8_t zn, svint8_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_s8]
  //   _za32[_u8]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svmla[_single]_za32[_s8]_vg4x2(uint32_t slice, svint8x2_t zn,
                                      svint8_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_s8]
  //   _za32[_u8]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svmla[_single]_za32[_s8]_vg4x4(uint32_t slice, svint8x4_t zn,
                                      svint8_t zm)
    __arm_streaming __arm_inout("za");


  void svsumla_za32[_s8]_vg4x1(uint32_t slice, svint8_t zn, svuint8_t zm)
    __arm_streaming __arm_inout("za");


  void svsumla[_single]_za32[_s8]_vg4x2(uint32_t slice, svint8x2_t zn,
                                        svuint8_t zm)
    __arm_streaming __arm_inout("za");


  void svsumla[_single]_za32[_s8]_vg4x4(uint32_t slice, svint8x4_t zn,
                                        svuint8_t zm)
    __arm_streaming __arm_inout("za");


  void svusmla_za32[_u8]_vg4x1(uint32_t slice, svuint8_t zn, svint8_t zm)
    __arm_streaming __arm_inout("za");


  void svusmla[_single]_za32[_u8]_vg4x2(uint32_t slice, svuint8x2_t zn,
                                        svint8_t zm)
    __arm_streaming __arm_inout("za");


  void svusmla[_single]_za32[_u8]_vg4x4(uint32_t slice, svuint8x4_t zn,
                                        svint8_t zm)
    __arm_streaming __arm_inout("za");
  ```

#### UMLALL, SMLALL, USMLALL, SUMLALL (multi)

Multi-vector multiply-add long long (widening)

``` c
  // Variants are available for:
  //   _za32[_s8]
  //   _za32[_u8]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svmla_za32[_s8]_vg4x2(uint32_t slice, svint8x2_t zn, svint8x2_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_s8]
  //   _za32[_u8]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svmla_za32[_s8]_vg4x4(uint32_t slice, svint8x4_t zn, svint8x4_t zm)
    __arm_streaming __arm_inout("za");


  void svsumla_za32[_s8]_vg4x2(uint32_t slice, svint8x2_t zn, svuint8x2_t zm)
    __arm_streaming __arm_inout("za");


  void svsumla_za32[_s8]_vg4x4(uint32_t slice, svint8x4_t zn, svuint8x4_t zm)
    __arm_streaming __arm_inout("za");


  void svusmla_za32[_u8]_vg4x2(uint32_t slice, svuint8x2_t zn, svint8x2_t zm)
    __arm_streaming __arm_inout("za");


  void svusmla_za32[_u8_vg4x4(uint32_t slice, svuint8x4_t zn, svint8x4_t zm)
    __arm_streaming __arm_inout("za");
  ```

#### UMLALL, SMLALL, USMLALL, SUMLALL (indexed)

Multi-vector multiply-add long long (widening)

``` c
  // Variants are available for:
  //   _za32[_s8]
  //   _za32[_u8]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svmla_lane_za32[_s8]_vg4x1(uint32_t slice, svint8_t zn, svint8_t zm,
                                  uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_s8]
  //   _za32[_u8]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svmla_lane_za32[_s8]_vg4x2(uint32_t slice, svint8x2_t zn, svint8_t zm,
                                  uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_s8]
  //   _za32[_u8]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svmla_lane_za32[_s8]_vg4x4(uint32_t slice, svint8x4_t zn, svint8_t zm,
                                  uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  void svsumla_lane_za32[_s8]_vg4x1(uint32_t slice, svint8_t zn,
                                    svuint8_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  void svsumla_lane_za32[_s8]_vg4x2(uint32_t slice, svint8x2_t zn,
                                    svuint8_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  void svsumla_lane_za32[_s8]_vg4x4(uint32_t slice, svint8x4_t zn,
                                    svuint8_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  void svusmla_lane_za32[_u8]_vg4x1(uint32_t slice, svuint8_t zn,
                                    svint8_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  void svusmla_lane_za32[_u8]_vg4x2(uint32_t slice, svuint8x2_t zn,
                                    svint8_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  void svusmla_lane_za32[_u8]_vg4x4(uint32_t slice, svuint8x4_t zn,
                                    svint8_t zm, uint64_t imm_idx)
    __arm_streaming __arm_inout("za");
  ```

#### SMLSLL, UMLSLL (single)

Multi-vector multiply-subtract long long (widening)

``` c
  // Variants are available for:
  //   _za32[_s8]
  //   _za32[_u8]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svmls_za32[_s8]_vg4x1(uint32_t slice, svint8_t zn, svint8_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_s8]
  //   _za32[_u8]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svmls[_single]_za32[_s8]_vg4x2(uint32_t slice, svint8x2_t zn,
                                      svint8_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_s8]
  //   _za32[_u8]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svmls[_single]_za32[_s8]_vg4x4(uint32_t slice, svint8x4_t zn,
                                      svint8_t zm)
    __arm_streaming __arm_inout("za");
  ```

#### SMLSLL, UMLSLL (multi)

Multi-vector multiply-subtract long long (widening)

``` c
  // Variants are available for:
  //   _za32[_s8]
  //   _za32[_u8]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svmls_za32[_s8]_vg4x2(uint32_t slice, svint8x2_t zn, svint8x2_t zm)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_s8]
  //   _za32[_u8]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svmls_za32[_s8]_vg4x4(uint32_t slice, svint8x4_t zn, svint8x4_t zm)
    __arm_streaming __arm_inout("za");
  ```

#### SMLSLL, UMLSLL (indexed)

Multi-vector multiply-subtract long long (widening)

``` c
  // Variants are available for:
  //   _za32[_s8]
  //   _za32[_u8]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svmls_lane_za32[_s8]_vg4x1(uint32_t slice, svint8_t zn, svint8_t zm,
                                  uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_s8]
  //   _za32[_u8]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svmls_lane_za32[_s8]_vg4x2(uint32_t slice, svint8x2_t zn, svint8_t zm,
                                  uint64_t imm_idx)
    __arm_streaming __arm_inout("za");


  // Variants are available for:
  //   _za32[_s8]
  //   _za32[_u8]
  //   _za64[_s16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  //   _za64[_u16] (only if __ARM_FEATURE_SME_I16I64 != 0)
  void svmls_lane_za32[_s8]_vg4x4(uint32_t slice, svint8x4_t zn, svint8_t zm,
                                  uint64_t imm_idx)
    __arm_streaming __arm_inout("za");
  ```

#### SMAX, SMIN, UMAX, UMIN, BFMAX, BFMIN, FMAX, FMIN (single)

Multi-vector min/max

``` c
  // Variants are also available for:
  //   _single_s8_x2
  //   _single_u8_x2,
  //   _single_bf16_x2 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _single_s16_x2
  //   _single_u16_x2
  //   _single_s32_x2
  //   _single_u32_x2,
  //   _single_f32_x2
  //   _single_s64_x2
  //   _single_u64_x2
  //   _single_f64_x2
  svfloat16x2_t svmax[_single_f16_x2](svfloat16x2_t zdn, svfloat16_t zm)
    __arm_streaming;


  // Variants are also available for:
  //   _single_s8_x4
  //   _single_u8_x4,
  //   _single_bf16_x4 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _single_s16_x4
  //   _single_u16_x4
  //   _single_s32_x4
  //   _single_u32_x4,
  //   _single_f32_x4
  //   _single_s64_x4
  //   _single_u64_x4
  //   _single_f64_x4
  svfloat16x4_t svmax[_single_f16_x4](svfloat16x4_t zdn, svfloat16_t zm)
    __arm_streaming;


  // Variants are also available for:
  //   _single_s8_x2
  //   _single_u8_x2,
  //   _single_bf16_x2 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _single_s16_x2
  //   _single_u16_x2
  //   _single_s32_x2
  //   _single_u32_x2,
  //   _single_f32_x2
  //   _single_s64_x2
  //   _single_u64_x2
  //   _single_f64_x2
  svfloat16x2_t svmin[_single_f16_x2](svfloat16x2_t zdn, svfloat16_t zm)
    __arm_streaming;


  // Variants are also available for:
  //   _single_s8_x4
  //   _single_u8_x4,
  //   _single_bf16_x4 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _single_s16_x4
  //   _single_u16_x4
  //   _single_s32_x4
  //   _single_u32_x4,
  //   _single_f32_x4
  //   _single_s64_x4
  //   _single_u64_x4
  //   _single_f64_x4
  svfloat16x4_t svmin[_single_f16_x4](svfloat16x4_t zdn, svfloat16_t zm)
    __arm_streaming;
  ```

#### SMAX, SMIN, UMAX, UMIN, BFMAX, BFMIN, FMAX, FMIN (multi)

Multi-vector min/max

``` c
  // Variants are also available for:
  //   _s8_x2
  //   _u8_x2
  //   _bf16_x2 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _s16_x2
  //   _u16_x2,
  //   _s32_x2
  //   _u32_x2
  //   _f32_x2
  //   _s64_x2
  //   _u64_x2
  //   _f64_x2
  svfloat16x2_t svmax[_f16_x2](svfloat16x2_t zdn, svfloat16x2_t zm)
    __arm_streaming;


  // Variants are also available for:
  //   _s8_x4
  //   _u8_x4
  //   _bf16_x4 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _s16_x4
  //   _u16_x4,
  //   _s32_x4
  //   _u32_x4
  //   _f32_x4
  //   _s64_x4
  //   _u64_x4
  //   _f64_x4
  svfloat16x4_t svmax[_f16_x4](svfloat16x4_t zdn, svfloat16x4_t zm)
    __arm_streaming;


  // Variants are also available for:
  //   _s8_x2
  //   _u8_x2
  //   _bf16_x2 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _s16_x2
  //   _u16_x2,
  //   _s32_x2
  //   _u32_x2
  //   _f32_x2
  //   _s64_x2
  //   _u64_x2
  //   _f64_x2
  svfloat16x2_t svmin[_f16_x2](svfloat16x2_t zdn, svfloat16x2_t zm)
    __arm_streaming;


  // Variants are also available for:
  //   _s8_x4
  //   _u8_x4
  //   _bf16_x4 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _s16_x4
  //   _u16_x4,
  //   _s32_x4
  //   _u32_x4
  //   _f32_x4
  //   _s64_x4
  //   _u64_x4
  //   _f64_x4
  svfloat16x4_t svmin[_f16_x4](svfloat16x4_t zdn, svfloat16x4_t zm)
    __arm_streaming;
  ```

#### BFMAXNM, BFMINNM, FMAXNM, FMINNM (single)

Multi-vector floating point min/max number

``` c
  // Variants are also available for:
  //   _single_bf16_x2 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _single_f32_x2
  //   _single_f64_x2
  svfloat16x2_t svmaxnm[_single_f16_x2](svfloat16x2_t zdn, svfloat16_t zm)
    __arm_streaming;


  // Variants are also available for:
  //   _single_bf16_x4 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _single_f32_x4
  //   _single_f64_x4
  svfloat16x4_t svmaxnm[_single_f16_x4](svfloat16x4_t zdn, svfloat16_t zm)
    __arm_streaming;


  // Variants are also available for:
  //   _single_bf16_x2 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _single_f32_x2
  //   _single_f64_x2
  svfloat16x2_t svminnm[_single_f16_x2](svfloat16x2_t zdn, svfloat16_t zm)
    __arm_streaming;


  // Variants are also available for:
  //   _single_bf16_x4 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _single_f32_x4
  //   _single_f64_x4
  svfloat16x4_t svminnm[_single_f16_x4](svfloat16x4_t zdn, svfloat16_t zm)
    __arm_streaming;
  ```

#### BFMAXNM, BFMINNM, FMAXNM, FMINNM (multi)

Multi-vector floating point min/max number

``` c
  // Variants are also available for:
  //   _bf16_x2 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _f32_x2
  //   _f64_x2
  svfloat16x2_t svmaxnm[_f16_x2](svfloat16x2_t zdn, svfloat16x2_t zm)
    __arm_streaming;


  // Variants are also available for:
  //   _bf16_x4 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _f32_x4
  //   _f64_x4
  svfloat16x4_t svmaxnm[_f16_x4](svfloat16x4_t zdn, svfloat16x4_t zm)
    __arm_streaming;


  // Variants are also available for:
  //   _bf16_x2 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _f32_x2
  //   _f64_x2
  svfloat16x2_t svminnm[_f16_x2](svfloat16x2_t zdn, svfloat16x2_t zm)
    __arm_streaming;


  // Variants are also available for:
  //   _bf16_x4 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _f32_x4
  //   _f64_x4
  svfloat16x4_t svminnm[_f16_x4](svfloat16x4_t zdn, svfloat16x4_t zm)
    __arm_streaming;
  ```

#### FRINTA, FRINTM, FRINTN, FRINTP

Multi-vector floating-point round to integral value

``` c
  svfloat32x2_t svrinta[_f32_x2](svfloat32x2_t zn) __arm_streaming;


  svfloat32x4_t svrinta[_f32_x4](svfloat32x4_t zn) __arm_streaming;


  svfloat32x2_t svrintm[_f32_x2](svfloat32x2_t zn) __arm_streaming;


  svfloat32x4_t svrintm[_f32_x4](svfloat32x4_t zn) __arm_streaming;


  svfloat32x2_t svrintn[_f32_x2](svfloat32x2_t zn) __arm_streaming;


  svfloat32x4_t svrintn[_f32_x4](svfloat32x4_t zn) __arm_streaming;


  svfloat32x2_t svrintp[_f32_x2](svfloat32x2_t zn) __arm_streaming;


  svfloat32x4_t svrintp[_f32_x4](svfloat32x4_t zn) __arm_streaming;
  ```

#### LDR, STR

Spill and fill of ZT0

``` c
  void svldr_zt(uint64_t zt, const void *rn)
    __arm_streaming_compatible __arm_inout("zt0");


  void svstr_zt(uint64_t zt, void *rn)
    __arm_streaming_compatible __arm_in("zt0");
  ```

#### ZERO

Zero ZT0

``` c
  void svzero_zt(uint64_t zt)
    __arm_streaming_compatible __arm_out("zt0");
  ```

#### LUTI2, LUTI4

Lookup table read with 2-bit and 4-bit indexes

``` c
  // Variants are also available for _zt_u8, _zt_mf8, _zt_s16, _zt_u16, _zt_f16,
  // _zt_bf16, _zt_s32, _zt_u32 and _zt_f32
  svint8_t svluti2_lane_zt_s8(uint64_t zt, svuint8_t zn, uint64_t imm_idx)
    __arm_streaming __arm_in("zt0");


  // Variants are also available for _zt_u8, _zt_mf8, _zt_s16, _zt_u16, _zt_f16,
  // _zt_bf16, _zt_s32, _zt_u32 and _zt_f32
  svint8x2_t svluti2_lane_zt_s8_x2(uint64_t zt, svuint8_t zn,
                                   uint64_t imm_idx)
    __arm_streaming __arm_in("zt0");


  // Variants are also available for _zt_u8, _zt_mf8, _zt_s16, _zt_u16, _zt_f16,
  // _zt_bf16, _zt_s32, _zt_u32 and _zt_f32
  svint8x4_t svluti2_lane_zt_s8_x4(uint64_t zt, svuint8_t zn,
                                   uint64_t imm_idx)
    __arm_streaming __arm_in("zt0");


  // Variants are also available for _zt_u8, _zt_mf8, _zt_s16, _zt_u16, _zt_f16,
  // _zt_bf16, _zt_s32, _zt_u32 and _zt_f32
  svint8_t svluti4_lane_zt_s8(uint64_t zt, svuint8_t zn, uint64_t imm_idx)
    __arm_streaming __arm_in("zt0");


  // Variants are also available for _zt_u8, _zt_mf8, _zt_s16, _zt_u16, _zt_f16,
  // _zt_bf16, _zt_s32, _zt_u32 and _zt_f32
  svint8x2_t svluti4_lane_zt_s8_x2(uint64_t zt, svuint8_t zn,
                                   uint64_t imm_idx)
    __arm_streaming __arm_in("zt0");


  // Variants are also available for _zt_u16, _zt_f16, _zt_bf16, _zt_s32,
  // _zt_u32 and _zt_f32
  svint16x4_t svluti4_lane_zt_s16_x4(uint64_t zt, svuint8_t zn,
                                     uint64_t imm_idx)
    __arm_streaming __arm_in("zt0");
  ```

#### MOVA

Move multi-vectors to/from ZA

``` c
  // Variants are also available for _za8_u8, _za8_mf8, _za16_s16, _za16_u16,
  // _za16_f16, _za16_bf16, _za32_s32, _za32_u32, _za32_f32,
  // _za64_s64, _za64_u64 and _za64_f64
  svint8x2_t svread_hor_za8_s8_vg2(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_in("za");


  // Variants are also available for _za8_u8, _za8_mf8, _za16_s16, _za16_u16,
  // _za16_f16, _za16_bf16, _za32_s32, _za32_u32, _za32_f32,
  // _za64_s64, _za64_u64 and _za64_f64
  svint8x4_t svread_hor_za8_s8_vg4(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_in("za");


  // Variants are also available for _za8_u8, _za8_mf8, _za16_s16, _za16_u16,
  // _za16_f16, _za16_bf16, _za32_s32, _za32_u32, _za32_f32,
  // _za64_s64, _za64_u64 and _za64_f64
  svint8x2_t svread_ver_za8_s8_vg2(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_in("za");


  // Variants are also available for _za8_u8, _za8_mf8, _za16_s16, _za16_u16,
  // _za16_f16, _za16_bf16, _za32_s32, _za32_u32, _za32_f32,
  // _za64_s64, _za64_u64 and _za64_f64
  svint8x4_t svread_ver_za8_s8_vg4(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_in("za");


  // Variants are also available for _za8_u8, _za8_mf8, _za16_s16, _za16_u16,
  // _za16_f16, _za16_bf16, _za32_s32, _za32_u32, _za32_f32,
  // _za64_s64, _za64_u64 and _za64_f64
  svint8x2_t svread_za8_s8_vg1x2(uint32_t slice)
    __arm_streaming __arm_in("za");


  // Variants are also available for _za8_u8, _za8_mf8, _za16_s16, _za16_u16,
  // _za16_f16, _za16_bf16, _za32_s32, _za32_u32, _za32_f32,
  // _za64_s64, _za64_u64 and _za64_f64
  svint8x4_t svread_za8_s8_vg1x4(uint32_t slice)
    __arm_streaming __arm_in("za");


  // Variants are also available for _za8[_u8], _za8[_mf8], _za16[_s16], _za16[_u16],
  // _za16[_f16], _za16[_bf16], _za32[_s32], _za32[_u32], _za32[_f32],
  // _za64[_s64], _za64[_u64] and _za64[_f64]
  void svwrite_hor_za8[_s8]_vg2(uint64_t tile, uint32_t slice, svint8x2_t zn)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za8[_u8], _za8[_mf8], _za16[_s16], _za16[_u16],
  // _za16[_f16], _za16[_bf16], _za32[_s32], _za32[_u32], _za32[_f32],
  // _za64[_s64], _za64[_u64] and _za64[_f64]
  void svwrite_hor_za8[_s8]_vg4(uint64_t tile, uint32_t slice, svint8x4_t zn)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za8[_u8], _za8[_mf8], _za16[_s16], _za16[_u16],
  // _za16[_f16], _za16[_bf16], _za32[_s32], _za32[_u32], _za32[_f32],
  // _za64[_s64], _za64[_u64] and _za64[_f64]
  void svwrite_ver_za8[_s8]_vg2(uint64_t tile, uint32_t slice, svint8x2_t zn)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za8[_u8], _za8[_mf8], _za16[_s16], _za16[_u16],
  // _za16[_f16], _za16[_bf16], _za32[_s32], _za32[_u32], _za32[_f32],
  // _za64[_s64], _za64[_u64] and _za64[_f64]
  void svwrite_ver_za8[_s8]_vg4(uint64_t tile, uint32_t slice, svint8x4_t zn)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za8[_u8], _za8[_mf8], _za16[_s16], _za16[_u16],
  // _za16[_f16], _za16[_bf16], _za32[_s32], _za32[_u32], _za32[_f32],
  // _za64[_s64], _za64[_u64] and _za64[_f64]
  void svwrite_za8[_s8]_vg1x2(uint32_t slice, svint8x2_t zn)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za8[_u8], za8[_mf8], _za16[_s16], _za16[_u16],
  // _za16[_f16], _za16[_bf16], _za32[_s32], _za32[_u32], _za32[_f32],
  // _za64[_s64], _za64[_u64] and _za64[_f64]
  void svwrite_za8[_s8]_vg1x4(uint32_t slice, svint8x4_t zn)
    __arm_streaming __arm_inout("za");
  ```

#### UCLAMP, SCLAMP, BFCLAMP, FCLAMP

Multi-vector clamp to minimum/maximum vector

``` c
  // Variants are also available for:
  //   _single_s8_x2
  //   _single_u8_x2,
  //   _single_bf16_x2 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _single_s16_x2
  //   _single_u16_x2
  //   _single_s32_x2
  //   _single_u32_x2,
  //   _single_f32_x2
  //   _single_s64_x2
  //   _single_u64_x2
  //   _single_f64_x2
  svfloat16x2_t svclamp[_single_f16_x2](svfloat16x2_t zd, svfloat16_t zn,
                                        svfloat16_t zm)
    __arm_streaming;


  // Variants are also available for:
  //   _single_s8_x4
  //   _single_u8_x4,
  //   _single_bf16_x4 (only if __ARM_FEATURE_SVE_B16B16 != 0)
  //   _single_s16_x4
  //   _single_u16_x4
  //   _single_s32_x4
  //   _single_u32_x4,
  //   _single_f32_x4
  //   _single_s64_x4
  //   _single_u64_x4
  //   _single_f64_x4
  svfloat16x4_t svclamp[_single_f16_x4](svfloat16x4_t zd, svfloat16_t zn,
                                        svfloat16_t zm)
    __arm_streaming;
  ```


#### SEL

Multi-vector conditionally select elements from two vectors

``` c
  // Variants are also available for _s8_x2, _mf8_x2, _u16_x2, _s16_x2, _f16_x2,
  // _bf16_x2, _u32_x2, _s32_x2, _f32_x2, _u64_x2, _s64_x2 and _f64_x2
  svuint8x2_t svsel[_u8_x2](svcount_t png, svuint8x2_t zn, svuint8x2_t zm)
    __arm_streaming;


  // Variants are also available for _s8_x4, _mf8_x4, _u16_x4, _s16_x4, _f16_x4,
  // _bf16_x4, _u32_x4, _s32_x4, _f32_x4, _u64_x4, _s64_x4 and _f64_x4
  svuint8x4_t svsel[_u8_x4](svcount_t png, svuint8x4_t zn, svuint8x4_t zm)
    __arm_streaming;
  ```

#### URSHL, SRSHL (single)

Multi-vector rounding shift left

``` c
  // Variants are also available for _single_u8_x2, _single_u16_x2,
  // _single_s16_x2, _single_u32_x2, _single_s32_x2, _single_u64_x2
  // and _single_s64_x2
  svint8x2_t svrshl[_single_s8_x2](svint8x2_t zdn, svint8_t zm) __arm_streaming;


  // Variants are also available for _single_u8_x4, _single_u16_x4,
  // _single_s16_x4, _single_u32_x4, _single_s32_x4, _single_u64_x4
  // and _single_s64_x4
  svint8x4_t svrshl[_single_s8_x4](svint8x4_t zdn, svint8_t zm) __arm_streaming;
  ```

#### URSHL, SRSHL (multi)

Multi-vector rounding shift left

``` c
  // Variants are also available for _u8_x2, _u16_x2, _s16_x2, _u32_x2, _s32_x2,
  // _u64_x2 and _s64_x2
  svint8x2_t svrshl[_s8_x2](svint8x2_t zdn, svint8x2_t zm) __arm_streaming;


  // Variants are also available for _u8_x4, _u16_x4, _s16_x4, _u32_x4, _s32_x4,
  // _u64_x4 and _s64_x4
  svint8x4_t svrshl[_s8_x4](svint8x4_t zdn, svint8x4_t zm) __arm_streaming;
  ```

#### SQRSHR, UQRSHR

Multi-vector saturating rounding shift right narrow

``` c
  // Variants are also available for _u8[_u32_x4]
  svint8_t svqrshr[_n]_s8[_s32_x4](svint32x4_t zn, uint64_t imm)
    __arm_streaming;


  // Variants are also available for _u16[_u32_x2]
  svint16_t svqrshr[_n]_s16[_s32_x2](svint32x2_t zn, uint64_t imm)
    __arm_streaming;


  // Variants are also available for _u16[_u64_x4]
  svint16_t svqrshr[_n]_s16[_s64_x4](svint64x4_t zn, uint64_t imm)
    __arm_streaming;
  ```

#### SQRSHRN, UQRSHRN

Multi-vector saturating rounding shift right narrow and interleave

``` c
  // Variants are also available for _u8[_u32_x4]
  svint8_t svqrshrn[_n]_s8[_s32_x4](svint32x4_t zn, uint64_t imm)
    __arm_streaming;


  // Variants are also available for _u16[_u64_x4]
  svint16_t svqrshrn[_n]_s16[_s64_x4](svint64x4_t zn, uint64_t imm)
    __arm_streaming;
  ```

#### SQRSHRU

Multi-vector saturating rounding shift right unsigned narrow

``` c
  svuint8_t svqrshru[_n]_u8[_s32_x4](svint32x4_t zn, uint64_t imm)
    __arm_streaming;


  svuint16_t svqrshru[_n]_u16[_s32_x2](svint32x2_t zn, uint64_t imm)
    __arm_streaming;


  svuint16_t svqrshru[_n]_u16[_s64_x4](svint64x4_t zn, uint64_t imm)
    __arm_streaming;
  ```

#### SQRSHRUN

Multi-vector saturating rounding shift right unsigned narrow and interleave

``` c
  // Variants are also available for _u16[_s64_x4]
  svuint8_t svqrshrun[_n]_u8[_s32_x4](svint32x4_t zn, uint64_t imm)
    __arm_streaming;
  ```

#### SQDMULH (single)

Multi-vector signed saturating doubling multiply high

``` c
  // Variants are also available for _single_s16_x2, _single_s32_x2
  // and _single_s64_x2
  svint8x2_t svqdmulh[_single_s8_x2](svint8x2_t zdn, svint8_t zm)
    __arm_streaming;


  // Variants are also available for _single_s16_x4, _single_s32_x4
  // and _single_s64_x4
  svint8x4_t svqdmulh[_single_s8_x4](svint8x4_t zdn, svint8_t zm)
    __arm_streaming;
  ```

#### SQDMULH (multi)

Multi-vector signed saturating doubling multiply high

``` c
  // Variants are also available for _s16_x2, _s32_x2 and _s64_x2
  svint8x2_t svqdmulh[_s8_x2](svint8x2_t zdn, svint8x2_t zm) __arm_streaming;


  // Variants are also available for _s16_x4, _s32_x4 and _s64_x4
  svint8x4_t svqdmulh[_s8_x4](svint8x4_t zdn, svint8x4_t zm) __arm_streaming;
  ```

#### SUNPK, UUNPK

Multi-vector pack/unpack

``` c
  // Variants are also available for _u16[_u8_x2], _u32[_u16_x2], _s32[_s16_x2],
  // _u64[_u32_x2] and _s64[_s32_x2]
  svint16x2_t svunpk_s16[_s8_x2](svint8_t zn) __arm_streaming;


  // Variants are also available for _u16[_u8_x4], _u32[_u16_x4], _s32[_s16_x4],
  // _u64[_u32_x4] and _s64[_s32_x4]
  svint16x4_t svunpk_s16[_s8_x4](svint8x2_t zn) __arm_streaming;
  ```

#### ZIP

Multi-vector zip.

``` c
  // Variants are also available for _u8_x2, _mf8_x2, _u16_x2, _s16_x2, _f16_x2,
  // _bf16_x2, _u32_x2, _s32_x2, _f32_x2, _u64_x2, _s64_x2 and _f64_x2
  svint8x2_t svzip[_s8_x2](svint8x2_t zn) __arm_streaming;


  // Variants are also available for _u8_x4, _mf8_x4, _u16_x4, _s16_x4, _f16_x4,
  // _bf16_x4, _u32_x4, _s32_x4, _f32_x4, _u64_x4, _s64_x4 and _f64_x4
  svint8x4_t svzip[_s8_x4](svint8x4_t zn) __arm_streaming;
  ```

The `svzipq` intrinsics operate on quad-words, but for convenience accept all
element types.


``` c
  // Variants are also available for _u8_x2, _mf8_x2, _u16_x2, _s16_x2, _f16_x2,
  // _bf16_x2, _u32_x2, _s32_x2, _f32_x2, _u64_x2, _s64_x2 and _f64_x2
  svint8x2_t svzipq[_s8_x2](svint8x2_t zn) __arm_streaming;


  // Variants are also available for _u8_x4, _mf8_x4, _u16_x4, _s16_x4, _f16_x4,
  // _bf16_x4, _u32_x4, _s32_x4, _f32_x4, _u64_x4, _s64_x4 and _f64_x4
  svint8x4_t svzipq[_s8_x4](svint8x4_t zn) __arm_streaming;
  ```

#### UZP

Multi-vector unzip.

``` c
  // Variants are also available for _u8_x2, _mf8_x2, _u16_x2, _s16_x2, _f16_x2,
  // _bf16_x2, _u32_x2, _s32_x2, _f32_x2, _u64_x2, _s64_x2 and _f64_x2
  svint8x2_t svuzp[_s8_x2](svint8x2_t zn) __arm_streaming;


  // Variants are also available for _u8_x4, _mf8_x4, _u16_x4, _s16_x4, _f16_x4,
  // _bf16_x4, _u32_x4, _s32_x4, _f32_x4, _u64_x4, _s64_x4 and _f64_x4
  svint8x4_t svuzp[_s8_x4](svint8x4_t zn) __arm_streaming;
  ```

The `svuzpq` intrinsics operate on quad-words, but for convenience accept all
element types.

``` c
  // Variants are also available for _u8_x2, _mf8_x2, _u16_x2, _s16_x2, _f16_x2,
  // _bf16_x2, _u32_x2, _s32_x2, _f32_x2, _u64_x2, _s64_x2 and _f64_x2
  svint8x2_t svuzpq[_s8_x2](svint8x2_t zn) __arm_streaming;


  // Variants are also available for _u8_x4, _mf8_x4, _u16_x4, _s16_x4, _f16_x4,
  // _bf16_x4, _u32_x4, _s32_x4, _f32_x4, _u64_x4, _s64_x4 and _f64_x4
  svint8x4_t svuzpq[_s8_x4](svint8x4_t zn) __arm_streaming;
  ```

### SME2.1 instruction intrinsics

The specification for SME2.1 is in
[**Alpha** state](#current-status-and-anticipated-changes) and might change or
be extended in the future.

The intrinsics in this section are defined by the header file
[`<arm_sme.h>`](#arm_sme.h) when `__ARM_FEATURE_SME2p1` is defined.

#### MOVAZ (tile to vector, single)

Move and zero ZA tile slice to vector register.

```
  // And similarly for u8.
  svint8_t svreadz_hor_za8_s8(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_inout("za");

  // And similarly for u16, bf16 and f16.
  svint16_t svreadz_hor_za16_s16(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_inout("za");

  // And similarly for u32 and f32.
  svint32_t svreadz_hor_za32_s32(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_inout("za");

  // And similarly for u64 and f64.
  svint64_t svreadz_hor_za64_s64(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_inout("za");

  // And similarly for s16, s32, s64, u8, u16, u32, u64, bf16, f16, f32, f64
  svint8_t svreadz_hor_za128_s8(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_inout("za");

  // And similarly for u8.
  svint8_t svreadz_ver_za8_s8(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_inout("za");

  // And similarly for u16, bf16 and f16.
  svint16_t svreadz_ver_za16_s16(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_inout("za");

  // And similarly for u32 and f32.
  svint32_t svreadz_ver_za32_s32(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_inout("za");

  // And similarly for u64 and f64.
  svint64_t svreadz_ver_za64_s64(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_inout("za");

  // And similarly for s16, s32, s64, u8, u16, u32, u64, bf16, f16, f32, f64
  svint8_t svreadz_ver_za128_s8(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_inout("za");
```

#### MOVAZ (tile to vector, multiple)

Move and zero multiple ZA tile slices to vector registers

``` c
  // Variants are also available for _za8_u8, _za16_s16, _za16_u16,
  // _za16_f16, _za16_bf16, _za32_s32, _za32_u32, _za32_f32,
  // _za64_s64, _za64_u64 and _za64_f64
  svint8x2_t svreadz_hor_za8_s8_vg2(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za8_u8, _za16_s16, _za16_u16,
  // _za16_f16, _za16_bf16, _za32_s32, _za32_u32, _za32_f32,
  // _za64_s64, _za64_u64 and _za64_f64
  svint8x4_t svreadz_hor_za8_s8_vg4(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za8_u8, _za16_s16, _za16_u16,
  // _za16_f16, _za16_bf16, _za32_s32, _za32_u32, _za32_f32,
  // _za64_s64, _za64_u64 and _za64_f64
  svint8x2_t svreadz_ver_za8_s8_vg2(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za8_u8, _za16_s16, _za16_u16,
  // _za16_f16, _za16_bf16, _za32_s32, _za32_u32, _za32_f32,
  // _za64_s64, _za64_u64 and _za64_f64
  svint8x4_t svreadz_ver_za8_s8_vg4(uint64_t tile, uint32_t slice)
    __arm_streaming __arm_inout("za");
```

#### MOVAZ (array to vector)

Move and zero multiple ZA single-vector groups to vector registers

```
  // Variants are also available for _za8_u8, _za16_s16, _za16_u16,
  // _za16_f16, _za16_bf16, _za32_s32, _za32_u32, _za32_f32,
  // _za64_s64, _za64_u64 and _za64_f64
  svint8x2_t svreadz_za8_s8_vg1x2(uint32_t slice)
    __arm_streaming __arm_inout("za");


  // Variants are also available for _za8_u8, _za16_s16, _za16_u16,
  // _za16_f16, _za16_bf16, _za32_s32, _za32_u32, _za32_f32,
  // _za64_s64, _za64_u64 and _za64_f64
  svint8x4_t svreadz_za8_s8_vg1x4(uint32_t slice)
    __arm_streaming __arm_inout("za");
```

#### ZERO (vector groups)

Zero ZA vector groups

```
  void svzero_za64_vg1x2(uint32_t slice)
    __arm_streaming __arm_inout("za");

  void svzero_za64_vg1x4(uint32_t slice)
    __arm_streaming __arm_inout("za");

  void svzero_za64_vg2x1(uint32_t slice)
    __arm_streaming __arm_inout("za");

  void svzero_za64_vg2x2(uint32_t slice)
    __arm_streaming __arm_inout("za");

  void svzero_za64_vg2x4(uint32_t slice)
    __arm_streaming __arm_inout("za");

  void svzero_za64_vg4x1(uint32_t slice)
    __arm_streaming __arm_inout("za");

  void svzero_za64_vg4x2(uint32_t slice)
    __arm_streaming __arm_inout("za");

  void svzero_za64_vg4x4(uint32_t slice)
    __arm_streaming __arm_inout("za");
```

### Streaming-compatible versions of standard routines

ACLE provides the following streaming-compatible functions,
with the same behavior as the standard C functions that they
are named after. All of the functions have external linkage.

``` c
  void *__arm_sc_memcpy(void *dest, const void *src, size_t n)
    __arm_streaming_compatible;

  void *__arm_sc_memmove(void *dest, const void *src, size_t n)
    __arm_streaming_compatible;

  void *__arm_sc_memset(void *s, int c, size_t n)
    __arm_streaming_compatible;

  void *__arm_sc_memchr(void *s, int c, size_t n)
    __arm_streaming_compatible;
```

### SVE2.1 and SME2 instruction intrinsics

The specification for SVE2.1 is in
[**Alpha** state](#current-status-and-anticipated-changes) and may change or be
extended in the future.

The functions in this section are defined by either the header file
 [`<arm_sve.h>`](#arm_sve.h) or [`<arm_sme.h>`](#arm_sme.h)
when `__ARM_FEATURE_SVE2p1` or `__ARM_FEATURE_SME2` is defined, respectively.

These intrinsics can only be called from non-streaming code if
`__ARM_FEATURE_SVE2p1` is defined. They can only be called from streaming code
if the appropriate SME feature macro is defined (see previous paragraph).
They can only be called from streaming-compatible code if they could be called
from both non-streaming code and streaming code

Most function in this section are SME2 or SVE2.1. However some are available in
SME. For convinience the ones available in SME will be tagged in the function
with `[SME]`.

#### UCLAMP, SCLAMP, FCLAMP

Clamp to minimum/maximum vector.

``` c
  // Variants are also available for:
  //  _s8, _u8, _s16, _u16, _s32, _u32  [SME]
  // _f32, _s64, _u64 and _f64
  svfloat16_t svclamp[_f16](svfloat16_t op, svfloat16_t min, svfloat16_t max);
  ```

#### CNTP

Set scalar to count from predicate-as-counter. ``vl`` is expected to be 2 or 4.

``` c
  // Variants are also available for _c16, _c32 and _c64
  uint64_t svcntp_c8(svcount_t pnn, uint64_t vl);
  ```

#### UDOT, SDOT, FDOT (vectors)

Multi-vector dot-product (2-way)

``` c
  // Variants are also available for _s32_s16 and _u32_u16
  svfloat32_t svdot[_f32_f16](svfloat32_t zda, svfloat16_t zn,
                              svfloat16_t zm);
  ```

#### UDOT, SDOT, FDOT (indexed)

Multi-vector dot-product (2-way)

``` c
  // Variants are also available for _s32_s16 and _u32_u16
  svfloat32_t svdot_lane[_f32_f16](svfloat32_t zda, svfloat16_t zn,
                                   svfloat16_t zm, uint64_t imm_idx);
  ```

#### LD1B, LD1D, LD1H, LD1W

Contiguous load to multi-vector

``` c
  // Variants are also available for _s8, _mf8
  svuint8x2_t svld1[_u8]_x2(svcount_t png, const uint8_t *rn);


  // Variants are also available for _s8, _mf8
  svuint8x4_t svld1[_u8]_x4(svcount_t png, const uint8_t *rn);


  // Variants are also available for _s8, _mf8
  svuint8x2_t svld1_vnum[_u8]_x2(svcount_t png, const uint8_t *rn,
                                 int64_t vnum);


  // Variants are also available for _s8, _mf8
  svuint8x4_t svld1_vnum[_u8]_x4(svcount_t png, const uint8_t *rn,
                                 int64_t vnum);


  // Variants are also available for _s16, _f16 and _bf16
  svuint16x2_t svld1[_u16]_x2(svcount_t png, const uint16_t *rn);


  // Variants are also available for _s16, _f16 and _bf16
  svuint16x4_t svld1[_u16]_x4(svcount_t png, const uint16_t *rn);


  // Variants are also available for _s16, _f16 and _bf16
  svuint16x2_t svld1_vnum[_u16]_x2(svcount_t png, const uint16_t *rn,
                                   int64_t vnum);


  // Variants are also available for _s16, _f16 and _bf16
  svuint16x4_t svld1_vnum[_u16]_x4(svcount_t png, const uint16_t *rn,
                                   int64_t vnum);


  // Variants are also available for _s32 and _f32
  svuint32x2_t svld1[_u32]_x2(svcount_t png, const uint32_t *rn);


  // Variants are also available for _s32 and _f32
  svuint32x4_t svld1[_u32]_x4(svcount_t png, const uint32_t *rn);


  // Variants are also available for _s32 and _f32
  svuint32x2_t svld1_vnum[_u32]_x2(svcount_t png, const uint32_t *rn,
                                   int64_t vnum);


  // Variants are also available for _s32 and _f32
  svuint32x4_t svld1_vnum[_u32]_x4(svcount_t png, const uint32_t *rn,
                                   int64_t vnum);


  // Variants are also available for _s64 and _f64
  svuint64x2_t svld1[_u64]_x2(svcount_t png, const uint64_t *rn);


  // Variants are also available for _s64 and _f64
  svuint64x4_t svld1[_u64]_x4(svcount_t png, const uint64_t *rn);


  // Variants are also available for _s64 and _f64
  svuint64x2_t svld1_vnum[_u64]_x2(svcount_t png, const uint64_t *rn,
                                   int64_t vnum);


  // Variants are also available for _s64 and _f64
  svuint64x4_t svld1_vnum[_u64]_x4(svcount_t png, const uint64_t *rn,
                                   int64_t vnum);
  ```

#### LDNT1B, LDNT1D, LDNT1H, LDNT1W

Contiguous non-temporal load to multi-vector

``` c
  // Variants are also available for _s8, _mf8
  svuint8x2_t svldnt1[_u8]_x2(svcount_t png, const uint8_t *rn);


  // Variants are also available for _s8, _mf8
  svuint8x4_t svldnt1[_u8]_x4(svcount_t png, const uint8_t *rn);


  // Variants are also available for _s8, _mf8
  svuint8x2_t svldnt1_vnum[_u8]_x2(svcount_t png, const uint8_t *rn,
                                   int64_t vnum);


  // Variants are also available for _s8, _mf8
  svuint8x4_t svldnt1_vnum[_u8]_x4(svcount_t png, const uint8_t *rn,
                                   int64_t vnum);


  // Variants are also available for _s16, _f16 and _bf16
  svuint16x2_t svldnt1[_u16]_x2(svcount_t png, const uint16_t *rn);


  // Variants are also available for _s16, _f16 and _bf16
  svuint16x4_t svldnt1[_u16]_x4(svcount_t png, const uint16_t *rn);


  // Variants are also available for _s16, _f16 and _bf16
  svuint16x2_t svldnt1_vnum[_u16]_x2(svcount_t png, const uint16_t *rn,
                                     int64_t vnum);


  // Variants are also available for _s16, _f16 and _bf16
  svuint16x4_t svldnt1_vnum[_u16]_x4(svcount_t png, const uint16_t *rn,
                                     int64_t vnum);


  // Variants are also available for _s32 and _f32
  svuint32x2_t svldnt1[_u32]_x2(svcount_t png, const uint32_t *rn);


  // Variants are also available for _s32 and _f32
  svuint32x4_t svldnt1[_u32]_x4(svcount_t png, const uint32_t *rn);


  // Variants are also available for _s32 and _f32
  svuint32x2_t svldnt1_vnum[_u32]_x2(svcount_t png, const uint32_t *rn,
                                     int64_t vnum);


  // Variants are also available for _s32 and _f32
  svuint32x4_t svldnt1_vnum[_u32]_x4(svcount_t png, const uint32_t *rn,
                                     int64_t vnum);


  // Variants are also available for _s64 and _f64
  svuint64x2_t svldnt1[_u64]_x2(svcount_t png, const uint64_t *rn);


  // Variants are also available for _s64 and _f64
  svuint64x4_t svldnt1[_u64]_x4(svcount_t png, const uint64_t *rn);


  // Variants are also available for _s64 and _f64
  svuint64x2_t svldnt1_vnum[_u64]_x2(svcount_t png, const uint64_t *rn,
                                     int64_t vnum);


  // Variants are also available for _s64 and _f64
  svuint64x4_t svldnt1_vnum[_u64]_x4(svcount_t png, const uint64_t *rn,
                                     int64_t vnum);
  ```

#### BFMLSLB, BFMLSLT

BFloat16 floating-point multiply-subtract long from single-precision (top/bottom)

``` c
  svfloat32_t svbfmlslb[_f32](svfloat32_t zda, svbfloat16_t zn, svbfloat16_t zm);


  svfloat32_t svbfmlslb_lane[_f32](svfloat32_t zda, svbfloat16_t zn,
                                   svbfloat16_t zm, uint64_t imm_idx);


  svfloat32_t svbfmlslt[_f32](svfloat32_t zda, svbfloat16_t zn, svbfloat16_t zm);


  svfloat32_t svbfmlslt_lane[_f32](svfloat32_t zda, svbfloat16_t zn,
                                   svbfloat16_t zm, uint64_t imm_idx);
  ```

#### PEXT

Transform a predicate-as-counter to a predicate (pair).

``` c
  // Variants are also available for _c16, _c32 and _c64
  svbool_t svpext_lane_c8(svcount_t pnn, uint64_t imm);


  // Variants are also available for _c16, _c32 and _c64
  svboolx2_t svpext_lane_c8_x2(svcount_t pnn, uint64_t imm);
  ```

#### PSEL

Predicate select between predicate value or all-false

``` c
   // Variants are also available for _b16, _b32 and _b64 [SME]
   svbool_t svpsel_lane_b8(svbool_t pn, svbool_t pm, uint32_t idx);


  // Variants are also available for _c16, _c32 and _c64
  svcount_t svpsel_lane_c8(svcount_t pn, svbool_t pm, uint32_t idx);
  ```

#### PTRUE, PFALSE

Initialise predicate-as-counter to all active or all inactive.

``` c
  // Variants are also available for _c16, _c32 and _c64
  svcount_t svptrue_c8();


  svcount_t svpfalse_c(void);
```

#### REVD

Reverse doublewords in elements.

``` c
  // All the intrinsics below are [SME]
  // Variants are available for:
  // _s8, _s16, _u16, _s32, _u32, _s64, _u64
  // _mf8, _bf16, _f16, _f32, _f64
  svuint8_t svrevd[_u8]_m(svuint8_t zd, svbool_t pg, svuint8_t zn);


  // Variants are available for:
  // _s8, _s16, _u16, _s32, _u32, _s64, _u64
  // _mf8, _bf16, _f16, _f32, _f64
  svuint8_t svrevd[_u8]_z(svbool_t pg, svuint8_t zn);


  // Variants are available for:
  // _s8, _s16, _u16, _s32, _u32, _s64, _u64
  // _mf8, _bf16, _f16, _f32, _f64
  svuint8_t svrevd[_u8]_x(svbool_t pg, svuint8_t zn);
  ```

#### SQCVTN, SQCVTUN, UQCVTN

Multi-vector saturating extract narrow and interleave

``` c
  // Variants are also available for _u16[_s32_x2] and _u16[_u32_x2]
  svint16_t svqcvtn_s16[_s32_x2](svint32x2_t zn);
  ```

#### SQRSHRN, UQRSHRN

Multi-vector saturating rounding shift right narrow and interleave

``` c
  // Variants are also available for _u16[_u32_x2]
  svint16_t svqrshrn[_n]_s16[_s32_x2](svint32x2_t zn, uint64_t imm);
  ```

#### SQRSHRUN

Multi-vector saturating rounding shift right unsigned narrow and interleave

``` c
  svuint16_t svqrshrun[_n]_u16[_s32_x2](svint32x2_t zn, uint64_t imm);
  ```

#### ST1B, ST1D, ST1H, ST1W

Contiguous store of multi-vector operand

``` c
  // Variants are also available for _s8_x2, _mf8_x2
  void svst1[_u8_x2](svcount_t png, uint8_t *rn, svuint8x2_t zt);


  // Variants are also available for _s8_x4, _mf8_x4
  void svst1[_u8_x4](svcount_t png, uint8_t *rn, svuint8x4_t zt);


  // Variants are also available for _s8_x2, _mf8_x2
  void svst1_vnum[_u8_x2](svcount_t png, uint8_t *rn, int64_t vnum,
                          svuint8x2_t zt);


  // Variants are also available for _s8_x4, _mf8_x4
  void svst1_vnum[_u8_x4](svcount_t png, uint8_t *rn, int64_t vnum,
                          svuint8x4_t zt);


  // Variants are also available for _s16_x2, _f16_x2 and _bf16_x2
  void svst1[_u16_x2](svcount_t png, uint16_t *rn, svuint16x2_t zt);


  // Variants are also available for _s16_x4, _f16_x4 and _bf16_x4
  void svst1[_u16_x4](svcount_t png, uint16_t *rn, svuint16x4_t zt);


  // Variants are also available for _s16_x2, _f16_x2 and _bf16_x2
  void svst1_vnum[_u16_x2](svcount_t png, uint16_t *rn, int64_t vnum,
                           svuint16x2_t zt);


  // Variants are also available for _s16_x4, _f16_x4 and _bf16_x4
  void svst1_vnum[_u16_x4](svcount_t png, uint16_t *rn, int64_t vnum,
                           svuint16x4_t zt);


  // Variants are also available for _s32_x2 and _f32_x2
  void svst1[_u32_x2](svcount_t png, uint32_t *rn, svuint32x2_t zt);


  // Variants are also available for _s32_x4 and _f32_x4
  void svst1[_u32_x4](svcount_t png, uint32_t *rn, svuint32x4_t zt);


  // Variants are also available for _s32_x2 and _f32_x2
  void svst1_vnum[_u32_x2](svcount_t png, uint32_t *rn, int64_t vnum,
                           svuint32x2_t zt);


  // Variants are also available for _s32_x4 and _f32_x4
  void svst1_vnum[_u32_x4](svcount_t png, uint32_t *rn, int64_t vnum,
                           svuint32x4_t zt);


 // Variants are also available for _s64_x2 and _f64_x2
  void svst1[_u64_x2](svcount_t png, uint64_t *rn, svuint64x2_t zt);


  // Variants are also available for _s64_x4 and _f64_x4
  void svst1[_u64_x4](svcount_t png, uint64_t *rn, svuint64x4_t zt);


  // Variants are also available for _s64_x2 and _f64_x2
  void svst1_vnum[_u64_x2](svcount_t png, uint64_t *rn, int64_t vnum,
                           svuint64x2_t zt);


  // Variants are also available for _s64_x4 and _f64_x4
  void svst1_vnum[_u64_x4](svcount_t png, uint64_t *rn, int64_t vnum,
                           svuint64x4_t zt);
  ```

#### STNT1B, STNT1D, STNT1H, STNT1W

Contiguous non-temporal store of multi-vector operand

``` c
  // Variants are also available for _s8_x2, _mf8_x2
  void svstnt1[_u8_x2](svcount_t png, uint8_t *rn, svuint8x2_t zt);


  // Variants are also available for _s8_x4, _mf8_x4
  void svstnt1[_u8_x4](svcount_t png, uint8_t *rn, svuint8x4_t zt);


  // Variants are also available for _s8_x2, _mf8_x2
  void svstnt1_vnum[_u8_x2](svcount_t png, uint8_t *rn, int64_t vnum,
                            svuint8x2_t zt);


  // Variants are also available for _s8_x4, _mf8_x4
  void svstnt1_vnum[_u8_x4](svcount_t png, uint8_t *rn, int64_t vnum,
                            svuint8x4_t zt);


  // Variants are also available for _s16_x2, _f16_x2 and _bf16_x2
  void svstnt1[_u16_x2](svcount_t png, uint16_t *rn, svuint16x2_t zt);


  // Variants are also available for _s16_x4, _f16_x4 and _bf16_x4
  void svstnt1[_u16_x4](svcount_t png, uint16_t *rn, svuint16x4_t zt);


  // Variants are also available for _s16_x2, _f16_x2 and _bf16_x2
  void svstnt1_vnum[_u16_x2](svcount_t png, uint16_t *rn, int64_t vnum,
                             svuint16x2_t zt);


  // Variants are also available for _s16_x4, _f16_x4 and _bf16_x4
  void svstnt1_vnum[_u16_x4](svcount_t png, uint16_t *rn, int64_t vnum,
                             svuint16x4_t zt);


  // Variants are also available for _s32_x2 and _f32_x2
  void svstnt1[_u32_x2](svcount_t png, uint32_t *rn, svuint32x2_t zt);


  // Variants are also available for _s32_x4 and _f32_x4
  void svstnt1[_u32_x4](svcount_t png, uint32_t *rn, svuint32x4_t zt);


  // Variants are also available for _s32_x2 and _f32_x2
  void svstnt1_vnum[_u32_x2](svcount_t png, uint32_t *rn, int64_t vnum,
                             svuint32x2_t zt);


  // Variants are also available for _s32_x4 and _f32_x4
  void svstnt1_vnum[_u32_x4](svcount_t png, uint32_t *rn, int64_t vnum,
                             svuint32x4_t zt);


  // Variants are also available for _s64_x2 and _f64_x2
  void svstnt1[_u64_x2](svcount_t png, uint64_t *rn, svuint64x2_t zt);


  // Variants are also available for _s64_x4 and _f64_x4
  void svstnt1[_u64_x4](svcount_t png, uint64_t *rn, svuint64x4_t zt);


  // Variants are also available for _s64_x2 and _f64_x2
  void svstnt1_vnum[_u64_x2](svcount_t png, uint64_t *rn, int64_t vnum,
                             svuint64x2_t zt);


  // Variants are also available for _s64_x4 and _f64_x4
  void svstnt1_vnum[_u64_x4](svcount_t png, uint64_t *rn, int64_t vnum,
                             svuint64x4_t zt);
  ```

#### WHILEGE, WHILEGT, WHILEHI, WHILEHS, WHILELE, WHILELO, WHILELS, WHILELT

While (resulting in predicate-as-counter). ``vl`` is expected to be 2 or 4.

``` c
  // Variants are also available for _c16[_s64], _c32[_s64] _c64[_s64],
  // _c8[_u64], _c16[_u64], _c32[_u64] and _c64[_u64]
  svcount_t svwhilege_c8[_s64](int64_t rn, int64_t rm, uint64_t vl);


  // Variants are also available for _c16[_s64], _c32[_s64] _c64[_s64],
  // _c8[_u64], _c16[_u64], _c32[_u64] and _c64[_u64]
  svcount_t svwhilegt_c8[_s64](int64_t rn, int64_t rm, uint64_t vl);


  // Variants are also available for _c16[_s64], _c32[_s64] _c64[_s64],
  // _c8[_u64], _c16[_u64], _c32[_u64] and _c64[_u64]
  svcount_t svwhilele_c8[_s64](int64_t rn, int64_t rm, uint64_t vl);


  // Variants are also available for _c16[_s64], _c32[_s64] _c64[_s64],
  // _c8[_u64], _c16[_u64], _c32[_u64] and _c64[_u64]
  svcount_t svwhilelt_c8[_s64](int64_t rn, int64_t rm, uint64_t vl);
  ```

While (resulting in predicate tuple)

``` c
  // Variants are also available for _b16[_s64]_x2, _b32[_s64]_x2,
  // _b64[_s64]_x2, _b8[_u64]_x2, _b16[_u64]_x2, _b32[_u64]_x2 and
  // _b64[_u64]_x2
  svboolx2_t svwhilege_b8[_s64]_x2(int64_t rn, int64_t rm);


  // Variants are also available for _b16[_s64]_x2, _b32[_s64]_x2,
  // _b64[_s64]_x2, _b8[_u64]_x2, _b16[_u64]_x2, _b32[_u64]_x2 and
  // _b64[_u64]_x2
  svboolx2_t svwhilegt_b8[_s64]_x2(int64_t rn, int64_t rm);


  // Variants are also available for _b16[_s64]_x2, _b32[_s64]_x2,
  // _b64[_s64]_x2, _b8[_u64]_x2, _b16[_u64]_x2, _b32[_u64]_x2 and
  // _b64[_u64]_x2
  svboolx2_t svwhilele_b8[_s64]_x2(int64_t rn, int64_t rm);


  // Variants are also available for _b16[_s64]_x2, _b32[_s64]_x2,
  // _b64[_s64]_x2, _b8[_u64]_x2, _b16[_u64]_x2, _b32[_u64]_x2 and
  // _b64[_u64]_x2
  svboolx2_t svwhilelt_b8[_s64]_x2(int64_t rn, int64_t rm);
```


### SME2 maximum and minimum absolute value

The intrinsics in this section are defined by the header file
[`<arm_sme.h>`](#arm_sme.h) when `__ARM_FEATURE_SME2` is defined to 1
and `__ARM_FEATURE_FAMINMAX` is defined to 1.

#### FAMAX

Absolute maximum.
``` c
  // Variants are also available for:
  //  [_f32_x2], [_f64_x2],
  //  [_f16_x4], [_f32_x4] and [_f64_x4]
  svfloat16x2_t svamax[_f16_x2](svfloat16x2 zd, svfloat16x2_t zm) __arm_streaming;
```

#### FAMIN

Absolute minimum.
``` c
  // Variants are also available for:
  //  [_f32_x2], [_f64_x2],
  //  [_f16_x4], [_f32_x4] and [_f64_x4]
  svfloat16x2_t svamin[_f16_x2](svfloat16x2 zd, svfloat16x2_t zm) __arm_streaming;
```

### SME2 lookup table

The intrinsics in this section are defined by the header file
[`<arm_sme.h>`](#arm_sme.h) when `__ARM_FEATURE_SME_LUTv2` is defined to 1.

#### MOVT

Move vector register to ZT0.
``` c
  // Variants are also available for:
  // [_s8], [_u16], [_s16], [_u32], [_s32], [_u64], [_s64]
  // [_bf16], [_f16], [_f32], [_f64]
  void svwrite_zt[_u8](uint64_t zt0, svuint8_t zt) __arm_streaming __arm_out("zt0");

  // Variants are also available for:
  // [_s8], [_u16], [_s16], [_u32], [_s32], [_u64], [_s64]
  // [_bf16], [_f16], [_f32], [_f64]
  void svwrite_lane_zt[_u8](uint64_t zt0, svuint8_t zt, uint64_t idx) __arm_streaming __arm_inout("zt0");
```

#### LUTI4

Lookup table read with 4-bit indexes and 8-bit elements.
``` c
  // Variants are also available for: _u8
  svint8x4_t svluti4_zt_s8_x4(uint64_t zt0, svuint8x2_t zn) __arm_streaming __arm_in("zt0");
```

### SVE2 and SME2 modal 8-bit floating-point intrinsics

The intrinsics in this section are defined by the header file
[`<arm_sve.h>`](#arm_sve.h) when `__ARM_FEATURE_FP8` is defined,
and `__ARM_FEATURE_SVE2` or `__ARM_FEATURE_SME2` is defined. Individual
intrinsics may have additional target feature requirements.

#### BF1CVT, BF2CVT, F1CVT, F2CVT

8-bit floating-point convert to half-precision and BFloat16.
``` c
  // Variants are also available for: _bf16
  svfloat16_t svcvt1_f16[_mf8]_fpm(svmfloat8_t zn, fpm_t fpm);
  svfloat16_t svcvt2_f16[_mf8]_fpm(svmfloat8_t zn, fpm_t fpm);
```

#### BF1CVTLT, BF2CVTLT, F1CVTLT, F2CVTLT

8-bit floating-point convert to half-precision and BFloat16 (top).
``` c
  // Variants are also available for: _bf16
  svfloat16_t svcvtlt1_f16[_mf8]_fpm(svmfloat8_t zn, fpm_t fpm);
  svfloat16_t svcvtlt2_f16[_mf8]_fpm(svmfloat8_t zn, fpm_t fpm);
```

#### BFCVTN, FCVTN

Half-precision and BFloat16 convert, narrow, and interleave to 8-bit
floating-point.
``` c
  // Variant is also available for: _bf16_x2
  svmfloat8_t svcvtn_mf8[_f16_x2]_fpm(svfloat16x2_t zn, fpm_t fpm);
```

#### FCVTNT, FCVTNB

Single-precision convert, narrow, and interleave to 8-bit floating-point (top and bottom).
``` c
  svmfloat8_t svcvtnt_mf8[_f32_x2]_fpm(svmfloat8_t zd, svfloat32x2_t zn, fpm_t fpm);
  svmfloat8_t svcvtnb_mf8[_f32_x2]_fpm(svfloat32x2_t zn, fpm_t fpm);
```

#### FDOT (4-way, vectors)

8-bit floating-point dot product to single-precision.
``` c
  // Only if (__ARM_FEATURE_SVE2  && __ARM_FEATURE_FP8DOT4) || __ARM_FEATURE_SSVE_FP8DOT4
  svfloat32_t svdot[_f32_mf8]_fpm(svfloat32_t zda, svmfloat8_t zn, svmfloat8_t zm, fpm_t fpm);
```

#### FDOT (4-way, indexed)

8-bit floating-point indexed dot product to single-precision.
``` c
  // Only if (__ARM_FEATURE_SVE2  && __ARM_FEATURE_FP8DOT4) || __ARM_FEATURE_SSVE_FP8DOT4
  svfloat32_t svdot_lane[_f32_mf8]_fpm(svfloat32_t zda, svmfloat8_t zn, svmfloat8_t zm,
                                       uint64_t imm0_3, fpm_t fpm);
```

#### FDOT (2-way, vectors, FP8 to FP16)

8-bit floating-point dot product to half-precision.
``` c
  // Only if (__ARM_FEATURE_SVE2  && __ARM_FEATURE_FP8DOT2) || __ARM_FEATURE_SSVE_FP8DOT2
  svfloat16_t svdot[_f16_mf8]_fpm(svfloat16_t zda, svmfloat8_t zn, svmfloat8_t zm, fpm_t fpm);
```

#### FDOT (2-way, indexed, FP8 to FP16)

8-bit floating-point dot product to half-precision.
``` c
  // Only if (__ARM_FEATURE_SVE2  && __ARM_FEATURE_FP8DOT2) || __ARM_FEATURE_SSVE_FP8DOT2
  svfloat16_t svdot_lane[_f16_mf8]_fpm(svfloat16_t zda, svmfloat8_t zn, svmfloat8_t zm,
                                       uint64_t imm0_7, fpm_t fpm);
```

#### FMLALB (vectors, FP8 to FP16)

8-bit floating-point multiply-add long to half-precision (bottom).
``` c
  // Only if (__ARM_FEATURE_SVE2  && __ARM_FEATURE_FP8FMA) || __ARM_FEATURE_SSVE_FP8FMA
  svfloat16_t svmlalb[_f16_mf8]_fpm(svfloat16_t zda, svmfloat8_t zn, svmfloat8_t zm, fpm_t fpm);
  svfloat16_t svmlalb[_n_f16_mf8]_fpm(svfloat16_t zda, svmfloat8_t zn, mfloat8_t zm, fpm_t fpm);
```

#### FMLALB (indexed, FP8 to FP16)

8-bit floating-point multiply-add long to half-precision (bottom, indexed).
``` c
  // Only if (__ARM_FEATURE_SVE2  && __ARM_FEATURE_FP8FMA) || __ARM_FEATURE_SSVE_FP8FMA
  svfloat16_t svmlalb_lane[_f16_mf8]_fpm(svfloat16_t zda, svmfloat8_t zn, svmfloat8_t zm,
                                         uint64_t imm0_15, fpm_t fpm);
```

#### FMLALLBB (vectors)

8-bit floating-point multiply-add long long to single-precision (bottom bottom).
``` c
  // Only if (__ARM_FEATURE_SVE2  && __ARM_FEATURE_FP8FMA) || __ARM_FEATURE_SSVE_FP8FMA
  svfloat32_t svmlallbb[_f32_mf8]_fpm(svfloat32_t zda, svmfloat8_t zn, svmfloat8_t zm, fpm_t fpm);
  svfloat32_t svmlallbb[_n_f32_mf8]_fpm(svfloat32_t zda, svmfloat8_t zn, mfloat8_t zm, fpm_t fpm);
```

#### FMLALLBB (indexed)

8-bit floating-point multiply-add long long to single-precision (bottom bottom, indexed).
``` c
  // Only if (__ARM_FEATURE_SVE2  && __ARM_FEATURE_FP8FMA) || __ARM_FEATURE_SSVE_FP8FMA
  svfloat32_t svmlallbb_lane[_f32_mf8]_fpm(svfloat32_t zda, svmfloat8_t zn, svmfloat8_t zm,
                                           uint64_t imm0_15, fpm_t fpm);
```

#### FMLALLBT (vectors)

8-bit floating-point multiply-add long long to single-precision (bottom top).
``` c
  // Only if (__ARM_FEATURE_SVE2  && __ARM_FEATURE_FP8FMA) || __ARM_FEATURE_SSVE_FP8FMA
  svfloat32_t svmlallbt[_f32_mf8]_fpm(svfloat32_t zda, svmfloat8_t zn, svmfloat8_t zm, fpm_t fpm);
  svfloat32_t svmlallbt[_n_f32_mf8]_fpm(svfloat32_t zda, svmfloat8_t zn, mfloat8_t zm, fpm_t fpm);
```

#### FMLALLBT (indexed)

8-bit floating-point multiply-add long long to single-precision (bottom top, indexed).
``` c
  // Only if (__ARM_FEATURE_SVE2  && __ARM_FEATURE_FP8FMA) || __ARM_FEATURE_SSVE_FP8FMA
  svfloat32_t svmlallbt_lane[_f32_mf8]_fpm(svfloat32_t zda, svmfloat8_t zn, svmfloat8_t zm,
                                           uint64_t imm0_15, fpm_t fpm);
```

#### FMLALLTB (vectors)

8-bit floating-point multiply-add long long to single-precision (top bottom).
``` c
  // Only if (__ARM_FEATURE_SVE2  && __ARM_FEATURE_FP8FMA) || __ARM_FEATURE_SSVE_FP8FMA
  svfloat32_t svmlalltb[_f32_mf8]_fpm(svfloat32_t zda, svmfloat8_t zn, svmfloat8_t zm, fpm_t fpm);
  svfloat32_t svmlalltb[_n_f32_mf8]_fpm(svfloat32_t zda, svmfloat8_t zn, mfloat8_t zm, fpm_t fpm);
```

#### FMLALLTB (indexed)

8-bit floating-point multiply-add long long to single-precision (top bottom, indexed).
``` c
  // Only if (__ARM_FEATURE_SVE2  && __ARM_FEATURE_FP8FMA) || __ARM_FEATURE_SSVE_FP8FMA
  svfloat32_t svmlalltb_lane[_f32_mf8]_fpm(svfloat32_t zda, svmfloat8_t zn, svmfloat8_t zm,
                                           uint64_t imm0_15, fpm_t fpm);
```

#### FMLALLTT (vectors)

8-bit floating-point multiply-add long long to single-precision (top top).
``` c
  // Only if (__ARM_FEATURE_SVE2  && __ARM_FEATURE_FP8FMA) || __ARM_FEATURE_SSVE_FP8FMA
  svfloat32_t svmlalltt[_f32_mf8]_fpm(svfloat32_t zda, svmfloat8_t zn, svmfloat8_t zm, fpm_t fpm);
  svfloat32_t svmlalltt[_n_f32_mf8]_fpm(svfloat32_t zda, svmfloat8_t zn, mfloat8_t zm, fpm_t fpm);
```

#### FMLALLTT (indexed)

8-bit floating-point multiply-add long long to single-precision (top top, indexed).
``` c
  // Only if (__ARM_FEATURE_SVE2  && __ARM_FEATURE_FP8FMA) || __ARM_FEATURE_SSVE_FP8FMA
  svfloat32_t svmlalltt_lane[_f32_mf8]_fpm(svfloat32_t zda, svmfloat8_t zn, svmfloat8_t zm,
                                           uint64_t imm0_15, fpm_t fpm);
```

#### FMLALT (vectors, FP8 to FP16)

8-bit floating-point multiply-add long to half-precision (top).
```c
  // Only if (__ARM_FEATURE_SVE2  && __ARM_FEATURE_FP8FMA) || __ARM_FEATURE_SSVE_FP8FMA
  svfloat16_t svmlalt[_f16_mf8]_fpm(svfloat16_t zda, svmfloat8_t zn, svmfloat8_t zm, fpm_t fpm);
  svfloat16_t svmlalt[_n_f16_mf8]_fpm(svfloat16_t zda, svmfloat8_t zn, mfloat8_t zm, fpm_t fpm);
```

#### FMLALT (indexed, FP8 to FP16)

8-bit floating-point multiply-add long to half-precision (top, indexed).
```c
  // Only if (__ARM_FEATURE_SVE2  && __ARM_FEATURE_FP8FMA) || __ARM_FEATURE_SSVE_FP8FMA
  svfloat16_t svmlalt_lane[_f16_mf8]_fpm(svfloat16_t zda, svmfloat8_t zn, svmfloat8_t zm,
                                         uint64_t imm0_15, fpm_t fpm);
```

### SME2 modal 8-bit floating-point intrinsics

The intrinsics in this section are defined by the header file
[`<arm_sme.h>`](#arm_sme.h) when `__ARM_FEATURE_SME2` and
`__ARM_FEATURE_FP8` are defined. Individual intrinsics may have
additional target feature requirements.

#### BF1CVT, BF2CVT, F1CVT, F2CVT

8-bit floating-point convert to half-precision or BFloat16.
``` c
  // Variant is also available for: _bf16[_mf8]_x2
  svfloat16x2_t svcvt1_f16[_mf8]_x2_fpm(svmfloat8_t zn, fpm_t fpm) __arm_streaming;
  svfloat16x2_t svcvt2_f16[_mf8]_x2_fpm(svmfloat8_t zn, fpm_t fpm) __arm_streaming;
```

#### BF1CVTL, BF2CVTL, F1CVTL, F2CVTL

8-bit floating-point convert to deinterleaved half-precision or BFloat16.
``` c
  // Variant is also available for: _bf16[_mf8]_x2
  svfloat16x2_t svcvtl1_f16[_mf8]_x2_fpm(svmfloat8_t zn, fpm_t fpm) __arm_streaming;
  svfloat16x2_t svcvtl2_f16[_mf8]_x2_fpm(svmfloat8_t zn, fpm_t fpm) __arm_streaming;
```

#### BFCVT, FCVT

Convert to packed 8-bit floating-point format.
``` c
  // Variants are also available for: _mf8[_bf16_x2] and _mf8[_f32_x4]
  svmfloat8_t svcvt_mf8[_f16_x2]_fpm(svfloat16x2_t zn, fpm_t fpm) __arm_streaming;
```

#### FCVTN

Convert to interleaved 8-bit floating-point format.
``` c
  svmfloat8_t svcvtn_mf8[_f32_x4]_fpm(svfloat32x4_t zn, fpm_t fpm) __arm_streaming;
```

#### FSCALE
``` c
  // Variants are also available for:
  // [_single_f32_x2], [_single_f64_x2],
  // [_single_f16_x4], [_single_f32_x4] and [_single_f64_x4]
  svfloat16x2_t svscale[_single_f16_x2](svfloat16x2_t zd, svint16_t zm) __arm_streaming;

  // Variants are also available for:
  //  [_f32_x2], [_f64_x2],
  //  [_f16_x4], [_f32_x4] and [_f64_x4]
  svfloat16x2_t svscale[_f16_x2](svfloat16x2_t zd, svint16x2_t zm) __arm_streaming;
```

#### FDOT

Multi-vector 8-bit floating-point dot-product.
``` c
  // Available variants are: _za16 if __ARM_FEATURE_SME_F8F16 != 0
  //                         _za32 if __ARM_FEATURE_SME_F8F32 != 0
  void svdot_lane_za16[_mf8]_vg1x2_fpm(uint32_t slice, svmfloat8x2_t zn,
                                       svmfloat8_t zm, uint64_t imm_idx,
                                       fpm_t fpm) __arm_streaming __arm_inout("za");

  void svdot_lane_za16[_mf8]_vg1x4_fpm(uint32_t slice, svmfloat8x4_t zn,
                                      svmfloat8_t zm, uint64_t imm_idx,
                                      fpm_t fpm) __arm_streaming __arm_inout("za");

  void svdot[_single]_za16[_mf8]_vg1x2_fpm(uint32_t slice, svmfloat8x2_t zn,
                                           svmfloat8_t zm, fpm_t fpm)
                                           __arm_streaming __arm_inout("za");

  void svdot[_single]_za16[_mf8]_vg1x4_fpm(uint32_t slice, svmfloat8x4_t zn,
                                           svmfloat8_t zm, fpm_t fpm)
                                           __arm_streaming __arm_inout("za");

  void svdot_za16[_mf8]_vg1x2_fpm(uint32_t slice, svmfloat8x2_t zn, svmfloat8x2_t zm,
                                  fpm_t fpm) __arm_streaming __arm_inout("za");

  void svdot_za16[_mf8]_vg1x4_fpm(uint32_t slice, svmfloat8x4_t zn, svmfloat8x4_t zm,
                                  fpm_t fpm)  __arm_streaming __arm_inout("za");
```

#### FVDOT

Multi-vector 8-bit floating-point vertical dot-product by indexed element to
half-precision.
``` c
  // Only if __ARM_FEATURE_SME_F8F16 != 0
  void svvdot_lane_za16[_mf8]_vg1x2_fpm(uint32_t slice, svmfloat8x2_t zn,
                                        svmfloat8_t zm, uint64_t imm_idx,
                                        fpm_t fpm)  __arm_streaming __arm_inout("za");
```

#### FVDOTB, FVDOTT

Multi-vector 8-bit floating-point vertical dot-product.
``` c
  // Only if __ARM_FEATURE_SME_F8F32 != 0
  void svvdott_lane_za32[_mf8]_vg1x4_fpm(uint32_t slice, svmfloat8x2_t zn,
                                         svmfloat8_t zm, uint64_t imm_idx,
                                         fpm_t fpm) __arm_streaming __arm_inout("za");

  void svvdotb_lane_za32[_mf8]_vg1x4_fpm(uint32_t slice, svmfloat8x2_t zn,
                                         svmfloat8_t zm, uint64_t imm_idx,
                                         fpm_t fpm) __arm_streaming __arm_inout("za");
```

#### FMLAL

Multi-vector 8-bit floating-point multiply-add long.
``` c
  // Only if __ARM_FEATURE_SME_F8F16 != 0
  void svmla_lane_za16[_mf8]_vg2x1_fpm(uint32_t slice, svmfloat8_t zn,
                                       svmfloat8_t zm, uint64_t imm_idx,
                                       fpm_t fpm)  __arm_streaming __arm_inout("za");

  void svmla_lane_za16[_mf8]_vg2x2_fpm(uint32_t slice, svmfloat8x2_t zn,
                                       svmfloat8_t zm, uint64_t imm_idx,
                                       fpm_t fpm)  __arm_streaming __arm_inout("za");

  void svmla_lane_za16[_mf8]_vg2x4_fpm(uint32_t slice, svmfloat8x4_t zn,
                                       svmfloat8_t zm, uint64_t imm_idx
                                       fpm_t fpm) __arm_streaming __arm_inout("za");

  void svmla[_single]_za16[_mf8]_vg2x1_fpm(uint32_t slice, svmfloat8_t zn,
                                           svmfloat8_t zm, fpm_t fpm)
                                           __arm_streaming __arm_inout("za");

  void svmla[_single]_za16[_mf8]_vg2x2_fpm(uint32_t slice, svmfloat8x2_t zn,
                                           svmfloat8_t zm, fpm_t fpm)
                                           __arm_streaming __arm_inout("za");

  void svmla[_single]_za16[_mf8]_vg2x4_fpm(uint32_t slice, svmfloat8x4_t zn,
                                           svmfloat8_t zm, fpm_t fpm)
                                           __arm_streaming __arm_inout("za");

  void svmla_za16[_mf8]_vg2x2_fpm(uint32_t slice, svmfloat8x2_t zn, svmfloat8x2_t zm,
                                  fpm_t fpm) __arm_streaming __arm_inout("za");

  void svmla_za16[_mf8]_vg2x4_fpm(uint32_t slice, svmfloat8x4_t zn, svmfloat8x4_t zm,
                                  fpm_t fpm) __arm_streaming __arm_inout("za");
```

#### FMLALL

Multi-vector 8-bit floating-point multiply-add long.
``` c
// Only if __ARM_FEATURE_SME_F8F32 != 0
  void svmla_lane_za32[_mf8]_vg4x1_fpm(uint32_t slice, svmfloat8_t zn,
                                       svmfloat8_t zm, uint64_t imm_idx,
                                       fpm_t fpm)__arm_streaming __arm_inout("za");

  void svmla_lane_za32[_mf8]_vg4x2_fpm(uint32_t slice, svmfloat8x2_t zn,
                                       svmfloat8_t zm, uint64_t imm_idx,
                                       fpm_t fpm)__arm_streaming __arm_inout("za");

  void svmla_lane_za32[_mf8]_vg4x4_fpm(uint32_t slice, svmfloat8x4_t zn,
                                       svmfloat8_t zm, uint64_t imm_idx,
                                       fpm_t fpm)__arm_streaming __arm_inout("za");

  void svmla[_single]_za32[_mf8]_vg4x1_fpm(uint32_t slice, svmfloat8_t zn,
                                           svmfloat8_t zm, fpm_t fpm)
                                           __arm_streaming __arm_inout("za");

  void svmla[_single]_za32[_mf8]_vg4x2_fpm(uint32_t slice, svmfloat8x2_t zn,
                                           svmfloat8_t zm, fpm_t fpm)
                                           __arm_streaming __arm_inout("za");

  void svmla[_single]_za32[_mf8]_vg4x4_fpm(uint32_t slice, svmfloat8x4_t zn,
                                           svmfloat8_t zm, fpm_t fpm)
                                           __arm_streaming __arm_inout("za");

  void svmla_za32[_mf8]_vg4x2_fpm(uint32_t slice, svmfloat8x2_t zn, svmfloat8x2_t zm,
                                  fpm_t fpm) __arm_streaming __arm_inout("za");

  void svmla_za32[_mf8]_vg4x4_fpm(uint32_t slice, svmfloat8x4_t zn, svmfloat8x4_t zm,
                                  fpm_t fpm) __arm_streaming __arm_inout("za");
```

#### FMOPA

8-bit floating-point sum of outer products and accumulate.
``` c
  // Only if __ARM_FEATURE_SME_F8F16 != 0
    void svmopa_za16[_mf8]_m_fpm(uint64_t tile, svbool_t pn, svbool_t pm,
                                 svmfloat8_t zn, svmfloat8_t zm, fpm_t fpm)
                                 __arm_streaming __arm_inout("za");

  // Only if __ARM_FEATURE_SME_F8F32 != 0
    void svmopa_za32[_mf8]_m_fpm(uint64_t tile, svbool_t pn, svbool_t pm,
                                 svmfloat8_t zn, svmfloat8_t zm, fpm_t fpm)
                                 __arm_streaming __arm_inout("za");
```

# M-profile Vector Extension (MVE) intrinsics

The M-profile Vector Extension (MVE) [[MVE-spec]](#MVE-spec) instructions provide packed Single
Instruction Multiple Data (SIMD) and single-element scalar operations on a range
of integer and floating-point types.  MVE can also be referred to as Helium.

The M-profile Vector Extension provides for arithmetic, logical and saturated
arithmetic operations on 8-bit, 16-bit and 32-bit integers (and sometimes
on 64-bit integers) and on 16-bit and 32-bit floating-point data, arranged
in 128-bit vectors.

The intrinsics in this section provide C and C++ programmers with a
simple programming model allowing easy access to the code generation of the
MVE instructions for the Armv8.1-M Mainline architecture.

## Concepts

The MVE instructions are designed to improve the performance of SIMD operations
by operating on 128-bit *vectors* of *elements* of the same *scalar* data type.

For example, `uint16x8_t` is a 128-bit vector type consisting of eight
elements of the scalar `uint16_t` data type. Likewise, `uint8x16_t` is
a 128-bit vector type consisting of sixteen `uint8_t` elements.

In a vector programming model, operations are performed in parallel across
the elements of the vector. For example, `vmulq_u16(a, b)` is a vector
intrinsic which takes two `uint16x8_t` vector arguments `a` and `b`,
and returns the result of multiplying corresponding elements from each vector
together.

The M-profile Vector Extension also provides support for *vector-by-scalar*
operations. In these operations, a scalar value is provided directly,
duplicated to create a new vector with the same number of elements as an
input vector, and an operation is performed in parallel between
this new vector and other input vectors.

For example, `vaddq_n_u16(a, s)`, is a vector-by-scalar intrinsic
which takes one `uint16x8_t` vector argument and one `uint16_t` scalar
argument. A new vector is formed which consists of eight copies of `s`,
and this new vector is multiplied by `a`.

*Reductions* work across the whole of a single vector performing the same
operation between elements of that vector. For example, `vaddvq_u16(a)` is a
reduction intrinsic which takes a `uint16x8_t` vector, adds each of the eight
`uint16_t` elements together, and returns a `uint32_t` result containing
the sum.  Note the difference in return types between MVE's `vaddvq_u16` and
Advanced SIMD's implementation of the same name intrinsic, MVE returns the
`uint32_t` type whereas Advanced SIMD returns the element type `uint16_t`.

*Cross-lane* and *pairwise* vector operations work on pairs of elements within
a vector, sometimes performing the same operation like in the case of the
vector saturating doubling multiply subtract dual returning high half with
exchange `vqdmlsdhxq_s8` or sometimes a different one as is the case with the
vector complex addition intrinsic `vcaddq_rot90_s8`.

Some intrinsics may only read part of the input vectors whereas others may only
write part of the results. For example, the vector multiply long intrinsics,
depending on whether you use `vmullbq_int_s32` or `vmulltq_int_s32`, will
read the even (bottom) or odd (top) elements of each `int16x8_t` input
vectors, multiply them and write to a double-width `int32x4_t` vector.
In contrast the vector shift right and narrow will read in a double-width input
vector and, depending on whether you pick the bottom or top variant, write to
the even or odd elements of the single-width result vector. For example,
`vshrnbq_n_s16(a, b, 2)` will take each eight elements of type `int16_t` of
argument `b`, shift them right by two, narrow them to eight bits and write
them to the even elements of the `int8x16_t` result vector, where the odd
elements are picked from the equally typed `int8x16_t` argument `a`.

*Predication*: the M-profile Vector Extension uses vector predication to allow
SIMD operations on selected lanes. The MVE intrinsics expose vector predication
by providing predicated intrinsic variants for instructions that support it.
These intrinsics can be recognized by one of the four suffixes:

* `_m` (merging) which indicates that false-predicated lanes are not written
  to and keep the same value as they had in the first argument of the
  intrinsic.
* `_p` (predicated) which indicates that false-predicated lanes are not used
  in the SIMD operation. For example `vaddvq_p_s8`, where the
  false-predicated lanes are not added to the resulting sum.
* `_z` (zero) which indicates that false-predicated lanes are filled with
  zeroes. These are only used for load instructions.
* `_x` (dont-care) which indicates that the false-predicated lanes have
  undefined values. These are syntactic sugar for merge intrinsics with a
  `vuninitializedq` inactive parameter.

These predicated intrinsics can also be recognized by their last parameter
being of type `mve_pred16_t`.  This is an alias for the `uint16_t` type.
Some predicated intrinsics may have a dedicated first parameter to specify the
value in the result vector for the false-predicated lanes; this argument will
be of the same type as the result type.  For example,
`v = veorq_m_s8(inactive, a, b, p)`, will write to each of the sixteen lanes
of the result vector `v`, either the result of the exclusive or between the
corresponding lanes of vectors `a` and `b`, or the corresponding lane of
vector `inactive`, depending on whether that lane is true- or false-predicated
in `p`.  The types of `inactive`, `a`, `b` and  `v` are all
`int8x16_t` in this case and `p` has type `mve_pred16_t`.

When calling a predicated intrinsic, the predicate mask value should
contain the same value in all bits corresponding to the same element
of an input or output vector. For example, an instruction operating on
32-bit vector elements should have a predicate mask in which each
block of 4 bits is either all 0 or all 1.

``` c
  mve_pred16_t mask8 = vcmpeqq_u8 (a, b);
  uint8x16_t r8  = vaddq_m_u8  (inactive, a, b, mask8); // OK
  uint16x8_t r16 = vaddq_m_u16 (inactive, c, d, mask8); // UNDEFINED BEHAVIOR
  mve_pred16_t mask8 = 0x5555;        // Predicate every other byte.
  uint8x16_t r8  = vaddq_m_u8  (inactive, a, b, mask8); // OK
  uint16x8_t r16 = vaddq_m_u16 (inactive, c, d, mask8); // UNDEFINED BEHAVIOR
```

In cases where the input and output vectors have different sizes (a
widening or narrowing operation), the mask should be consistent with
the largest element size used by the intrinsic. For example,
`vcvtbq_m_f16_f32` and `vcvtbq_m_f32_f16` should *both* be passed
a predicate mask consistent with 32-bit vector lanes.

Users wishing to exploit the MVE architecture's predication behavior
in finer detail than this constraint permits are encouraged to use
inline assembly.

## Scalar shift intrinsics

The M-profile Vector Extension (MVE) also provides a set of scalar shift
instructions that operate on signed and unsigned double-words and single-words.
These shifts can perform additional saturation, rounding, or both. The ACLE for
MVE defines intrinsics for these instructions.

## Namespace

By default all M-profile Vector Extension intrinsics are available with and
without the `__arm_` prefix.  If the `__ARM_MVE_PRESERVE_USER_NAMESPACE`
macro is defined, the `__arm_` prefix is mandatory.  This is available to hide
the user-namespace-polluting variants of the intrinsics.

## Intrinsic polymorphism

The ACLE for the M-profile Vector Extension intrinsics was designed in such a
way that it supports a polymorphic implementation of most intrinsics.  The
polymorphic name of an intrinsic is indicated by leaving out the type suffix
enclosed in square brackets, for example the vector addition intrinsic
`vaddq[_s32]` can be called using the function name `vaddq`.  Note that the
polymorphism is only possible on input parameter types and intrinsics with the
same name must still have the same number of parameters.  This is expected to
aid implementation of the polymorphism using C11's `_Generic` selection.

## Vector data types

Vector data types are named as a lane type and a multiple. Lane type
names are based on the types defined in `<stdint.h>`. For example,.
`int16x8_t` is a vector of eight `int16_t` values. The base types are
`int8_t`, `uint8_t`, `int16_t`, `uint16_t`, `int32_t`,
`uint32_t`, `int64_t`, `uint64_t`, `float16_t` and `float32_t`.
The multiples are such that the resulting vector types are 128-bit.

## Vector array data types

Array types are defined for multiples of 2 and 4 of all the vector types, for
use in load and store operations. For a vector type `<type>_t` the
corresponding array type is `<type>x<length>_t`. Concretely, an array type is
a structure containing a single array element called `val`.

For example, an array of two `int16x8_t` types is `int16x4x8_t`, and is
represented as

``` c
  struct int16x8x2_t { int16x8_t val[2]; };
```

## Scalar data types

For consistency, `<arm_mve.h>` defines some additional scalar data types
to match the vector types.

`float32_t` is defined as an alias for `float`, `float16_t` is defined as
an alias for `__fp16` and `mve_pred16_t` is defined as an alias for
`uint16_t`.

## Operations on data types

ACLE does not define implicit conversion between different data types.
For example:

``` c
  int32x4_t x;
  uint32x4_t y = x; // No representation change
  float32x4_t z = x; // Conversion of integer to floating type
```

Is not portable. Use the `vreinterpretq` intrinsics to convert from one
vector type to another without changing representation, and use the `vcvtq`
intrinsics to convert between integer and floating types; for example:

``` c
  int32x4_t x;
  uint32x4_t y = vreinterpretq_u32_s32(x);
  float32x4_t z = vcvtq_f32_s32(x);
```

ACLE does not define static construction of vector types. For example:

``` c
  int32x4_t x = { 1, 2, 3, 4 };
```

Is not portable. Use the `vcreateq` or `vdupq` intrinsics to construct values
from scalars.

In C++, ACLE does not define whether MVE data types are POD types or whether
they can be inherited from.

## Compatibility with other vector programming models

ACLE does not specify how the MVE Intrinsics interoperate with alternative
vector programming models. Consequently, programmers should take particular
care when combining the MVE programming model with such programming models.

For example, the GCC vector extensions permit initialising a variable using
array syntax, as so

``` c
  #include "arm_mve.h"
  ...
  uint32x4_t x = {0, 1, 2, 3}; // GCC extension.
  uint32_t y = vgetq_lane_s32 (x, 0); // ACLE MVE Intrinsic.
```

But the definition of the GCC vector extensions is such that the value
stored in `y` will depend on whether the program is running in big- or
little-endian mode.

It is recommended that MVE Intrinsics be used consistently:

``` c
  #include "arm_mve.h"
  ...
  const int temp[4] = {0, 1, 2, 3};
  uint32x4_t x = vld1q_s32 (temp);
  uint32_t y = vgetq_lane_s32 (x, 0);
```

## Availability of M-profile Vector Extension intrinsics

M-profile Vector Extension support is available if the `__ARM_FEATURE_MVE`
macro has a value other than 0 (see [M-profile Vector
Extension](#m-profile-vector-extension)). The availability of the
MVE Floating Point data types and intrinsics are predicated on the value of
this macro having bit two set.  In order to access the MVE intrinsics, it is
necessary to include the `<arm_mve.h>` header.

``` c
  #if (__ARM_FEATURE_MVE & 3) == 3
  #include <arm_mve.h>
    /* MVE integer and floating point intrinsics are now available to use.  */
  #elif __ARM_FEATURE_MVE & 1
  #include <arm_mve.h>
    /* MVE integer intrinsics are now available to use.  */
  #endif
```

### Specification of M-profile Vector Extension intrinsics

The M-profile Vector Extension intrinsics are specified in the Arm MVE
Intrinsics Reference Architecture Specification [[MVE]](#MVE).

The behavior of an intrinsic is specified to be equivalent to the
MVE instruction it is mapped to in [[MVE]](#MVE). Intrinsics are specified
as a mapping between their name, arguments and return values and the MVE
instruction and assembler operands which they are equivalent to.

A compiler may make use of the as-if rule from C [[C99]](#C99) (5.1.2.3) to perform
optimizations which preserve the instruction semantics.

### Undefined behavior

Care should be taken by compiler implementers not to introduce the concept of
undefined behavior to the semantics of an intrinsic.

### Alignment assertions

The MVE load and store instructions provide for alignment assertions, which may
speed up access to aligned data (and will fault access to unaligned data).  The
MVE intrinsics do not directly provide a means for asserting alignment.

# Transactional Memory Extension (TME) intrinsics

## Introduction

This section describes the intrinsics for the instructions of the
Transactional Memory Extension (TME). TME adds support for transactional
execution where transactions are started and
committed by a set of new instructions. The TME instructions are present
in the AArch64 execution state only.

TME is designed to improve performance in cases where larger system scaling
requires atomic and isolated access to data structures whose composition is
dynamic in nature and therefore not readily amenable to fine-grained locking
or lock-free approaches.

TME transactions are *isolated*. This means that transactional stores are
hidden from other observers, and transactional loads cannot see stores from
other observers until the transaction commits. Also, if the transaction fails
then stores to memory and writes to registers by the transaction are discarded
and the processor returns to the state it had when the transaction started.

TME transactions are *best-effort*. This means that the architecture does not
guarantee success for any transaction. The architecture requires that all
transactions specify a failure handler allowing the software to fallback to a
non-transactional alternative to provide guarantees of forward progress.

TME defines *flattened nesting* of transactions, where nested transactions are
subsumed by the outer transaction. This means that the effects of a nested
transaction do not become visible to other observers until the outer
transaction commits. When a nested transaction fails it causes the
outer transaction, and all nested transactions within, to fail.

The TME intrinsics are available when `__ARM_FEATURE_TME` is defined.

## Failure definitions

Transactions can fail due to various causes. The following macros
are defined to help use or detect these causes.

``` c
  #define _TMFAILURE_REASON 0x00007fffu
  #define _TMFAILURE_RTRY   0x00008000u
  #define _TMFAILURE_CNCL   0x00010000u
  #define _TMFAILURE_MEM    0x00020000u
  #define _TMFAILURE_IMP    0x00040000u
  #define _TMFAILURE_ERR    0x00080000u
  #define _TMFAILURE_SIZE   0x00100000u
  #define _TMFAILURE_NEST   0x00200000u
  #define _TMFAILURE_DBG    0x00400000u
  #define _TMFAILURE_INT    0x00800000u
  #define _TMFAILURE_TRIVIAL    0x01000000u
```

## Intrinsics

``` c
  uint64_t __tstart (void);
```

Starts a new transaction. When the transaction starts successfully the return
value is 0. If the transaction fails, all state modifications are discarded
and a cause of the failure is encoded in the return value. The macros
defined in [Failure definitions](#failure-definitions) can be used
to detect the cause of the failure.

``` c
  void __tcommit (void);
```

Commits the current transaction. For a nested transaction, the only effect
is that the transactional nesting depth is decreased. For an outer transaction,
the state modifications performed transactionally are committed to the
architectural state.

``` c
  void __tcancel (/*constant*/ uint64_t);
```

Cancels the current transaction and discards all state modifications that
were performed transactionally. The intrinsic takes a 16-bit immediate input that encodes
the cancellation reason. This input could be given as

``` c
  __tcancel (_TMFAILURE_RTRY | (failure_reason & _TMFAILURE_REASON));
```

if retry is true or

``` c
  __tcancel (failure_reason & _TMFAILURE_REASON);
```

if retry is false.

``` c
  uint64_t __ttest (void);
```

Tests if executing inside a transaction. If no transaction is currently
executing, the return value is 0. Otherwise, this intrinsic returns the depth of the
transaction.

## Instructions

| **Intrinsics**                                | **Argument**     | **Result**     | **Instruction**   |
| --------------------------------------------- | ---------------- | -------------- | ----------------- |
| uint64_t __tstart (void)                      | -                | Xt -> result   | tstart <Xt>       |
| void __tcommit (void)                         | -                | -              | tcommit           |
| void __tcancel (/*constant*/ uint64_t reason) | reason -> #<imm> | -              | tcancel #<imm>    |
| uint64_t __ttest (void)                       | -                | Xt -> result   | ttest <Xt>        |

These intrinsics are available when `arm_acle.h` is included.

# memcpy family of operations intrinsics - MOPS

## Introduction

This section describes the intrinsic for the new instructions introduced in the
Armv8.8-A and Armv9.3-A architecture updates for the `memcpy`, `memmove` and `memset`
family of memory operations (MOPS).

These instructions are designed to enable the standardization of the software
implementation of those operations. Therefore, most of the use cases for
the new instructions are covered by the compiler's code generation or by library
implementations.

An exception to that is the set of instructions covering the `memset` operation
with memory tagging. An intrinsic is available to provide access to this
operation. See [Memory tagging](#memory-tagging) for more information on
memory tagging.

Note: the `<arm_acle.h>` header should be included before using this intrinsic.

This intrinsic is available when both `__ARM_FEATURE_MOPS` and
`__ARM_FEATURE_MEMORY_TAGGING` are defined.

``` c
  void* __arm_mops_memset_tag(void* tagged_address, int value, size_t size)
```

This intrinsic performs a `memset` operation with tag setting on a memory block.

The parameters of `__arm_mops_memset_tag` are as follows:

* `tagged_address`: destination address to be set, containing the allocation
  tag in its bits `[59:56]`. The address should be aligned with the tag granule
  size. (See the [SETG\* instructions specification](<https://developer.arm.com/documentation/ddi0596/2021-09/Base-Instructions/SETGP--SETGM--SETGE--Memory-Set-with-tag-setting-?lang=en#sa_xd)
  for more details)
* `value`: fill value.
* `size`: number of bytes to fill. This should be a multiple of the tag
  granule size.

Similarly to C's `memset`, this intrinsic returns the `tagged_address` pointer.

# Architectural Extension Bridges

## NEON-SVE Bridge

The NEON_SVE Bridge adds intrinsics that allow conversions between NEON and
SVE vectors.

The [`<arm_neon_sve_bridge.h>`](#arm_neon_sve_bridge.h) header should be
included before using these intrinsics.

### `svset_neonq`

These intrinsics set the first 128 bits of SVE vector `vec` to `subvec`.

That is, bit *i* of the result is equal to:
* bit *i* of `subvec` if *i* < 128
* bit *i* of `vec` otherwise

On big-endian targets, this leaves lanes in a different
order from the “native” SVE order.  For example, if `subvec` is
`int32x4_t`, then on big-endian targets, the first memory element
is in lane 3 of `subvec` and is therefore in lane 3 of the returned
SVE vector.  Using `svld1` to load elements would instead put the
first memory element in lane 0 of the returned SVE vector.

When `svundef` is passed as the `vec` parameter, compilers are able
to reuse the SVE register overlapping the NEON input without generating
additional instructions.

| **Instances**                                                            |
|--------------------------------------------------------------------------|
| `svint8_t svset_neonq[_s8](svint8_t vec, int8x16_t subvec)`              |
| `svint16_t svset_neonq[_s16](svint16_t vec, int16x8_t subvec)`           |
| `svint32_t svset_neonq[_s32](svint32_t vec, int32x4_t subvec)`           |
| `svint64_t svset_neonq[_s64](svint64_t vec, int64x2_t subvec)`           |
| `svuint8_t svset_neonq[_u8](svuint8_t vec, uint8x16_t subvec)`           |
| `svuint16_t svset_neonq[_u16](svuint16_t vec, uint16x8_t subvec)`        |
| `svuint32_t svset_neonq[_u32](svuint32_t vec, uint32x4_t subvec)`        |
| `svuint64_t svset_neonq[_u64](svuint64_t vec, uint64x2_t subvec)`        |
| `svfloat16_t svset_neonq[_f16](svfloat16_t vec, float16x8_t subvec)`     |
| `svfloat32_t svset_neonq[_f32](svfloat32_t vec, float32x4_t subvec)`     |
| `svfloat64_t svset_neonq[_f64](svfloat64_t vec, float64x2_t subvec)`     |
| `svbfloat16_t svset_neonq[_bf16](svbfloat16_t vec, bfloat16x8_t subvec)` |
| `svmfloat8_t svset_neonq[_mf8](svmfloat8_t vec, mfloat8x16_t subvec)`    |

### `svget_neonq`

These intrinsics get the first 128 bit subvector of SVE vector `vec` as a
NEON vector.

| **Instances**                                       |
|-----------------------------------------------------|
| `int8x16_t svget_neonq[_s8](svint8_t vec)`          |
| `int16x8_t svget_neonq[_s16](svint16_t vec)`        |
| `int32x4_t svget_neonq[_s32](svint32_t vec)`        |
| `int64x2_t svget_neonq[_s64](svint64_t vec)`        |
| `uint8x16_t svget_neonq[_u8](svuint8_t vec)`        |
| `uint16x8_t svget_neonq[_u16](svuint16_t vec)`      |
| `uint32x4_t svget_neonq[_u32](svuint32_t vec)`      |
| `uint64x2_t svget_neonq[_u64](svuint64_t vec)`      |
| `float16x8_t svget_neonq[_f16](svfloat16_t vec)`    |
| `float32x4_t svget_neonq[_f32](svfloat32_t vec)`    |
| `float64x2_t svget_neonq[_f64](svfloat64_t vec)`    |
| `bfloat16x8_t svget_neonq[_bf16](svbfloat16_t vec)` |
| `mfloat8x16_t svget_neonq[_mf8](svmfloat8_t vec)`   |

### `svdup_neonq`

These intrinsics return an SVE vector with all SVE subvectors containing the
duplicated NEON vector `vec`.

| **Instances**                                       |
|-----------------------------------------------------|
| `svint8_t svdup_neonq[_s8](int8x16_t vec)`          |
| `svint16_t svdup_neonq[_s16](int16x8_t vec)`        |
| `svint32_t svdup_neonq[_s32](int32x4_t vec)`        |
| `svint64_t svdup_neonq[_s64](int64x2_t vec)`        |
| `svuint8_t svdup_neonq[_u8](uint8x16_t vec)`        |
| `svuint16_t svdup_neonq[_u16](uint16x8_t vec)`      |
| `svuint32_t svdup_neonq[_u32](uint32x4_t vec)`      |
| `svuint64_t svdup_neonq[_u64](uint64x2_t vec)`      |
| `svfloat16_t svdup_neonq[_f16](float16x8_t vec)`    |
| `svfloat32_t svdup_neonq[_f32](float32x4_t vec)`    |
| `svfloat64_t svdup_neonq[_f64](float64x2_t vec)`    |
| `svbfloat16_t svdup_neonq[_bf16](bfloat16x8_t vec)` |
| `svmfloat8_t svdup_neonq[_mf8](mfloat8x16_t vec)`   |

# Future directions

## Extensions under consideration

### Procedure calls and the Q / GE bits

The Arm procedure call standard [[AAPCS]](#AAPCS) states that the Q and GE bits are
undefined across public interfaces, but in practice it is desirable to
return saturation status from functions. There are at least two common
use cases:

To define small (inline) functions (defined in terms of
expressions involving intrinsics, which provide abstractions or emulate
other intrinsic families), it is desirable for such functions to have the
same well-defined effects on the Q/GE bits as the corresponding
intrinsics.

### DSP library functions

Options being considered are to define an extension to the pcs
attribute to indicate that Q is meaningful on the return, and possibly
also to infer this in the case of functions marked as inline.

### Returning a value in registers

As a type attribute this would allow things like

``` c
  struct __attribute__((value_in_regs)) Point { int x[2]; };
```

This would indicate that the result registers should be used as if the
type had been passed as the first argument. The implementation should
not complain if the attribute is applied inappropriately (that is, where
insufficient registers are available) it might be a template instance.

### Custom calling conventions

Some interfaces may use calling conventions that depart from the AAPCS.
Examples include:

* Using additional argument registers, for example passing an argument
  in R5, R7, R12.
* Using additional result registers, for example R0 and R1 for a
  combined divide-and-remainder routine (note that some implementations
  may be able to support this by means of a value in registers structure
  return).
* Returning results in the condition flags.
* Preserving and possibly setting the Q (saturation) bit.

### Traps: system calls, breakpoints, ...

This release of ACLE does not define how to invoke a SVC (supervisor
call), BKPT (breakpoint) and other related functionality.

One option would be to mark a function prototype with an attribute, for example

``` c
  int __attribute__((svc(0xAB))) system_call(int code, void const *params);
```

When calling the function, arguments and results would be marshalled
according to the AAPCS, the only difference being that the call would be
invoked as a trap instruction rather than a branch-and-link.

One issue is that some calls may have non-standard calling conventions.
(For example, Arm Linux system calls expect the code number to be passed
in R7.)

Another issue is that the code may vary between A32 and T32 state.
This issue could be addressed by allowing two numeric parameters in the
attribute.

### Mixed-endian data

Extensions for accessing data in different endianness have been
considered. However, this is not an issue specific to the Arm
architecture, and it seems better to wait for a lead from language
standards.

### Memory access with non-temporal hints

Supporting memory access with cacheability hints through language
extensions is being investigated. For example:

``` c
  int *__attribute__((nontemporal)) p;
```

As a type attribute, will allow indirection of p with non-temporal
cacheability hint.

## Features not considered for support

### VFP vector mode

The short vector mode of the original VFP architecture is now
deprecated, and unsupported in recent implementations of the Arm
floating-point instructions set. There is no plan to support it through
C extensions.

### Bit-banded memory access

The bit-banded memory feature of certain Cortex-M cores is now regarded
as being outside the architecture, and there is no plan to standardize
its support.

<!-- Please add new extension chapters somewhere before the “Architectural
     Extension Bridges” chapter.  In particular, the “Future directions”
     chapter should be last.  -->
