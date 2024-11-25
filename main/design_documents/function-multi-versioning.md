<!--
SPDX-FileCopyrightText: Copyright 2022 Arm Limited and/or its affiliates <open-source-office@arm.com>
CC-BY-SA-4.0 AND Apache-Patent-License
See LICENSE.md file for details
-->
# Function Multi Versioning support for Arm architectures

Other architectures supports [Function Multi Versioning (FMV)]
(https://gcc.gnu.org/wiki/FunctionMultiVersioning). This documents presents
the rationale behind the design of the same feature for Arm.

All toolchains and platforms should use the same source code formats to simplify
the development and deployment of software and therefore increase the use of
architectural features. Arm architectures are a bit more complex in view of
feature availability therefore function versions would be better to be bound to
features instead of cpu implementations. Also the kernels may limit the
availability of a features in the user space.

Why is FMV defined in the ACLE instead of the ABI? Because FMV does not change
how the function behaves from the ABI perspective. Because the caller does not
know which version is actually called, the following holds for all the function
derived from a function via FMV:

1. the derived function have the same signature of the original function,
2. the derived function obey to the same calling convention of the original
function.

Currently the `target` [attribute for aarch64](https://gcc.gnu.org/onlinedocs/gcc/AArch64-Function-Attributes.html)
is used for many purposes, some of which might overlap the functionality
introduced by FMV. To avoid confusion, we named the attributes used by FMV with
`target_version` and `target_clones`.

The ACLE does not specify the underlying mechanism of the selection and the
dispatching, but only the expected results of such mechanism. On an embedded
system probably these mechanisms will be implemented differently than on a
desktop operating system. On Linux based systems mechanisms based on
[IFUNC](https://sourceware.org/glibc/wiki/GNU_IFUNC) will likely be used.
Therefore, these mechanisms are left unspecified in the ACLE because the ACLE
should specify the behavior that software could rely on every implementation.

Feature test macro
##################

In order for users to determine the availability of support in the toolchain,
we propose the following feature test macro, to be
defined to 1 if the support is available:

``` c
  __HAVE_FUNCTION_MULTI_VERSIONING
```

Enabling this feature and using one of the attributes on a given function does
not enable the related ACLE feature(s) associated to the `"name"` expressed
in the attribute. That would require significant amount of changes in the
C/C++ preprocessor.

## Attributes

These use cases to be considered:

* *The compiler is not aware of the new attributes:* usually unknown attributes
are ignored, but the feature test macro is there to disable the unwanted code
parts.

* *FMV aware compiler processes the attributes with newer arch features:* in
this case the compiler should ignore the new feature because it won't able to
process it.
