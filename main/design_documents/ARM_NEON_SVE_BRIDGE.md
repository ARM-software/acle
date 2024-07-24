# Design Document for ARM_NEON_SVE_BRIDGE

This document describes the design of the intrinsics defined in
[NEON_SVE Bridge](../acle.md#neon-sve-bridge). These C intrinsics enable the
conversion between NEON and SVE vectors with no performance overhead, and
duplicating NEON vectors across SVE vectors.

## Location

The intrinsics are defined in `arm_neon_sve_bridge.h`. If
`arm_neon_sve_bridge.h` is available on the compiler,
`__ARM_NEON_SVE_BRIDGE` is defined as 1. Users include the NEON/SVE Bridge
as follows:

```
#ifdef __ARM_NEON_SVE_BRIDGE
#include <arm_neon_sve_bridge.h>
#endif //__ARM_NEON_SVE_BRIDGE
```

`arm_neon_sve_bridge.h` includes `arm_neon.h` and `arm_sve.h`.

## Suggestions & Considerations

### Why not enable the extraction of any 128-bit subvector in an SVE vector?

Extracting other 128-bit subvectors goes against the no-op design.
This functionality is already available with the ACLE intrinsic 
`svdupq_lane`. For example:

```
svuint64_t sve_vector_a = ...;
uint64x2_t neon_vec = svget_neonq_u64(svdupq_lane_u64(sve_vector_a, 1));
```

### Why not enable the insertion of a 128-bit NEON vector into a specific SVE subvector?

`arm_sve.h` does not currently provide any intrinsics for inserting individual
elements into a specific lane of an SVE vector. The approach should be
consistent between `arm_sve.h` and `arm_neon_sve_bridge.h`

### Why not include 64-bit Vectors?

Support for 64-bit vectors is not added because of low interest. The
naming scheme is designed to cope with the possibility of supporting these in
the future. The C standard requires a unique function name for each set of
input and return types from these functions. C Generics enable inferring the
intended function from its parameter types, but not from the return type.
Therefore we adopt the NEON convention of using the letter `q` in the name to
indicate a 128-bit vector in the return type, for instance,
`svget_neonq[_u16]`. If 64-bit vectors are added later they will omit the `q`.

#### NEON Vector duplication across all SVE vectors

`svdup_neonq` is added as a convenience function to avoid casting from
NEON to SVE as a separate step when duplicating NEON vectors into SVE vectors.
`svdup_neonq` also prevents initializing non-NEON bits in an SVE vector
and then immediately overriding them with an `svdupq_lane` intrinsic.

### Intrinsic Naming

The intrinsics are named `svset_neonq`, `svget_neonq` and
`svdup_neonq`. These names are taken from `svget/svset[2|3|4]` and 
`svdupq` from the [SVE ACLE specification](https://developer.arm.com/documentation/100987/).
The `q` is from the 64/128 bit naming convention of the 
[NEON](https://github.com/ARM-software/acle/tree/main/neon_intrinsics/)
intrinsics.