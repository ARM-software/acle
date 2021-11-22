---
title: Arm C Language Extensions
version: Development version based on 2021Q2
date-of-issue: 02 July 2021
# LaTeX specific variables
copyright-text: Copyright © 2020-2021, Arm Limited and its affiliates. All rights reserved.
# Jekyll specific variables
header_counter: true
toc: true
---

<!---
**** Do not remove! ****
The two lines following this comments are necessary
to generate the Table of Contents via Jekyll.
They are automatically removed by the scripts that generates the pdfs.
-->
* TOC
{:toc}
# Preface

## Warning

The specifications documented on this website are in experimental
format. Please refer to the [Official
Release](https://github.com/ARM-software/acle/releases/latest) for
production quality documentation.

## Abstract

This document specifies the Arm C Language Extensions to enable C/C++
programmers to exploit the Arm architecture with minimal restrictions on
source code portability.

## Keywords

ACLE, ABI, C, C++, compiler, armcc, gcc, intrinsic, macro, attribute,
Neon, SIMD, atomic

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

## About the license

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
under the same terms as those in the LICENSE file.

## Trademark notice

The text of and illustrations in this document are licensed by Arm under
a Creative Commons Attribution–Share Alike 4.0 International license
("CC-BY-SA-4.0”), with an additional clause on patents. The Arm
trademarks featured here are registered trademarks or trademarks of Arm
Limited (or its subsidiaries) in the US and/or elsewhere. All rights
reserved. Please visit <https://www.arm.com/company/policies/trademarks>
for more information about Arm’s trademarks.

## Copyright

Copyright (c) 2011-2021, Arm Limited and its affiliates. All rights
reserved.

## About this document

### Change control

#### Change history

|              |              |        |                                                                                                                      |
| ------------ | ------------ | ------ | -------------------------------------------------------------------------------------------------------------------- |
| **Issue**    | **Date**     | **By** | **Change**                                                                                                           |
| A            | 11/11/11     | AG     | First release                                                                                                        |
| B            | 13/11/13     | AG     | Version 1.1. Editorial changes. Corrections and completions to intrinsics as detailed in 3.3. Updated for C11/C++11. |
| C            | 09/05/14     | TB     | Version 2.0. Updated for Armv8 AArch32 and AArch64.                                                                  |
| D            | 24/03/16     | TB     | Version 2.1. Updated for Armv8.1 AArch32 and AArch64.                                                                |
| E            | 02/06/17     | Arm    | Version ACLE Q2 2017. Updated for Armv8.2-A and Armv8.3-A.                                                           |
| F            | 30/04/18     | Arm    | Version ACLE Q2 2018. Updated for Armv8.4-A.                                                                         |
| G            | 30/03/19     | Arm    | Version ACLE Q1 2019. Updated for Armv8.5-A and MVE. Various bugfixes.                                               |
| H            | 30/06/19     | Arm    | Version ACLE Q2 2019. Updated for TME and more Armv8.5-A intrinsics. Various bugfixes.                               |
| ACLE Q3 2019 | 30/09/19     | Arm    | Version ACLE Q3 2019.                                                                                                |
| ACLE Q4 2019 | 31/12/19     | Arm    | Version ACLE Q4 2019.                                                                                                |
| ACLE Q2 2020 | 31/05/20     | Arm    | Version ACLE Q2 2020.                                                                                                |
| ACLE Q3 2020 | 31/10/20     | Arm    | Version ACLE Q3 2020.                                                                                                |
| 2021Q2       | 02 July 2021 | Arm    | Version ACLE Q2 2021. Open source version. NFCI.                                                                     |

#### Changes between ACLE Q2 2020 and ACLE Q3 2020

  - Add support for features introduced in the Armv8.7-a architecture
    update.
  - Fix allowed values for \_\_ARM\_FEATURE\_CDE\_COPROC macro.

#### Changes between ACLE Q4 2019 and ACLE Q2 2020

  - Updates to CDE intrinsics.
  - Allow some Neon intrinsics previously available in A64 only in A32
    as well.

#### Changes between ACLE Q3 2019 and ACLE Q4 2019

  - BETA support for the Custom Datapath Extension.
  - MVE intrinsics updates and fixes.
  - Feature macros for Pointer Authentication and Branch Target
    Identification.

#### Changes between ACLE Q2 2019 and ACLE Q3 2019

  - Support added for Armv8.6-A features.
  - Support added for random number instruction intrinsics from
    Armv8.5-A [\[ARMARMv85\]](#ARMARMv85).

#### Changes between ACLE Q1 2019 and ACLE Q2 2019

  - Support added for TME features.
  - Support added for rounding intrinsics from Armv8.5-A
    [\[ARMARMv85\]](#ARMARMv85).

#### Changes between ACLE Q2 2018 and ACLE Q1 2019

  - Support added for features introduced in Armv8.5-A
    [\[ARMARMv85\]](#ARMARMv85) (including the MTE extension).
  - Support added for MVE [\[MVE-spec\]](#MVE-spec) from the Armv8.1-M
    architecture.
  - Support added for Armv8.4-A half-precision extensions through Neon
    intrinsics.
  - Added feature detection macro for LSE atomic operations.
  - Added floating-point versions of intrinsics to access coprocessor
    registers.

#### Changes between ACLE Q2 2017 and ACLE Q2 2018

Most changes in ACLE Q2 2018 are updates to support features introduced
in Armv8.3-A [\[ARMARMv83\]](#ARMARMv83). Support is added for the
Complex addition and Complex MLA intrinsics. Armv8.4-A
[\[ARMARMv84\]](#ARMARMv84). Support is added for the Dot Product
intrinsics.

### References

This document refers to the following documents.

### Terms and abbreviations

This document uses the following terms and abbreviations.

|                  |                                                                                              |
| ---------------- | -------------------------------------------------------------------------------------------- |
| **Term**         | **Meaning**                                                                                  |
| AAPCS            | Arm Procedure Call Standard, part of the ABI, defined in [\[AAPCS\]](#AAPCS).                |
| ABI              | Arm Application Binary Interface.                                                            |
| ACLE             | Arm C Language Extensions, as defined in this document.                                      |
| Advanced SIMD    | A 64-bit/128-bit SIMD instruction set defined as part of the Arm architecture.               |
| build attributes | Object build attributes indicating configuration, as defined in [\[BA\]](#BA).               |
| ILP32            | A 32-bit address mode where long is a 32-bit type.                                           |
| LLP64            | A 64-bit address mode where long is a 32-bit type.                                           |
| LP64             | A 64-bit address mode where long is a 64-bit type.                                           |
| Neon             | An implementation of the Arm Advanced SIMD extensions.                                       |
| SIMD             | Any instruction set that operates simultaneously on multiple elements of a vector data type. |
| Thumb            | The Thumb instruction set extension to Arm.                                                  |
| VFP              | The original Arm non-SIMD floating-point instruction set.                                    |
| word             | A 32-bit quantity, in memory or a register.                                                  |

## Scope

The Arm C Language Extensions (ACLE) specification specifies source
language extensions and implementation choices that C/C++ compilers can
implement in order to allow programmers to better exploit the Arm
architecture.

The extensions include:

>   - Predefined macros that provide information about the functionality
>     of the target architecture.
>   - Intrinsic functions.
>   - Attributes that can be applied to functions, data and other
>     entities.

This specification does not standardize command-line options,
diagnostics or other external behavior of compilers.

The intended users of this specification are:

>   - Application programmers wishing to adapt or hand-optimize
>     applications and libraries for Arm targets.
>   - System programmers needing low-level access to Arm targets beyond
>     what C/C++ provides for.
>   - Compiler implementors, who will implement this specification.
>   - Implementors of IDEs, static analysis and other similar tools who
>     wish to deal with the C/C++ source language extensions when
>     encountered in source code.

ACLE is not a hardware abstraction layer (HAL), and does not specify a
library component but it may make it easier to write a HAL or other
low-level library in C rather than assembler.

## Scalable Vector Extensions (SVE)

ACLE support for SVE is defined in the Arm C Language Extensions for SVE
document [\[SVE-ACLE\]](#SVE-ACLE) available on the Arm Developer
Website.

# Introduction

The Arm architecture includes features that go beyond the set of
operations available to C/C++ programmers. The intention of the Arm C
Language Extensions (ACLE) is to allow the creation of applications and
middleware code that is portable across compilers, and across Arm
architecture variants, while exploiting the advanced features of the Arm
architecture.

The design principles for ACLE can be summarized as:

>   - Be implementable in (or as an addition to) current C/C++
>     implementations.
>   - Build on and standardize existing practice where possible.

ACLE incorporates some language extensions introduced in the GCC C
compiler. Current GCC documentation [\[GCC\]](#GCC) can be found at
<http://gcc.gnu.org/onlinedocs/gcc>. Formally it should be assumed that
ACLE refers to the documentation for GCC 4.5.1:
<http://gcc.gnu.org/onlinedocs/gcc-4.5.1/gcc/>.

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
attributes [\[BA\]](#BA). These attributes are intended to facilitate
generating cross-platform portable binary object files by providing a
mechanism to determine the compatibility of object files. In AArch64,
the ABI does not define a standard set of build attributes and takes the
approach that binaries are, in general, not portable across platforms.
References to build attributes in this document should be interpreted as
applying only to AArch32.

# C language extensions

## Data types

This section overlaps with the specification of the Arm Procedure Call
Standard, particularly [\[AAPCS\]](#AAPCS) (4.1). ACLE extends some of
the guarantees of C, allowing assumptions to be made in source code
beyond those permitted by Standard C.

>   - Plain char is unsigned, as specified in the ABI
>     [\[AAPCS\]](#AAPCS) and [\[AAPCS64\]](#AAPCS64) (7.1.1).
>   - When pointers are 32 bits, the long type is 32 bits (ILP32 model).
>   - When pointers are 64 bits, the long type may be either 64 bits
>     (LP64 model) or 32 bits (LLP64 model).

ACLE extends C by providing some types not present in Standard C and
defining how they are dealt with by the AAPCS.

>   - Vector types for use with the Advanced SIMD intrinsics (see
>     [ssec-vectypes](#ssec-vectypes)).
>   - The <span class="title-ref">\_\_fp16</span> type for 16-bit
>     floating-point values (see [ssec-fp16-type](#ssec-fp16-type)).
>   - The <span class="title-ref">\_\_bf16</span> type for 16-bit brain
>     floating-point values (see [ssec-bf16-type](#ssec-bf16-type)).

### Implementation-defined type properties

ACLE and the Arm ABI allow implementations some freedom in order to
conform to long-standing conventions in various environments. It is
suggested that implementations set suitable defaults for their
environment but allow the default to be overridden.

The signedness of a plain int bit-field is implementation-defined.

Whether the underlying type of an enumeration is minimal or at least
32-bit, is implementation-defined. The predefined macro
<span class="title-ref">\_\_ARM\_SIZEOF\_MINIMAL\_ENUM</span> should be
defined as 1 or 4 according to the size of a minimal enumeration type
such as <span class="title-ref">enum { X=0 }</span>. An implementation
that conforms to the Arm ABI must reflect its choice in the
<span class="title-ref">Tag\_ABI\_enum\_size build</span> attribute.

<span class="title-ref">wchar\_t</span> may be 2 or 4 bytes. The
predefined macro
<span class="title-ref">\_\_ARM\_SIZEOF\_WCHAR\_T</span> should be
defined as the same number. An implementation that conforms to the Arm
ABI must reflect its choice in the
<span class="title-ref">Tag\_ABI\_PCS\_wchar\_t</span> build attribute.

## Predefined macros

Several predefined macros are defined. Generally these define features
of the Arm architecture being targeted, or how the C/C++ implementation
uses the architecture. These macros are detailed in
[sec-Feature-test-macros](#sec-Feature-test-macros). All ACLE predefined
macros start with the prefix <span class="title-ref">\_\_ARM.</span>

## Intrinsics

ACLE standardizes intrinsics to access the Arm ® Neon ™ architecture
extension. These intrinsics are intended to be compatible with existing
implementations. Before using the Neon intrinsics or data types, the
<span class="title-ref">\<arm\_neon.h\></span> header must be included.
The Neon intrinsics are defined in
[sec-NEON-intrinsics](#sec-NEON-intrinsics). Note that the Neon
intrinsics and data types are in the user namespace.

ACLE standardizes intrinsics to access the Arm M-profile Vector
Extension (MVE). These intrinsics are intended to be compatible with
existing implementations. Before using the MVE intrinsics or data types,
the <span class="title-ref">\<arm\_mve.h\></span> header must be
included. The MVE intrinsics are defined in
[sec-MVE-intrinsics](#sec-MVE-intrinsics). Note that the MVE data types
are in the user namespace, the MVE intrinsics can optionally be left out
of the user namespace.

ACLE also standardizes other intrinsics to access Arm instructions which
do not map directly to C operators generally either for optimal
implementation of algorithms, or for accessing specialist system-level
features. Intrinsics are defined further in various following sections.

Before using the non-Neon intrinsics, the
<span class="title-ref">\<arm\_acle.h\></span> header should be
included.

Whether intrinsics are macros, functions or built-in operators is
unspecified. For example:

>   - It is unspecified whether applying \#undef to an intrinsic removes
>     the name from visibility
>   - It is unspecified whether it is possible to take the address of an
>     intrinsic

However, each argument must be evaluated at most once. So this
definition is acceptable:

    #define __rev(x) __builtin_bswap32(x)

but this is not:

    #define __rev(x) ((((x) & 0xff) << 24) | (((x) & 0xff00) << 8) | \
      (((x) & 0xff0000) >> 8) | ((x) >> 24))

### Constant arguments to intrinsics

Some intrinsics may require arguments that are constant at compile-time,
to supply data that is encoded into the immediate fields of an
instruction. Typically, these intrinsics require an
integral-constant-expression in a specified range, or sometimes a string
literal. An implementation should produce a diagnostic if the argument
does not meet the requirements.

## Header files

<span class="title-ref">\<arm\_acle.h\></span> is provided to make the
non-Neon intrinsics available. These intrinsics are in the C
implementation namespace and begin with double underscores. It is
unspecified whether they are available without the header being
included. The <span class="title-ref">\_\_ARM\_ACLE</span> macro should
be tested before including the header:

    #ifdef __ARM_ACLE
    #include <arm_acle.h>
    #endif /* __ARM_ACLE */

<span class="title-ref">\<arm\_neon.h\></span> is provided to define the
Neon intrinsics. As these intrinsics are in the user namespace, an
implementation would not normally define them until the header is
included. The <span class="title-ref">\_\_ARM\_NEON</span> macro should
be tested before including the header:

    #ifdef __ARM_NEON
    #include <arm_neon.h>
    #endif /* __ARM_NEON */

<span class="title-ref">\<arm\_mve.h\></span> is provided to define the
M-Profile Vector Extension (MVE) intrinsics. By default these intrinsics
occupy both the user namespace and the
<span class="title-ref">\_\_arm\_</span> namespace, defining
<span class="title-ref">\_\_ARM\_MVE\_PRESERVE\_USER\_NAMESPACE</span>
will hide the definition of the user namespace variants. The
<span class="title-ref">\_\_ARM\_FEATURE\_MVE</span> macro should be
tested before including the header:

    #if (__ARM_FEATURE_MVE & 3) == 3
    #include <arm_mve.h>
    /* MVE integer and floating point intrinsics are now available to use.  */
    #elif __ARM_FEATURE_MVE & 1
    #include <arm_mve.h>
    /* MVE integer intrinsics are now available to use.  */
    #endif

<span class="title-ref">\<arm\_fp16.h\></span> is provided to define the
scalar 16-bit floating point arithmetic intrinsics. As these intrinsics
are in the user namespace, an implementation would not normally define
them until the header is included. The
<span class="title-ref">\_\_ARM\_FEATURE\_FP16\_SCALAR\_ARITHMETIC</span>
feature macro should be tested before including the header:

    #ifdef __ARM_FEATURE_FP16_SCALAR_ARITHMETIC
    #include <arm_fp16.h>
    #endif /* __ARM_FEATURE_FP16_SCALAR_ARITHMETIC */

Including <span class="title-ref">\<arm\_neon.h\></span> will also cause
<span class="title-ref">\<arm\_fp16.h\></span> to be included if
appropriate.

<span class="title-ref">\<arm\_bf16.h\></span> is provided to define the
16-bit brain floating point arithmetic intrinsics. As these intrinsics
are in the user namespace, an implementation would not normally define
them until the header is included. The
<span class="title-ref">\_\_ARM\_FEATURE\_BF16</span> feature macro
should be tested before including the header:

    #ifdef __ARM_FEATURE_BF16
    #include <arm_bf16.h>
    #endif /* __ARM_FEATURE_BF16 */

When <span class="title-ref">\_\_ARM\_BF16\_FORMAT\_ALTERNATIVE</span>
is defined to <span class="title-ref">1</span> the only scalar
instructions available are conversion instrinstics between
<span class="title-ref">bfloat16\_t</span> and
<span class="title-ref">float32\_t</span>. These instructions are:

  - <span class="title-ref">vcvth\_bf16\_f32</span> (convert float32\_t
    to bfloat16\_t)
  - <span class="title-ref">vcvtah\_f32\_bf16</span> (convert
    bfloat16\_t to float32\_t)

Including <span class="title-ref">\<arm\_neon.h\></span> will also cause
<span class="title-ref">\<arm\_bf16.h\></span> to be included if
appropriate.

These headers behave as standard library headers; repeated inclusion has
no effect beyond the first include.

It is unspecified whether the ACLE headers include the standard headers
<span class="title-ref">\<assert.h\></span>,
<span class="title-ref">\<stdint.h\></span> or
<span class="title-ref">\<inttypes.h\></span>. However, the ACLE headers
will not define the standard type names (for example
<span class="title-ref">uint32\_t</span>) except by inclusion of the
standard headers. Programmers are recommended to include the standard
headers explicitly if the associated types and macros are needed.

In C++, the following source code fragments are expected to work
correctly:

    #include <stdint.h>
    // UINT64_C not defined here since we did not set __STDC_FORMAT_MACROS
    ...
    #include <arm_neon.h>

and:

    #include <arm_neon.h>
    ...
    #define __STDC_FORMAT_MACROS
    #include <stdint.h>
    // ... UINT64_C is now defined

## Attributes

GCC-style attributes are provided to annotate types, objects and
functions with extra information, such as alignment. These attributes
are defined in
[sec-Attributes-and-pragmas](#sec-Attributes-and-pragmas).

## Implementation strategies

An implementation may choose to define all the ACLE non-Neon intrinsics
as true compiler intrinsics, i.e. built-in functions. The
<span class="title-ref">\<arm\_acle.h\></span> header would then have no
effect.

Alternatively, <span class="title-ref">\<arm\_acle.h\></span> could
define the ACLE intrinsics in terms of already supported features of the
implementation, for example compiler intrinsics with other names, or
inline functions using inline assembler.

### Half-precision floating-point

ACLE defines the <span class="title-ref">\_\_fp16</span> type, which can
be used for half-precision (16-bit) floating-point in one of two
formats. The binary16 format defined in [\[IEEE-FP\]](#IEEE-FP), and
referred to as *IEEE* format, and an alternative format, defined by Arm,
which extends the range by removing support for infinities and NaNs,
referred to as *alternative* format. Both formats are described in
[\[ARMARM\]](#ARMARM) (A2.7.4), [\[ARMARMv8\]](#ARMARMv8) (A1.4.2).

Toolchains are not required to support the alternative format, and use
of the alternative format precludes use of the ISO/IEC TS 18661:3
[\[CFP15\]](#CFP15) <span class="title-ref">\_Float16</span> type and
the Armv8.2-A 16-bit floating-point extensions. For these reasons, Arm
deprecates the use of the alternative format for half precision in ACLE.

The format in use can be selected at runtime but ACLE assumes it is
fixed for the life of a program. If the
<span class="title-ref">\_\_fp16</span> type is available, one of
<span class="title-ref">\_\_ARM\_FP16\_FORMAT\_IEEE</span> and
<span class="title-ref">\_\_ARM\_FP16\_FORMAT\_ALTERNATIVE</span> will
be defined to indicate the format in use. An implementation conforming
to the Arm ABI will set the
<span class="title-ref">Tag\_ABI\_FP\_16bit\_format</span> build
attribute.

The <span class="title-ref">\_\_fp16</span> type can be used in two
ways; using the intrinsics ACLE defines when the Armv8.2-A 16-bit
floating point extensions are available, and using the standard C
operators. When using standard C operators, values of
<span class="title-ref">\_\_fp16</span> type promote to (at least) float
when used in arithmetic operations, in the same way that values of char
or short types promote to int. There is no support for arithmetic
directly on <span class="title-ref">\_\_fp16</span> values using
standard C operators. :

    void add(__fp16 a, __fp16 b) {
      a + b; /* a and b are promoted to (at least) float.
                Operation takes place with (at least) 32-bit precision.  */
      vaddh_f16 (a, b); /* a and b are not promoted.
                           Operation takes place with 16-bit precision.  */
    }

Armv8 introduces floating point instructions to convert 64-bit to 16-bit
i.e. from double to <span class="title-ref">\_\_fp16.</span> They are
not available in earlier architectures, therefore have to rely on
emulation libraries or a sequence of instructions to achieve the
conversion.

Providing emulation libraries for half-precision floating point
conversions when not implemented in hardware is implementation-defined.
:

    double xd;
    __fp16 xs = (float)xd;

rather than: :

    double xd;
    __fp16 xs = xd;

In some older implementations, <span class="title-ref">\_\_fp16</span>
cannot be used as an argument or result type, though it can be used as a
field in a structure passed as an argument or result, or passed via a
pointer. The predefined macro
<span class="title-ref">\_\_ARM\_FP16\_ARGS</span> should be defined if
<span class="title-ref">\_\_fp16</span> can be used as an argument and
result. C++ name mangling is Dh as defined in [\[cxxabi\]](#cxxabi), and
is the same for both the IEEE and alternative formats.

In this example, the floating-point addition is done in single (32-bit)
precision:

    void add(__fp16 *z, __fp16 const *x, __fp16 const *y, int n) {
       int i;
       for (i = 0; i < n; ++i) z[i] = x[i] + y[i];
     }

### Relationship between <span class="title-ref">\_\_fp16</span> and ISO/IEC TS 18661

ISO/IEC TS 18661-3 [\[CFP15\]](#CFP15) is a published extension to
[\[C11\]](#C11) which describes a language binding for the
[\[IEEE-FP\]](#IEEE-FP) standard for floating point arithmetic. This
language binding introduces a mapping to an unlimited number of
interchange and extended floating-point types, on which binary
arithmetic is well defined. These types are of the form
<span class="title-ref">\_FloatN</span>, where
<span class="title-ref">N</span> gives size in bits of the type.

One instantiation of the interchange types introduced by
[\[CFP15\]](#CFP15) is the <span class="title-ref">\_Float16</span>
type. ACLE defines the <span class="title-ref">\_\_fp16</span> type as a
storage and interchange only format, on which arithmetic operations are
defined to first promote to a type with at least the range and precision
of float.

This has implications for the result of operations which would result in
rounding had the operation taken place in a native 16-bit type. As
software may rely on this behaviour for correctness, arithmetic
operations on <span class="title-ref">\_\_fp16</span> are defined to
promote even when the Armv8.2-A fp16 extension is available.

Arm recommends that portable software is written to use the
<span class="title-ref">\_Float16</span> type defined in
[\[CFP15\]](#CFP15).

Type conversion between a value of type
<span class="title-ref">\_\_fp16</span> and a value of type
<span class="title-ref">\_Float16</span> leaves the object
representation of the converted value unchanged.

When <span class="title-ref">\_\_ARM\_FP16\_FORMAT\_IEEE == 1</span>,
this has no effect on the value of the object. However, as the
representation of certain values has a different meaning when using the
Arm alternative format for 16-bit floating point values
[\[ARMARM\]](#ARMARM) (A2.7.4) [\[ARMARMv8\]](#ARMARMv8) (A1.4.2), when
<span class="title-ref">\_\_ARM\_FP16\_FORMAT\_ALTERNATIVE == 1</span>
the type conversion may introduce or remove infinity or NaN
representations.

Arm recommends that software implementations warn on type conversions
between <span class="title-ref">\_\_fp16</span> and
<span class="title-ref">\_Float16</span> if
<span class="title-ref">\_\_ARM\_FP16\_FORMAT\_ALTERNATIVE == 1</span>.

In an arithmetic operation where one operand is of
<span class="title-ref">\_\_fp16</span> type and the other is of
<span class="title-ref">\_Float16 type</span>, the
<span class="title-ref">\_Float16</span> type is first converted to
<span class="title-ref">\_\_fp16</span> type following the rules above,
and then the operation is completed as if both operands were of
<span class="title-ref">\_\_fp16</span> type.

[\[CFP15\]](#CFP15) and [\[C11\]](#C11) do not define vector types,
however many C implementations do provide these extensions. Where they
exist, type conversion between a value of type vector of
<span class="title-ref">\_\_fp16</span> and a value of type vector of
<span class="title-ref">\_Float16</span> leaves the object
representation of the converted value unchanged.

ACLE does not define vector of <span class="title-ref">\_Float16</span>
types.

### Half-precision brain floating-point

ACLE defines the <span class="title-ref">\_\_bf16</span> type, which can
be used for half-precision (16-bit) brain floating-point in an
alternative format, defined by Arm, which closely resembles the IEEE 754
single-precision floating point format.

The <span class="title-ref">\_\_bf16</span> type is only available when
the <span class="title-ref">\_\_ARM\_BF16\_FORMAT\_ALTERNATIVE</span>
feature macro is defined. When it is available it can only be used by
the ACLE intrinsics ; it cannot be used with standard C operators. It is
expected that arithmetic using standard C operators be used using a
single-precision floating point format and the value be converted to
<span class="title-ref">\_\_bf16</span> when required using ACLE
intrinsics.

Armv8.2-A introduces floating point instructions to convert 32-bit to
brain 16-bit i.e. from float to <span class="title-ref">\_\_bf16.</span>
They are not available in earlier architectures, therefore have to rely
on emulation libraries or a sequence of instructions to achieve the
conversion.

Providing emulation libraries for half-precision floating point
conversions when not implemented in hardware is implementation-defined.

# Architecture and CPU names

## Introduction

The intention of this section is to standardize architecture names, for
example for use in compiler command lines. Toolchains should accept
these names case-insensitively where possible, or use all lowercase
where not possible. Tools may apply local conventions such as using
hyphens instead of underscores.

(Note: processor names, including from the Arm Cortex ® processor
family, are used as illustrative examples. This specification is
applicable to any processors implementing the Arm architecture.)

## Architecture names

### CPU architecture

The recommended CPU architecture names are as specified under
<span class="title-ref">Tag\_CPU\_arch</span> in [\[BA\]](#BA). For
details of how to use predefined macros to test architecture in source
code, see [ssec-ATisa](#ssec-ATisa).

The following table lists the architectures and the A32 and T32
instruction set versions.

|                 |                                                          |         |         |                        |
| --------------- | -------------------------------------------------------- | ------- | ------- | ---------------------- |
| **Name**        | **Features**                                             | **A32** | **T32** | **Example processor**  |
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
(for example the Large Physical Address Extension) or because it would
be handled by the compiler (for example hardware divide might or might
not be present in the Armv7-A architecture).

### FPU architecture

For details of how to test FPU features in source code, see
[ssec-HWFPSIMD](#ssec-HWFPSIMD). In particular, for testing which
precisions are supported in hardware, see
`\_ssec-HWFP`.

|                  |                                                    |                                     |
| ---------------- | -------------------------------------------------- | ----------------------------------- |
| **Name**         | **Features**                                       | **Example processor**               |
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

Object producers should place the CPU name in the
<span class="title-ref">Tag\_CPU\_name</span> build attribute.

# Feature test macros

## Introduction

The feature test macros allow programmers to determine the availability
of ACLE or subsets of it, or of target architectural features. This may
indicate the availability of some source language extensions (for
example intrinsics) or the likely level of performance of some standard
C features, such as integer division and floating-point.

Several macros are defined as numeric values to indicate the level of
support for particular features. These macros are undefined if the
feature is not present. (Aside: in Standard C/C++, references to
undefined macros expand to 0 in preprocessor expressions, so a
comparison such as:

    #if __ARM_ARCH >= 7

will have the expected effect of evaluating to false if the macro is not
defined.)

All ACLE macros begin with the prefix
<span class="title-ref">\_\_ARM\_.</span> All ACLE macros expand to
integral constant expressions suitable for use in an \#if directive,
unless otherwise specified. Syntactically, they must be
primary-expressions generally this means an implementation should
enclose them in parentheses if they are not simple constants.

## Testing for Arm C Language Extensions

<span class="title-ref">\_\_ARM\_ACLE</span> is defined to the version
of this specification implemented, as <span class="title-ref">100 \*
major\_version + minor\_version</span>. An implementation implementing
version 2.1 of the ACLE specification will define
<span class="title-ref">\_\_ARM\_ACLE</span> as 201.

## Endianness

<span class="title-ref">\_\_ARM\_BIG\_ENDIAN</span> is defined as 1 if
data is stored by default in big-endian format. If the macro is not set,
data is stored in little-endian format. (Aside: the "mixed-endian"
format for double-precision numbers, used on some very old Arm FPU
implementations, is not supported by ACLE or the Arm ABI.)

## A32 and T32 instruction set architecture and features

References to the target architecture refer to the target as configured
in the tools, for example by appropriate command-line options. This may
be a subset or intersection of actual targets, in order to produce a
binary that runs on more than one real architecture. For example, use of
specific features may be disabled.

In some cases, hardware features may be accessible from only one or
other of A32 or T32 state. For example, in the v5TE and v6
architectures, DSP instructions and (where available) VFP instructions,
are only accessible in A32 state, while in the v7-R architecture,
hardware divide is only accessible from T32 state. Where both states are
available, the implementation should set feature test macros indicating
that the hardware feature is accessible. To provide access to the
hardware feature, an implementation might override the programmer's
preference for target instruction set, or generate an interworking call
to a helper function. This mechanism is outside the scope of ACLE. In
cases where the implementation is given a hard requirement to use only
one state (for example to support validation, or post-processing) then
it should set feature test macros only for the hardware features
available in that state as if compiling for a core where the other
instruction set was not present.

An implementation that allows a user to indicate which functions go into
which state (either as a hard requirement or a preference) is not
required to change the settings of architectural feature test macros.

### A32/T32 instruction set architecture

<span class="title-ref">\_\_ARM\_ARCH</span> is defined as an integer
value indicating the current Arm instruction set architecture (for
example 7 for the Arm v7-A architecture implemented by Cortex-A8 or the
Armv7-M architecture implemented by Cortex-M3 or 8 for the Armv8-A
architecture implemented by Cortex-A57). Armv8.1-A
[\[ARMARMv81\]](#ARMARMv81) onwards, the value of
<span class="title-ref">\_\_ARM\_ARCH</span> is scaled up to include
minor versions. The formula to calculate the value of
<span class="title-ref">\_\_ARM\_ARCH</span> from Armv8.1-A
[\[ARMARMv81\]](#ARMARMv81) onwards is given by the following formula:

    For an Arm architecture ArmvX.Y, __ARM_ARCH = X * 100 + Y. E.g.
    for Armv8.1 __ARM_ARCH = 801.

Since ACLE only supports the Arm architecture, this macro would always
be defined in an ACLE implementation.

Note that the <span class="title-ref">\_\_ARM\_ARCH</span> macro is
defined even for cores which only support the T32 instruction set.

<span class="title-ref">\_\_ARM\_ARCH\_ISA\_ARM</span> is defined to 1
if the core supports the Arm instruction set. It is not defined for
M-profile cores.

<span class="title-ref">\_\_ARM\_ARCH\_ISA\_THUMB</span> is defined to 1
if the core supports the original T32 instruction set (including the
v6-M architecture) and 2 if it supports the T32 instruction set as found
in the v6T2 architecture and all v7 architectures.

<span class="title-ref">\_\_ARM\_ARCH\_ISA\_A64</span> is defined to 1
if the core supports AArch64's A64 instruction set.

<span class="title-ref">\_\_ARM\_32BIT\_STATE</span> is defined to 1 if
code is being generated for AArch32.

<span class="title-ref">\_\_ARM\_64BIT\_STATE</span> is defined to 1 if
code is being generated for AArch64.

### Architectural profile (A, R, M or pre-Cortex)

<span class="title-ref">\_\_ARM\_ARCH\_PROFILE</span> is defined to be
one of the char literals <span class="title-ref">'A'</span>,
<span class="title-ref">'R'</span>, <span class="title-ref">'M'</span>
or <span class="title-ref">'S'</span>, or unset, according to the
architectural profile of the target. <span class="title-ref">'S'</span>
indicates the common subset of the A and R profiles. The common subset
of the A, R and M profiles is indicated by:

    __ARM_ARCH == 7 && !defined (__ARM_ARCH_PROFILE)

This macro corresponds to the
<span class="title-ref">Tag\_CPU\_arch\_profile</span> object build
attribute. It may be useful to writers of system code. It is expected in
most cases programmers will use more feature-specific tests.

The macro is undefined for architectural targets which predate the use
of architectural profiles.

### Unaligned access supported in hardware

<span class="title-ref">\_\_ARM\_FEATURE\_UNALIGNED</span> is defined if
the target supports unaligned access in hardware, at least to the extent
of being able to load or store an integer word at any alignment with a
single instruction. (There may be restrictions on load-multiple and
floating-point accesses.) Note that whether a code generation target
permits unaligned access will in general depend on the settings of
system register bits, so an implementation should define this macro to
match the user's expectations and intentions. For example, a
command-line option might be provided to disable the use of unaligned
access, in which case this macro would not be defined.

### LDREX/STREX

This feature was deprecated in ACLE 2.0. It is strongly recommended that
C11/C++11 atomics be used instead.

<span class="title-ref">\_\_ARM\_FEATURE\_LDREX</span> is defined if the
load/store-exclusive instructions (LDREX/STREX) are supported. Its value
is a set of bits indicating available widths of the access, as powers of
2. The following bits are used:

|         |           |                  |                 |
| ------- | --------- | ---------------- | --------------- |
| **Bit** | **Value** | **Access width** | **Instruction** |
| 0       | 0x01      | byte             | LDREXB/STREXB   |
| 1       | 0x02      | halfword         | LDREXH/STREXH   |
| 2       | 0x04      | word             | LDREX/STREX     |
| 3       | 0x08      | doubleword       | LDREXD/STREXD   |

Other bits are reserved.

The following values of
<span class="title-ref">\_\_ARM\_FEATURE\_LDREX</span> may occur:

|                 |                                  |                          |
| --------------- | -------------------------------- | ------------------------ |
| **Macro value** | **Access widths**                | **Example architecture** |
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

### Large System Extensions

<span class="title-ref">\_\_ARM\_FEATURE\_ATOMICS</span> is defined if
the Large System Extensions introduced in the Armv8.1-A
[\[ARMARMv81\]](#ARMARMv81) architecture are supported on this target.
Note: It is strongly recommended that standardized C11/C++11 atomics are
used to implement atomic operations in user code.

### CLZ

<span class="title-ref">\_\_ARM\_FEATURE\_CLZ</span> is defined to 1 if
the CLZ (count leading zeroes) instruction is supported in hardware.
Note that ACLE provides the <span class="title-ref">\_\_clz()</span>
family of intrinsics (see [ssec-Mdpi](#ssec-Mdpi)) even when
<span class="title-ref">\_\_ARM\_FEATURE\_CLZ</span> is not defined.

### Q (saturation) flag

<span class="title-ref">\_\_ARM\_FEATURE\_QBIT</span> is defined to 1 if
the Q (saturation) global flag exists and the intrinsics defined in
[ssec-Qflag2](#ssec-Qflag2) are available. This flag is used with the
DSP saturating-arithmetic instructions (such as QADD) and the
width-specified saturating instructions (SSAT and USAT). Note that
either of these classes of instructions may exist without the other: for
example, v5E has only QADD while v7-M has only SSAT.

Intrinsics associated with the Q-bit and their feature macro
<span class="title-ref">\_\_ARM\_FEATURE\_QBIT</span> are deprecated in
ACLE 2.0 for A-profile. They are fully supported for M-profile and
R-profile. This macro is defined for AArch32 only.

### DSP instructions

<span class="title-ref">\_\_ARM\_FEATURE\_DSP</span> is defined to 1 if
the DSP (v5E) instructions are supported and the intrinsics defined in
[ssec-Satin](#ssec-Satin) are available. These instructions include
QADD, SMULBB and others. This feature also implies support for the Q
flag.

<span class="title-ref">\_\_ARM\_FEATURE\_DSP</span> and its associated
intrinsics are deprecated in ACLE 2.0 for A-profile. They are fully
supported for M and R-profiles. This macro is defined for AArch32 only.

### Saturation instructions

<span class="title-ref">\_\_ARM\_FEATURE\_SAT</span> is defined to 1 if
the SSAT and USAT instructions are supported and the intrinsics defined
in [ssec-Wsatin](#ssec-Wsatin) are available. This feature also implies
support for the Q flag.

<span class="title-ref">\_\_ARM\_FEATURE\_SAT</span> and its associated
intrinsics are deprecated in ACLE 2.0 for A-profile. They are fully
supported for M and R-profiles. This macro is defined for AArch32 only.

### 32-bit SIMD instructions

<span class="title-ref">\_\_ARM\_FEATURE\_SIMD32</span> is defined to 1
if the 32-bit SIMD instructions are supported and the intrinsics defined
in [ssec-32SIMD](#ssec-32SIMD) are available. This also implies support
for the GE global flags which indicate byte-by-byte comparison results.

<span class="title-ref">\_\_ARM\_FEATURE\_SIMD32</span> is deprecated in
ACLE 2.0 for A-profile. Users are encouraged to use Neon Intrinsics as
an equivalent for the 32-bit SIMD intrinsics functionality. However they
are fully supported for M and R-profiles. This is defined for AArch32
only.

### Hardware integer divide

<span class="title-ref">\_\_ARM\_FEATURE\_IDIV</span> is defined to 1 if
the target has hardware support for 32-bit integer division in all
available instruction sets. Signed and unsigned versions are both
assumed to be available. The intention is to allow programmers to choose
alternative algorithm implementations depending on the likely speed of
integer division.

Some older R-profile targets have hardware divide available in the T32
instruction set only. This can be tested for using the following test:

    #if __ARM_FEATURE_IDIV || (__ARM_ARCH_PROFILE == 'R')

### Transactional Memory Extension

<span class="title-ref">\_\_ARM\_FEATURE\_TME</span> is defined to
<span class="title-ref">1</span> if the Transactional Memory Extension
instructions are supported in hardware and intrinsics defined in
[sec-TME-intrinsics](#sec-TME-intrinsics) are available.

## Floating-point, Advanced SIMD (Neon) and MVE hardware

### Hardware floating point

<span class="title-ref">\_\_ARM\_FP</span> is set if hardware
floating-point is available. The value is a set of bits indicating the
floating-point precisions supported. The following bits are used:

|         |           |                              |
| ------- | --------- | ---------------------------- |
| **Bit** | **Value** | **Precision**                |
| 1       | 0x02      | half (16-bit) data type only |
| 2       | 0x04      | single (32-bit)              |
| 3       | 0x08      | double (64-bit)              |

Bits 0 and 4..31 are reserved

Currently, the following values of
<span class="title-ref">\_\_ARM\_FP</span> may occur (assuming the
processor configuration option for hardware floating-point support is
selected where available):

|             |                      |                                                       |
| ----------- | -------------------- | ----------------------------------------------------- |
| **Value**   | **Precisions**       | **Example processor**                                 |
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

Support for 16-bit floating-point language or 16-bit brain
floating-point language extensions (see [ssec-FP16fmt](#ssec-FP16fmt)
and [ssec-BF16fmt](#ssec-BF16fmt)) is only required if supported in
hardware

### Half-precision (16-bit) floating-point format

<span class="title-ref">\_\_ARM\_FP16\_FORMAT\_IEEE</span> is defined to
1 if the IEEE 754-2008 [\[IEEE-FP\]](#IEEE-FP) 16-bit floating-point
format is used.

<span class="title-ref">\_\_ARM\_FP16\_FORMAT\_ALTERNATIVE</span> is
defined to 1 if the Arm alternative [\[ARMARM\]](#ARMARM) 16-bit
floating-point format is used. This format removes support for
infinities and NaNs in order to provide an extra exponent bit.

At most one of these macros will be defined. See
[ssec-fp16-type](#ssec-fp16-type) for details of half-precision
floating-point types.

### Brain half-precision (16-bit) floating-point format

<span class="title-ref">\_\_ARM\_BF16\_FORMAT\_ALTERNATIVE</span> is
defined to 1 if the Arm alternative [\[ARMARM\]](#ARMARM) 16-bit brain
floating-point format is used. This format closely resembles the IEEE
754 single-precision format. As such a brain half-precision floating
point value can be converted to an IEEE 754 single-floating point format
by appending 16 zero bits at the end.

<span class="title-ref">\_\_ARM\_FEATURE\_BF16\_VECTOR\_ARITHMETIC</span>
is defined to <span class="title-ref">1</span> if the brain 16-bit
floating-point arithmetic instructions are supported in hardware and the
associated vector intrinsics defined by ACLE are available. Note that
this implies:

>   - <span class="title-ref">\_\_ARM\_FP & 0x02 == 1</span>
>   - <span class="title-ref">\_\_ARM\_NEON\_FP & 0x02 == 1</span>

See [ssec-bf16-type](#ssec-bf16-type) for details of half-precision
brain floating-point types.

### Fused multiply-accumulate (FMA)

<span class="title-ref">\_\_ARM\_FEATURE\_FMA</span> is defined to 1 if
the hardware floating-point architecture supports fused floating-point
multiply-accumulate, i.e. without intermediate rounding. Note that C
implementations are encouraged [\[C99\]](#C99) (7.12) to ensure that
\<math.h\> defines <span class="title-ref">FP\_FAST\_FMAF</span> or
<span class="title-ref">FP\_FAST\_FMA,</span> which can be tested by
portable C code. A C implementation on Arm might define these macros by
testing <span class="title-ref">\_\_ARM\_FEATURE\_FMA</span> and
<span class="title-ref">\_\_ARM\_FP.</span>

### Advanced SIMD architecture extension (Neon)

<span class="title-ref">\_\_ARM\_NEON</span> is defined to a value
indicating the Advanced SIMD (Neon) architecture supported. The only
current value is 1.

In principle, for AArch32, the Neon architecture can exist in an
integer-only version. To test for the presence of Neon floating-point
vector instructions, test
<span class="title-ref">\_\_ARM\_NEON\_FP.</span> When Neon does occur
in an integer-only version, the VFP scalar instruction set is also not
present. See [\[ARMARM\]](#ARMARM) (table A2-4) for architecturally
permitted combinations.

<span class="title-ref">\_\_ARM\_NEON</span> is always set to 1 for
AArch64.

### Neon floating-point

<span class="title-ref">\_\_ARM\_NEON\_FP</span> is defined as a bitmap
to indicate floating-point support in the Neon architecture. The meaning
of the values is the same as for
<span class="title-ref">\_\_ARM\_FP.</span> This macro is undefined when
the Neon extension is not present or does not support floating-point.

Current AArch32 Neon implementations do not support double-precision
floating-point even when it is present in VFP. 16-bit floating-point
format is supported in Neon if and only if it is supported in VFP.
Consequently, the definition of
<span class="title-ref">\_\_ARM\_NEON\_FP</span> is the same as
<span class="title-ref">\_\_ARM\_FP</span> except that the bit to
indicate double-precision is not set for AArch32. Double-precision is
always set for AArch64.

If <span class="title-ref">\_\_ARM\_FEATURE\_FMA</span> and
<span class="title-ref">\_\_ARM\_NEON\_FP</span> are both defined,
fused-multiply instructions are available in Neon also.

### M-profile Vector Extension

<span class="title-ref">\_\_ARM\_FEATURE\_MVE</span> is defined as a
bitmap to indicate M-profile Vector Extension (MVE) support.

|         |           |                    |
| ------- | --------- | ------------------ |
| **Bit** | **Value** | **Support**        |
| 0       | 0x01      | Integer MVE        |
| 1       | 0x02      | Floating-point MVE |

### Wireless MMX

If Wireless MMX operations are available on the target,
<span class="title-ref">\_\_ARM\_WMMX</span> is defined to a value that
indicates the level of support, corresponding to the
<span class="title-ref">Tag\_WMMX\_arch</span> build attribute.

This specification does not further define source-language features to
support Wireless MMX.

### Crypto extension

NOTE: The <span class="title-ref">\_\_ARM\_FEATURE\_CRYPTO</span> macro
is deprecated in favor of the finer grained feature macros described
below.

<span class="title-ref">\_\_ARM\_FEATURE\_CRYPTO</span> is defined to 1
if the Armv8-A Crypto instructions are supported and intrinsics
targeting them are available. These instructions include AES{E, D},
SHA1{C, P, M} and others. This also implies
<span class="title-ref">\_\_ARM\_FEATURE\_AES</span> and
<span class="title-ref">\_\_ARM\_FEATURE\_SHA2</span>.

### AES extension

<span class="title-ref">\_\_ARM\_FEATURE\_AES</span> is defined to 1 if
the AES Crypto instructions from Armv8-A are supported and intrinsics
targeting them are available. These instructions include AES{E, D},
AESMC, AESIMC and others.

### SHA2 extension

<span class="title-ref">\_\_ARM\_FEATURE\_SHA2</span> is defined to 1 if
the SHA1 & SHA2 Crypto instructions from Armv8-A are supported and
intrinsics targeting them are available. These instructions include
SHA1{C, P, M} and others.

### SHA512 extension

<span class="title-ref">\_\_ARM\_FEATURE\_SHA512</span> is defined to 1
if the SHA2 Crypto instructions from Armv8.2-A are supported and
intrinsics targeting them are available. These instructions include
SHA1{C, P, M} and others.

### SHA3 extension

<span class="title-ref">\_\_ARM\_FEATURE\_SHA3</span> is defined to 1 if
the SHA1 & SHA2 Crypto instructions from Armv8-A and the SHA2 and SHA3
instructions from Armv8.2-A and newer are supported and intrinsics
targeting them are available. These instructions include AES{E, D},
SHA1{C, P, M}, RAX, and others.

### SM3 extension

<span class="title-ref">\_\_ARM\_FEATURE\_SM3</span> is defined to 1 if
the SM3 Crypto instructions from Armv8.2-A are supported and intrinsics
targeting them are available. These instructions include SM3{TT1A,
TT1B}, and others.

### SM4 extension

<span class="title-ref">\_\_ARM\_FEATURE\_SM4</span> is defined to 1 if
the SM4 Crypto instructions from Armv8.2-A are supported and intrinsics
targeting them are available. These instructions include SM4{E, EKEY}
and others.

### FP16 FML extension

<span class="title-ref">\_\_ARM\_FEATURE\_FP16\_FML</span> is defined to
1 if the FP16 multiplication variant instructions from Armv8.2-A are
supported and intrinsics targeting them are available. Available when
<span class="title-ref">\_\_ARM\_FEATURE\_FP16\_SCALAR\_ARITHMETIC</span>.

### CRC32 extension

<span class="title-ref">\_\_ARM\_FEATURE\_CRC32</span> is defined to 1
if the CRC32 instructions are supported and the intrinsics defined in
[ssec-crc32](#ssec-crc32) are available. These instructions include
CRC32B, CRC32H and others. This is only available when
<span class="title-ref">\_\_ARM\_ARCH \>= 8</span>.

### Random Number Generation Extension

<span class="title-ref">\_\_ARM\_FEATURE\_RNG</span> is defined to 1 if
the Random Number Generation instructions are supported and the
intrinsics defined in [ssec-rand](#ssec-rand) are available.

### Directed rounding

<span class="title-ref">\_\_ARM\_FEATURE\_DIRECTED\_ROUNDING</span> is
defined to 1 if the directed rounding and conversion vector instructions
are supported and rounding and conversion intrinsics are available. This
is only available when <span class="title-ref">\_\_ARM\_ARCH \>=
8</span>.

### Numeric maximum and minimum

<span class="title-ref">\_\_ARM\_FEATURE\_NUMERIC\_MAXMIN</span> is
defined to 1 if the IEEE 754-2008 compliant floating point maximum and
minimum vector instructions are supported and intrinsics targeting these
instructions are available. This is only available when
<span class="title-ref">\_\_ARM\_ARCH \>= 8</span>.

### Half-precision argument and result

<span class="title-ref">\_\_ARM\_FP16\_ARGS</span> is defined to 1 if
<span class="title-ref">\_\_fp16</span> can be used as an argument and
result.

### Rounding doubling multiplies

<span class="title-ref">\_\_ARM\_FEATURE\_QRDMX</span> is defined to 1
if SQRDMLAH and SQRDMLSH instructions and their associated intrinsics
are available.

### 16-bit floating-point data processing operations

<span class="title-ref">\_\_ARM\_FEATURE\_FP16\_SCALAR\_ARITHMETIC</span>
is defined to <span class="title-ref">1</span> if the 16-bit
floating-point arithmetic instructions are supported in hardware and the
associated scalar intrinsics defined by ACLE are available. Note that
this implies:

>   - <span class="title-ref">\_\_ARM\_FP16\_FORMAT\_IEEE == 1</span>
>   - <span class="title-ref">\_\_ARM\_FP16\_FORMAT\_ALTERNATIVE ==
>     0</span>
>   - <span class="title-ref">\_\_ARM\_FP & 0x02 == 1</span>

<span class="title-ref">\_\_ARM\_FEATURE\_FP16\_VECTOR\_ARITHMETIC</span>
is defined to <span class="title-ref">1</span> if the 16-bit
floating-point arithmetic instructions are supported in hardware and the
associated vector intrinsics defined by ACLE are available. Note that
this implies:

>   - <span class="title-ref">\_\_ARM\_FP16\_FORMAT\_IEEE == 1</span>
>   - <span class="title-ref">\_\_ARM\_FP16\_FORMAT\_ALTERNATIVE ==
>     0</span>
>   - <span class="title-ref">\_\_ARM\_FP & 0x02 == 1</span>
>   - <span class="title-ref">\_\_ARM\_NEON\_FP & 0x02 == 1</span>

### Javascript floating-point conversion

<span class="title-ref">\_\_ARM\_FEATURE\_JCVT</span> is defined to 1 if
the FJCVTZS (AArch64) or VJCVT (AArch32) instruction and the associated
intrinsic is available.

## Floating-point model

These macros test the floating-point model implemented by the compiler
and libraries. The model determines the guarantees on arithmetic and
exceptions.

<span class="title-ref">\_\_ARM\_FP\_FAST</span> is defined to 1 if
floating-point optimizations may occur such that the computed results
are different from those prescribed by the order of operations according
to the C standard. Examples of such optimizations would be reassociation
of expressions to reduce depth, and replacement of a division by
constant with multiplication by its reciprocal.

<span class="title-ref">\_\_ARM\_FP\_FENV\_ROUNDING</span> is defined to
1 if the implementation allows the rounding to be configured at runtime
using the standard C fesetround() function and will apply this rounding
to future floating-point operations. The rounding mode applies to both
scalar floating-point and Neon.

The floating-point implementation might or might not support denormal
values. If denormal values are not supported then they are flushed to
zero.

Implementations may also define the following macros in appropriate
floating-point modes:

<span class="title-ref">\_\_STDC\_IEC\_559\_\_</span> is defined if the
implementation conforms to IEC This implies support for floating-point
exception status flags, including the inexact exception. This macro is
specified by [\[C99\]](#C99) (6.10.8).

<span class="title-ref">\_\_SUPPORT\_SNAN\_\_</span> is defined if the
implementation supports signalling NaNs. This macro is specified by the
C standards proposal WG14 N965 Optional support for Signaling NaNs.
(Note: this was not adopted into C11.)

## Procedure call standard

<span class="title-ref">\_\_ARM\_PCS</span> is defined to 1 if the
default procedure calling standard for the translation unit conforms to
the base PCS defined in [\[AAPCS\]](#AAPCS). This is supported on
AArch32 only.

<span class="title-ref">\_\_ARM\_PCS\_VFP</span> is defined to 1 if the
default is to pass floating-point parameters in hardware floating-point
registers using the VFP variant PCS defined in [\[AAPCS\]](#AAPCS). This
is supported on AArch32 only.

<span class="title-ref">\_\_ARM\_PCS\_AAPCS64</span> is defined to 1 if
the default procedure calling standard for the translation unit conforms
to the [\[AAPCS64\]](#AAPCS64).

Note that this should reflect the implementation default for the
translation unit. Implementations which allow the PCS to be set for a
function, class or namespace are not expected to redefine the macro
within that scope.

## Position-independent code

<span class="title-ref">\_\_ARM\_ROPI</span> is defined to 1 if the
translation unit is being compiled in read-only position independent
mode. In this mode, all read-only data and functions are at a link-time
constant offset from the program counter.

<span class="title-ref">\_\_ARM\_RWPI</span> is defined to 1 if the
translation unit is being compiled in read-write position independent
mode. In this mode, all writable data is at a link-time constant offset
from the static base register defined in [\[AAPCS\]](#AAPCS).

The ROPI and RWPI position independence modes are compatible with each
other, so the <span class="title-ref">\_\_ARM\_ROPI</span> and
<span class="title-ref">\_\_ARM\_RWPI</span> macros may be defined at
the same time.

## Coprocessor intrinsics

<span class="title-ref">\_\_ARM\_FEATURE\_COPROC</span> is defined as a
bitmap to indicate the presence of coprocessor intrinsics for the target
architecture. If <span class="title-ref">\_\_ARM\_FEATURE\_COPROC</span>
is undefined or zero, that means there is no support for coprocessor
intrinsics on the target architecture. The following bits are used:

|         |           |                                                                                                              |
| ------- | --------- | ------------------------------------------------------------------------------------------------------------ |
| **Bit** | **Value** | **Intrinsics Available**                                                                                     |
| 0       | 0x1       | \_\_arm\_cdp \_\_arm\_ldc, \_\_arm\_ldcl, \_\_arm\_stc, \_\_arm\_stcl, \_\_arm\_mcr and \_\_arm\_mrc         |
| 1       | 0x2       | \_\_arm\_cdp2, \_\_arm\_ldc2, \_\_arm\_stc2, \_\_arm\_ldc2l, \_\_arm\_stc2l, \_\_arm\_mcr2 and \_\_arm\_mrc2 |
| 2       | 0x4       | \_\_arm\_mcrr and \_\_arm\_mrrc                                                                              |
| 3       | 0x8       | \_\_arm\_mcrr2 and \_\_arm\_mrrc2                                                                            |

## Armv8.5-A Floating-point rounding extension

<span class="title-ref">\_\_ARM\_FEATURE\_FRINT</span> is defined to 1
if the Armv8.5-A rounding number instructions are supported and the
scalar and vector intrinsics are available. This macro may only ever be
defined in the AArch64 execution state. The scalar intrinsics are
specified in [ssec-Fpdpi](#ssec-Fpdpi) and are not expected to be for
general use. They are defined for uses that require the specialist
rounding behavior of the relevant instructions. The vector intrinsics
are specified in the Arm Neon Intrinsics Reference Architecture
Specification [\[Neon\]](#Neon).

## Dot Product extension

<span class="title-ref">\_\_ARM\_FEATURE\_DOTPROD</span> is defined if
the dot product data manipulation instructions are supported and the
vector intrinsics are available. Note that this implies:

>   - <span class="title-ref">\_\_ARM\_NEON == 1</span>

## Complex number intrinsics

<span class="title-ref">\_\_ARM\_FEATURE\_COMPLEX</span> is defined if
the complex addition and complex multiply-accumulate vector instructions
are supported. Note that this implies:

>   - <span class="title-ref">\_\_ARM\_NEON == 1</span>

These instructions require that the input vectors are organized such
that the real and imaginary parts of the complex number are stored in
alternating sequences: real, imag, real, imag, ... etc.

## Branch Target Identification

<span class="title-ref">\_\_ARM\_FEATURE\_BTI\_DEFAULT</span> is defined
to 1 if the Branch Target Identification extension is used to protect
branch destinations by default. The protection applied to any particular
function may be overriden by mechanisms such as function attributes.

## Pointer Authentication

<span class="title-ref">\_\_ARM\_FEATURE\_PAC\_DEFAULT</span> is defined
as a bitmap to indicate the use of the Pointer Authentication extension
to protect code against code reuse attacks by default. The bits are
defined as follows:

|         |                                     |
| ------- | ----------------------------------- |
| **Bit** | **Meaning**                         |
| 0       | Protection using the A key          |
| 1       | Protection using the B key          |
| 2       | Protection including leaf functions |

For example, a value of <span class="title-ref">0x5</span> indicates
that the Pointer Authentication extension is used to protect function
entry points, including leaf functions, using the A key for signing. The
protection applied to any particular function may be overriden by
mechanisms such as function attributes.

## Matrix Multiply Intrinsics

<span class="title-ref">\_\_ARM\_FEATURE\_MATMUL\_INT8</span> is defined
if the integer matrix multiply instructions are supported. Note that
this implies:

  - <span class="title-ref">\_\_ARM\_NEON == 1</span>

## Custom Datapath Extension

<span class="title-ref">\_\_ARM\_FEATURE\_CDE</span> is defined to 1 if
the Arm Custom Datapath Extension (CDE) is supported.

<span class="title-ref">\_\_ARM\_FEATURE\_CDE\_COPROC</span> is a bitmap
indicating the CDE coprocessors available. The following bits are used:

|         |           |                                   |
| ------- | --------- | --------------------------------- |
| **Bit** | **Value** | **CDE Coprocessor available**     |
| 0       | 0x01      | <span class="title-ref">p0</span> |
| 1       | 0x02      | <span class="title-ref">p1</span> |
| 2       | 0x04      | <span class="title-ref">p2</span> |
| 3       | 0x08      | <span class="title-ref">p3</span> |
| 4       | 0x10      | <span class="title-ref">p4</span> |
| 5       | 0x20      | <span class="title-ref">p5</span> |
| 6       | 0x40      | <span class="title-ref">p6</span> |
| 7       | 0x80      | <span class="title-ref">p7</span> |

## Armv8.7-A Load/Store 64 Byte extension

<span class="title-ref">\_\_ARM\_FEATURE\_LS64</span> is defined to 1 if
the Armv8.7-A <span class="title-ref">LD64B</span>,
<span class="title-ref">ST64B</span>,
<span class="title-ref">ST64BV</span> and
<span class="title-ref">ST64BV0</span> instructions for atomic 64-byte
access to device memory are supported. This macro may only ever be
defined in the AArch64 execution state. Intrinsics for using these
instructions are specified in [ssec-LS64](#ssec-LS64).

## Mapping of object build attributes to predefines

This section is provided for guidance. Details of build attributes can
be found in [\[BA\]](#BA).

| **Tag no.**              | **Tag**                        | **Predefined macro**                  |
| ------------------------ | ------------------------------ | ------------------------------------- |
| 6                        | ``Tag_CPU_arch``               | ``__ARM_ARCH``, ``__ARM_FEATURE_DSP`` |
| 7                        | ``Tag_CPU_arch_profile``       | ``__ARM_PROFILE``                     |
| 8                        | ``Tag_ARM_ISA_use``            | ``__ARM_ISA_ARM``                     |
| 9                        | ``Tag_THUMB_ISA_use``          | ``__ARM_ISA_THUMB``                   |
| 11                       | ``Tag_WMMX_arch``              | ``__ARM_WMMX``                        |
| 18                       | ``Tag_ABI_PCS_wchar_t``        | ``__ARM_SIZEOF_WCHAR_T``              |
| 20                       | ``Tag_ABI_FP_denormal``        |                                       |
| 21                       | ``Tag_ABI_FP_exceptions``      |                                       |
| 22                       | ``Tag_ABI_FP_user_exceptions`` |                                       |
| 23                       | ``Tag_ABI_FP_number_model``    |                                       |
| 26                       | ``Tag_ABI_enum_size``          | ``__ARM_SIZEOF_MINIMAL_ENUM``         |
| 34                       | ``Tag_CPU_unaligned_access``   | ``__ARM_FEATURE_UNALIGNED``           |
| 36                       | ``Tag_FP_HP_extension``        | ``__ARM_FP16_FORMAT_IEEE``            |
|                          |                                |                                       |
|                          |                                | ``__ARM_FP16_FORMAT_ALTERNATIVE``     |
| 38                       | ``Tag_ABI_FP_16bit_for``       | ``__ARM_FP16_FORMAT_IEEE``            |
|                          |                                |                                       |
|                          |                                | ``__ARM_FP16_FORMAT_ALTERNATIVE``     |

## Summary of predefined macros

| **Macro name**                                                                                 | **Meaning**                                                                                        | **Example** |
| ---------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | ----------- |
| `__ARM_32BIT_STATE` [[ssec-ATisa]](#ssec-ATisa)                                                | Code is for AArch32 state                                                                          | 1           |
| `__ARM_64BIT_STATE` [[ssec-ATisa]](#ssec-ATisa)                                                | Code is for AArch64 state                                                                          | 1           |
| `__ARM_ACLE` [[ssec-TfACLE]](#ssec-TfACLE)                                                     | Indicates ACLE implemented                                                                         | 101         |
| `__ARM_ALIGN_MAX_PWR` [[ssec-Aoso]](#ssec-Aoso)                                                | Log of maximum alignment of static object                                                          | 20          |
| `__ARM_ALIGN_MAX_STACK_PWR` [[ssec-Aoso2]](#ssec-Aoso2)                                        | Log of maximum alignment of stack object                                                           | 3           |
| `__ARM_ARCH` [[ssec-ATisa]](#ssec-ATisa)                                                       | Arm architecture level                                                                             | 7           |
| `__ARM_ARCH_ISA_A64` [[ssec-ATisa]](#ssec-ATisa)                                               | AArch64 ISA present                                                                                | 1           |
| `__ARM_ARCH_ISA_ARM` [[ssec-ATisa]](#ssec-ATisa)                                               | Arm instruction set present                                                                        | 1           |
| `__ARM_ARCH_ISA_THUMB` [[ssec-ATisa]](#ssec-ATisa)                                             | T32 instruction set present                                                                        | 2           |
| `__ARM_ARCH_PROFILE` [[ssec-Archp]](#ssec-Archp)                                               | Architecture profile                                                                               | `'A'`       |
| `__ARM_BIG_ENDIAN` [[ssec-Endi]](#ssec-Endi)                                                   | Memory is big-endian                                                                               | 1           |
| `__ARM_FEATURE_COMPLEX` [[ssec-COMPLX]](#ssec-COMPLX)                                          | Armv8.3-A extension                                                                                | 1           |
| `__ARM_FEATURE_BTI_DEFAULT` [[ssec-BTI]](#ssec-BTI)                                            | Branch Target Identification                                                                       | 1           |
| `__ARM_FEATURE_PAC_DEFAULT` [[ssec-PAC]](#ssec-PAC)                                            | Pointer authentication                                                                             | 0x5         |
| `__ARM_FEATURE_CLZ` [[ssec-CLZ]](#ssec-CLZ), [[ssec-Mdpi]](#ssec-Mdpi)                         | CLZ instruction                                                                                    | 1           |
| `__ARM_FEATURE_CRC32` [[ssec-CRC32E]](#ssec-CRC32E)                                            | CRC32 extension                                                                                    | 1           |
| `__ARM_FEATURE_CRYPTO` [[ssec-CrypE]](#ssec-CrypE)                                             | Crypto extension                                                                                   | 1           |
| `__ARM_FEATURE_DIRECTED_ROUNDING` [[ssec-v8rnd]](#ssec-v8rnd)                                  | Directed Rounding                                                                                  | 1           |
| `__ARM_FEATURE_DOTPROD` [[ssec-Dot]](#ssec-Dot), [[ssec-DotIns]](#ssec-DotIns)                 | Dot product extension (ARM v8.2-A)                                                                 | 1           |
| `__ARM_FEATURE_FRINT` [[ssec-Frint]](#ssec-Frint), [[ssec-FrintIns]](#ssec-FrintIns)           | Floating-point rounding extension (Arm v8.5-A)                                                     | 1           |
| `__ARM_FEATURE_DSP` [[ssec-DSPins]](#ssec-DSPins), [[ssec-Satin]](#ssec-Satin)                 | DSP instructions (Arm v5E) (32-bit-only)                                                           | 1           |
| `__ARM_FEATURE_AES` [[ssec-CrypE]](#ssec-CrypE), [[ssec-AES]](#ssec-AES)                       | AES Crypto extension (Arm v8-A)                                                                    | 1           |
| `__ARM_FEATURE_FMA` [[ssec-FMA]](#ssec-FMA), [[ssec-Fpdpi]](#ssec-Fpdpi)                       | Floating-point fused multiply-accumulate                                                           | 1           |
| `__ARM_FEATURE_IDIV` [[ssec-HID]](#ssec-HID)                                                   | Hardware Integer Divide                                                                            | 1           |
| `__ARM_FEATURE_JCVT` [[ssec-JCVT]](#ssec-JCVT), [[ssec-Fpdpi]](#ssec-Fpdpi)                    | Javascript conversion (ARMv8.3-A)                                                                  | 1           |
| `__ARM_FEATURE_LDREX` *(Deprecated)* [[ssec-LDREX]](#ssec-LDREX), [[ssec-Sbahi]](#ssec-Sbahi)  | Load/store exclusive instructions                                                                  | 0x0F        |
| `__ARM_FEATURE_MATMUL_INT8` [[ssec-MatMul]](#ssec-MatMul), [[ssec-MatMulIns]](#ssec-MatMulIns) | Integer Matrix Multiply extension (Armv8.6-A, optional Armv8.2-A, Armv8.3-A, Armv8.4-A, Armv8.5-A) | 1           |
| `__ARM_FEATURE_MEMORY_TAGGING` [[ssec-MTE]](#ssec-MTE)                                         | Memory Tagging (Armv8.5-A)                                                                         | 1           |
| `__ARM_FEATURE_ATOMICS` [[ssec-ATOMICS]](#ssec-ATOMICS)                                        | Large System Extensions                                                                            | 1           |
| `__ARM_FEATURE_NUMERIC_MAXMIN` [[ssec-v8max]](#ssec-v8max)                                     | Numeric Maximum and Minimum                                                                        | 1           |
| `__ARM_FEATURE_QBIT` [[ssec-Qflag]](#ssec-Qflag), [[ssec-Qflag2]](#ssec-Qflag2)                | Q (saturation) flag (32-bit-only)                                                                  | 1           |
| `__ARM_FEATURE_QRDMX` [[ssec-RDM]](#ssec-RDM)                                                  | SQRDMLxH instructions and associated intrinsics availability                                       | 1           |
| `__ARM_FEATURE_SAT` [[ssec-Satins]](#ssec-Satins), [[ssec-Wsatin]](#ssec-Wsatin)               | Width-specified saturation instructions (32-bit-only)                                              | 1           |
| `__ARM_FEATURE_SHA2` [[ssec-CrypE]](#ssec-CrypE), [[ssec-SHA2]](#ssec-SHA2)                    | SHA2 Crypto extension (Arm v8-A)                                                                   | 1           |
| `__ARM_FEATURE_SHA512` [[ssec-CrypE]](#ssec-CrypE), [[ssec-SHA512]](#ssec-SHA512)              | SHA2 Crypto ext. (Arm v8.4-A, optional Armv8.2-A, Armv8.3-A)                                       | 1           |
| `__ARM_FEATURE_SHA3` [[ssec-CrypE]](#ssec-CrypE), [[ssec-SHA3]](#ssec-SHA3)                    | SHA3 Crypto extension (Arm v8.4-A)                                                                 | 1           |
| `__ARM_FEATURE_SIMD32` [[ssec-Satins]](#ssec-Satins), [[ssec-32SIMD]](#ssec-32SIMD)            | 32-bit SIMD instructions (Armv6) (32-bit-only)                                                     | 1           |
| `__ARM_FEATURE_SM3` [[ssec-CrypE]](#ssec-CrypE), [[ssec-SM3]](#ssec-SM3)                       | SM3 Crypto extension (Arm v8.4-A, optional Armv8.2-A, Armv8.3-A)                                   | 1           |
| `__ARM_FEATURE_SM4` [[ssec-CrypE]](#ssec-CrypE), [[ssec-SM4]](#ssec-SM4)                       | SM4 Crypto extension (Arm v8.4-A, optional Armv8.2-A, Armv8.3-A)                                   | 1           |
| `__ARM_FEATURE_FP16_FML` [[ssec-FP16FML]](#ssec-FP16FML)                                       | FP16 FML extension (Arm v8.4-A, optional Armv8.2-A, Armv8.3-A)                                     | 1           |
| `__ARM_FEATURE_UNALIGNED` [[ssec-Uasih]](#ssec-Uasih)                                          | Hardware support for unaligned access                                                              | 1           |
| `__ARM_FP` [[ssec-HWFP]](#ssec-HWFP)                                                           | Hardware floating-point                                                                            | 1           |
| `__ARM_FP16_ARGS` [[ssec-FP16arg]](#ssec-FP16arg)                                              | `__fp16` argument and result                                                                       | 0x0C        |
| `__ARM_FP16_FORMAT_ALTERNATIVE` [[ssec-FP16fmt]](#ssec-FP16fmt)                                | 16-bit floating-point, alternative format                                                          | 1           |
| `__ARM_FP16_FORMAT_IEEE` [[ssec-FP16fmt]](#ssec-FP16fmt)                                       | 16-bit floating-point, IEEE format                                                                 | 1           |
| `__ARM_FP_FAST` [[ssec-FPm]](#ssec-FPm)                                                        | Accuracy-losing optimizations                                                                      | 1           |
| `__ARM_FP_FENV_ROUNDING` [[ssec-FPm]](#ssec-FPm)                                               | Rounding is configurable at runtime                                                                | 1           |
| `__ARM_BF16_FORMAT_ALTERNATIVE` [[ssec-BF16fmt]](#ssec-BF16fmt)                                | 16-bit brain floating-point, alternative format                                                    | 1           |
| `__ARM_FEATURE_BF16` [[ssec-BF16fmt]](#ssec-BF16fmt)                                           | 16-bit brain floating-point, vector instruction                                                    | 1           |
| `__ARM_FEATURE_MVE` [[ssec-MVE]](#ssec-MVE)                                                    | M-profile Vector Extension                                                                         | 1           |
| `__ARM_FEATURE_CDE` [[ssec-CDE]](#ssec-CDE)                                                    | Custom Datapath Extension                                                                          | 0x01        |
| `__ARM_FEATURE_CDE_COPROC` [[ssec-CDE]](#ssec-CDE)                                             | Custom Datapath Extension                                                                          | 0xf         |
| `__ARM_NEON` [[ssec-NEONfp]](#ssec-NEONfp)                                                     | Advanced SIMD (Neon) extension                                                                     | 1           |
| `__ARM_NEON_FP` [[ssec-WMMX]](#ssec-WMMX)                                                      | Advanced SIMD (Neon) floating-point                                                                | 0x04        |
| `__ARM_FEATURE_COPROC` [[ssec-CoProc]](#ssec-CoProc)                                           | Coprocessor Intrinsics                                                                             | 1           |
| `__ARM_PCS` [[ssec-Pcs]](#ssec-Pcs)                                                            | Arm procedure call standard (32-bit-only)                                                          | 0x01        |
| `__ARM_PCS_AAPCS64` [[ssec-Pcs]](#ssec-Pcs)                                                    | Arm PCS for AArch64.                                                                               | 1           |
| `__ARM_PCS_VFP` [[ssec-Pcs]](#ssec-Pcs)                                                        | Arm PCS hardware FP variant in use (32-bit-only)                                                   | 1           |
| `__ARM_FEATURE_RNG` [[ssec-rng]](#ssec-rng)                                                    | Random Number Generation Extension (Armv8.5-A)                                                     | 1           |
| `__ARM_ROPI` [[ssec-Pic]](#ssec-Pic)                                                           | Read-only PIC in use                                                                               | 1           |
| `__ARM_RWPI` [[ssec-Pic]](#ssec-Pic)                                                           | Read-write PIC in use                                                                              | 1           |
| `__ARM_SIZEOF_MINIMAL_ENUM` [[ssec-Imptype]](#ssec-Imptype)                                    | Size of minimal enumeration type: 1 or 4                                                           | 1           |
| `__ARM_SIZEOF_WCHAR_T` [[ssec-Imptype]](#ssec-Imptype)                                         | Size of `wchar_t`: 2 or 4                                                                          | 2           |
| `__ARM_WMMX` [[ssec-WMMX]](#ssec-WMMX)                                                         | Wireless MMX extension (32-bit-only)                                                               | 1           |

# Attributes and pragmas

## Attribute syntax

The general rules for attribute syntax are described in the GCC
documentation
\<<http://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html>\>. Briefly,
for this declaration:

    A int B x C, D y E;

attribute <span class="title-ref">A</span> applies to both
<span class="title-ref">x</span> and <span class="title-ref">y</span>;
<span class="title-ref">B</span> and <span class="title-ref">C</span>
apply to <span class="title-ref">x</span> only, and
<span class="title-ref">D</span> and <span class="title-ref">E</span>
apply to <span class="title-ref">y</span> only. Programmers are
recommended to keep declarations simple if attributes are used.

Unless otherwise stated, all attribute arguments must be compile-time
constants.

## Hardware/software floating-point calling convention

The AArch32 PCS defines a base standard, as well as several variants.

On targets with hardware FP the AAPCS provides for procedure calls to
use either integer or floating-point argument and result registers. ACLE
allows this to be selectable per function. :

    __attribute__((pcs("aapcs")))

applied to a function, selects software (integer) FP calling convention.
:

    __attribute__((pcs("aapcs-vfp")))

applied to a function, selects hardware FP calling convention.

The AArch64 PCS standard variants do not change how parameters are
passed, so no PCS attributes are supported.

The pcs attribute applies to functions and function types.
Implementations are allowed to treat the procedure call specification as
part of the type, i.e. as a language linkage in the sense of \[C++
\#1\].

## Target selection

The following target selection attributes are supported:

    __attribute__((target("arm")))

when applied to a function, forces A32 state code generation. :

    __attribute__((target("thumb")))

when applied to a function, forces T32 state code generation.

The implementation must generate code in the required state unless it is
impossible to do so. For example, on an Armv5 or Armv6 target with VFP
(and without the T32 instruction set), if a function is forced to T32
state, any floating-point operations or intrinsics that are only
available in A32 state must be generated as calls to library functions
or compiler-generated functions.

This attribute does not apply to AArch64.

## Weak linkage

<span class="title-ref">\_\_attribute\_\_((weak))</span> can be attached
to declarations and definitions to indicate that they have weak static
linkage (<span class="title-ref">STB\_WEAK</span> in ELF objects). As
definitions, they can be overridden by other definitions of the same
symbol. As references, they do not need to be satisfied and will be
resolved to zero if a definition is not present.

### Patchable constants

In addition, this specification requires that weakly defined initialized
constants are not used for constant propagation, allowing the value to
be safely changed by patching after the object is produced.

## Alignment

The new standards for C [\[C11\]](#C11) (6.7.5) and C++
[\[CPP11\]](#CPP11) (7.6.2) add syntax for aligning objects and types.
ACLE provides an alternative syntax described in this section.

### Alignment attribute

<span class="title-ref">\_\_attribute\_\_((aligned(N)))</span> can be
associated with data, functions, types and fields. N must be an integral
constant expression and must be a power of 2, for example 1, 2, 4, 8.
The maximum alignment depends on the storage class of the object being
aligned. The size of a data type is always a multiple of its alignment.
This is a consequence of the rule in C that the spacing between array
elements is equal to the element size.

The aligned attribute does not act as a type qualifier. For example,
given:

    char x `__attribute__((aligned(8)));`
    int y `__attribute__((aligned(1)));`

the type of <span class="title-ref">\&x</span> is
<span class="title-ref">char \*</span> and the type of
<span class="title-ref">\&y</span> is <span class="title-ref">int
\*</span>. The following declarations are equivalent:

    struct S x __attribute__((aligned(16))); /* ACLE */

    struct S _Alignas(16) x/* C11 */

    #include <stdalign.h> /* C11 (alternative) */
    struct S alignas(16) x;

    struct S alignas(16) x; /* C++11 */

### Alignment of static objects

The macro <span class="title-ref">\_\_ARM\_ALIGN\_MAX\_PWR</span>
indicates (as the exponent of a power of 2) the maximum available
alignment of static data -- for example 4 for 16-byte alignment. So the
following is always valid:

    int x __attribute__((aligned(1 << __ARM_ALIGN_MAX_PWR)));

or, using the C11/C++11 syntax:

    alignas(1 << __ARM_ALIGN_MAX_PWR) int x;

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
as specified in the AAPCS for AArch32 (i.e. 8 bytes) or as specified in
AAPCS64 for AArch64 (i.e. 16 bytes) this being also the maximal
alignment of any native type.

An implementation may, but is not required to, permit the allocation of
local objects with greater alignment, for example 16 or 32 bytes for
AArch32. (This would involve some runtime adjustment such that the
object address was not a fixed offset from the stack pointer on entry.)

If a program requests alignment greater than the implementation
supports, it is recommended that the compiler warn but not fault this.
Programmers should expect over-alignment of local objects to be treated
as a hint.

The macro <span class="title-ref">\_\_ARM\_ALIGN\_MAX\_STACK\_PWR</span>
indicates (as the exponent of a power of 2) the maximum available stack
alignment. For example, a value of 3 indicates 8-byte alignment.

### Procedure calls

For procedure calls, where a parameter has aligned type, data should be
passed as if it was a basic type of the given type and alignment. For
example, given the aligned type:

    struct S { int a[2]; } __attribute__((aligned(8)));

the second argument of:

    f(int, struct S);

should be passed as if it were:

    f(int, long long);

which means that in AArch32 AAPCS the second parameter is in
<span class="title-ref">R2/R3</span> rather than
<span class="title-ref">R1/R2</span>.

### Alignment of C heap storage

The standard C allocation functions [\[C99\]](#C99) (7.20.3), such as
malloc(), return storage aligned to the normal maximal alignment, i.e.
the largest alignment of any (standard) type.

Implementations may, but are not required to, provide a function to
return heap storage of greater alignment. Suitable functions are:

    int posix_memalign(void **memptr, size_t alignment, size_t size );

as defined in [\[POSIX\]](#POSIX), or:

    void *aligned_alloc(size_t alignment, size_t size);

as defined in [\[C11\]](#C11) (7.22.3.1).

### Alignment of C++ heap allocation

In C++, an allocation (with new) knows the object's type. If the type is
aligned, the allocation should also be aligned. There are two cases to
consider depending on whether the user has provided an allocation
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

    struct float4 {
      void *operator new[](size_t s) {
        void *p;
        posix_memalign(&p, 16, s);
        return p;
      }
      float data[4];
    } __attribute__((aligned(16)));

If the user has not provided their own allocation function, the behavior
is implementation-defined.

The generic itanium C++ ABI, which we use in AArch64, already handles
arrays with arbitrarily aligned elements

## Other attributes

The following attributes should be supported and their definitions
follow [\[GCC\]](#GCC). These attributes are not specific to Arm or the
Arm ABI.

<span class="title-ref">alias</span>,
<span class="title-ref">common</span>,
<span class="title-ref">nocommon</span>,
<span class="title-ref">noinline</span>,
<span class="title-ref">packed</span>,
<span class="title-ref">section</span>,
<span class="title-ref">visibility</span>,
<span class="title-ref">weak</span>

  - Some specific requirements on the weak attribute are detailed in
    [sec-Weak-linkage](#sec-Weak-linkage).

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

The new C and C++ standards [\[C11\]](#C11) (7.17), [\[CPP11\]](#CPP11)
(clause 29) provide a comprehensive library of atomic operations and
barriers, including operations to read and write data with particular
ordering requirements. Programmers are recommended to use this where
available.

### IA-64/GCC atomic update primitives

The <span class="title-ref">\_\_sync</span> family of intrinsics
(introduced in [\[IA-64\]](#IA-64) (section 7.4), and as documented in
the GCC documentation) may be provided, especially if the C/C++ atomics
are not available, and are recommended as being portable and widely
understood. These may be expanded inline, or call library functions.
Note that, unusually, these intrinsics are polymorphic they will
specialize to instructions suitable for the size of their arguments.

## Memory barriers

Memory barriers ensure specific ordering properties between memory
accesses. For more details on memory barriers, see \[ARMARM\] (A3.8.3).
The intrinsics in this section are available for all targets. They may
be no-ops (i.e. generate no code, but possibly act as a code motion
barrier in compilers) on targets where the relevant instructions do not
exist, but only if the property they guarantee would have held anyway.
On targets where the relevant instructions exist but are implemented as
no-ops, these intrinsics generate the instructions.

The memory barrier intrinsics take a numeric argument indicating the
scope and access type of the barrier, as shown in the following table.
(The assembler mnemonics for these numbers, as shown in the table, are
not available in the intrinsics.) The argument should be an integral
constant expression within the required range see
[sec-Constant-arguments-to-intrinsics](#sec-Constant-arguments-to-intrinsics).

|              |              |                 |                                     |
| ------------ | ------------ | --------------- | ----------------------------------- |
| **Argument** | **Mnemonic** | **Domain**      | **Ordered Accesses (before-after)** |
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

The following memory barrier intrinsics are available: :

    void __dmb(/*constant*/ unsigned int);

Generates a DMB (data memory barrier) instruction or equivalent CP15
instruction. DMB ensures the observed ordering of memory accesses.
Memory accesses of the specified type issued before the DMB are
guaranteed to be observed (in the specified scope) before memory
accesses issued after the DMB. For example, DMB should be used between
storing data, and updating a flag variable that makes that data
available to another core.

The <span class="title-ref">\_\_dmb()</span> intrinsic also acts as a
compiler memory barrier of the appropriate type. :

    void __dsb(/*constant*/ unsigned int);

Generates a DSB (data synchronization barrier) instruction or equivalent
CP15 instruction. DSB ensures the completion of memory accesses. A DSB
behaves as the equivalent DMB and has additional properties. After a DSB
instruction completes, all memory accesses of the specified type issued
before the DSB are guaranteed to have completed.

The <span class="title-ref">\_\_dsb()</span> intrinsic also acts as a
compiler memory barrier of the appropriate type. :

    void __isb(/*constant*/ unsigned int);

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

The only supported argument for the
<span class="title-ref">\_\_isb()</span> intrinsic is 15, corresponding
to the SY (full system) scope of the ISB instruction.

### Examples

In this example, process <span class="title-ref">P1</span> makes some
data available to process <span class="title-ref">P2</span> and sets a
flag to indicate this. :

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

In this example, process <span class="title-ref">P1</span> makes data
available to <span class="title-ref">P2</span> by putting it on a queue.
:

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
      while (!(work = `queue_head))` {}
      /* no barrier needed: load of payload is data-dependent */
      /* use work->payload */

## Hints

The intrinsics in this section are available for all targets. They may
be no-ops (i.e. generate no code, but possibly act as a code motion
barrier in compilers) on targets where the relevant instructions do not
exist. On targets where the relevant instructions exist but are
implemented as no-ops, these intrinsics generate the instructions. :

    void __wfi(void);

Generates a WFI (wait for interrupt) hint instruction, or nothing. The
WFI instruction allows (but does not require) the processor to enter a
low-power state until one of a number of asynchronous events occurs. :

    void __wfe(void);

Generates a WFE (wait for event) hint instruction, or nothing. The WFE
instruction allows (but does not require) the processor to enter a
low-power state until some event occurs such as a SEV being issued by
another processor. :

    void __sev(void);

Generates a SEV (send a global event) hint instruction. This causes an
event to be signaled to all processors in a multiprocessor system. It is
a NOP on a uniprocessor system. :

    void __sevl(void);

Generates a send a local event hint instruction. This causes an event to
be signaled to only the processor executing this instruction. In a
multiprocessor system, it is not required to affect the other
processors. :

    void __yield(void);

Generates a YIELD hint instruction. This enables multithreading software
to indicate to the hardware that it is performing a task, for example a
spin-lock, that could be swapped out to improve overall system
performance. :

    void __dbg(/*constant*/ unsigned int);

Generates a DBG instruction. This provides a hint to debugging and
related systems. The argument must be a constant integer from 0 to 15
inclusive. See implementation documentation for the effect (if any) of
this instruction and the meaning of the argument. This is available only
when compiling for AArch32.

## Swap

<span class="title-ref">\_\_swp</span> is available for all targets.
This intrinsic expands to a sequence equivalent to the deprecated (and
possibly unavailable) SWP instruction. :

    uint32_t __swp(uint32_t, volatile void *);

Unconditionally stores a new value at the given address, and returns the
old value.

As with the IA-64/GCC primitives described in 0, the
<span class="title-ref">\_\_swp</span> intrinsic is polymorphic. The
second argument must provide the address of a byte-sized object or an
aligned word-sized object and it must be possible to determine the size
of this object from the argument expression.

This intrinsic is implemented by LDREX/STREX (or LDREXB/STREXB) where
available, as if by:

    uint32_t __swp(uint32_t x, volatile uint32_t *p) {
      uint32_t v;
      /* use LDREX/STREX intrinsics not specified by ACLE */
      do v = __ldrex(p); while (__strex(x, p));
      return v;
    }

or alternatively,:

    uint32_t __swp(uint32_t x, uint32_t *p) {
      uint32_t v;
      /* use IA-64/GCC atomic builtins */
      do v = *p; while (!__sync_bool_compare_and_swap(p, v, x));
      return v;
    }

It is recommended that compilers should produce a
downgradeable/upgradeable warning on encountering the
<span class="title-ref">\_\_swp</span> intrinsic.

Only if load-store exclusive instructions are not available will the
intrinsic use the SWP/SWPB instructions.

It is strongly recommended to use standard and flexible atomic
primitives such as those available in the C++ \<atomic\> header.
<span class="title-ref">\_\_swp</span> is provided solely to allow
straightforward (and possibly automated) replacement of explicit use of
SWP in inline assembler. SWP is obsolete in the Arm architecture, and in
recent versions of the architecture, may be configured to be unavailable
in user-mode. (Aside: unconditional atomic swap is also less powerful as
a synchronization primitive than load-exclusive/store-conditional.)

## Memory prefetch intrinsics

Intrinsics are provided to prefetch data or instructions. The size of
the data or function is ignored. Note that the intrinsics may be
implemented as no-ops (i.e. not generate a prefetch instruction, if none
is available). Also, even where the architecture does provide a prefetch
instruction, a particular implementation may implement the instruction
as a no-op (i.e. the instruction has no effect).

### Data prefetch

    void __pld(void const volatile *addr);

Generates a data prefetch instruction, if available. The argument should
be any expression that may designate a data address. The data is
prefetched to the innermost level of cache, for reading. :

    void __pldx(/*constant*/ unsigned int /*access_kind*/,
                /*constant*/ unsigned int /*cache_level*/,
                /*constant*/ unsigned int /*retention_policy*/,
                void const volatile *addr);

Generates a data prefetch instruction. This intrinsic allows the
specification of the expected access kind (read or write), the cache
level to load the data, the data retention policy (temporal or
streaming), The relevant arguments can only be one of the following
values.

|                 |           |                                          |
| --------------- | --------- | ---------------------------------------- |
| **Access Kind** | **Value** | **Summary**                              |
| PLD             | 0         | Fetch the addressed location for reading |
| PST             | 1         | Fetch the addressed location for writing |

|             |       |                                          |
| ----------- | ----- | ---------------------------------------- |
| Cache Level | Value | Summary                                  |
| L1          | 0     | Fetch the addressed location to L1 cache |
| L2          | 1     | Fetch the addressed location to L2 cache |
| L3          | 2     | Fetch the addressed location to L3 cache |

|                      |           |                                                                            |
| -------------------- | --------- | -------------------------------------------------------------------------- |
| **Retention Policy** | **Value** | **Summary**                                                                |
| KEEP                 | 0         | Temporal fetch of the addressed location (i.e. allocate in cache normally) |
| STRM                 | 1         | Streaming fetch of the addressed location (i.e. memory used only once)     |

### Instruction prefetch

    void __pli(T addr);

Generates a code prefetch instruction, if available. If a specific code
prefetch instruction is not available, this intrinsic may generate a
data-prefetch instruction to fetch the addressed code to the innermost
level of unified cache. It will not fetch code to data-cache in a split
cache level. :

    void __plix(/*constant*/ unsigned int /*cache_level*/,
                /*constant*/ unsigned int /*retention_policy*/,
                T addr);

Generates a code prefetch instruction. This intrinsic allows the
specification of the cache level to load the code, the retention policy
(temporal or streaming). The relevant arguments can have the same values
as in <span class="title-ref">\_\_pldx.</span>

<span class="title-ref">\_\_pldx</span> and
<span class="title-ref">\_\_plix</span> arguments cache level and
retention policy are ignored on unsupported targets.

## NOP

    void __nop(void);

Generates an unspecified no-op instruction. Note that not all
architectures provide a distinguished NOP instruction. On those that do,
it is unspecified whether this intrinsic generates it or another
instruction. It is not guaranteed that inserting this instruction will
increase execution time.

# Data-processing intrinsics

The intrinsics in this section are provided for algorithm optimization.

The <span class="title-ref">\<arm\_acle.h\></span> header should be
included before using these intrinsics.

Implementations are not required to introduce precisely the instructions
whose names match the intrinsics. However, implementations should aim to
ensure that a computation expressed compactly with intrinsics will
generate a similarly compact sequence of machine code. In general, C's
as-if rule [\[C99\]](#C99) (5.1.2.3) applies, meaning that the compiled
code must behave *as if* the instruction had been generated.

In general, these intrinsics are aimed at DSP algorithm optimization on
M-profile and R-profile. Use on A-profile is deprecated. However, the
miscellaneous intrinsics and CRC32 intrinsics described in
[ssec-Mdpi](#ssec-Mdpi) and [ssec-crc32](#ssec-crc32) respectively are
suitable for all profiles.

## Programmer's model of global state

### The Q (saturation) flag

The Q flag is a cumulative (sticky) saturation bit in the APSR
(Application Program Status Register) indicating that an operation
saturated, or in some cases, overflowed. It is set on saturation by most
intrinsics in the DSP and SIMD intrinsic sets, though some SIMD
intrinsics feature saturating operations which do not set the Q flag.

[\[AAPCS\]](#AAPCS) (5.1.1) states:

The N, Z, C, V and Q flags (bits 27-31) and the GE\[3:0\] bits (bits
16-19) are undefined on entry to or return from a public interface.

Note that this does not state that these bits (in particular the Q flag)
are undefined across any C/C++ function call boundary only across a
public interface. The Q and GE bits could be manipulated in well-defined
ways by local functions, for example when constructing functions to be
used in DSP algorithms.

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

The following intrinsics are available when
<span class="title-ref">\_\_ARM\_FEATURE\_QBIT</span> is defined:

int <span class="title-ref">\_\_saturation\_occurred(void);</span>

Returns 1 if the Q flag is set, 0 if not.

void <span class="title-ref">\_\_set\_saturation\_occurred(int);</span>

Sets or resets the Q flag according to the LSB of the value.
<span class="title-ref">\_\_set\_saturation\_occurred(0)</span> might be
used before performing a sequence of operations after which the Q flag
is tested. (In general, the Q flag cannot be assumed to be unset at the
start of a function.)

void <span class="title-ref">\_\_ignore\_saturation(void);</span>

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
[ssec-32SIMD](#ssec-32SIMD).

There are four GE flags, one for each 8-bit lane of a 32-bit SIMD
operation. Certain non-saturating 32-bit SIMD intrinsics set the GE bits
to indicate overflow of addition or subtraction. For 4x8-bit operations
the GE bits are set one for each byte. For 2x16-bit operations the GE
bits are paired together, one for the high halfword and the other pair
for the low halfword. The only supported way to read or use the GE bits
(in this specification) is by using the
<span class="title-ref">\_\_sel</span> intrinsic, see
[sec-Parallel-selection](#sec-Parallel-selection).

### Floating-point environment

An implementation should implement the features of \<fenv.h\> for
accessing the floating-point runtime environment. Programmers should use
this rather than accessing the VFP FPSCR directly. For example, on a
target supporting VFP the cumulative exception flags (for example IXC,
OFC) can be read from the FPSCR by using the fetestexcept() function,
and the rounding mode (RMode) bits can be read using the fegetround()
function.

ACLE does not support changing the DN, FZ or AHP bits at runtime.

VFP short vector mode (enabled by setting the Stride and Len bits) is
deprecated, and is unavailable on later VFP implementations. ACLE
provides no support for this mode.

## Miscellaneous data-processing intrinsics

The following intrinsics perform general data-processing operations.
They have no effect on global state.

\[Note: documentation of the <span class="title-ref">\_\_nop</span>
intrinsic has moved to [ssec-nop](#ssec-nop)\]

For completeness and to aid portability between LP64 and LLP64 models,
ACLE also defines intrinsics with <span class="title-ref">l</span>
suffix. :

    uint32_t __ror(uint32_t x, uint32_t y);
    unsigned long __rorl(unsigned long x, uint32_t y);
    uint64_t __rorll(uint64_t x, uint32_t y);

Rotates the argument <span class="title-ref">x</span> right by
<span class="title-ref">y</span> bits. <span class="title-ref">y</span>
can take any value. These intrinsics are available on all targets. :

    unsigned int __clz(uint32_t x);
    unsigned int __clzl(unsigned long x);
    unsigned int __clzll(uint64_t x);

Returns the number of leading zero bits in
<span class="title-ref">x</span>. When <span class="title-ref">x</span>
is zero it returns the argument width, i.e. 32 or 64. These intrinsics
are available on all targets. On targets without the CLZ instruction it
should be implemented as an instruction sequence or a call to such a
sequence. A suitable sequence can be found in [\[Warren\]](#Warren)
(fig. 5-7). Hardware support for these intrinsics is indicated by
<span class="title-ref">\_\_ARM\_FEATURE\_CLZ</span>. :

    unsigned int __cls(uint32_t x);
    unsigned int __clsl(unsigned long x);
    unsigned int __clsll(uint64_t x);

Returns the number of leading sign bits in
<span class="title-ref">x</span>. When <span class="title-ref">x</span>
is zero it returns the argument width - 1, i.e. 31 or 63. These
intrinsics are available on all targets. On targets without the CLZ
instruction it should be implemented as an instruction sequence or a
call to such a sequence. Fast hardware implementation (using a CLS
instruction or a short code sequence involving the CLZ instruction) is
indicated by <span class="title-ref">\_\_ARM\_FEATURE\_CLZ.</span> :

    uint32_t __rev(uint32_t);
    unsigned long __revl(unsigned long);
    uint64_t __revll(uint64_t);

Reverses the byte order within a word or doubleword. These intrinsics
are available on all targets and should be expanded to an efficient
straight-line code sequence on targets without byte reversal
instructions. :

    uint32_t __rev16(uint32_t);
    unsigned long __rev16l(unsigned long);
    uint64_t __rev16ll(uint64_t);

Reverses the byte order within each halfword of a word. For example,
<span class="title-ref">0x12345678</span> becomes
<span class="title-ref">0x34127856</span>. These intrinsics are
available on all targets and should be expanded to an efficient
straight-line code sequence on targets without byte reversal
instructions. :

    int16_t __revsh(int16_t);

Reverses the byte order in a 16-bit value and returns the signed 16-bit
result. For example, <span class="title-ref">0x0080</span> becomes
<span class="title-ref">0x8000</span>. This intrinsic is available on
all targets and should be expanded to an efficient straight-line code
sequence on targets without byte reversal instructions. :

    uint32_t __rbit(uint32_t x);
    unsigned long __rbitl(unsigned long x);
    uint64_t __rbitll(uint64_t x);

Reverses the bits in <span class="title-ref">x</span>. These intrinsics
are only available on targets with the RBIT instruction.

### Examples

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

## 16-bit multiplications

The intrinsics in this section provide direct access to the 16x16 and
16x32 bit multiplies introduced in Armv5E. Compilers are also encouraged
to exploit these instructions from C code. These intrinsics are
available when <span class="title-ref">\_\_ARM\_FEATURE\_DSP</span> is
defined, and are not available on non-5E targets. These multiplies
cannot overflow. :

    int32_t __smulbb(int32_t, int32_t);

Multiplies two 16-bit signed integers, i.e. the low halfwords of the
operands. :

    int32_t __smulbt(int32_t, int32_t);

Multiplies the low halfword of the first operand and the high halfword
of the second operand. :

    int32_t __smultb(int32_t, int32_t);

Multiplies the high halfword of the first operand and the low halfword
of the second operand. :

    int32_t __smultt(int32_t, int32_t);

Multiplies the high halfwords of the operands. :

    int32_t __smulwb(int32_t, int32_t);

Multiplies the 32-bit signed first operand with the low halfword (as a
16-bit signed integer) of the second operand. Return the top 32 bits of
the 48-bit product. :

    int32_t __smulwt(int32_t, int32_t);

Multiplies the 32-bit signed first operand with the high halfword (as a
16-bit signed integer) of the second operand. Return the top 32 bits of
the 48-bit product.

## Saturating intrinsics

### Width-specified saturation intrinsics

These intrinsics are available when
<span class="title-ref">\_\_ARM\_FEATURE\_SAT</span> is defined. They
saturate a 32-bit value at a given bit position. The saturation width
must be an integral constant expression – see
[sec-Constant-arguments-to-intrinsics](#sec-Constant-arguments-to-intrinsics).

    int32_t __ssat(int32_t, /*constant*/ unsigned int);

Saturates a signed integer to the given bit width in the range 1 to 32.
For example, the result of saturation to 8-bit width will be in the
range -128 to 127. The Q flag is set if the operation saturates. :

    uint32_t __usat(int32_t, /*constant*/ unsigned int);

Saturates a signed integer to an unsigned (non-negative) integer of a
bit width in the range 0 to 31. For example, the result of saturation to
8-bit width is in the range 0 to 255, with all negative inputs going to
zero. The Q flag is set if the operation saturates.

### Saturating addition and subtraction intrinsics

These intrinsics are available when
<span class="title-ref">\_\_ARM\_FEATURE\_DSP</span> is defined.

The saturating intrinsics operate on 32-bit signed integer data. There
are no special saturated or fixed point types. :

    int32_t __qadd(int32_t, int32_t);

Adds two 32-bit signed integers, with saturation. Sets the Q flag if the
addition saturates. :

    int32_t __qsub(int32_t, int32_t);

Subtracts two 32-bit signed integers, with saturation. Sets the Q flag
if the subtraction saturates. :

    int32_t __qdbl(int32_t);

Doubles a signed 32-bit number, with saturation.
<span class="title-ref">\_\_qdbl(x)</span> is equal to
<span class="title-ref">\_\_qadd(x,x)</span> except that the argument x
is evaluated only once. Sets the Q flag if the addition saturates.

### Accumulating multiplications

These intrinsics are available when
<span class="title-ref">\_\_ARM\_FEATURE\_DSP</span> is defined. :

    int32_t __smlabb(int32_t, int32_t, int32_t);

Multiplies two 16-bit signed integers, the low halfwords of the first
two operands, and adds to the third operand. Sets the Q flag if the
addition overflows. (Note that the addition is the usual 32-bit modulo
addition which wraps on overflow, not a saturating addition. The
multiplication cannot overflow.):

    int32_t __smlabt(int32_t, int32_t, int32_t);

Multiplies the low halfword of the first operand and the high halfword
of the second operand, and adds to the third operand, as for
<span class="title-ref">\_\_smlabb</span>. :

    int32_t __smlatb(int32_t, int32_t, int32_t);

Multiplies the high halfword of the first operand and the low halfword
of the second operand, and adds to the third operand, as for
<span class="title-ref">\_\_smlabb</span>. :

    int32_t __smlatt(int32_t, int32_t, int32_t);

Multiplies the high halfwords of the first two operands and adds to the
third operand, as for <span class="title-ref">\_\_smlabb</span>. :

    int32_t __smlawb(int32_t, int32_t, int32_t);

Multiplies the 32-bit signed first operand with the low halfword (as a
16-bit signed integer) of the second operand. Adds the top 32 bits of
the 48-bit product to the third operand. Sets the Q flag if the addition
overflows. (See note for <span class="title-ref">\_\_smlabb</span>). :

    int32_t __smlawt(int32_t, int32_t, int32_t);

Multiplies the 32-bit signed first operand with the high halfword (as a
16-bit signed integer) of the second operand and adds the top 32 bits of
the 48-bit result to the third operand as for
<span class="title-ref">\_\_smlawb</span>.

### Examples

The ACLE DSP intrinsics can be used to define ETSI/ITU-T basic
operations [\[G.191\]](#G.191): :

    #include <arm_acle.h>
    inline int32_t L_add(int32_t x, int32_t y) { return __qadd(x, y); }
    inline int32_t L_negate(int32_t x) { return __qsub(0, x); }
    inline int32_t L_mult(int16_t x, int16_t y) { return __qdbl(x*y); }
    inline int16_t add(int16_t x, int16_t y) { return (int16_t)(__qadd(x<<16, y<<16) >> 16); }
    inline int16_t norm_l(int32_t x) { return __clz(x ^ (x<<1)) & 31; }
    ...

This example assumes the implementation preserves the Q flag on return
from an inline function.

## 32-bit SIMD intrinsics

### Availability

Armv6 introduced instructions to perform 32-bit SIMD operations (i.e.
two 16-bit operations or four 8-bit operations) on the Arm
general-purpose registers. These instructions are not related to the
much more versatile Advanced SIMD (Neon) extension, whose support is
described in [sec-NEON-intrinsics](#sec-NEON-intrinsics).

The 32-bit SIMD intrinsics are available on targets featuring Armv6 and
upwards, including the A and R profiles. In the M profile they are
available in the Armv7E-M architecture. Availability of the 32-bit SIMD
intrinsics implies availability of the saturating intrinsics.

Availability of the SIMD intrinsics is indicated by the
<span class="title-ref">\_\_ARM\_FEATURE\_SIMD32</span> predefine.

To access the intrinsics, the
<span class="title-ref">\<arm\_acle.h\></span> header should be
included.

### Data types for 32-bit SIMD intrinsics

The header <span class="title-ref">\<arm\_acle.h\></span> should be
included before using these intrinsics.

The SIMD intrinsics generally operate on and return 32-bit words
consisting of two 16-bit or four 8-bit values. These are represented as
<span class="title-ref">int16x2\_t</span> and
<span class="title-ref">int8x4\_t</span> below for illustration. Some
intrinsics also feature scalar accumulator operands and/or results.

When defining the intrinsics, implementations can define SIMD operands
using a 32-bit integral type (such as <span class="title-ref">unsigned
int</span>).

The header <span class="title-ref">\<arm\_acle.h\></span> defines
typedefs <span class="title-ref">int16x2\_t</span>,
<span class="title-ref">uint16x2\_t</span>,
<span class="title-ref">int8x4\_t</span>, and
<span class="title-ref">uint8x4\_t.</span> These should be defined as
32-bit integral types of the appropriate sign. There are no intrinsics
provided to pack or unpack values of these types. This can be done with
shifting and masking operations.

### Use of the Q flag by 32-bit SIMD intrinsics

Some 32-bit SIMD instructions may set the Q flag described in
[ssec-Qflag2](#ssec-Qflag2). The behavior of the intrinsics matches that
of the instructions.

Generally, instructions that perform lane-by-lane saturating operations
do not set the Q flag. For example,
<span class="title-ref">\_\_qadd16</span> does not set the Q flag, even
if saturation occurs in one or more lanes.

The explicit saturation operations
<span class="title-ref">\_\_ssat</span> and
<span class="title-ref">\_\_usat</span> set the Q flag if saturation
occurs. Similarly, <span class="title-ref">\_\_ssat16</span> and
<span class="title-ref">\_\_usat16</span> set the Q flag if saturation
occurs in either lane.

Some instructions, such as <span class="title-ref">\_\_smlad</span>, set
the Q flag if overflow occurs on an accumulation, even though the
accumulation is not a saturating operation (i.e. does not clip its
result to the limits of the type).

In the following descriptions of intrinsics, if the description does not
mention whether the intrinsic affects the Q flag, the intrinsic does not
affect it.

### Parallel 16-bit saturation

These intrinsics are available when
<span class="title-ref">\_\_ARM\_FEATURE\_SIMD32</span> is defined. They
saturate two 16-bit values to a given bit width as for the
<span class="title-ref">\_\_ssat</span> and
<span class="title-ref">\_\_usat</span> intrinsics defined in
[ssec-wsatin](#ssec-Wsatin). :

    int16x2_t __ssat16(int16x2_t, /*constant*/ unsigned int);

Saturates two 16-bit signed values to a width in the range 1 to 16. The
Q flag is set if either operation saturates. :

    int16x2_t __usat16(int16x2_t, /*constant */ unsigned int);

Saturates two 16-bit signed values to a bit width in the range 0 to 15.
The input values are signed and the output values are non-negative, with
all negative inputs going to zero. The Q flag is set if either operation
saturates.

### Packing and unpacking

These intrinsics are available when
<span class="title-ref">\_\_ARM\_FEATURE\_SIMD32</span> is defined. :

    int16x2_t __sxtab16(int16x2_t, int8x4_t);

Two values (at bit positions 0..7 and 16..23) are extracted from the
second operand, sign-extended to 16 bits, and added to the first
operand. :

    int16x2_t __sxtb16(int8x4_t);

Two values (at bit positions 0..7 and 16..23) are extracted from the
first operand, sign-extended to 16 bits, and returned as the result. :

    uint16x2_t __uxtab16(uint16x2_t, uint8x4_t);

Two values (at bit positions 0..7 and 16..23) are extracted from the
second operand, zero-extended to 16 bits, and added to the first
operand. :

    uint16x2_t __uxtb16(uint8x4_t);

Two values (at bit positions 0..7 and 16..23) are extracted from the
first operand, zero-extended to 16 bits, and returned as the result.

### Parallel selection

This intrinsic is available when
<span class="title-ref">\_\_ARM\_FEATURE\_SIMD32</span> is defined. :

    uint8x4_t __sel(uint8x4_t, uint8x4_t);

Selects each byte of the result from either the first operand or the
second operand, according to the values of the GE bits. For each result
byte, if the corresponding GE bit is set then the byte from the first
operand is used, otherwise the byte from the second operand is used.
Because of the way that <span class="title-ref">int16x2\_t</span>
operations set two (duplicate) GE bits per value, the
<span class="title-ref">\_\_sel</span> intrinsic works equally well on
<span class="title-ref">(u)int16x2\_t</span> and
<span class="title-ref">(u)int8x4\_t</span> data.

### Parallel 8-bit addition and subtraction

These intrinsics are available when
<span class="title-ref">\_\_ARM\_FEATURE\_SIMD32</span> is defined. Each
intrinsic performs 8-bit parallel addition or subtraction. In some cases
the result may be halved or saturated. :

    int8x4_t __qadd8(int8x4_t, int8x4_t);

4x8-bit addition, saturated to the range
<span class="title-ref">-2\*\*7</span> to
<span class="title-ref">2\*\*7-1</span>. :

    int8x4_t __qsub8(int8x4_t, int8x4_t);

4x8-bit subtraction, with saturation. :

    int8x4_t __sadd8(int8x4_t, int8x4_t);

4x8-bit signed addition. The GE bits are set according to the results. :

    int8x4_t __shadd8(int8x4_t, int8x4_t);

4x8-bit signed addition, halving the results. :

    int8x4_t __shsub8(int8x4_t, int8x4_t);

4x8-bit signed subtraction, halving the results. :

    int8x4_t __ssub8(int8x4_t, int8x4_t);

4x8-bit signed subtraction. The GE bits are set according to the
results. :

    uint8x4_t __uadd8(uint8x4_t, uint8x4_t);

4x8-bit unsigned addition. The GE bits are set according to the results.
:

    uint8x4_t __uhadd8(uint8x4_t, uint8x4_t);

4x8-bit unsigned addition, halving the results. :

    uint8x4_t __uhsub8(uint8x4_t, uint8x4_t);

4x8-bit unsigned subtraction, halving the results. :

    uint8x4_t __uqadd8(uint8x4_t, uint8x4_t);

4x8-bit unsigned addition, saturating to the range
<span class="title-ref">0</span> to
<span class="title-ref">2\*\*8-1</span>. :

    uint8x4_t __uqsub8(uint8x4_t, uint8x4_t);

4x8-bit unsigned subtraction, saturating to the range
<span class="title-ref">0</span> to
<span class="title-ref">2\*\*8-1</span>. :

    uint8x4_t __usub8(uint8x4_t, uint8x4_t);

4x8-bit unsigned subtraction. The GE bits are set according to the
results.

### Sum of 8-bit absolute differences

These intrinsics are available when
<span class="title-ref">\_\_ARM\_FEATURE\_SIMD32</span> is defined. They
perform an 8-bit sum-of-absolute differences operation, typically used
in motion estimation. :

    uint32_t __usad8(uint8x4_t, uint8x4_t);

Performs 4x8-bit unsigned subtraction, and adds the absolute values of
the differences together, returning the result as a single unsigned
integer. :

    uint32_t __usada8(uint8x4_t, uint8x4_t, uint32_t);

Performs 4x8-bit unsigned subtraction, adds the absolute values of the
differences together, and adds the result to the third operand.

### Parallel 16-bit addition and subtraction

These intrinsics are available when
<span class="title-ref">\_\_ARM\_FEATURE\_SIMD32</span> is defined. Each
intrinsic performs 16-bit parallel addition and/or subtraction. In some
cases the result may be halved or saturated. :

    int16x2_t __qadd16(int16x2_t, int16x2_t);

2x16-bit addition, saturated to the range
<span class="title-ref">-2\*\*15</span> to
<span class="title-ref">2\*\*15-1</span>. :

    int16x2_t __qasx(int16x2_t, int16x2_t);

Exchanges halfwords of second operand, adds high halfwords and subtracts
low halfwords, saturating in each case. :

    int16x2_t __qsax(int16x2_t, int16x2_t);

Exchanges halfwords of second operand, subtracts high halfwords and adds
low halfwords, saturating in each case. :

    int16x2_t __qsub16(int16x2_t, int16x2_t);

2x16-bit subtraction, with saturation. :

    int16x2_t __sadd16(int16x2_t, int16x2_t);

2x16-bit signed addition. The GE bits are set according to the results.
:

    int16x2_t __sasx(int16x2_t, int16x2_t);

Exchanges halfwords of the second operand, adds high halfwords and
subtracts low halfwords. The GE bits are set according to the results. :

    int16x2_t __shadd16(int16x2_t, int16x2_t);

2x16-bit signed addition, halving the results. :

    int16x2_t __shasx(int16x2_t, int16x2_t);

Exchanges halfwords of the second operand, adds high halfwords and
subtract low halfwords, halving the results. :

    int16x2_t __shsax(int16x2_t, int16x2_t);

Exchanges halfwords of the second operand, subtracts high halfwords and
add low halfwords, halving the results. :

    int16x2_t __shsub16(int16x2_t, int16x2_t);

2x16-bit signed subtraction, halving the results. :

    int16x2_t __ssax(int16x2_t, int16x2_t);

Exchanges halfwords of the second operand, subtracts high halfwords and
adds low halfwords. The GE bits are set according to the results. :

    int16x2_t __ssub16(int16x2_t, int16x2_t);

2x16-bit signed subtraction. The GE bits are set according to the
results. :

    uint16x2_t __uadd16(uint16x2_t, uint16x2_t);

2x16-bit unsigned addition. The GE bits are set according to the
results. :

    uint16x2_t __uasx(uint16x2_t, uint16x2_t);

Exchanges halfwords of the second operand, adds high halfwords and
subtracts low halfwords. The GE bits are set according to the results of
unsigned addition. :

    uint16x2_t __uhadd16(uint16x2_t, uint16x2_t);

2x16-bit unsigned addition, halving the results. :

    uint16x2_t __uhasx(uint16x2_t, uint16x2_t);

Exchanges halfwords of the second operand, adds high halfwords and
subtracts low halfwords, halving the results. :

    uint16x2_t __uhsax(uint16x2_t, uint16x2_t);

Exchanges halfwords of the second operand, subtracts high halfwords and
adds low halfwords, halving the results. :

    uint16x2_t __uhsub16(uint16x2_t, uint16x2_t);

2x16-bit unsigned subtraction, halving the results. :

    uint16x2_t __uqadd16(uint16x2_t, uint16x2_t);

2x16-bit unsigned addition, saturating to the range
<span class="title-ref">0</span> to
<span class="title-ref">2\*\*16-1</span>. :

    uint16x2_t __uqasx(uint16x2_t, uint16x2_t);

Exchanges halfwords of the second operand, and performs saturating
unsigned addition on the high halfwords and saturating unsigned
subtraction on the low halfwords. :

    uint16x2_t __uqsax(uint16x2_t, uint16x2_t);

Exchanges halfwords of the second operand, and performs saturating
unsigned subtraction on the high halfwords and saturating unsigned
addition on the low halfwords. :

    uint16x2_t __uqsub16(uint16x2_t, uint16x2_t);

2x16-bit unsigned subtraction, saturating to the range
<span class="title-ref">0</span> to
<span class="title-ref">2\*\*16-1</span>. :

    uint16x2_t __usax(uint16x2_t, uint16x2_t);

Exchanges the halfwords of the second operand, subtracts the high
halfwords and adds the low halfwords. Sets the GE bits according to the
results of unsigned addition. :

    uint16x2_t __usub16(uint16x2_t, uint16x2_t);

2x16-bit unsigned subtraction. The GE bits are set according to the
results.

### Parallel 16-bit multiplication

These intrinsics are available when
<span class="title-ref">\_\_ARM\_FEATURE\_SIMD32</span> is defined. Each
intrinsic performs two 16-bit multiplications. :

    int32_t __smlad(int16x2_t, int16x2_t, int32_t);

Performs 2x16-bit multiplication and adds both results to the third
operand. Sets the Q flag if the addition overflows. (Overflow cannot
occur during the multiplications.):

    int32_t __smladx(int16x2_t, int16x2_t, int32_t);

Exchanges the halfwords of the second operand, performs 2x16-bit
multiplication, and adds both results to the third operand. Sets the Q
flag if the addition overflows. (Overflow cannot occur during the
multiplications.):

    int64_t __smlald(int16x2_t, int16x2_t, int64_t);

Performs 2x16-bit multiplication and adds both results to the 64-bit
third operand. Overflow in the addition is not detected. :

    int64_t __smlaldx(int16x2_t, int16x2_t, int64_t);

Exchanges the halfwords of the second operand, performs 2x16-bit
multiplication and adds both results to the 64-bit third operand. ::
Overflow in the addition is not detected. :

    int32_t __smlsd(int16x2_t, int16x2_t, int32_t);

Performs two 16-bit signed multiplications. Takes the difference of the
products, subtracting the high-halfword product from the low-halfword
product, and adds the difference to the third operand. Sets the Q flag
if the addition overflows. (Overflow cannot occur during the
multiplications or the subtraction.) :

    int32_t __smlsdx(int16x2_t, int16x2_t, int32_t);

Performs two 16-bit signed multiplications. The product of the high
halfword of the first operand and the low halfword of the second operand
is subtracted from the product of the low halfword of the first operand
and the high halfword of the second operand, and the difference is added
to the third operand. Sets the Q flag if the addition overflows.
(Overflow cannot occur during the multiplications or the subtraction.) :

    int64_t __smlsld(int16x2_t, int16x2_t, int64_t);

Perform two 16-bit signed multiplications. Take the difference of the
products, subtracting the high-halfword product from the low-halfword
product, and add the difference to the third operand. Overflow in the
64-bit addition is not detected. (Overflow cannot occur during the
multiplications or the subtraction.) :

    int64_t __smlsldx(int16x2_t, int16x2_t, int64_t);

Perform two 16-bit signed multiplications. The product of the high
halfword of the first operand and the low halfword of the second operand
is subtracted from the product of the low halfword of the first operand
and the high halfword of the second operand, and the difference is added
to the third operand. Overflow in the 64-bit addition is not detected.
(Overflow cannot occur during the multiplications or the subtraction.) :

    int32_t __smuad(int16x2_t, int16x2_t);

Perform 2x16-bit signed multiplications, adding the products together.
:: Set the Q flag if the addition overflows. :

    int32_t __smuadx(int16x2_t, int16x2_t);

Exchange the halfwords of the second operand (or equivalently, the first
operand), perform 2x16-bit signed multiplications, and add the products
together. Set the Q flag if the addition overflows. :

    int32_t __smusd(int16x2_t, int16x2_t);

Perform two 16-bit signed multiplications. Take the difference of the
products, subtracting the high-halfword product from the low-halfword
product. :

    int32_t __smusdx(int16x2_t, int16x2_t);

Perform two 16-bit signed multiplications. The product of the high
halfword of the first operand and the low halfword of the second operand
is subtracted from the product of the low halfword of the first operand
and the high halfword of the second operand.

### Examples

Taking the elementwise maximum of two SIMD values each of which consists
of four 8-bit signed numbers:

    int8x4_t max8x4(int8x4_t x, int8x4_t y) { __ssub8(x, y); return __sel(x, y); }

As described in :ref:sec-Parallel-selection, where SIMD values consist
of two 16-bit unsigned numbers:

    int16x2_t max16x2(int16x2_t x, int16x2_t y) { __usub16(x, y); return __sel(x, y); }

Note that even though the result of the subtraction is not used, the
compiler must still generate the instruction, because of its side-effect
on the GE bits which are tested by the
<span class="title-ref">\_\_sel()</span> intrinsic.

## Floating-point data-processing intrinsics

The intrinsics in this section provide direct access to selected
floating-point instructions. They are defined only if the appropriate
precision is available in hardware, as indicated by
<span class="title-ref">\_\_ARM\_FP</span> (see
[ssec-HWFP](#ssec-HWFP)). :

    double __sqrt(double x);
    float __sqrtf(float x);

The <span class="title-ref">\_\_sqrt</span> intrinsics compute the
square root of their operand. They have no effect on errno. Negative
values produce a default NaN result and possible floating-point
exception as described in \[ARMARM\] (A2.7.7). :

    double __fma(double x, double y, double z);
    float __fmaf(float x, float y, float z);

The <span class="title-ref">\_\_fma</span> intrinsics compute
<span class="title-ref">(x\*y)+z</span>, without intermediate rounding.
These intrinsics are available only if
<span class="title-ref">\_\_ARM\_FEATURE\_FMA</span> is defined. On a
Standard C implementation it should not normally be necessary to use
these intrinsics, because the fma functions defined in \[C99\] (7.12.13)
should expand directly to the instructions if available. :

    float __rintnf (float);
    double __rintn (double);

The <span class="title-ref">\_\_rintn</span> intrinsics perform a
floating point round to integral, to nearest with ties to even. The
<span class="title-ref">\_\_rintn</span> intrinsic is available when
<span class="title-ref">\_\_ARM\_FEATURE\_DIRECTED\_ROUNDING</span> is
defined to 1. For other rounding modes like ‘ to nearest with ties to
away ’ it is strongly recommended that C99 standard functions be used.
To achieve a floating point convert to integer, rounding to ‘ nearest
with ties to even ’ operation, use these rounding functions with a
type-cast to integral values. For example: :

    (int) __rintnf (a);

maps to a floating point convert to signed integer, rounding to nearest
with ties to even operation. :

    int32_t __jcvt (double);

Converts a double-precision floating-point number to a 32-bit signed
integer following the Javascript Convert instruction semantics
[\[ARMARMv83\]](#ARMARMv83). The <span class="title-ref">\_\_jcvt</span>
intrinsic is available if
<span class="title-ref">\_\_ARM\_FEATURE\_JCVT</span> is defined.

    float __rint32zf (float);
    double __rint32z (double);
    float __rint64zf (float);
    double __rint64z (double);
    float __rint32xf (float);
    double __rint32x (double);
    float __rint64xf (float);
    double __rint64x (double);

These intrinsics round their floating-point argument to a floating-point
value that would be representable in a 32-bit or 64-bit signed integer
type. Out-of-Range values are forced to the Most Negative Integer
representable in the target size, and an Invalid Operation
Floating-Point Exception is generated. The rounding mode can be either
the ambient rounding mode (for example
<span class="title-ref">\_\_rint32xf</span>) or towards zero (for
example <span class="title-ref">\_\_rint32zf</span>).

These instructions are introduced in the Armv8.5-A extensions
[\[ARMARMv85\]](#ARMARMv85) and are available only in the AArch64
execution state. The intrinsics are available when
<span class="title-ref">\_\_ARM\_FEATURE\_FRINT</span> is defined.

## Random number generation intrinsics

The Random number generation intrinsics provide access to the Random
Number instructions introduced in Armv8.5-A. These intrinsics are only
defined for the AArch64 execution state and are available when
<span class="title-ref">\_\_ARM\_FEATURE\_RNG</span> is defined. :

    int __rndr (uint64_t *);

Stores a 64-bit random number into the object pointed to by the argument
and returns zero. If the implementation could not generate a random
number within a reasonable period of time the object pointed to by the
input is set to zero and a non-zero value is returned. :

    int __rndrrs (uint64_t *);

Reseeds the random number generator. After that stores a 64-bit random
number into the object pointed to by the argument and returns zero. If
the implementation could not generate a random number within a
reasonable period of time the object pointed to by the input is set to
zero and a non-zero value is returned.

These intrinsics have side-effects on the system beyond their results.
Implementations must preserve them even if the results of the intrinsics
are unused.

To access these intrinsics,
<span class="title-ref">\<arm\_acle.h\></span> should be included.

## CRC32 intrinsics

CRC32 intrinsics provide direct access to CRC32 instructions CRC32{C}{B,
H, W, X} in both Armv8 AArch32 and AArch64 execution states. These
intrinsics are available when
<span class="title-ref">\_\_ARM\_FEATURE\_CRC32</span> is defined. :

    uint32_t __crc32b (uint32_t a, uint8_t b);

Performs CRC-32 checksum from bytes. :

    uint32_t __crc32h (uint32_t a, uint16_t b);

Performs CRC-32 checksum from half-words. :

    uint32_t __crc32w (uint32_t a, uint32_t b);

Performs CRC-32 checksum from words. :

    uint32_t __crc32d (uint32_t a, uint64_t b);

Performs CRC-32 checksum from double words. :

    uint32_t __crc32cb (uint32_t a, uint8_t b);

Performs CRC-32C checksum from bytes. :

    uint32_t __crc32ch (uint32_t a, uint16_t b);

Performs CRC-32C checksum from half-words. :

    uint32_t __crc32cw (uint32_t a, uint32_t b);

Performs CRC-32C checksum from words. :

    uint32_t __crc32cd (uint32_t a, uint64_t b);

Performs CRC-32C checksum from double words.

To access these intrinsics,
<span class="title-ref">\<arm\_acle.h\></span> should be included.

## Load/store 64 Byte intrinsics

These intrinsics provide direct access to the Armv8.7-A
<span class="title-ref">LD64B</span>,
<span class="title-ref">ST64B</span>,
<span class="title-ref">ST64BV</span> and
<span class="title-ref">ST64BV0</span> instructions for atomic 64-byte
access to device memory. These intrinsics are available when
<span class="title-ref">\_\_ARM\_FEATURE\_LS64</span> is defined.

The header <span class="title-ref">\<arm\_acle.h\></span> defines these
intrinsics, and also the data type
<span class="title-ref">data512\_t</span> that they use.

The type <span class="title-ref">data512\_t</span> is a 64-byte
structure type containing a single member
<span class="title-ref">val</span> which is an array of 8
<span class="title-ref">uint64\_t</span>, as if declared like this: :

    typedef struct {
        uint64_t val[8];
    } data512_t;

The following intrinsics are defined on this data type. In all cases,
the address <span class="title-ref">addr</span> must be aligned to a
multiple of 64 bytes. :

    data512_t __arm_ld64b(const void *addr);

Loads 64 bytes of data atomically from the address
<span class="title-ref">addr</span>. The address must be in a memory
region that supports 64-byte load/store operations. :

    void __arm_st64b(void *addr, data512_t value);

Stores the 64 bytes in <span class="title-ref">value</span> atomically
to the address <span class="title-ref">addr</span>. The address must be
in a memory region that supports 64-byte load/store operations. :

    uint64_t __arm_st64bv(void *addr, data512_t value);

Attempts to store the 64 bytes in <span class="title-ref">value</span>
atomically to the address <span class="title-ref">addr</span>. It
returns a 64-bit value from the response of the device written to.

    uint64_t __arm_st64bv0(void *addr, data512_t value);

Performs the same operation as
<span class="title-ref">\_\_arm\_st64bv</span>, except that the data
stored to memory is modified by replacing the low 32 bits of
<span class="title-ref">value.val\[0\]</span> with the contents of the
<span class="title-ref">ACCDATA\_EL1</span> system register. The
returned value is the same as for
<span class="title-ref">\_\_arm\_st64bv</span>.

# Custom Datapath Extension

The specification for CDE is in <span class="title-ref">BETA</span>
state and may change or be extended in the future.

The intrinsics in this section provide access to instructions in the
Custom Datapath Extension.

The <span class="title-ref">\<arm\_cde.h\></span> header should be
included before using these intrinsics. The header is available when the
<span class="title-ref">\_\_ARM\_FEATURE\_CDE</span> feature macro is
defined.

The intrinsics are stateless and pure, meaning an implementation is
permitted to discard an invocation of an intrinsic whose result is
unused without considering side-effects.

## CDE intrinsics

The following intrinsics are available when
<span class="title-ref">\_\_ARM\_FEATURE\_CDE</span> is defined. These
intrinsics use the <span class="title-ref">coproc</span> and
<span class="title-ref">imm</span> compile-time constants to generate
the corresponding CDE instructions. The
<span class="title-ref">coproc</span> argument indicates the CDE
coprocessor to use. The range of available coprocessors is indicated by
the bitmap <span class="title-ref">\_\_ARM\_FEATURE\_CDE\_COPROC</span>,
described in [ssec-CDE](#ssec-CDE). The
<span class="title-ref">imm</span> argument must fit within the
immediate range of the corresponding CDE instruction. Values for these
arguments outside these ranges must be rejected.

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

The following intrinsics are also available when
<span class="title-ref">\_\_ARM\_FEATURE\_CDE</span> is defined,
providing access to the CDE instructions that read and write the
floating-point registers:

    uint32_t __arm_vcx1_u32(int coproc, uint32_t imm);
    uint32_t __arm_vcx1a_u32(int coproc, uint32_t acc, uint32_t imm);
    uint32_t __arm_vcx2_u32(int coproc, uint32_t n, uint32_t imm);
    uint32_t __arm_vcx2a_u32(int coproc, uint32_t acc, uint32_t n, uint32_t imm);
    uint32_t __arm_vcx3_u32(int coproc, uint32_t n, uint32_t m, uint32_t imm);
    uint32_t __arm_vcx3a_u32(int coproc, uint32_t acc, uint32_t n, uint32_t m, uint32_t imm);

In addition, the following intrinsics can be used to generate the
D-register forms of the instructions:

    uint64_t __arm_vcx1d_u64(int coproc, uint32_t imm);
    uint64_t __arm_vcx1da_u64(int coproc, uint64_t acc, uint32_t imm);
    uint64_t __arm_vcx2d_u64(int coproc, uint64_t m, uint32_t imm);
    uint64_t __arm_vcx2da_u64(int coproc, uint64_t acc, uint64_t m, uint32_t imm);
    uint64_t __arm_vcx3d_u64(int coproc, uint64_t n, uint64_t m, uint32_t imm);
    uint64_t __arm_vcx3da_u64(int coproc, uint64_t acc, uint64_t n, uint64_t m, uint32_t imm);

The above intrinsics use the <span class="title-ref">uint32\_t</span>
and <span class="title-ref">uint64\_t</span> types as general container
types.

The following intrinsics can be used to generate CDE instructions that
use the MVE Q registers.

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

These intrinsics are polymorphic in the
<span class="title-ref">T</span>, <span class="title-ref">U</span> and
<span class="title-ref">V</span> types, which must be of size 128 bits.
The <span class="title-ref">\_\_arm\_vcx1q\_u8</span>,
<span class="title-ref">\_\_arm\_vcx2q\_u8</span> and
<span class="title-ref">\_\_arm\_vcx3q\_u8</span> intrinsics return a
container vector of 16 bytes that can be reinterpreted to other vector
types as needed using the intrinsics below:

    uint16x8_t __arm_vreinterpretq_u16_u8 (uint8x16_t in);
    int16x8_t __arm_vreinterpretq_s16_u8 (uint8x16_t in);
    uint32x4_t __arm_vreinterpretq_u32_u8 (uint8x16_t in);
    int32x4_t __arm_vreinterpretq_s32_u8 (uint8x16_t in);
    uint64x2_t __arm_vreinterpretq_u64_u8 (uint8x16_t in);
    int64x2_t __arm_vreinterpretq_s64_u8 (uint8x16_t in);
    float16x8_t __arm_vreinterpretq_f16_u8 (uint8x16_t in);
    float32x4_t __arm_vreinterpretq_f32_u8 (uint8x16_t in);
    float64x2_t __arm_vreinterpretq_f64_u8 (uint8x16_t in);

The parameter <span class="title-ref">inactive</span> can be set to an
uninitialized (don't care) value using the MVE
<span class="title-ref">vuninitializedq</span> family of intrinsics.

# Memory tagging intrinsics

The intrinsics in this section provide access to the Memory Tagging
Extension (MTE) introduced with the Armv8.5-A
[\[ARMARMv85\]](#ARMARMv85) architecture.

The <span class="title-ref">\<arm\_acle.h\></span> header should be
included before using these intrinsics.

These intrinsics are expected to be used in system code, including
freestanding environments. As such, implementations must guarantee that
no new linking dependencies to runtime support libraries will occur when
these intrinsics are used.

## Memory tagging

Memory tagging is a lightweight, probabilistic version of a lock and key
system where one of a limited set of lock values can be associated with
the memory locations forming part of an allocation, and the equivalent
key is stored in unused high bits of addresses used as references to
that allocation. On each use of a reference the key is checked to make
sure that it matches with the lock before an access is made.

When allocating memory, programmers must assign a lock to that section
of memory. When freeing an allocation, programmers must change the lock
value so that further referencing using the previous key has a
reasonable probability of failure.

The intrinsics specified below support creation, storage, and retrieval
of the lock values, leaving software to select and set the values on
allocation and deallocation. The intrinsics are expected to help protect
heap allocations.

The lock is referred in the text below as
<span class="title-ref">allocation tag</span> and the key as
<span class="title-ref">logical address tag</span> (or in short
<span class="title-ref">logical tag</span>).

## Terms and implementation details

The memory system is extended with a new physical address space
containing an allocation tag for each 16-byte granule of memory in the
existing data physical address space. All loads and stores to memory
must pass a valid logical address tag as part of the reference. However,
SP- and PC-relative addresses are not checked. The logical tag is held
in the upper bits of the reference. There are 16 available logical tags
that can be used.

## MTE intrinsics

These intrinsics are available when
<span class="title-ref">\_\_ARM\_FEATURE\_MEMORY\_TAGGING</span> is
defined. Type T below can be any type. Where the function return type is
specified as T, the return type is determined from the input argument
which must be also be specified as of type T. If the input argument T
has qualifiers <span class="title-ref">const</span> or
<span class="title-ref">volatile</span>, the return type T will also
have the <span class="title-ref">const</span> or
<span class="title-ref">volatile</span> qualifier. :

    T* __arm_mte_create_random_tag(T* src, uint64_t mask);

This intrinsic returns a pointer containing a randomly created logical
address tag. The first argument is a pointer
<span class="title-ref">src</span> containing an address. The second
argument is a <span class="title-ref">mask</span>, where the lower 16
bits specify logical tags which must be excluded from consideration. The
intrinsic returns a pointer which is a copy of the input address but
also contains a randomly created logical tag (in the upper bits), that
excludes any logical tags specified by the
<span class="title-ref">mask</span>. A
<span class="title-ref">mask</span> of zero excludes no tags. :

    T* __arm_mte_increment_tag(T* src, unsigned offset);

This intrinsic returns a pointer which is a copy of the input pointer
<span class="title-ref">src</span> but with the logical address tag part
offset by a specified offset value. The first argument is a pointer
<span class="title-ref">src</span> containing an address and a logical
tag. The second argument is an offset which must be a compile time
constant value in the range \[0,15\]. The intrinsic adds
<span class="title-ref">offset</span> to the logical tag part of
<span class="title-ref">src</span> returning a pointer with the
incremented logical tag. If adding the offset increments the logical tag
beyond the valid 16 tags, the value is wrapped around. :

    uint64_t __arm_mte_exclude_tag(T* src, uint64_t excluded);

This intrinsic adds a logical tag to the set of excluded logical tags.
The first argument is a pointer <span class="title-ref">src</span>
containing an address and a logical tag. The second argument
<span class="title-ref">excluded</span> is a mask where the lower 16
bits specify logical tags which are in current excluded set. The
intrinsic adds the logical tag of <span class="title-ref">src</span> to
the set specified by <span class="title-ref">excluded</span> and returns
the new excluded tag set. :

    void __arm_mte_set_tag(T* tag_address);

This intrinsic stores an allocation tag, computed from the logical tag,
to the tag memory thereby setting the allocation tag for the 16-byte
granule of memory. The argument is a pointer
<span class="title-ref">tag\_address</span> containing a logical tag and
an address. The address must be 16-byte aligned. The type of the pointer
is ignored (i.e. allocation tag is set only for a single granule even if
the pointer points to a type that is greater than 16 bytes). These
intrinsics generate an unchecked access to memory. :

    T* __arm_mte_get_tag(T* address);

This intrinsic loads the allocation tag from tag memory and returns the
corresponding logical tag as part of the returned pointer value. The
argument is a pointer <span class="title-ref">address</span> containing
an address from which allocation tag memory is read. The pointer
<span class="title-ref">address</span> need not be 16-byte aligned as it
applies to the 16-byte naturally aligned granule containing the
un-aligned pointer. The return value is a pointer whose address part
comes from <span class="title-ref">address</span> and the logical tag
value is the value computed from the allocation tag that was read from
tag memory. :

    ptrdiff_t __arm_mte_ptrdiff(T* a, T* b);

The intrinsic calculates the difference between the address parts of the
two pointers, ignoring the tags. The return value is the sign-extended
result of the computation. The tag bits in the input pointers are
ignored for this operation.

# System register access

## Special register intrinsics

Intrinsics are provided to read and write system and coprocessor
registers, collectively referred to as special register. :

    uint32_t __arm_rsr(const char *special_register);

Reads a 32-bit system register. :

    uint64_t __arm_rsr64(const char *special_register);

Reads a 64-bit system register. :

    void* __arm_rsrp(const char *special_register);

Reads a system register containing an address. :

    float __arm_rsrf(const char *special_register);

Reads a 32-bit coprocessor register containing a floating point value. :

    double __arm_rsrf64(const char *special_register);

Reads a 64-bit coprocessor register containing a floating point value. :

    void __arm_wsr(const char *special_register, uint32_t value);

Writes a 32-bit system register. :

    void __arm_wsr64(const char *special_register, uint64_t value);

Writes a 64-bit system register. :

    void __arm_wsrp(const char *special_register, const void *value);

Writes a system register containing an address. :

    void __arm_wsrf(const char *special_register, float value);

Writes a floating point value to a 32-bit coprocessor register. :

    void __arm_wsrf64(const char *special_register, double value);

Writes a floating point value to a 64-bit coprocessor register.

## Special register designations

The <span class="title-ref">special\_register</span> parameter must be a
compile time string literal. This means that the implementation can
determine the register being accessed at compile-time and produce the
correct instruction without having to resort to self-modifying code. All
register specifiers are case-insensitive (so "apsr" is equivalent to
"APSR"). The string literal should have one of the forms described
below.

### AArch32 32-bit coprocessor register

When specifying a 32-bit coprocessor register to
<span class="title-ref">\_\_arm\_rsr</span>,
<span class="title-ref">\_\_arm\_rsrp</span>,
<span class="title-ref">\_\_arm\_rsrf</span>,
<span class="title-ref">\_\_arm\_wsr</span>,
<span class="title-ref">\_\_arm\_wsrp</span>, or \`\_\_arm\_wsrf\`:

    cp<coprocessor>:<opc1>:c<CRn>:c<CRm>:<opc2>

Or (equivalently):

    p<coprocessor>:<opc1>:c<CRn>:c<CRm>:<opc2>

Where:

>   - <span class="title-ref">\<coprocessor\></span> is a decimal
>     integer in the range <span class="title-ref">\[0, 15\]</span>
>   - <span class="title-ref">\<opc1\></span>,
>     <span class="title-ref">\<opc2\></span> are decimal integers in
>     the range <span class="title-ref">\[0, 7\]</span>
>   - <span class="title-ref">\<CRn\></span>,
>     <span class="title-ref">\<CRm\></span> are decimal integers in the
>     range <span class="title-ref">\[0, 15\]</span>.

The values of the register specifiers will be as described in
[\[ARMARM\]](#ARMARM) or the Technical Reference Manual (TRM) for the
specific processor.

So to read MIDR:

    unsigned int midr = __arm_rsr("cp15:0:c0:c0:0");

ACLE does not specify predefined strings for the system coprocessor
register names documented in the Arm Architecture Reference Manual (for
example “ MIDR ”).

### AArch32 32-bit system register

When specifying a 32-bit system register to
<span class="title-ref">\_\_arm\_rsr</span>,
<span class="title-ref">\_\_arm\_rsrp</span>,
<span class="title-ref">\_\_arm\_wsr</span>, or
<span class="title-ref">\_\_arm\_wsrp</span>, one of:

>   - The values accepted in the
>     <span class="title-ref">spec\_reg</span> field of the MRS
>     instruction [\[ARMARM\]](#ARMARM) (B6.1.5), for example CPSR.
>   - The values accepted in the
>     <span class="title-ref">spec\_reg</span> field of the MSR
>     (immediate) instruction [\[ARMARM\]](#ARMARM) (B6.1.6).
>   - The values accepted in the
>     <span class="title-ref">spec\_reg</span> field of the VMRS
>     instruction [\[ARMARM\]](#ARMARM) (B6.1.14), for example FPSID.
>   - The values accepted in the
>     <span class="title-ref">spec\_reg</span> field of the VMSR
>     instruction [\[ARMARM\]](#ARMARM) (B6.1.15), for example FPSCR.
>   - The values accepted in the
>     <span class="title-ref">spec\_reg</span> field of the MSR and MRS
>     instructions with virtualization extensions [\[ARMARM\]](#ARMARM)
>     (B1.7), for example <span class="title-ref">ELR\_Hyp</span>.
>   - The values specified in Special register encodings used in Armv7-M
>     system instructions. [\[ARMv7M\]](#ARMv7M) (B5.1.1), for example
>     PRIMASK.

### AArch32 64-bit coprocessor register

When specifying a 64-bit coprocessor register to
<span class="title-ref">\_\_arm\_rsr64</span>,
<span class="title-ref">\_\_arm\_rsrf64</span>,
<span class="title-ref">\_\_arm\_wsr64</span>, or \`\_\_arm\_wsrf64\`:

    cp<coprocessor>:<opc1>:c<CRm>

Or (equivalently):

    p<coprocessor>:<opc1>:c<Rm>

Where:

>   - <span class="title-ref">\<coprocessor\></span> is a decimal
>     integer in the range <span class="title-ref">\[0, 15\]</span>
>   - <span class="title-ref">\<opc1\></span> is a decimal integer in
>     the range <span class="title-ref">\[0, 7\]</span>
>   - <span class="title-ref">\<CRm\></span> is a decimal integer in the
>     range <span class="title-ref">\[0, 15\]</span>

### AArch64 system register

When specifying a system register to
<span class="title-ref">\_\_arm\_rsr</span>,
<span class="title-ref">\_\_arm\_rsr64</span>,
<span class="title-ref">\_\_arm\_rsrp</span>,
<span class="title-ref">\_\_arm\_wsr</span>,
<span class="title-ref">\_\_arm\_wsr64</span> or \`\_\_arm\_wsrp\`:

    "o0:op1:CRn:CRm:op2"

Where:

>   - <span class="title-ref">\<o0\></span> is a decimal integer in the
>     range <span class="title-ref">\[0, 1\]</span>
>   - <span class="title-ref">\<op1\></span>,
>     <span class="title-ref">\<op2\></span> are decimal integers in the
>     range <span class="title-ref">\[0, 7\]</span>
>   - <span class="title-ref">\<CRm\></span>,
>     <span class="title-ref">\<CRn\></span> are decimal integers in the
>     range <span class="title-ref">\[0, 15\]</span>

### AArch64 processor state field

When specifying a processor state field to
<span class="title-ref">\_\_arm\_rsr</span>,
<span class="title-ref">\_\_arm\_rsp</span>,
<span class="title-ref">\_\_arm\_wsr</span>, or
<span class="title-ref">\_\_arm\_wsrp</span>, one of the values accepted
in the pstatefield of the MSR (immediate) instruction
[\[ARMARMv8\]](#ARMARMv8) (C5.6.130).

## Coprocessor Intrinsics

### AArch32 coprocessor intrinsics

In the intrinsics below <span class="title-ref">coproc</span>,
<span class="title-ref">opc1</span>,
<span class="title-ref">opc2</span>, <span class="title-ref">CRn</span>
and <span class="title-ref">CRd</span> are all compile time integer
constants with appropriate values as defined by the coprocessor for the
intended architecture.

The argument order for all intrinsics is the same as the operand order
for the instruction as described in the Arm Architecture Reference
Manual, with the exception of <span class="title-ref">MRC</span>/
<span class="title-ref">MRC2</span>/
<span class="title-ref">MRRC</span>/<span class="title-ref">MRRC2</span>
which omit the Arm register arguments and instead returns a value and
<span class="title-ref">MCRR</span>/<span class="title-ref">MCRR2</span>
which accepts a single 64 bit unsigned integer instead of two 32-bit
unsigned integers.

### AArch32 Data-processing coprocessor intrinsics

Intrinsics are provided to create coprocessor data-processing
instructions as follows:

|                                                       |                                        |
| ----------------------------------------------------- | -------------------------------------- |
| **Intrinsics**                                        | **Equivalent Instruction**             |
| void \_\_arm\_cdp(coproc, opc1, CRd, CRn, CRm, opc2)  | CDP coproc, opc1, CRd, CRn, CRm, opc2  |
| void \_\_arm\_cdp2(coproc, opc1, CRd, CRn, CRm, opc2) | CDP2 coproc, opc1, CRd, CRn, CRm, opc2 |

#### AArch32 Memory coprocessor transfer intrinsics

Intrinsics are provided to create coprocessor memory transfer
instructions as follows:

|                                                  |                            |
| ------------------------------------------------ | -------------------------- |
| **Intrinsics**                                   | **Equivalent Instruction** |
| void \_\_arm\_ldc(coproc, CRd, const void\* p)   | LDC coproc, CRd, \[...\]   |
| void \_\_arm\_ldcl(coproc, CRd, const void\* p)  | LDCL coproc, CRd, \[...\]  |
| void \_\_arm\_ldc2(coproc, CRd, const void\* p)  | LDC2 coproc, CRd, \[...\]  |
| void \_\_arm\_ldc2l(coproc, CRd, const void\* p) | LDC2L coproc, CRd, \[...\] |
| void \_\_arm\_stc(coproc, CRd, void\* p)         | STC coproc, CRd, \[...\]   |
| void \_\_arm\_stcl(coproc, CRd, void\* p)        | STCL coproc, CRd, \[...\]  |
| void \_\_arm\_stc2(coproc, CRd, void\* p)        | STC2 coproc, CRd, \[...\]  |
| void \_\_arm\_stc2l(coproc, CRd, void\* p)       | STC2L coproc, CRd, \[...\] |

### AArch32 Integer to coprocessor transfer intrinsics

Intrinsics are provided to map to coprocessor to core register transfer
instructions as follows:

|                                                                   |                                       |
| ----------------------------------------------------------------- | ------------------------------------- |
| **Intrinsics**                                                    | **Equivalent Instruction**            |
| void \_\_arm\_mcr(coproc, opc1, uint32\_t value, CRn, CRm, opc2)  | MCR coproc, opc1, Rt, CRn, CRm, opc2  |
| void \_\_arm\_mcr2(coproc, opc1, uint32\_t value, CRn, CRm, opc2) | MCR2 coproc, opc1, Rt, CRn, CRm, opc2 |
| uint32\_t \_\_arm\_mrc(coproc, opc1, CRn, CRm, opc2)              | MRC coproc, opc1, Rt, CRn, CRm, opc2  |
| uint32\_t \_\_arm\_mrc2(coproc, opc1, CRn, CRm, opc2)             | MRC2 coproc, opc1, Rt, CRn, CRm, opc2 |
| void \_\_arm\_mcrr(coproc, opc1, uint64\_t value, CRm)            | MCRR coproc, opc1, Rt, Rt2, CRm       |
| void \_\_arm\_mcrr2(coproc, opc1, uint64\_t value, CRm)           | MCRR2 coproc, opc1, Rt, Rt2, CRm      |
| uint64\_t \_\_arm\_mrrc(coproc, opc1, CRm)                        | MRRC coproc, opc1, Rt, Rt2, CRm       |
| uint64\_t \_\_arm\_mrrc2(coproc, opc1, CRm)                       | MRRC2 coproc, opc1, Rt, Rt2, CRm      |

The intrinsics
<span class="title-ref">\_\_arm\_mcrr</span>/<span class="title-ref">\_\_arm\_mcrr2</span>
accept a single unsigned 64-bit integer value instead of two 32-bit
integers. The low half of the value goes in register
<span class="title-ref">Rt</span> and the high half goes in
<span class="title-ref">Rt2</span>. Likewise for
<span class="title-ref">\_\_arm\_mrrc</span>/<span class="title-ref">\_\_arm\_mrrc2</span>
which return an unsigned 64-bit integer.

## Unspecified behavior

ACLE does not specify how the implementation should behave in the
following cases:

>   - When merging multiple reads/writes of the same register.
>   - When writing to a read-only register, or a register that is
>     undefined on the architecture being compiled for.
>   - When reading or writing to a register which the implementation
>     models by some other means (this covers – but is not limited to –
>     reading/writing cp10 and cp11 registers when VFP is enabled, and
>     reading/writing the CPSR).
>   - When reading or writing a register using one of these intrinsics
>     with an inappropriate type for the value being read or written to.
>   - When writing to a coprocessor register that carries out a "System
>     operation".
>   - When using a register specifier which doesn't apply to the
>     targetted architecture.

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

Architecture 8 means Armv8-A AArch32 and AArch64, 8-32 means
Armv8-AArch32 only. 8-64 means Armv8-AArch64 only.

Architecture 7 means Armv7-A and Armv7-R.

In the sequence of Arm architectures { 5, 5TE, 6, 6T2, 7 } each
architecture includes its predecessor instruction set.

In the sequence of Thumb-only architectures { 6-M, 7-M, 7E-M } each
architecture includes its predecessor instruction set.

7MP are the Armv7 architectures that implement the Multiprocessing
Extensions.

|                 |           |               |                                                                                             |
| --------------- | --------- | ------------- | ------------------------------------------------------------------------------------------- |
| **Instruction** | **Flags** | **Arch.**     | **Intrinsic or C code**                                                                     |
| BKPT            |           | 5             | none                                                                                        |
| BFC             |           | 6T2, 7-M      | C                                                                                           |
| BFI             |           | 6T2, 7-M      | C                                                                                           |
| CLZ             |           | 5             | <span class="title-ref">\_\_clz,</span> <span class="title-ref">\_\_builtin\_clz</span>     |
| DBG             |           | 7, 7-M        | <span class="title-ref">\_\_dbg</span>                                                      |
| DMB             |           | 8,7, 6-M      | <span class="title-ref">\_\_dmb</span>                                                      |
| DSB             |           | 8, 7, 6-M     | <span class="title-ref">\_\_dsb</span>                                                      |
| FRINT32Z        |           | 8-64          | <span class="title-ref">\_\_rint32zf,</span> <span class="title-ref">\_\_rint32z</span>     |
| FRINT64Z        |           | 8-64          | <span class="title-ref">\_\_rint64zf,</span> <span class="title-ref">\_\_rint64z</span>     |
| FRINT32X        |           | 8-64          | <span class="title-ref">\_\_rint32xf,</span> <span class="title-ref">\_\_rint32x</span>     |
| FRINT64X        |           | 8-64          | <span class="title-ref">\_\_rint64xf,</span> <span class="title-ref">\_\_rint64x</span>     |
| ISB             |           | 8, 7, 6-M     | <span class="title-ref">\_\_isb</span>                                                      |
| LDREX           |           | 6, 7-M        | <span class="title-ref">\_\_sync\_xxx</span>                                                |
| LDRT            |           | all           | none                                                                                        |
| MCR/MRC         |           | all           | see [ssec-sysreg](#ssec-sysreg)                                                             |
| MSR/MRS         |           | 6-M           | see [ssec-sysreg](#ssec-sysreg)                                                             |
| PKHBT           |           | 6             | C                                                                                           |
| PKHTB           |           | 6             | C                                                                                           |
| PLD             |           | 8-32,5TE, 7-M | <span class="title-ref">\_\_pld</span>                                                      |
| PLDW            |           | 7-MP          | <span class="title-ref">\_\_pldx</span>                                                     |
| PLI             |           | 8-32,7        | <span class="title-ref">\_\_pli</span>                                                      |
| QADD            | Q         | 5E, 7E-M      | <span class="title-ref">\_\_qadd</span>                                                     |
| QADD16          |           | 6, 7E-M       | <span class="title-ref">\_\_qadd16</span>                                                   |
| QADD8           |           | 6, 7E-M       | <span class="title-ref">\_\_qadd8</span>                                                    |
| QASX            |           | 6, 7E-M       | <span class="title-ref">\_\_qasx</span>                                                     |
| QDADD           | Q         | 5E, 7E-M      | <span class="title-ref">\_\_qadd(\_\_qdbl)</span>                                           |
| QDSUB           | Q         | 5E, 7E-M      | <span class="title-ref">\_\_qsub(\_\_qdbl)</span>                                           |
| QSAX            |           | 6, 7E-M       | <span class="title-ref">\_\_qsax</span>                                                     |
| QSUB            | Q         | 5E, 7E-M      | <span class="title-ref">\_\_qsub</span>                                                     |
| QSUB16          |           | 6, 7E-M       | <span class="title-ref">\_\_qsub16</span>                                                   |
| QSUB8           |           | 6, 7E-M       | <span class="title-ref">\_\_qsub8</span>                                                    |
| RBIT            |           | 8,6T2, 7-M    | <span class="title-ref">\_\_rbit</span>, <span class="title-ref">\_\_builtin\_rbit</span>   |
| REV             |           | 8,6, 6-M      | <span class="title-ref">\_\_rev</span>, <span class="title-ref">\_\_builtin\_bswap32</span> |
| REV16           |           | 8,6, 6-M      | <span class="title-ref">\_\_rev16</span>                                                    |
| REVSH           |           | 6, 6-M        | <span class="title-ref">\_\_revsh</span>                                                    |
| ROR             |           | all           | <span class="title-ref">\_\_ror</span>                                                      |
| SADD16          | GE        | 6, 7E-M       | <span class="title-ref">\_\_sadd16</span>                                                   |
| SADD8           | GE        | 6, 7E-M       | <span class="title-ref">\_\_sadd8</span>                                                    |
| SASX            | GE        | 6, 7E-M       | <span class="title-ref">\_\_sasx</span>                                                     |
| SBFX            |           | 8,6T2, 7-M    | C                                                                                           |
| SDIV            |           | 7-M+          | C                                                                                           |
| SEL             | (GE)      | 6, 7E-M       | <span class="title-ref">\_\_sel</span>                                                      |
| SETEND          |           | 6             | n/a                                                                                         |
| SEV             |           | 8,6K,6-M,7-M  | <span class="title-ref">\_\_sev</span>                                                      |
| SHADD16         |           | 6, 7E-M       | <span class="title-ref">\_\_shadd16</span>                                                  |
| SHADD8          |           | 6, 7E-M       | <span class="title-ref">\_\_shadd8</span>                                                   |
| SHASX           |           | 6, 7E-M       | <span class="title-ref">\_\_shasx</span>                                                    |
| SHSAX           |           | 6, 7E-M       | <span class="title-ref">\_\_shsax</span>                                                    |
| SHSUB16         |           | 6, 7E-M       | <span class="title-ref">\_\_shsub16</span>                                                  |
| SHSUB8          |           | 6, 7E-M       | <span class="title-ref">\_\_shsub8</span>                                                   |
| SMC             |           | 8,6Z, T2      | none                                                                                        |
| SMI             |           | 6Z, T2        | none                                                                                        |
| SMLABB          | Q         | 5E, 7E-M      | <span class="title-ref">\_\_smlabb</span>                                                   |
| SMLABT          | Q         | 5E, 7E-M      | <span class="title-ref">\_\_smlabt</span>                                                   |
| SMLAD           | Q         | 6, 7E-M       | <span class="title-ref">\_\_smlad</span>                                                    |
| SMLADX          | Q         | 6, 7E-M       | <span class="title-ref">\_\_smladx</span>                                                   |
| SMLAL           |           | all, 7-M      | C                                                                                           |
| SMLALBB         |           | 5E, 7E-M      | <span class="title-ref">\_\_smulbb</span> and C                                             |
| SMLALBT         |           | 5E, 7E-M      | <span class="title-ref">\_\_smulbt</span> and C                                             |
| SMLALTB         |           | 5E, 7E-M      | <span class="title-ref">\_\_smultb</span> and C                                             |
| SMLALTT         |           | 5E, 7E-M      | <span class="title-ref">\_\_smultt</span> and C                                             |
| SMLALD          |           | 6, 7E-M       | <span class="title-ref">\_\_smlald</span>                                                   |
| SMLALDX         |           | 6, 7E-M       | <span class="title-ref">\_\_smlaldx</span>                                                  |
| SMLATB          | Q         | 5E, 7E-M      | <span class="title-ref">\_\_smlatb</span>                                                   |
| SMLATT          | Q         | 5E, 7E-M      | <span class="title-ref">\_\_smlatt</span>                                                   |
| SMLAWB          | Q         | 5E, 7E-M      | <span class="title-ref">\_\_smlawb</span>                                                   |
| SMLAWT          | Q         | 5E, 7E-M      | <span class="title-ref">\_\_smlawt</span>                                                   |
| SMLSD           | Q         | 6, 7E-M       | <span class="title-ref">\_\_smlsd</span>                                                    |
| SMLSDX          | Q         | 6, 7E-M       | <span class="title-ref">\_\_smlsdx</span>                                                   |
| SMLSLD          |           | 6, 7E-M       | <span class="title-ref">\_\_smlsld</span>                                                   |
| SMLSLDX         |           | 6, 7E-M       | <span class="title-ref">\_\_smlsldx</span>                                                  |
| SMMLA           |           | 6, 7E-M       | C                                                                                           |
| SMMLAR          |           | 6, 7E-M       | C                                                                                           |
| SMMLS           |           | 6, 7E-M       | C                                                                                           |
| SMMLSR          |           | 6, 7E-M       | C                                                                                           |
| SMMUL           |           | 6, 7E-M       | C                                                                                           |
| SMMULR          |           | 6, 7E-M       | C                                                                                           |
| SMUAD           | Q         | 6, 7E-M       | <span class="title-ref">\_\_smuad</span>                                                    |
| SMUADX          | Q         | 6, 7E-M       | <span class="title-ref">\_\_smuadx</span>                                                   |
| SMULBB          |           | 5E, 7E-M      | <span class="title-ref">\_\_smulbb;</span> C                                                |
| SMULBT          |           | 5E, 7E-M      | <span class="title-ref">\_\_smulbt</span> ; C                                               |
| SMULTB          |           | 5E, 7E-M      | <span class="title-ref">\_\_smultb;</span> C                                                |
| SMULTT          |           | 5E, 7E-M      | <span class="title-ref">\_\_smultt;</span> C                                                |
| SMULL           |           | all, 7-M      | C                                                                                           |
| SMULWB          |           | 5E, 7E-M      | <span class="title-ref">\_\_smulwb;</span> C                                                |
| SMULWT          |           | 5E, 7E-M      | <span class="title-ref">\_\_smulwt;</span> C                                                |
| SMUSD           |           | 6, 7E-M       | <span class="title-ref">\_\_smusd</span>                                                    |
| SMUSDX          |           | 6, 7E-M       | <span class="title-ref">\_\_smusd</span>                                                    |
| SSAT            | Q         | 6, 7-M        | <span class="title-ref">\_\_ssat</span>                                                     |
| SSAT16          | Q         | 6, 7E-M       | <span class="title-ref">\_\_ssat16</span>                                                   |
| SSAX            | GE        | 6, 7E-M       | <span class="title-ref">\_\_ssax</span>                                                     |
| SSUB16          | GE        | 6, 7E-M       | <span class="title-ref">\_\_ssub16</span>                                                   |
| SSUB8           | GE        | 6, 7E-M       | <span class="title-ref">\_\_ssub8</span>                                                    |
| STREX           |           | 6, 7-M        | <span class="title-ref">\_\_sync\_xxx</span>                                                |
| STRT            |           | all           | none                                                                                        |
| SVC             |           | all           | none                                                                                        |
| SWP             |           | A32 only      | <span class="title-ref">\_\_swp</span> \[deprecated; see [ssec-swap](#ssec-swap)\]          |
| SXTAB           |           | 6, 7E-M       | <span class="title-ref">(int8\_t)x</span> + a                                               |
| SXTAB16         |           | 6, 7E-M       | <span class="title-ref">\_\_sxtab16</span>                                                  |
| SXTAH           |           | 6, 7E-M       | <span class="title-ref">(int16\_t)x</span> + a                                              |
| SXTB            |           | 8,6, 6-M      | <span class="title-ref">(int8\_t)x</span>                                                   |
| SXTB16          |           | 6, 7E-M       | <span class="title-ref">\_\_sxtb16</span>                                                   |
| SXTH            |           | 8,6, 6-M      | <span class="title-ref">(int16\_t)x</span>                                                  |
| UADD16          | GE        | 6, 7E-M       | <span class="title-ref">\_\_uadd16</span>                                                   |
| UADD8           | GE        | 6, 7E-M       | <span class="title-ref">\_\_uadd8</span>                                                    |
| UASX            | GE        | 6, 7E-M       | <span class="title-ref">\_\_uasx</span>                                                     |
| UBFX            |           | 8,6T2, 7-M    | C                                                                                           |
| UDIV            |           | 7-M+          | C                                                                                           |
| UHADD16         |           | 6, 7E-M       | <span class="title-ref">\_\_uhadd16</span>                                                  |
| UHADD8          |           | 6, 7E-M       | <span class="title-ref">\_\_uhadd8</span>                                                   |
| UHASX           |           | 6, 7E-M       | <span class="title-ref">\_\_uhasx</span>                                                    |
| UHSAX           |           | 6, 7E-M       | <span class="title-ref">\_\_uhsax</span>                                                    |
| UHSUB16         |           | 6, 7E-M       | <span class="title-ref">\_\_uhsub16</span>                                                  |
| UHSUB8          |           | 6, 7E-M       | <span class="title-ref">\_\_uhsub8</span>                                                   |
| UMAAL           |           | 6, 7E-M       | C                                                                                           |
| UMLAL           |           | all, 7-M      | <span class="title-ref">acc += (uint64\_t)x \* y</span>                                     |
| UMULL           |           | all, 7-M      | C                                                                                           |
| UQADD16         |           | 6, 7E-M       | <span class="title-ref">\_\_uqadd16</span>                                                  |
| UQADD8          |           | 6, 7E-M       | <span class="title-ref">\_\_uqadd8</span>                                                   |
| UQASX           |           | 6, 7E-M       | <span class="title-ref">\_\_uqasx</span>                                                    |
| UQSAX           |           | 6, 7E-M       | <span class="title-ref">\_\_uqsax</span>                                                    |
| UQSUB16         |           | 6, 7E-M       | <span class="title-ref">\_\_uqsub16</span>                                                  |
| UQSUB8          |           | 6, 7E-M       | <span class="title-ref">\_\_uqsub8</span>                                                   |
| USAD8           |           | 6, 7E-M       | <span class="title-ref">\_\_usad8</span>                                                    |
| USADA8          |           | 6, 7E-M       | <span class="title-ref">\_\_usad8 + acc</span>                                              |
| USAT            | Q         | 6, 7-M        | <span class="title-ref">\_\_usat</span>                                                     |
| USAT16          | Q         | 6, 7E-M       | <span class="title-ref">\_\_usat16</span>                                                   |
| USAX            |           | 6, 7E-M       | <span class="title-ref">\_\_usax</span>                                                     |
| USUB16          |           | 6, 7E-M       | <span class="title-ref">\_\_usub16</span>                                                   |
| USUB8           |           | 6, 7E-M       | <span class="title-ref">\_\_usub8</span>                                                    |
| UXTAB           |           | 6, 7E-M       | <span class="title-ref">(uint8\_t)x + i</span>                                              |
| UXTAB16         |           | 6, 7E-M       | <span class="title-ref">\_\_uxtab16</span>                                                  |
| UXTAH           |           | 6, 7E-M       | <span class="title-ref">(uint16\_t)x + i</span>                                             |
| UXTB16          |           | 6, 7E-M       | <span class="title-ref">\_\_uxtb16</span>                                                   |
| UXTH            |           | 8,6, 6-M      | <span class="title-ref">(uint16\_t)x</span>                                                 |
| VFMA            |           | VFPv4         | <span class="title-ref">fma</span>, <span class="title-ref">\_\_fma</span>                  |
| VSQRT           |           | VFP           | <span class="title-ref">sqrt</span>, <span class="title-ref">\_\_sqrt</span>                |
| WFE             |           | 8,6K, 6-M     | <span class="title-ref">\_\_wfe</span>                                                      |
| WFI             |           | 8,6K, 6-M     | <span class="title-ref">\_\_wfi</span>                                                      |
| YIELD           |           | 8,6K, 6-M     | <span class="title-ref">\_\_yield</span>                                                    |

# Advanced SIMD (Neon) intrinsics

## Introduction

The Advanced SIMD instructions provide packed Single Instruction
Multiple Data (SIMD) and single-element scalar operations on a range of
integer and floating-point types.

Neon is an implementation of the Advanced SIMD instructions which is
provided as an extension for some Cortex-A Series processors. Where this
document refers to Neon instructions, such instructions refer to the
Advanced SIMD instructions as described by the Arm Architecture
Reference Manual [\[ARMARMv8\]](#ARMARMv8).

The Advanced SIMD extension provides for arithmetic, logical and
saturated arithmetic operations on 8-bit, 16-bit and 32-bit integers
(and sometimes on 64-bit integers) and on 32-bit and 64-bit
floating-point data, arranged in 64-bit and 128-bit vectors.

The intrinsics in this section provide C and C++ programmers with a
simple programming model allowing easy access to code-generation of the
Advanced SIMD instructions for both AArch64 and AArch32 execution
states.

### Concepts

The Advanced SIMD instructions are designed to improve the performance
of multimedia and signal processing algorithms by operating on 64-bit or
128-bit *vectors* of *elements* of the same *scalar* data type.

For example, <span class="title-ref">uint16x4\_t</span> is a 64-bit
vector type consisting of four elements of the scalar
<span class="title-ref">uint16\_t</span> data type. Likewise,
<span class="title-ref">uint16x8\_t</span> is a 128-bit vector type
consisting of eight <span class="title-ref">uint16\_t</span> elements.

In a vector programming model, operations are performed in parallel
across the elements of the vector. For example,
<span class="title-ref">vmul\_u16(a, b)</span> is a vector intrinsic
which takes two <span class="title-ref">uint16x4\_t</span> vector
arguments <span class="title-ref">a</span> and
<span class="title-ref">b</span>, and returns the result of multiplying
corresponding elements from each vector together.

The Advanced SIMD extension also provides support for *vector-by-lane*
and *vector-by-scalar* operations. In these operations, a scalar value
is extracted from one element of a vector input, or provided directly,
duplicated to create a new vector with the same number of elements as an
input vector, and an operation is performed in parallel between this new
vector and other input vectors.

For example, <span class="title-ref">vmul\_lane\_u16(a, b, 1)</span>, is
a vector-by-lane intrinsic which takes two
<span class="title-ref">uint16x4\_t</span> vector elements. From
<span class="title-ref">b</span>, element
<span class="title-ref">1</span> is extracted, a new vector is formed
which consists of four copies of <span class="title-ref">b</span>, and
this new vector is multiplied by <span class="title-ref">a</span>.

*Reduction*, *cross-lane*, and *pairwise* vector operations work on
pairs of elements within a vector, or across the whole of a single
vector performing the same operation between elements of that vector.
For example, <span class="title-ref">vaddv\_u16(a)</span> is a reduction
intrinsic which takes a <span class="title-ref">uint16x4\_t</span>
vector, adds each of the four <span class="title-ref">uint16\_t</span>
elements together, and returns a
<span class="title-ref">uint16\_t</span> result containing the sum.

### Vector data types

Vector data types are named as a lane type and a multiple. Lane type
names are based on the types defined in
<span class="title-ref">\<stdint.h\></span>. For example,.
<span class="title-ref">int16x4\_t</span> is a vector of four
<span class="title-ref">int16\_t</span> values. The base types are
<span class="title-ref">int8\_t</span>,
<span class="title-ref">uint8\_t</span>,
<span class="title-ref">int16\_t</span>,
<span class="title-ref">uint16\_t</span>,
<span class="title-ref">int32\_t</span>,
<span class="title-ref">uint32\_t</span>,
<span class="title-ref">int64\_t</span>,
<span class="title-ref">uint64\_t</span>,
<span class="title-ref">float16\_t</span>,
<span class="title-ref">float32\_t</span>,
<span class="title-ref">poly8\_t</span>,
<span class="title-ref">poly16\_t</span>,
<span class="title-ref">poly64\_t</span>,
<span class="title-ref">poly128\_t</span> and
<span class="title-ref">bfloat16\_t</span>. The multiples are such that
the resulting vector types are 64-bit and 128-bit. In AArch64,
<span class="title-ref">float64\_t</span> is also a base type.

Not all types can be used in all operations. Generally, the operations
available on a type correspond to the operations available on the
corresponding scalar type.

ACLE does not define whether <span class="title-ref">int64x1\_t</span>
is the same type as <span class="title-ref">int64\_t</span>, or whether
<span class="title-ref">uint64x1\_t</span> is the same type as
<span class="title-ref">uint64\_t</span>, or whether
<span class="title-ref">poly64x1\_t</span> is the same as
<span class="title-ref">poly64\_t</span> for example for C++ overloading
purposes.

float16 types are only available when the
<span class="title-ref">\_\_fp16</span> type is defined, i.e. when
supported by the hardware.

bfloat types are only available when the
<span class="title-ref">\_\_bf16</span> type is defined, i.e. when
supported by the hardware. The bfloat types are all opaque types. That
is to say they can only be used by intrinsics.

### Advanced SIMD Scalar data types

AArch64 supports Advanced SIMD scalar operations that work on standard
scalar data types viz. <span class="title-ref">int8\_t</span>,
<span class="title-ref">uint8\_t</span>,
<span class="title-ref">int16\_t</span>,
<span class="title-ref">uint16\_t</span>,
<span class="title-ref">int32\_t</span>,
<span class="title-ref">uint32\_t</span>,
<span class="title-ref">int64\_t</span>,
<span class="title-ref">uint64\_t</span>,
<span class="title-ref">float32\_t</span>,
<span class="title-ref">float64\_t.</span>

### Vector array data types

Array types are defined for multiples of 2, 3 or 4 of all the vector
types, for use in load and store operations, in table-lookup operations,
and as the result type of operations that return a pair of vectors. For
a vector type <span class="title-ref">\<type\>\_t</span> the
corresponding array type is
<span class="title-ref">\<type\>x\<length\>\_t</span>. Concretely, an
array type is a structure containing a single array element called val.

For example an array of two <span class="title-ref">int16x4\_t</span>
types is <span class="title-ref">int16x4x2\_t</span>, and is represented
as:

    struct int16x4x2_t { int16x4_t val[2]; };

Note that this array of two 64-bit vector types is distinct from the
128-bit vector type <span class="title-ref">int16x8\_t</span>.

### Scalar data types

For consistency, <span class="title-ref">\<arm\_neon.h\></span> defines
some additional scalar data types to match the vector types.

<span class="title-ref">float32\_t</span> is defined as an alias for
<span class="title-ref">float</span>.

If the <span class="title-ref">\_\_fp16</span> type is defined,
<span class="title-ref">float16\_t</span> is defined as an alias for it.

If the <span class="title-ref">\_\_bf16</span> type is defined,
<span class="title-ref">bfloat16\_t</span> is defined as an alias for
it.

<span class="title-ref">poly8\_t</span>,
<span class="title-ref">poly16\_t</span>,
<span class="title-ref">poly64\_t</span> and
<span class="title-ref">poly128\_t</span> are defined as unsigned
integer types. It is unspecified whether these are the same type as
<span class="title-ref">uint8\_t</span>,
<span class="title-ref">uint16\_t</span>,
<span class="title-ref">uint64\_t</span> and
<span class="title-ref">uint128\_t</span> for overloading and mangling
purposes.

<span class="title-ref">float64\_t</span> is defined as an alias for
<span class="title-ref">double</span>.

### 16-bit floating-point arithmetic scalar intrinsics

The architecture extensions introduced by Armv8.2-A
[\[ARMARMv82\]](#ARMARMv82) provide a set of data processing
instructions which operate on 16-bit floating-point quantities. These
instructions are available in both AArch64 and AArch32 execution states,
for both Advanced SIMD and scalar floating-point values.

ACLE defines two sets of intrinsics which correspond to these data
processing instructions; a set of scalar intrinsics, and a set of vector
intrinsics.

The intrinsics introduced in this section use the data types defined by
ACLE. In particular, scalar intrinsics use the
<span class="title-ref">float16\_t</span> type defined by ACLE as an
alias for the <span class="title-ref">\_\_fp16</span> type, and vector
intrinsics use the <span class="title-ref">float16x4\_t</span> and
<span class="title-ref">float16x8\_t</span> vector types.

Where the scalar 16-bit floating point intrinsics are available, an
implementation is required to ensure that including
<span class="title-ref">\<arm\_neon.h\></span> has the effect of also
including <span class="title-ref">\<arm\_fp16.h\></span>.

To only enable support for the scalar 16-bit floating-point intrinsics,
the header <span class="title-ref">\<arm\_fp16.h\></span> may be
included directly.

### 16-bit brain floating-point arithmetic scalar intrinsics

The architecture extensions introduced by Armv8.6-A
[\[Bfloat16\]](#Bfloat16) provide a set of data processing instructions
which operate on brain 16-bit floating-point quantities. These
instructions are available in both AArch64 and AArch32 execution states,
for both Advanced SIMD and scalar floating-point values.

The brain 16-bit floating-point format (bfloat) differs from the older
16-bit floating-point format (float16) in that the former has an 8-bit
exponent similar to a single-precision floating-point format but has a
7-bit fraction.

ACLE defines two sets of intrinsics which correspond to these data
processing instructions; a set of scalar intrinsics, and a set of vector
intrinsics.

The intrinsics introduced in this section use the data types defined by
ACLE. In particular, scalar intrinsics use the
<span class="title-ref">bfloat16\_t</span> type defined by ACLE as an
alias for the <span class="title-ref">\_\_bf16</span> type, and vector
intrinsics use the <span class="title-ref">bfloat16x4\_t</span> and
<span class="title-ref">bfloat16x8\_t</span> vector types.

Where the 16-bit brain floating point intrinsics are available, an
implementation is required to ensure that including
<span class="title-ref">\<arm\_neon.h\></span> has the effect of also
including <span class="title-ref">\<arm\_bf16.h\></span>.

To only enable support for the 16-bit brain floating-point intrinsics,
the header <span class="title-ref">\<arm\_bf16.h\></span> may be
included directly.

When <span class="title-ref">\_\_ARM\_BF16\_FORMAT\_ALTERNATIVE</span>
is defined to <span class="title-ref">1</span> then these types are
storage only and cannot be used with anything other than ACLE
intrinsics. The underlying type for them is
<span class="title-ref">uint16\_t</span>.

### Operations on data types

ACLE does not define implicit conversion between different data types.
E.g. :

    int32x4_t x;
    uint32x4_t y = x; // No representation change
    float32x4_t z = x; // Conversion of integer to floating type

Is not portable. Use the <span class="title-ref">vreinterpret</span>
intrinsics to convert from one vector type to another without changing
representation, and use the <span class="title-ref">vcvt</span>
intrinsics to convert between integer and floating types; for example:

    int32x4_t x;
    uint32x4_t y = vreinterpretq_u32_s32(x);
    float32x4_t z = vcvt_f32_s32(x);

ACLE does not define static construction of vector types. E.g. :

    int32x4_t x = { 1, 2, 3, 4 };

Is not portable. Use the <span class="title-ref">vcreate</span> or
<span class="title-ref">vdup</span> intrinsics to construct values from
scalars.

In C++, ACLE does not define whether Advanced SIMD data types are POD
types or whether they can be inherited from.

### Compatibility with other vector programming models

ACLE does not specify how the Advanced SIMD Intrinsics interoperate with
alternative vector programming models. Consequently, programmers should
take particular care when combining the Advanced SIMD Intrinsics
programming model with such programming models.

For example, the GCC vector extensions permit initialising a variable
using array syntax, as so :

    #include "arm_neon.h"
    ...
    uint32x2_t x = {0, 1}; // GCC extension.
    uint32_t y = vget_lane_s32 (x, 0); // ACLE Neon Intrinsic.

But the definition of the GCC vector extensions is such that the value
stored in y will depend on both the target architecture (AArch32 or
AArch64) and whether the program is running in big- or little-endian
mode.

It is recommended that Advanced SIMD Intrinsics be used consistently:

    #include "arm_neon.h"
    ...
    const int temp[2] = {0, 1};
    uint32x2_t x = vld1_s32 (temp);
    uint32_t y = vget_lane_s32 (x, 0);

## Availability of Advanced SIMD intrinsics and Extensions

### Availability of Advanced SIMD intrinsics

Advanced SIMD support is available if the
<span class="title-ref">\_\_ARM\_NEON</span> macro is predefined (see
[ssec-NEON](#ssec-NEON)). In order to access the Advanced SIMD
intrinsics, it is necessary to include the
<span class="title-ref">\<arm\_neon.h\></span> header. :

    #if __ARM_NEON
    #include <arm_neon.h>
      /* Advanced SIMD intrinsics are now available to use.  */
    #endif

Some intrinsics are only available when compiling for the AArch64
execution state. This can be determined using the
<span class="title-ref">\_\_ARM\_64BIT\_STATE</span> predefined macro
(see [ssec-ATisa](#ssec-ATisa)).

### Availability of 16-bit floating-point vector interchange types

When the 16-bit floating-point data type
<span class="title-ref">\_\_fp16</span> is available as an interchange
type for scalar values, it is also available in the vector interchange
types <span class="title-ref">float16x4\_t</span> and
<span class="title-ref">float16x8\_t</span>. When the vector interchange
types are available, conversion intrinsics between vector of
<span class="title-ref">\_\_fp16</span> and vector of
<span class="title-ref">float</span> types are provided.

This is indicated by the setting of bit 1 in
<span class="title-ref">\_\_ARM\_NEON\_FP</span> (see
[ssec-NEONfp](#ssec-NEONfp)). :

    #if __ARM_NEON_FP & 0x1
      /* 16-bit floating point vector types are available.  */
      float16x8_t storage;
    #endif

### Availability of fused multiply-accumulate intrinsics

Whenever fused multiply-accumulate is available for scalar operations,
it is also available as a vector operation in the Advanced SIMD
extension. When a vector fused multiply-accumulate is available,
intrinsics are defined to access it.

This is indicated by
<span class="title-ref">\_\_ARM\_FEATURE\_FMA</span> (see
[ssec-FMA](#ssec-FMA)). :

    #if __ARM_FEATURE_FMA
      /* Fused multiply-accumulate intrinsics are available.  */
      float32x4_t a, b, c;
      vfma_f32 (a, b, c);
    #endif

### Availability of Armv8.1-A Advanced SIMD intrinsics

The Armv8.1-A [\[ARMARMv81\]](#ARMARMv81) architecture introduces two
new instructions: SQRDMLAH and SQRDMLSH. ACLE specifies vector and
vector-by-lane intrinsics to access these instructions where they are
available in hardware.

This is indicated by
<span class="title-ref">\_\_ARM\_FEATURE\_QRDMX</span> (see
[ssec-RDM](#ssec-RDM)). :

    #if __ARM_FEATURE_QRDMX
      /* Armv8.1-A RDMA extensions are available.  */
      int16x4_t a, b, c;
      vqrdmlah_s16 (a, b, c);
    #endif

### Availability of 16-bit floating-point arithmetic intrinsics

Armv8.2-A [\[ARMARMv82\]](#ARMARMv82) introduces new data processing
instructions which operate on 16-bit floating point data in the
IEEE754-2008 \[IEEE-FP\] format. ACLE specifies intrinsics which map to
the vector forms of these instructions where they are available in
hardware.

This is indicated by
<span class="title-ref">\_\_ARM\_FEATURE\_FP16\_VECTOR\_ARITHMETIC</span>
(see [ssec-fp16-arith](#ssec-fp16-arith)). :

    #if __ARM_FEATURE_FP16_VECTOR_ARITHMETIC
      float16x8_t a, b;
      vaddq_f16 (a, b);
    #endif

ACLE also specifies intrinsics which map to the scalar forms of these
instructions, see [ssec-fp16-scalar](#ssec-fp16-scalar). Availability of
the scalar intrinsics is indicated by
<span class="title-ref">\_\_ARM\_FEATURE\_FP16\_SCALAR\_ARITHMETIC</span>.
:

    #if __ARM_FEATURE_FP16_SCALAR_ARITHMETIC
      float16_t a, b;
      vaddh_f16 (a, b);
    #endif

### Availability of 16-bit brain floating-point arithmetic intrinsics

Armv8.2-A [\[ARMARMv82\]](#ARMARMv82) introduces new data processing
instructions which operate on 16-bit brain floating point data as
described in the Arm Architecture Reference Manual. ACLE specifies
intrinsics which map to the vector forms of these instructions where
they are available in hardware.

This is indicated by
<span class="title-ref">\_\_ARM\_FEATURE\_BF16\_VECTOR\_ARITHMETIC</span>
(see [ssec-BF16fmt](#ssec-BF16fmt)). :

    #if __ARM_FEATURE_BF16_VECTOR_ARITHMETIC
      float32x2_t res = {0};
      bfloat16x4_t a' = vld1_bf16 (a);
      bfloat16x4_t b' = vld1_bf16 (b);
      res = vdot_bf16 (res, a', b');
    #endif

ACLE also specifies intrinsics which map to the scalar forms of these
instructions, see [ssec-bf16-scalar](#ssec-bf16-scalar). Availability of
the scalar intrinsics is indicated by
<span class="title-ref">\_\_ARM\_FEATURE\_BF16\_SCALAR\_ARITHMETIC</span>.
:

    #if __ARM_FEATURE_BF16_SCALAR_ARITHMETIC
      bfloat16_t a;
      float32_t b = ..;
      a = b<convert> (b);
    #endif

### Availability of Armv8.4-A Advanced SIMD intrinsics

New Crypto and FP16 Floating Point Multiplication Variant instructions
in Armv8.4-A:

>   - New SHA512 crypto instructions (available if
>     <span class="title-ref">\_\_ARM\_FEATURE\_SHA512</span>)
>   - New SHA3 crypto instructions (available if
>     <span class="title-ref">\_\_ARM\_FEATURE\_SHA3</span>)
>   - SM3 crypto instructions (available if
>     <span class="title-ref">\_\_ARM\_FEATURE\_SM3</span>)
>   - SM4 crypto instructions (available if
>     <span class="title-ref">\_\_ARM\_FEATURE\_SM4</span>)
>   - New FML\[A|S\] instructions (available if
>     <span class="title-ref">\_\_ARM\_FEATURE\_FP16\_FML</span>).

These instructions have been backported as optional instructions to
Armv8.2-A and Armv8.3-A.

### Availability of Dot Product intrinsics

The architecture extensions introduced by Armv8.2-A provide a set of dot
product instructions which operate on 8-bit sub-element quantities.
These instructions are available in both AArch64 and AArch32 execution
states using Advanced SIMD instructions. These intrinsics are available
when <span class="title-ref">\_\_ARM\_FEATURE\_DOTPROD</span> is defined
(see [ssec-Dot](#ssec-Dot)). :

    #if __ARM_FEATURE_DOTPROD
      uint8x8_t a, b;
      vdot_u8 (a, b);
    #endif

### Availability of Armv8.5-A floating-point rounding intrinsics

The architecture extensions introduced by Armv8.5-A provide a set of
floating-point rounding instructions that round a floating-point number
to an to a floating-point value that would be representable in a 32-bit
or 64-bit signed integer type. NaNs, Infinities and Out-of-Range values
are forced to the Most Negative Integer representable in the target
size, and an Invalid Operation Floating-Point Exception is generated.
These instructions are available only in the AArch64 execution state.
The intrinsics for these are available when
<span class="title-ref">\_\_ARM\_FEATURE\_FRINT</span> is defined. The
Advanced SIMD intrinsics are specified in the Arm Neon Intrinsics
Reference Architecture Specification [\[Neon\]](#Neon).

### Availability of Armv8.6-A Integer Matrix Multiply intrinsics

The architecture extensions introduced by Armv8.6-A provide a set of
integer matrix multiplication and mixed sign dot product instructions.
These instructions are optional from Armv8.2-A to Armv8.5-A.

These intrinsics are available when
<span class="title-ref">\_\_ARM\_FEATURE\_MATMUL\_INT8</span> is defined
(see [ssec-MatMul](#ssec-MatMul)).

## Specification of Advanced SIMD intrinsics

The Advanced SIMD intrinsics are specified in the Arm Neon Intrinsics
Reference Architecture Specification [\[Neon\]](#Neon).

The behavior of an intrinsic is specified to be equivalent to the
AArch64 instruction it is mapped to in [\[Neon\]](#Neon). Intrinsics are
specified as a mapping between their name, arguments and return values
and the AArch64 instruction and assembler operands which they are
equivalent to.

A compiler may make use of the as-if rule from C [\[C99\]](#C99)
(5.1.2.3) to perform optimizations which preserve the instruction
semantics.

## Undefined behavior

Care should be taken by compiler implementers not to introduce the
concept of undefined behavior to the semantics of an intrinsic. For
example, the <span class="title-ref">vabsd\_s64</span> intrinsic has
well defined behaviour for all input values, while the C99
<span class="title-ref">llabs</span> has undefined behaviour if the
result would not be representable in a <span class="title-ref">long
long</span> type. It would thus be incorrect to implement
<span class="title-ref">vabsd\_s64</span> as a wrapper function or macro
around <span class="title-ref">llabs</span>.

## Alignment assertions

The AArch32 Neon load and store instructions provide for alignment
assertions, which may speed up access to aligned data (and will fault
access to unaligned data). The Advanced SIMD intrinsics do not directly
provide a means for asserting alignment.

# M-profile Vector Extension (MVE) intrinsics

The M-profile Vector Extension (MVE) [\[MVE-spec\]](#MVE-spec)
instructions provide packed Single Instruction Multiple Data (SIMD) and
single-element scalar operations on a range of integer and
floating-point types. MVE can also be referred to as Helium.

The M-profile Vector Extension provides for arithmetic, logical and
saturated arithmetic operations on 8-bit, 16-bit and 32-bit integers
(and sometimes on 64-bit integers) and on 16-bit and 32-bit
floating-point data, arranged in 128-bit vectors.

The intrinsics in this section provide C and C++ programmers with a
simple programming model allowing easy access to the code generation of
the MVE instructions for the Armv8.1-M Mainline architecture.

## Concepts

The MVE instructions are designed to improve the performance of SIMD
operations by operating on 128-bit *vectors* of *elements* of the same
*scalar* data type.

For example, <span class="title-ref">uint16x8\_t</span> is a 128-bit
vector type consisting of eight elements of the scalar
<span class="title-ref">uint16\_t</span> data type. Likewise,
<span class="title-ref">uint8x16\_t</span> is a 128-bit vector type
consisting of sixteen <span class="title-ref">uint8\_t</span> elements.

In a vector programming model, operations are performed in parallel
across the elements of the vector. For example,
<span class="title-ref">vmulq\_u16(a, b)</span> is a vector intrinsic
which takes two <span class="title-ref">uint16x8\_t</span> vector
arguments <span class="title-ref">a</span> and
<span class="title-ref">b</span>, and returns the result of multiplying
corresponding elements from each vector together.

The M-profile Vector Extension also provides support for
*vector-by-scalar* operations. In these operations, a scalar value is
provided directly, duplicated to create a new vector with the same
number of elements as an input vector, and an operation is performed in
parallel between this new vector and other input vectors.

For example, <span class="title-ref">vaddq\_n\_u16(a, s)</span>, is a
vector-by-scalar intrinsic which takes one
<span class="title-ref">uint16x8\_t</span> vector argument and one
<span class="title-ref">uint16\_t</span> scalar argument. A new vector
is formed which consists of eight copies of
<span class="title-ref">s</span>, and this new vector is multiplied by
<span class="title-ref">a</span>.

*Reductions* work across the whole of a single vector performing the
same operation between elements of that vector. For example,
<span class="title-ref">vaddvq\_u16(a)</span> is a reduction intrinsic
which takes a <span class="title-ref">uint16x8\_t</span> vector, adds
each of the eight <span class="title-ref">uint16\_t</span> elements
together, and returns a <span class="title-ref">uint32\_t</span> result
containing the sum. Note the difference in return types between MVE's
<span class="title-ref">vaddvq\_u16</span> and Advanced SIMD's
implementation of the same name intrinsic, MVE returns the
<span class="title-ref">uint32\_t</span> type whereas Advanced SIMD
returns the element type <span class="title-ref">uint16\_t</span>.

*Cross-lane* and *pairwise* vector operations work on pairs of elements
within a vector, sometimes performing the same operation like in the
case of the vector saturating doubling multiply subtract dual returning
high half with exchange <span class="title-ref">vqdmlsdhxq\_s8</span> or
sometimes a different one as is the case with the vector complex
addition intrinsic <span class="title-ref">vcaddq\_rot90\_s8</span>.

Some intrinsics may only read part of the input vectors whereas others
may only write part of the results. For example, the vector multiply
long intrinsics, depending on whether you use
<span class="title-ref">vmullbq\_int\_s32</span> or
<span class="title-ref">vmulltq\_int\_s32</span>, will read the even
(bottom) or odd (top) elements of each
<span class="title-ref">int16x8\_t</span> input vectors, multiply them
and write to a double-width <span class="title-ref">int32x4\_t</span>
vector. In contrast the vector shift right and narrow will read in a
double-width input vector and, depending on whether you pick the bottom
or top variant, write to the even or odd elements of the single-width
result vector. For example, <span class="title-ref">vshrnbq\_n\_s16(a,
b, 2)</span> will take each eight elements of type
<span class="title-ref">int16\_t</span> of argument
<span class="title-ref">b</span>, shift them right by two, narrow them
to eight bits and write them to the even elements of the
<span class="title-ref">int8x16\_t</span> result vector, where the odd
elements are picked from the equally typed
<span class="title-ref">int8x16\_t</span> argument
<span class="title-ref">a</span>.

*Predication*: the M-profile Vector Extension uses vector predication to
allow SIMD operations on selected lanes. The MVE intrinsics expose
vector predication by providing predicated intrinsic variants for
instructions that support it. These intrinsics can be recognized by one
of the four suffixes: \* <span class="title-ref">\_m</span> (merging)
which indicates that false-predicated lanes are not written to and keep
the same value as they had in the first argument of the intrinsic. \*
<span class="title-ref">\_p</span> (predicated) which indicates that
false-predicated lanes are not used in the SIMD operation. For example
<span class="title-ref">vaddvq\_p\_s8</span>, where the false-predicated
lanes are not added to the resulting sum. \*
<span class="title-ref">\_z</span> (zero) which indicates that
false-predicated lanes are filled with zeroes. These are only used for
load instructions. \* <span class="title-ref">\_x</span> (dont-care)
which indicates that the false-predicated lanes have undefined values.
These are syntactic sugar for merge intrinsics with a
<span class="title-ref">vuninitializedq</span> inactive parameter.

These predicated intrinsics can also be recognized by their last
parameter being of type <span class="title-ref">mve\_pred16\_t</span>.
This is an alias for the <span class="title-ref">uint16\_t</span> type.
Some predicated intrinsics may have a dedicated first parameter to
specify the value in the result vector for the false-predicated lanes;
this argument will be of the same type as the result type. For example,
<span class="title-ref">v = veorq\_m\_s8(inactive, a, b, p)</span>, will
write to each of the sixteen lanes of the result vector
<span class="title-ref">v</span>, either the result of the exclusive or
between the corresponding lanes of vectors
<span class="title-ref">a</span> and <span class="title-ref">b</span>,
or the corresponding lane of vector
<span class="title-ref">inactive</span>, depending on whether that lane
is true- or false-predicated in <span class="title-ref">p</span>. The
types of <span class="title-ref">inactive</span>,
<span class="title-ref">a</span>, <span class="title-ref">b</span> and
<span class="title-ref">v</span> are all
<span class="title-ref">int8x16\_t</span> in this case and
<span class="title-ref">p</span> has type
<span class="title-ref">mve\_pred16\_t</span>.

When calling a predicated intrinsic, the predicate mask value should
contain the same value in all bits corresponding to the same element of
an input or output vector. For example, an instruction operating on
32-bit vector elements should have a predicate mask in which each block
of 4 bits is either all 0 or all 1.

    mve_pred16_t mask8 = vcmpeqq_u8 (a, b);
    uint8x16_t r8  = vaddq_m_u8  (inactive, a, b, mask8); // OK
    uint16x8_t r16 = vaddq_m_u16 (inactive, c, d, mask8); // UNDEFINED BEHAVIOR
    mve_pred16_t mask8 = 0x5555;        // Predicate every other byte.
    uint8x16_t r8  = vaddq_m_u8  (inactive, a, b, mask8); // OK
    uint16x8_t r16 = vaddq_m_u16 (inactive, c, d, mask8); // UNDEFINED BEHAVIOR

In cases where the input and output vectors have different sizes (a
widening or narrowing operation), the mask should be consistent with the
largest element size used by the intrinsic. For example,
<span class="title-ref">vcvtbq\_m\_f16\_f32</span> and
<span class="title-ref">vcvtbq\_m\_f32\_f16</span> should *both* be
passed a predicate mask consistent with 32-bit vector lanes.

Users wishing to exploit the MVE architecture's predication behavior in
finer detail than this constraint permits are encouraged to use inline
assembly.

## Scalar shift intrinsics

The M-profile Vector Extension (MVE) also provides a set of scalar shift
instructions that operate on signed and unsigned double-words and
single-words. These shifts can perform additional saturation, rounding,
or both. The ACLE for MVE defines intrinsics for these instructions.

## Namespace

By default all M-profile Vector Extension intrinsics are available with
and without the <span class="title-ref">\_\_arm\_</span> prefix. If the
<span class="title-ref">\_\_ARM\_MVE\_PRESERVE\_USER\_NAMESPACE</span>
macro is defined, the <span class="title-ref">\_\_arm\_</span> prefix is
mandatory. This is available to hide the user-namespace-polluting
variants of the intrinsics.

## Intrinsic polymorphism

The ACLE for the M-profile Vector Extension intrinsics was designed in
such a way that it supports a polymorphic implementation of most
intrinsics. The polymorphic name of an intrinsic is indicated by leaving
out the type suffix enclosed in square brackets, for example the vector
addition intrinsic <span class="title-ref">vaddq\[\_s32\]</span> can be
called using the function name <span class="title-ref">vaddq</span>.
Note that the polymorphism is only possible on input parameter types and
intrinsics with the same name must still have the same number of
parameters. This is expected to aid implementation of the polymorphism
using C11's <span class="title-ref">\_Generic</span> selection.

## Vector data types

Vector data types are named as a lane type and a multiple. Lane type
names are based on the types defined in
<span class="title-ref">\<stdint.h\></span>. For example,.
<span class="title-ref">int16x8\_t</span> is a vector of eight
<span class="title-ref">int16\_t</span> values. The base types are
<span class="title-ref">int8\_t</span>,
<span class="title-ref">uint8\_t</span>,
<span class="title-ref">int16\_t</span>,
<span class="title-ref">uint16\_t</span>,
<span class="title-ref">int32\_t</span>,
<span class="title-ref">uint32\_t</span>,
<span class="title-ref">int64\_t</span>,
<span class="title-ref">uint64\_t</span>,
<span class="title-ref">float16\_t</span> and
<span class="title-ref">float32\_t</span>. The multiples are such that
the resulting vector types are 128-bit.

## Vector array data types

Array types are defined for multiples of 2 and 4 of all the vector
types, for use in load and store operations. For a vector type
<span class="title-ref">\<type\>\_t</span> the corresponding array type
is <span class="title-ref">\<type\>x\<length\>\_t</span>. Concretely, an
array type is a structure containing a single array element called
<span class="title-ref">val</span>.

For example, an array of two <span class="title-ref">int16x8\_t</span>
types is <span class="title-ref">int16x4x8\_t</span>, and is represented
as:

    struct int16x8x2_t { int16x8_t val[2]; };

## Scalar data types

For consistency, <span class="title-ref">\<arm\_mve.h\></span> defines
some additional scalar data types to match the vector types.

<span class="title-ref">float32\_t</span> is defined as an alias for
<span class="title-ref">float</span>,
<span class="title-ref">float16\_t</span> is defined as an alias for
<span class="title-ref">\_\_fp16</span> and
<span class="title-ref">mve\_pred16\_t</span> is defined as an alias for
<span class="title-ref">uint16\_t</span>.

## Operations on data types

ACLE does not define implicit conversion between different data types.
E.g. :

    int32x4_t x;
    uint32x4_t y = x; // No representation change
    float32x4_t z = x; // Conversion of integer to floating type

Is not portable. Use the <span class="title-ref">vreinterpretq</span>
intrinsics to convert from one vector type to another without changing
representation, and use the <span class="title-ref">vcvtq</span>
intrinsics to convert between integer and floating types; for example:

    int32x4_t x;
    uint32x4_t y = vreinterpretq_u32_s32(x);
    float32x4_t z = vcvtq_f32_s32(x);

ACLE does not define static construction of vector types. E.g. :

    int32x4_t x = { 1, 2, 3, 4 };

Is not portable. Use the <span class="title-ref">vcreateq</span> or
<span class="title-ref">vdupq</span> intrinsics to construct values from
scalars.

In C++, ACLE does not define whether MVE data types are POD types or
whether they can be inherited from.

## Compatibility with other vector programming models

ACLE does not specify how the MVE Intrinsics interoperate with
alternative vector programming models. Consequently, programmers should
take particular care when combining the MVE programming model with such
programming models.

For example, the GCC vector extensions permit initialising a variable
using array syntax, as so :

    #include "arm_mve.h"
    ...
    uint32x4_t x = {0, 1, 2, 3}; // GCC extension.
    uint32_t y = vgetq_lane_s32 (x, 0); // ACLE MVE Intrinsic.

But the definition of the GCC vector extensions is such that the value
stored in <span class="title-ref">y</span> will depend on whether the
program is running in big- or little-endian mode.

It is recommended that MVE Intrinsics be used consistently:

    #include "arm_mve.h"
    ...
    const int temp[4] = {0, 1, 2, 3};
    uint32x4_t x = vld1q_s32 (temp);
    uint32_t y = vgetq_lane_s32 (x, 0);

## Availability of M-profile Vector Extension intrinsics

M-profile Vector Extension support is available if the
<span class="title-ref">\_\_ARM\_FEATURE\_MVE</span> macro has a value
other than 0 (see [ssec-MVE](#ssec-MVE)). The availability of the MVE
Floating Point data types and intrinsics are predicated on the value of
this macro having bit two set. In order to access the MVE intrinsics, it
is necessary to include the
<span class="title-ref">\<arm\_mve.h\></span> header. :

    #if (__ARM_FEATURE_MVE & 3) == 3
    #include <arm_mve.h>
      /* MVE integer and floating point intrinsics are now available to use.  */
    #elif __ARM_FEATURE_MVE & 1
    #include <arm_mve.h>
      /* MVE integer intrinsics are now available to use.  */
    #endif

### Specification of M-profile Vector Extension intrinsics

The M-profile Vector Extension intrinsics are specified in the Arm MVE
Intrinsics Reference Architecture Specification [\[MVE\]](#MVE).

The behavior of an intrinsic is specified to be equivalent to the MVE
instruction it is mapped to in [\[MVE\]](#MVE). Intrinsics are specified
as a mapping between their name, arguments and return values and the MVE
instruction and assembler operands which they are equivalent to.

A compiler may make use of the as-if rule from C [\[C99\]](#C99)
(5.1.2.3) to perform optimizations which preserve the instruction
semantics.

### Undefined behavior

Care should be taken by compiler implementers not to introduce the
concept of undefined behavior to the semantics of an intrinsic.

### Alignment assertions

The MVE load and store instructions provide for alignment assertions,
which may speed up access to aligned data (and will fault access to
unaligned data). The MVE intrinsics do not directly provide a means for
asserting alignment.

# Future directions

## Extensions under consideration

### Procedure calls and the Q / GE bits

The Arm procedure call standard [\[AAPCS\]](#AAPCS) says that the Q and
GE bits are undefined across public interfaces, but in practice it is
desirable to return saturation status from functions. There are at least
two common use cases:

To define small (inline) functions defined in terms of expressions
involving intrinsics, which provide abstractions or emulate other
intrinsic families; it is desirable for such functions to have the same
well-defined effects on the Q/GE bits as the corresponding intrinsics.

### DSP library functions

Options being considered are to define an extension to the pcs attribute
to indicate that Q is meaningful on the return, and possibly also to
infer this in the case of functions marked as inline.

### Returning a value in registers

As a type attribute this would allow things like:

    struct __attribute__((value_in_regs)) Point { int x[2]; };

This would indicate that the result registers should be used as if the
type had been passed as the first argument. The implementation should
not complain if the attribute is applied inappropriately (i.e. where
insufficient registers are available) it might be a template instance.

### Custom calling conventions

Some interfaces may use calling conventions that depart from the AAPCS.
Examples include:

Using additional argument registers, for example passing an argument in
R5, R7, R12.

Using additional result registers, for example R0 and R1 for a combined
divide-and-remainder routine (note that some implementations may be able
to support this by means of a value in registers structure return).

Returning results in the condition flags.

Preserving and possibly setting the Q (saturation) bit.

### Traps: system calls, breakpoints, ...

This release of ACLE does not define how to invoke a SVC (supervisor
call), BKPT (breakpoint) and other related functionality.

One option would be to mark a function prototype with an attribute, for
example :

    int __attribute__((svc(0xAB))) system_call(int code, void const \*params);

When calling the function, arguments and results would be marshalled
according to the AAPCS, the only difference being that the call would be
invoked as a trap instruction rather than a branch-and-link.

One issue is that some calls may have non-standard calling conventions.
(For example, Arm Linux system calls expect the code number to be passed
in R7.)

Another issue is that the code may vary between A32 and T32 state. This
issue could be addressed by allowing two numeric parameters in the
attribute.

### Mixed-endian data

Extensions for accessing data in different endianness have been
considered. However, this is not an issue specific to the Arm
architecture, and it seems better to wait for a lead from language
standards.

### Memory access with non-temporal hints

Supporting memory access with cacheability hints through language
extensions is being investigated. Eg. :

    int *__attribute__((nontemporal)) p;

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

# Transactional Memory Extension (TME) intrinsics

## Introduction

This section describes the intrinsics for the instructions of the
Transactional Memory Extension (TME). TME adds support for transactional
execution where transactions are started and committed by a set of new
instructions. The TME instructions are present in the AArch64 execution
state only.

TME is designed to improve performance in cases where larger system
scaling requires atomic and isolated access to data structures whose
composition is dynamic in nature and therefore not readily amenable to
fine-grained locking or lock-free approaches.

TME transactions are *isolated*. This means that transactional stores
are hidden from other observers, and transactional loads cannot see
stores from other observers until the transaction commits. Also, if the
transaction fails then stores to memory and writes to registers by the
transaction are discarded and the processor returns to the state it had
when the transaction started.

TME transactions are *best-effort*. This means that the architecture
does not guarantee success for any transaction. The architecture
requires that all transactions specify a failure handler allowing the
software to fallback to a non-transactional alternative to provide
guarantees of forward progress.

TME defines *flattened nesting* of transactions, where nested
transactions are subsumed by the outer transaction. This means that the
effects of a nested transaction do not become visible to other observers
until the outer transaction commits. When a nested transaction fails it
causes the outer transaction, and all nested transactions within, to
fail.

The TME intrinsics are available when
<span class="title-ref">\_\_ARM\_FEATURE\_TME</span> is defined.

## Failure definitions

Transactions can fail due to various causes. The following macros are
defined to help use or detect these causes. :

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

## Intrinsics

    uint64_t __tstart (void);

Starts a new transaction. When the transaction starts successfully the
return value is 0. If the transaction fails, all state modifications are
discarded and a cause of the failure is encoded in the return value. The
macros defined in [ssec-TMEFailures](#ssec-TMEFailures) can be used to
detect the cause of the failure. :

    void __tcommit (void);

Commits the current transaction. For a nested transaction, the only
effect is that the transactional nesting depth is decreased. For an
outer transaction, the state modifications performed transactionally are
committed to the architectural state. :

    void __tcancel (/*constant*/ uint64_t);

Cancels the current transaction and discards all state modifications
that were performed transactionally. The intrinsic takes a 16-bit
immediate input that encodes the cancellation reason. This input could
be given as

<span class="title-ref">\_\_tcancel (\_TMFAILURE\_RTRY |
(failure\_reason & \_TMFAILURE\_REASON));</span>

if retry is true or

<span class="title-ref">\_\_tcancel (failure\_reason &
\_TMFAILURE\_REASON);</span>

if retry is false. :

    uint64_t __ttest (void);

Tests if executing inside a transaction. If no transaction is currently
executing, the return value is 0. Otherwise, this intrinsic returns the
depth of the transaction.

## Instructions

|                                                    |                      |               |                   |
| -------------------------------------------------- | -------------------- | ------------- | ----------------- |
| **Intrinsics**                                     | **Argument**         | **Result**    | **Instruction**   |
| uint64\_t \_\_tstart (void)                        | \-                   | Xt -\> result | tstart \<Xt\>     |
| void \_\_tcommit (void)                            | \-                   | \-            | tcommit           |
| void \_\_tcancel (/\*constant\*/ uint64\_t reason) | reason -\> \#\<imm\> | \-            | tcancel \#\<imm\> |
| uint64\_t \_\_ttest (void)                         | \-                   | Xt -\> result | ttest \<Xt\>      |

These intrinsics are available when
<span class="title-ref">arm\_acle.h</span> is included.

<div id="citations">

  - <span id="AAPCS" class="citation-label">AAPCS</span>
    Arm, [Application Binary Interface for the Arm
    Architecture](https://developer.arm.com/products/architecture/system-architectures/software-standards/abi)

  - <span id="AAPCS64" class="citation-label">AAPCS64</span>
    Arm, [Application Binary Interface for the Arm
    Architecture](https://developer.arm.com/products/architecture/system-architectures/software-standards/abi)

  - <span id="ARMARM" class="citation-label">ARMARM</span>
    Arm, Arm Architecture Reference Manual (7-A / 7-R), Arm DDI 0406C

  - <span id="ARMARMv8" class="citation-label">ARMARMv8</span>
    Arm, Armv8-A Reference Manual (Issue A.b), Arm DDI0487A.B

  - <span id="ARMARMv81" class="citation-label">ARMARMv81</span>
    Arm, Armv8.1 Extension, [The ARMv8-A architecture and its ongoing
    development](http://community.arm.com/groups/processors/blog/2014/12/02/the-armv8-a-architecture-and-its-ongoing-development)

  - <span id="ARMARMv82" class="citation-label">ARMARMv82</span>
    Arm, Armv8.2 Extension, [Armv8-A architecture
    evolution](https://community.arm.com/groups/processors/blog/2016/01/05/armv8-a-architecture-evolution)

  - <span id="ARMARMv83" class="citation-label">ARMARMv83</span>
    Arm, Armv8.3 Extension, [Armv8-A architecture: 2016
    additions](https://community.arm.com/processors/b/blog/posts/armv8-a-architecture-2016-additions)

  - <span id="ARMARMv84" class="citation-label">ARMARMv84</span>
    Arm, Armv8.4 Extension, [Introducing 2017’s extensions to the Arm
    Architecture](https://community.arm.com/processors/b/blog/posts/introducing-2017s-extensions-to-the-arm-architecture)

  - <span id="ARMARMv85" class="citation-label">ARMARMv85</span>
    Arm, Armv8.5 Extension, [Arm A-Profile Architecture
    Developments 2018:
    Armv8.5-A](https://community.arm.com/developer/ip-products/processors/b/processors-ip-blog/posts/arm-a-profile-architecture-2018-developments-armv85a)

  - <span id="ARMv7M" class="citation-label">ARMv7M</span>
    Arm, Arm Architecture Reference Manual (7-M), Arm DDI 0403C

  - <span id="BA" class="citation-label">BA</span>
    Arm, EABI Addenda and Errata Build Attributes, Arm IHI 0045C

  - <span id="Bfloat16" class="citation-label">Bfloat16</span>
    Arm, [BFloat16 processing for Neural Networks on
    Armv8-A](https://community.arm.com/developer/ip-products/processors/b/ml-ip-blog/posts/bfloat16-processing-for-neural-networks-on-armv8_2d00_a)

  - <span id="C11" class="citation-label">C11</span>
    ISO, Standard C (based on draft N1570), ISO/IEC 9899:2011

  - <span id="C99" class="citation-label">C99</span>
    ISO, Standard C (C99), ISO 9899:1999

  - <span id="CFP15" class="citation-label">CFP15</span>
    ISO/IEC, Floating point extensions for C, ISO/IEC TS 18661-3

  - <span id="CPP11" class="citation-label">CPP11</span>
    ISO, Standard C++ (based on draft N3337), ISO/IEC 14882:2011

  - <span id="G.191" class="citation-label">G.191</span>
    ITU-T, Software Tool Library 2005 User's Manual,
    T-REC-G.191-200508-I

  - <span id="GCC" class="citation-label">GCC</span>
    GNU/FSF, [GNU C Compiler Collection](http://gcc.gnu.org/onlinedocs)

  - <span id="IA-64" class="citation-label">IA-64</span>
    Intel, Intel Itanium Processor-Specific ABI, 245370-003

  - <span id="IEEE-FP" class="citation-label">IEEE-FP</span>
    IEEE, IEEE Floating Point, IEEE 754-2008

  - <span id="MVE" class="citation-label">MVE</span>
    Arm, [MVE
    Intrinsics](https://developer.arm.com/architectures/instruction-sets/simd-isas/helium/mve-intrinsics)

  - <span id="MVE-spec" class="citation-label">MVE-spec</span>
    Arm, Arm v8-M Architecture Reference Manual, Arm DDI0553B.F

  - <span id="Neon" class="citation-label">Neon</span>
    Arm, [Neon
    Intrinsics](https://developer.arm.com/technologies/neon/intrinsics)

  - <span id="POSIX" class="citation-label">POSIX</span>
    IEEE / TOG, The Open Group Base Specifications, IEEE 1003.1

  - <span id="SVE-ACLE" class="citation-label">SVE-ACLE</span>
    Arm, [Arm C Language Extensions for
    SVE](https://developer.arm.com/architectures/system-architectures/software-standards/acle)

  - <span id="Warren" class="citation-label">Warren</span>

    8.  Warren, Hacker's Delight, pub. Addison-Wesley 2003

  - <span id="cxxabi" class="citation-label">cxxabi</span>
    [Itanium C++ ABI](https://itanium-cxx-abi.github.io/cxx-abi/)

</div>
