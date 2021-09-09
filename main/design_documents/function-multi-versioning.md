# Function Multi Versioning support for Arm architectures

Other architectures supports [function multi versioning]
(https://gcc.gnu.org/wiki/FunctionMultiVersioning). This documents presents
the rationale behind the design of the same feature for Arm.
All toolchains and platforms should use the same source code formats to simplify
the development and deployment of software and therefore increase the use of
architectural features. Arm architectures are a bit more complex in view of
feature availability therefore function versions would be better to be bound to
features instead of cpu implementations. Also the kernels may limit the
available features in the user space. Arm architectures are a bit more complex
in view of feature availability therefore function versions would be better to
be bound to features instead of cpu implementations. Also the kernels may limit
the available features in the user space. Function Multi Versioning abbreviated
to FMV.

Why ACLE instead of ABI? FMV does not change how the function behaves from the
ABI perspective. Because the caller does not know which version is actually
called, the following holds for all the function derived from a function via
FMV:

1. the derived function have the same signature of the original function,
2. the derived function obey to the same calling convention of the original
function.

Today the `target` [attribute aarch64](https://gcc.gnu.org/onlinedocs/gcc/AArch64-Function-Attributes.html#AArch64-Function-Attributes>)
is used for many purposes, some of which might overlap the functionality
introduced by FMV. To avoid confusion, we propose the  introduction of the
`target_version` attribute besides the `target_clones` attribute.

The ACLE does not specify the underlying mechanism of the selection and the
dispatching. On an embedded system probably these mechanisms will be implemented
differently than on a desktop operating system. On Linux based systems
mechanisms based on [IFUNC](https://sourceware.org/glibc/wiki/GNU_IFUNC) will
likely be used. Therefore, these mechanisms are left unspecified in the ACLE
because the ACLE should specify the behavior that software could rely on every
implementation.

Feature test macro
##################

In order for users to determine the availability of support in the toolchain,
we propose the following feature test macro, to be
defined to 1 if the support is available:

``` c
  __ARM_FEATURE_FUNCTION_MULTI_VERSIONING
```

Enabling a feature for given function does not enable the related ACLE
functionalities like the intrinsics in the function's scope. That would require
significant amount of changes in the C/C++ preprocessor.

## Attributes

These use cases to be considered:

- The compiler is not aware of the new attributes.

Usually unknown attributes are ignored, but the feature test macro is there to
disable the unwanted code parts.

- FMV aware compiler processes the attributes with newer arch features.

In this case the compiler should ignore the new feature because it won't able to
process it.
