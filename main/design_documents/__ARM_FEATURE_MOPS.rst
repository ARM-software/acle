=============================================================
Introducing extensions for memcpy family of memory operations
=============================================================

Following the announcement of the `2021 Architecture Extensions
<https://community.arm.com/developer/ip-products/processors/b/processors-ip-blog/posts/arm-a-profile-architecture-developments-2021>`_,
we are proposing these aditions to the ACLE to support the new instructions
that standardise the memcpy family of operations.

Here's the rationale behind the contents:

Feature test macro
##################

In order for users to determine the availability of the memory instructions
introduced in Armv8.8-A and Armv9.3-A, as well of new potential intrinsics
related to them, we are proposing the addition of the following feature test
macro, to be defined to 1 if the new extension is available:

::

  __ARM_FEATURE_MOPS


Intrinsics
##########

Given that the purpose of the memory instructions introduced in Armv8.8-A and
Armv9.3-a is not only optimizing but also standardising the software
implementation of memcpy, memmove and memset operations, the general use of
these instructions should be covered by the code generation of compilers and
library implementations. Therefore, we feel there might be no motivation to
introduce new intrinsics covering this scenario.

Armv8.8-A and Armv9.3-A also introduce a few variations of these memory
instructions covering the following cases:

* Privileged/unprivileged reads and writes.
* Temporal/non-temporal reads and writes.
* Tag setting variation of the memset operation.

Privileged/unprivileged variations
==================================

As the regular usage of the memory instructions is covered by compiler code
generation and library implementation, and intrinsics for unprivileged forms
have the potential of hiding relevant implementation details from the OS,
we feel there is currently no motivation to grant new intrinsics to cover the
privileged/unprivileged variations.

Temporal/non-temporal variations
================================

Currently, in section `15.1.7 ("Memory access with non-temporal hints")
<../acle.rst#Memory access with non-temporal hints>`__, the ACLE mentions that
language extensions to support cacheability hints are currently being
investigated. Introducing new intrinsics for non-temporal memory operations
could overlap with the support under investigation, so we suggest waiting for
the investigation outcomes to provide a coherent solution.

Tag setting memset variation
============================

The ability to tag a memory address during a memset operation is highly useful
for MTE users - for writting a custom allocator, for example. As it's also not
covered by the regular code generation and library flows, we propose the
introduction of a new intrinsic to cover this scenario. We suggest the
following:

::

  void* __arm_mops_memset_tag(void* tagged_address, int value, size_t size)

* ``tagged_address``: destination address to be set, containing the allocation tag in its bits [59:56].
* ``value``: fill value
* ``size``: number of bytes to fill