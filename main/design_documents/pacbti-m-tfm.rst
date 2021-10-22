..
   SPDX-FileCopyrightText: Copyright 2021 Tejas Belagod <tejas.belagod@arm.com>

   CC-BY-SA-4.0 AND Apache-Patent-License
   See LICENSE.md file for details

Pointer Authentication(PAC) and Branch Target Identification (BTI) Target Feature Macros.
=========================================================================================

This documents presents the rationale behind introducing the target feature
that identify PAC and BTI extensions. The macros are:

``__ARM_FEATURE_PAUTH`` is defined to 1 if Pointer Authentication extension
is available on the target. It is undefined otherwise.

``__ARM_FEATURE_BTI`` is defined to 1 if Branch Target Identification
extension is available on the target. It is undefined otherwise.

How it differs from the other two macros introduced for PAC and BTI
===================================================================

Defining ``__ARM_FEATURE_PAUTH`` to 1 means that the target supports
instructions like ``PAC``, ``AUT``, ``AUTG`` whereas
``__ARM_FEATURE_PAC_DEFAULT`` means that the compiler has been instructed to
generate the prologue and epilogue sequences that sign and authenticate return
address. ``__ARM_FEATURE_PAUTH`` indicates the compiler has been invoked with
the extension enabled, for example ``-march=armv8.1-m.main+pacbti``, whereas
``__ARM_FEATURE_PAC_DEFAULT`` indicates the compiler has been invoked with
``-mbranch-protection=pac-ret`` which is a code-generation option.

The reason is similar for BTI.

Why it is required to have target feature extension macros
===========================================================

There are scenarios in application code where the programmer has to choose
between using instructions that work on legacy implementations and ones that
don't. For example, on Armv8.1-M Mainline, ``PAC`` is backward compatible with
legacy implementations of the architecture, where the optional ``PACBTI``
extension is not implemented, while ``PACG`` is only available when the extension
is implemented. This target feature macro can be used to determine which
instructions to use according to what's available on the target. If an
application is built to run on legacy and be backward compatible, ``PAC`` can be
used. Contrarily, ``PACG`` can be used only when ``PACBTI`` target extension is
implemented.

Example:
--------

::

  void
  foo ()
  {
  #if __ARM_FEATURE_PAUTH
    asm ("PACG R0, R1, R2");
  #else
    asm ("PAC R12, LR, SP");
  #endif

    ...

  #if __ARM_FEATURE_PAUTH
    asm ("AUTG R0, R1, R2");
  #else
    asm ("AUT R12, LR, SP");
  #endif
  }

A real-world use-case of these macros is in the stack-unwinding runtime for
exceptions where the runtime unwinding is potentially better with ``AUTG``
rather than using ``AUT`` which forces register pressure.
