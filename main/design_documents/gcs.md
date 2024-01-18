# Design Document for GCS

## Feature test

GCS support has three levels:

(1) Code generation is GCS compatible. (Compile time decision.)

(2) HW supports GCS instructions. (Might be known at compile time,
    but this is a runtime feature.)

(3) GCS is enabled at runtime. (Only known at runtime.)

Where (3) implies (1) and (2). In principle a user may decide to
enable GCS even if (1) was false at compile time, but this is
a user error. The runtime system is responsible for enabling GCS
when (1) and (2) holds and GCS protection was requested for the
program.

(1) and (2) need feature test macros since they can be known at
compile time.

(3) can be detected using `__chkfeat(_CHKFEAT_GCS)` which is
available without GCS support.

## Intrinsics

Alternative designs for the support levels at which the intrinsics
are well defined:

(A) require (3),

(B) require (1) and (2) but not (3),

(C) require (2) only.

Simplest is (A), but it does not allow asynchronously disabling GCS,
for that at least (B) is needed since the intrinsics must do something
reasonable if GCS is disabled. Asynchronous disable is e.g. needed to
allow disabling GCS at dlopen time in a multi-threaded process when
the loaded module is not GCS compatible.

(C) is similar to (B) but allows using the intrinsics even if GCS is
guaranteed to be disabled. The intrinsics are expected to be used
behind runtime check for (3) since they don't do anything useful
otherwise and thus (1) and (2) are true when the intrinsics are used
either way. With (B) it is possible to only expose the intrinsics
at compile time if (1) is true which can be feature tested. With (C)
there is no obvious feature test for the presence of the intrinsics.

The future direction is to make intrinsics available unconditionally
and rely on runtime checks (e.g. via function multi-versioning). So
it makes sense to go with (C), have separate semantics defined for
the enabled and disabled case and let user code deal with the runtime
checks.

The type of the intrinsics is based on `const void *` GCS pointer
type and `uint64_t` GCS entry type. The GCS pointer could be
`const uint64_t *`, but void is more general in that it allows
different access to the GCS (e.g. accessing entries as pointers or
bytes). A GCS entry is usually a code pointer, but the architecture
requires it to be 8 bytes (even with ILP32) and it may be a special
token that requires bit operations to detect, so fixed width
unsigned int type is the most appropriate.

The const qualifier is justified for GCS even if GCS stores are
enabled because normal stores cannot modify the GCS only specific
instructions can.
