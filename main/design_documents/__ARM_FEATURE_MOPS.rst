======================================
Design Document for __ARM_FEATURE_MOPS
======================================

Following the announcement of the `2021 Architecture Extensions
<https://community.arm.com/developer/ip-products/processors/b/processors-ip-blog/posts/arm-a-profile-architecture-developments-2021>`_,
we are extending the ACLE to add support for the new instructions that
standardise the memcpy family of operations, which were introduced in Armv8.8-A
and Armv9.3-A.

Feature test macro
##################

In order for users to determine the availability of the memory instructions
introduced in Armv8.8-A and Armv9.3-A, as well of new potential intrinsics
related to them, we are adding of the following feature test macro, to be
defined to 1 if the new extension is available:

::

  __ARM_FEATURE_MOPS


Intrinsics
##########

Given that the purpose of the memory instructions introduced in Armv8.8-A and
Armv9.3-a is not only optimizing but also standardising the software
implementation of memcpy, memmove and memset operations, the general use of
these instructions is covered by the code generation of compilers and library
implementations. Therefore, there is no motivation to introduce new intrinsics
covering this scenario.

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
there is no motivation to grant new intrinsics to cover the privileged/
unprivileged variations.

Temporal/non-temporal variations
================================

Currently, in section `15.1.7 ("Memory access with non-temporal hints")
<../acle.rst#memory-access-with-non-temporal-hints>`_, the ACLE mentions that
language extensions to support cacheability hints are currently being
investigated. Introducing new intrinsics for non-temporal memory operations
overlaps with the support covered by this investigation. We will provide a
coherent solution once that investigation finishes.

Tag setting memset variation
============================

The ability to tag a memory address during a memset operation is highly useful
for MTE users - for writing a custom allocator, for example. As it's also not
covered by the regular code generation and library flows, we are introducing
the following intrinsic to cover this scenario:

::

  void* __arm_mops_memset_tag(void* tagged_address, int value, size_t size)

The parameters of ``__arm_mops_memset_tag`` are:

* ``tagged_address``: destination address to be set, containing the allocation
  tag in its bits [59:56] (See the `SETG* instructions specification
  <https://developer.arm.com/documentation/ddi0596/2021-09/Base-Instructions/SETGP--SETGM--SETGE--Memory-Set-with-tag-setting-?lang=en#sa_xd>`_
  for more details).
* ``value``: fill value
* ``size``: number of bytes to fill