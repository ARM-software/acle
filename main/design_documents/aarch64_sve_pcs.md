# Design Document for `aarch64_sve_pcs`

The AArch64 ABI specifies a behaviour for functions which take SVE types as
parameters or has them as return values (“SVE-aware functions”). This pushes
the responsibility of preserving the majority of the SVE state onto the callee,
which is in a better position to know if a given register is to be clobbered
and therefore requires preservation. When an SVE-aware function calls an
SVE-unaware function, it is necessary to preserve the whole SVE register state
going into the function, since the use of NEON or floating-point instructions
may clobber the upper bits of the SVE state.

Calling out to instrumentation functions which do not have SVE in their function
signature, for example performance monitoring or printf, causes the whole
register state to be preserved across the call, which requires lots of
additional instructions.

To avoid the cost of preserving the whole SVE register state it is necessary to
have a way of explicitly specifying that a function will take on the
responsibility of preserving the SVE register state across the call.