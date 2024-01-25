# FP8 Specifications

## Feature macros

```c
  #define __ARM_FEATURE_FP8 1
  #define __ARM_FEATURE_FP8DOT4 1
  #define __ARM_FEATURE_FP8DOT2 1
  #define __ARM_FEATURE_FP8FMA 1
```

## Data types

Use existing `uint8x16_t`, `svuint8_t` types.
Aliases (for readability and documentation only):

```c
  typedef uint8x8_t   float8x8_t
  typedef uint8x16_t  float8x16_t
  typedef uint8x16_t  float8x16_t;
  typedef svuint8_t   svfloat8_t;
```

## Support macros

These macros help the user construct values for the `FPMR` register.

```c
#define __ARM_FPMR_F8S1_E5M2 0
#define __ARM_FPMR_F8S1_E4M3 1

#define __ARM_FPMR_F8S2_E5M2 0
#define __ARM_FPMR_F8S1_E4M3 (1 << 3)

#define __ARM_FPMR_F8D_E5M2 0
#define __ARM_FPMR_F8D_E4M3 (1 << 6)

#define __ARM_FPRM_OSM_INF 0
#define __ARM_FPRM_OSM_MAX 0 (1 << 14)

#define __ARM_FPRM_OSC_INFNAN 0
#define __ARM_FPRM_OSC_MAX (1 << 15)

#define __ARM_FPRM_LSCALE(v) ((v) << 16)

#define __ARM_FPRM_NSCALE(v) (((v) & 0xff) << 24)

#define __ARM_FPRM_LSCALE2(v) ((uint64_t)(v) << 32)

```

## Intrinsic calls

  All the FP8 intrinsic calls have a `uint64_t fpmr` argument, which controls
  the operaton of this intrinsic call only. The value of the `FPMR` register
  itself is unspecified.

### NEON

#### BF1CVTL, BF2CVTL

8-bit floating-point convert to to BFloat16 (vector, lower)
``` c
  bfloat16x8_t vcvtl1_low_bf16[_f8](float8x8_t vn, uint64_t fpmr);
  bfloat16x8_t vcvtl2_low_bf16[_f8](float8x8_t vn, uint64_t fpmr);
```

#### BF1CVTL2, BF2CVTL2

8-bit floating-point convert to to BFloat16 (vector, upper)
``` c
  bfloat16x8_t vcvtl1_high_bf16[_f8](float8x16_t vn, uint64_t fpmr);
  bfloat16x8_t vcvtl2_high_bf16[_f8](float8x16_t vn, uint64_t fpmr);
```

#### F1CVTL, F2CVTL

8-bit floating-point convert to half-precision (vector, lower)
``` c
  float16x8_t vcvtl1_low_f16[_f8](float8x8_t vn, uint64_t fpmr);
  float16x8_t vcvtl2_low_f16[_f8](float8x8_t vn, uint64_t fpmr);
```

#### F1CVTL2, F2CVTL2

8-bit floating-point convert to half-precision (vector, upper)
``` c
  float16x8_t vcvtl1_high_f16[_f8](float8x16_t vn, uint64_t fpmr);
  float16x8_t vcvtl2_high_f16[_f8](float8x16_t vn, uint64_t fpmr);
```

#### FCVTN (F32 to FP8)

convert each single-precision element to 8-bit floating-point (vector, lower)
``` c
  float8x8_t vcvtn_low_f8[_f32](float32x4_t vn, float32x4_t vm, uint64_t fpmr);
```

#### FCVTN2 (F32 to FP8)

convert each single-precision element to 8-bit floating-point (vector, upper)
``` c
  float8x16_t vcvtn_high_f8[_f32](float32x4_t vn, float32x4_t vm, uint64_t fpmr);
```

#### FCVTN (F16 to FP8)

convert each half-precision element to 8-bit floating-point (vector)
``` c
  float8x8_t vcvtn_f8[_f16](float16x4_t vn, float16x4_t vm, uint64_t fpmr);
```

#### FAMAX

floating-point absolute maximum
``` c
  float16x4_t vfamax_f16[_f16](float16x4_t vn, float16x4_t vm, uint64_t fpmr);
  float16x8_t vfamax_f16[_f16](float16x8_t vn, float16x8_t vm, uint64_t fpmr);

  float32x2_t vfamax_f32[_f32](float32x2_t vn, float32x2_t vm, uint64_t fpmr);
  float32x4_t vfamax_f32[_f32](float32x4_t vn, float32x4_t vm, uint64_t fpmr);
  
  float64x2_t vfamax_f64[_f64](float64x2_t vn, float64x2_t vm, uint64_t fpmr);
```

#### FAMIN

floating-point absolute minimum
``` c
  float16x4_t vfamin_f16[_f16](float16x4_t vn, float16x4_t vm, uint64_t fpmr);
  float16x8_t vfamin_f16[_f16](float16x8_t vn, float16x8_t vm, uint64_t fpmr);

  float32x2_t vfamin_f32[_f32](float32x2_t vn, float32x2_t vm, uint64_t fpmr);
  float32x4_t vfamin_f32[_f32](float32x4_t vn, float32x4_t vm, uint64_t fpmr);
  
  float64x2_t famin_f64[_f64](float64x2_t vn, float64x2_t vm, uint64_t fpmr);
```

#### FDOT (4-way, vector)

8-bit floating-point do product to single-percision
``` c
  float32x2_t vdot_f32[_f8](float8x8_t vn, float8x8_t vm, uint64_t fpmr);
  float32x4_t vdot_f32[_f8](float8x16_t vn, float8x16_t vm, uint64_t fpmr);
```

#### FDOT (4-way, indexed)

8-bit floating-point do product to single-percision
``` c
  float32x2_t vdot_lane_f32[_f8](float8x8_t vn, float8x4_t vm, uint64_t imm0_3, uint64_t fpmr);
  float32x4_t vdot_lane_f32[_f8](float8x16_t vn, float8x4_t vm, uint64_t imm0_3, uint64_t fpmr);
```

#### FDOT (2-way, vector)

8-bit floating-point dot product to half-percision
``` c
  float16x4_t vdot_f16[_f8](float8x8_t vn, float8x8_t vm, uint64_t fpmr);
  float16x8_t vdot_f16[_f8](float8x16_t vn, float8x16_t vm, uint64_t fpmr);
```

#### FDOT (2-way, indexed)

8-bit floating-point dot product to half-percision
``` c
  float16x4_t vdot_lane_f16[_f8](float8x8_t vn, float8x2_t vm, uint64_t imm0_7, uint64_t fpmr);
  float16x8_t vdot_lane_f16[_f8](float8x16_t vn, float8x2_t vm, uint64_t imm0_7, uint64_t fpmr);
```

#### FMLALB (vector)

8-bit floating-point multiply-add long to half-percision
```c
  float16x8_t vmlalb[_f16_f8](float16x8_t vd, float8x16_t vn, float8x16_t vm, uint64_t fpmr);
```

#### FMLALT (vector)

8-bit floating-point multiply-add long to half-percision

```c
  float16x8_t vmlalt[_f16_f8](float16x8_t vd, float8x16_t vn, float8x16_t vm, uint64_t fpmr);
```

#### FMLALB (indexed)

8-bit floating-point multiply-add long to half-percision
```c
  float16x8_t vmlalb_lane[_f16_f8](float16x8_t vd, float8x16_t vn, float8x1_t vm, uint64_t imm0_15, uint64_t fpmr);
```

#### FMLALT (indexed)

8-bit floating-point multiply-add long to half-percision

```c
  float16x8_t vmlalt_lane[_f16_f8](float16x8_t vd, float8x16_t vn, float8x1_t vm, uint64_t imm0_15, uint64_t fpmr);
```

#### FMLALLBB (vector)

8-bit floating-point multiply-add long-long to single-percision

```c
  float32x4_t vmlallbb[_f32_f8](float32x4_t vd, float8x16_t vn, float8x16_t vm, uint64_t fpmr)
```

#### FMLALLBT (vector)

8-bit floating-point multiply-add long-long to single-percision

```c
  float32x4_t vmlallbt[_f32_f8](float32x4_t vd, float8x16_t vn, float8x16_t vm, uint64_t fpmr)
```

#### FMLALLTB (vector)

8-bit floating-point multiply-add long-long to single-percision

```c
  float32x4_t vmlalltb[_f32_f8](float32x4_t vd, float8x16_t vn, float8x16_t vm, uint64_t fpmr)
```

#### FMLALLTT (vector)

8-bit floating-point multiply-add long-long to single-percision

```c
  float32x4_t vmlalltt[_f32_f8](float32x4_t vd, float8x16_t vn, float8x16_t vm, uint64_t fpmr)
```

#### FMLALLBB (indexed)

8-bit floating-point multiply-add long-long to single-percision

```c
  float32x4_t vmlallbb_lane[_f32_f8](float32x4_t vd, float8x16_t vn, float8x16_t vm, uint64_t imm0_15, uint64_t fpmr)
```

#### FMLALLBT (indexed)

8-bit floating-point multiply-add long-long to single-percision

```c
  float32x4_t vmlallbt_lane[_f32_f8](float32x4_t vd, float8x16_t vn, float8x16_t vm, uint64_t imm0_15, uint64_t fpmr)
```

#### FMLALLTB (indexed)

8-bit floating-point multiply-add long-long to single-percision

```c
  float32x4_t vmlalltb_lane[_f32_f8](float32x4_t vd, float8x16_t vn, float8x16_t vm, uint64_t imm0_15, uint64_t fpmr)
```

#### FMLALLTT (indexed)

8-bit floating-point multiply-add long-long to single-percision

```c
  float32x4_t vmlalltt_lane[_f32_f8](float32x4_t vd, float8x16_t vn, float8x16_t vm, uint64_t imm0_15, uint64_t fpmr)
```

#### FSCALE (vector)

floating-point adjust exponent

```c
  float16x4_t vscale_f16[_f16](float16x4_t vn, int16x4_t vm, uint64_t fpmr)
  float16x8_t vscale_f16[_f16](float16x8_t vn, int16x8_t vm, uint64_t fpmr)

  float32x2_t vscale_f32[_f32](float32x2_t vn, int32x2_t vm, uint64_t fpmr)
  float32x4_t vscale_f32[_f32](float32x4_t vn, int32x4_t vm, uint64_t fpmr)

  float64x2_t vscale_f64[_f64](float64x2_t vn, int64x2_t vm, uint64_t fpmr)

```

#### LUTI2

lookup table read with 2-bit indices

```c
  uint8x16_t vluti2_lane_i8[_i8](uint8x16_t vn, uint8x1_t vm, uint64_t imm0_3, uint64_t fpmr)
  uint16x8_t vluti2_lane_i16[_i16](uint16x8_t vn, uint8x1_t vm, uint64_t imm0_7, uint64_t fpmr)

  int8x16_t vluti2_lane_i8[_i8](int8x16_t vn, int8x1_t vm, uint64_t imm0_3, uint64_t fpmr)
  int16x8_t vluti2_lane_i16[_i16](int16x8_t vn, int8x1_t vm, uint64_t imm0_7, uint64_t fpmr)
```

#### LUTI4

lookup table read with 4-bit indices

```c
// One register
  uint8x16_t vluti4_lane_i8[_i8](uint8x16_t vn, uint8x16_t vm, uint64_t imm0_1, uint64_t fpmr)
  int8x16_t vluti4_lane_i8[_i8](int8x16_t vn, int8x16_t vm, uint64_t imm0_1, uint64_t fpmr)
// two consecutive registers
  uint16x8_t vluti4_lane_i16[_i16]_x2(uint16x8_t vn1, uint16x8_t vn2, uint16x8_t vm, uint64_t imm0_3, uint64_t fpmr)
  int16x8_t vluti4_lane_i16[_i16]_x2(int16x8_t vn1, int16x8_t vn2, int16x8_t vm, uint64_t imm0_3, uint64_t fpmr)
```


### SVE

#### BF1CVT, BF2CVT

8-bit floating-point convert to to BFloat16

``` c    
  svbfloat16_t svcvt1_bf16[_f8](svfloat8_t zn, uint64_t fpmr);
  svbfloat16_t svcvt2_bf16[_f8](svfloat8_t zn, uint64_t fpmr);
```

#### BF1CVTLT, BF2CVTLT

8-bit floating-point convert to to BFloat16 (top)

``` c    
  svbfloat16_t svcvtlt1_bf16[_f8](svfloat8_t zn, uint64_t fpmr);
  svbfloat16_t svcvtlt2_bf16[_f8](svfloat8_t zn, uint64_t fpmr);
```

#### BFCVTN

BFloat16 convert, narrow and interleave to 8-bit floating-point.

``` c    
  svfloat8_t svcvtn_f8[_bf16_x2](svbfloat16x2_t zn, uint64_t fpmr);
```

#### F1CVT, F2CVT

8-bit floating-point convert to half-precision.

``` c    
  svfloat16_t svcvt1_f16[_f8](svfloat8_t zn, uint64_t fpmr);
  svfloat16_t svcvt2_f16[_f8](svfloat8_t zn, uint64_t fpmr);
```

#### F1CVTLT, F2CVTLT

8-bit floating-point convert to half-precision (top).

``` c    
  svfloat16_t svcvtlt1_f16[_f8](svfloat8_t zn, uint64_t fpmr);
  svfloat16_t svcvtlt2_f16[_f8](svfloat8_t zn, uint64_t fpmr);
```

#### FCVTN

Half-precision convert, narrow and interleave to 8-bit floating-point.

``` c    
  svfloat8_t svcvtn_f8[_f16_x2](svfloat16x2_t zn, uint64_t fpmr);
```

#### FCVTNT, FCVTNB

Single-precision convert, narrow and interleave to 8-bit floating-point (top and bottom).

``` c    
  svfloat8_t svcvtnt_f8[_f32_x2](svfloat32x2_t zn, uint64_t fpmr);
  svfloat8_t svcvtnb_f8[_f32_x2](svfloat32x2_t zn, uint64_t fpmr);
```

#### FDOT (4-way, vectors)

8-bit floating-point dot product to single-precision

``` c
  svfloat32_t svdot[_f32_f8](svfloat32_t zda ,svfloat8_t zn, svfloat8_t zm, uint64_t fpmr);
```

#### FDOT (4-way, indexed)

8-bit floating-point indexed dot product to single-precision

``` c
  svfloat32_t svdot_lane[_f32_f8](svfloat32_t zda, svfloat8_t zn, svfloat8_t zm, uint64_t imm0_3, uint64_t fpmr);
```

#### FDOT (2-way, vectors, FP8 to FP16)

8-bit floating-point dot product to half-precision.

``` c
  svfloat16_t svdot[_f16_f8](svfloat16_t zda, svfloat8_t zn, svfloat8_t zm, uint64_t fpmr);
```

#### FDOT (2-way, indexed, FP8 to FP16)

8-bit floating-point dot product to half-precision.

``` c
  svfloat16_t svdot_lane[_f16_f8](svfloat16_t zda, svfloat8_t zn, svfloat8_t zm, uint64_t imm0_7, uint64_t fpmr);
```

#### FMLALB (vectors, FP8 to FP16)

8-bit floating-point multiply-add long to half-precision (bottom).

``` c
  svfloat16_t svmlalb[_f16_f8](svfloat16_t zda, svfloat8_t zn, svfloat8_t zm, uint16_t fpmr);
  svfloat16_t svmlalb[_n_f16_f8](svfloat16_t zda, svfloat8_t zn, float8_t zm, uint16_t fpmr);
```

#### FMLALB (indexed, FP8 to FP16)

8-bit floating-point multiply-add long to half-precision (bottom, indexed).

``` c
  svfloat16_t svmlalb_lane[_f16_f8](svfloat16_t zda, svfloat8_t zn, svfloat8_t zm, uint64_t imm0_15, uint16_t fpmr);
```

#### FMLALLBB (vectors)

8-bit floating-point multiply-add long long to single-precision (bottom bottom).

``` c
  svfloat32_t svmlallbb[_f32_f8](svfloat32_t zda, svfloat8_t zn, svfloat8_t zm, uint64_t fpmr);
  svfloat32_t svmlallbb[_n_f32_f8](svfloat32_t zda, svfloat8_t zn, float8_t zm, uint64_t fpmr);
```

#### FMLALLBB (indexed)

8-bit floating-point multiply-add long long to single-precision (bottom bottom, indexed).

``` c
  svfloat32_t svmlallbb_lane[_f32_f8](svfloat32_t zda, svfloat8_t zn, svfloat8_t zm, uint64_t imm0_15, uint64_t fpmr);
```

#### FMLALLBT (vectors)

8-bit floating-point multiply-add long long to single-precision (bottom top).

``` c
  svfloat32_t svmlallbt[_f32_f8](svfloat32_t zda, svfloat8_t zn, svfloat8_t zm, uint64_t fpmr);
  svfloat32_t svmlallbt[_n_f32_f8](svfloat32_t zda, svfloat8_t zn, float8_t zm, uint64_t fpmr);
```

#### FMLALLBT (indexed)

8-bit floating-point multiply-add long long to single-precision (bottom top, indexed).

``` c
  svfloat32_t svmlallbt_lane[_f32_f8](svfloat32_t zda, svfloat8_t zn, svfloat8_t zm, uint64_t imm0_15, uint64_t fpmr);
```


#### FMLALLTB (vectors)

8-bit floating-point multiply-add long long to single-precision (top bottom).

``` c
  svfloat32_t svmlalltb[_f32_f8](svfloat32_t zda, svfloat8_t zn, svfloat8_t zm, uint64_t fpmr);
  svfloat32_t svmlalltb[_n_f32_f8](svfloat32_t zda, svfloat8_t zn, float8_t zm, uint64_t fpmr);
```

#### FMLALLTB (indexed)

8-bit floating-point multiply-add long long to single-precision (top bottom, indexed).

``` c
  svfloat32_t svmlalltb_lane[_f32_f8](svfloat32_t zda, svfloat8_t zn, svfloat8_t zm, uint64_t imm0_15, uint64_t fpmr);
```

#### FMLALLTT (vectors)

8-bit floating-point multiply-add long long to single-precision (top top).

``` c
  svfloat32_t svmlalltt[_f32_f8](svfloat32_t zda, svfloat8_t zn, svfloat8_t zm, uint64_t fpmr);
  svfloat32_t svmlalltt[_n_f32_f8](svfloat32_t zda, svfloat8_t zn, float8_t zm, uint64_t fpmr);
```

#### FMLALLTT (indexed)

8-bit floating-point multiply-add long long to single-precision (top top, indexed).

``` c
  svfloat32_t svmlalltt_lane[_f32_f8](svfloat32_t zda, svfloat8_t zn, svfloat8_t zm, uint64_t imm0_15, uint64_t fpmr);
```

#### FMLALT (vectors, FP8 to FP16)

8-bit floating-point multiply-add long to half-precision (top).

```c
  svfloat16_t svmlalt[_f16_f8](svfloat16_t zda, svfloat8_t zn, svfloat8_t zm, uint64_t fpmr);
  svfloat16_t svmlalt[_n_f16_f8](svfloat16_t zda, svfloat8_t zn, float8_t zm, uint64_t fpmr);
```

#### FMLALT (indexed, FP8 to FP16)

8-bit floating-point multiply-add long to half-precision (top, indexed).

```c
  svfloat16_t svmlalt_lane[_f16_f8](svfloat16_t zda, svfloat8_t zn, svfloat8_t zm, uint64_t imm0_15, uint64_t fpmr);
```

#### FAMAX

Floating-point absolute maximum (predicated)

``` c
  // Variants are also available for _f32 and _f64
  svfloat16_t svamax[_f16]_m(svbool_t pg, svfloat16_t zn, svfloat16_t zm) __arm_streaming_compatible;
  svfloat16_t svamax[_f16]_x(svbool_t pg, svfloat16_t zn, svfloat16_t zm) __arm_streaming_compatible;
  svfloat16_t svamax[_f16]_z(svbool_t pg, svfloat16_t zn, svfloat16_t zm) __arm_streaming_compatible;

  svfloat16_t svamax[_n_f16]_m(svbool_t pg, svfloat16_t zn, float16_t zm) __arm_streaming_compatible;
  svfloat16_t svamax[_n_f16]_x(svbool_t pg, svfloat16_t zn, float16_t zm) __arm_streaming_compatible;
  svfloat16_t svamax[_n_f16]_z(svbool_t pg, svfloat16_t zn, float16_t zm) __arm_streaming_compatible;
```

#### FAMIN

Floating-point absolute minimum (predicated)

``` c
  // Variants are also available for _f32 and _f64
  svfloat16_t svamin[_f16]_m(svbool_t pg, svfloat16_t zn, svfloat16_t zm) __arm_streaming_compatible;
  svfloat16_t svamin[_f16]_x(svbool_t pg, svfloat16_t zn, svfloat16_t zm) __arm_streaming_compatible;
  svfloat16_t svamin[_f16]_z(svbool_t pg, svfloat16_t zn, svfloat16_t zm) __arm_streaming_compatible;

  svfloat16_t svamin[_n_f16]_m(svbool_t pg, svfloat16_t zn, float16_t zm) __arm_streaming_compatible;
  svfloat16_t svamin[_n_f16]_x(svbool_t pg, svfloat16_t zn, float16_t zm) __arm_streaming_compatible;
  svfloat16_t svamin[_n_f16]_z(svbool_t pg, svfloat16_t zn, float16_t zm) __arm_streaming_compatible;
```


### SME2

#### SME2 and FP8 functions

The functions in this section are defined by the header file
 [`<arm_sme.h>`](#arm_sme.h) when `__ARM_FEATURE_SME2` and
`__ARM_FEATURE_FP8` are defined.

#### SME2 and FP8 data-processing instructions.

##### F1CVT/F2CVT

8-bit floating-point convert to half-precision or BFloat16

``` c 
  // Variants are also available for: _bf16[_f8]_x2
  svfloat16x2_t svcvt1_f16[_f8]_x2(svfloat8_t zn, uint64_t fpmr) __arm_streaming;
  svfloat16x2_t svcvt2_f16[_f8]_x2(svfloat8_t zn, uint64_t fpmr) __arm_streaming;
```

##### F1CVTL/F2CVTL

8-bit floating-point convert to deinterleave half-precision or BFloat16

``` c 
  // Variants are also available for: _bf16[_f8]_x2
  svfloat16x2_t svcvtl1_f16[_f8]_x2(svfloat8_t zn, uint64_t fpmr) __arm_streaming;
  svfloat16x2_t svcvtl2_f16[_f8]_x2(svfloat8_t zn, uint64_t fpmr) __arm_streaming;
```

##### FCVT

Convert to packed 8-bit floating-point format

``` c 
  // Variants are also available for: _f8[_bf16_x2], _f8[_f32_x4]
  svfloat8_t svcvt_f8[_f16_x2](svfloat16x2_t zn, uint64_t fpmr) __arm_streaming;
```

##### FCVTN 

Convert to interleaved 8-bit floating-point format

``` c 
  svfloat8_t svcvtn_f8[_f32_x4](svfloat32x4_t zn, uint64_t fpmr) __arm_streaming;
```

##### FSCALE

``` c
  // Variants are also available for:
  // [_single_f32_x2], [_single_f64_x2],
  // [_single_f16_x4], [_single_f32_x4], [_single_f64_x4]
  svfloat16x2_t svscale[_single_f16_x2](svfloat16x2_t zd, svfloat16_t zm) __arm_streaming;
 
  // Variants are also available for:
  //  [_f32_x2], [_f64_x2],
  //  [_f16_x4], [_f32_x4], [_f64_x4] 
  svfloat16x2_t svscale[_f16_x2](svfloat16x2_t zd, svfloat16x2_t zm) __arm_streaming;
```

#### SME2 and FAMINMAX functions

The functions in this section are defined by the header file
 [`<arm_sme.h>`](#arm_sme.h) when `__ARM_FEATURE_SME2` and
`__ARM_FEATURE_FAMINMAX` are defined.

##### SME2 and FAMINMAX data-processing instructions.

##### FAMAX, FAMIN

Absolute maximum

``` c
  // Variants are also available for:
  //  [_f32_x2], [_f64_x2],
  //  [_f16_x4], [_f32_x4], [_f64_x4]
  svfloat16x2_t svamax[_f16_x2](svfloat16x2 zd, svfloat16x2_t zm) __arm_streaming;
  svfloat16x2_t svamin[_f16_x2](svfloat16x2 zd, svfloat16x2_t zm) __arm_streaming;
```

#### SME2 and SME_LUTv2 data-processing instructions.

The functions in this section are defined by the header file
 [`<arm_sme.h>`](#arm_sme.h) when `__ARM_FEATURE_SME2` and
`__ARM_FEATURE_SME_LUTv2` are defined.

##### MOVT

Move vector register to ZT0

``` c
  // Variants are also available for:
  // [_s8], [_u16], [_s16], [_u32], [_s32], [_u64], [_s64]
  //[_bf16], [_f16], [_f32], [_f64]
  void svmovt_lane_zt[_u8](uint64_t zt0, svuint8_t zt, uint64_t idx) __arm_streaming;
```

##### LUTI4

Lookup table read with 4-bit indexes and 8-bit elements

``` c
  // Variants are also available for in SME2:
  //  _u8, _u16, _s16, _u32, _s32, _u64, _s64,
  // _bf16, _f16, _f32, _f64
  svint8x4_t svluti4_zt_s8[_s8]_x4(uint64_t zt0, svint8x2_t zn) __arm_streaming;

  // Variants are also available for in SME2.1:
  //  _u8, _u16, _s16, _u32, _s32, _u64, _s64,
  // _bf16, _f16, _f32, _f64
  svint8x4_t svluti4_stride_zt_s8[_s8]_x4(uint64_t zt0, svint8x2_t zn) __arm_streaming;
```

##### SMEFP8F16  data-processing instructions

The instructions in this section are available when __ARM_FEATURE_F8F16 is
non-zero.

##### FVDOT
Multi-vector 8-bit floating-point vertical dot-product by indexed element to half-precision

``` c
  void svvdot_lane_za16[_f8]_vg1x2(uint32_t slice, svfloat8x2_t zn,
                                   svfloat8_t zm, uint64_t imm_idx,
                                   uint64_t fpmr)  __arm_streaming __arm_shared_za;
```

##### FDOT

Multi-vector 8-bit floating-point dot-product

``` c
  void svdot_lane_za16[_f8]_vg1x2(uint32_t slice, svfloat8x2_t zn,
                                  svfloat8_t zm, uint64_t imm_idx,
                                   uint64_t fpmr)  __arm_streaming __arm_shared_za;

  void svdot_lane_za16[_f8]_vg1x4(uint32_t slice, svfloat8x4_t zn,
                                  svfloat8_t zm, uint64_t imm_idx,
                                   uint64_t fpmr) __arm_streaming __arm_shared_za;

  void svdot[_single]_za16[_f8]_vg1x2(uint32_t slice, svfloat8x2_t zn,
                                      svfloat8_t zm, uint64_t fpmr) __arm_streaming __arm_shared_za;

  void svdot[_single]_za16[_f8]_vg1x4(uint32_t slice, svfloat8x4_t zn,
                                      svfloat8_t zm, uint64_t fpmr) __arm_streaming __arm_shared_za;

  void svdot_za16[_f8]_vg1x2(uint32_t slice, svfloat8x2_t zn, svfloat8x2_t zm,
                             uint64_t fpmr) __arm_streaming __arm_shared_za;

  void svdot_za16[_f8]_vg1x4(uint32_t slice, svfloat8x4_t zn, svfloat8x4_t zm,
                             uint64_t fpmr)  __arm_streaming __arm_shared_za;
```

##### FMLAL

Multi-vector 8-bit floating-point multiply-add long

``` c
  void svmlal_lane_za16[_f8]_vg1x1(uint32_t slice, svfloat8_t zn,
                                  svfloat8_t zm, uint64_t imm_idx,
                                  uint64_t fpmr)  __arm_streaming __arm_shared_za;

  void svmlal_lane_za16[_f8]_vg1x2(uint32_t slice, svfloat8x2_t zn,
                                  svfloat8_t zm, uint64_t imm_idx,
                                 uint64_t fpmr)  __arm_streaming __arm_shared_za;

  void svmlal_lane_za16[_f8]_vg1x4(uint32_t slice, svfloat8x4_t zn,
                                  svfloat8_t zm, uint64_t imm_idx
                                  uint64_t fpmr) __arm_streaming __arm_shared_za;

  void svmlal[_single]_za16[_f8]_vg1x1(uint32_t slice, svfloat8_t zn,
                                      svfloat8_t zm, uint64_t fpmr)
    __arm_streaming __arm_shared_za;

  void svmlal[_single]_za16[_f8]_vg1x2(uint32_t slice, svfloat8x2_t zn,
                                      svfloat8_t zm, uint64_t fpmr)
   __arm_streaming __arm_shared_za;

  void svmlal[_single]_za16[_f8]_vg1x4(uint32_t slice, svfloat8x4_t zn,
                                      svfloat8_t zm, uint64_t fpmr) __arm_streaming __arm_shared_za;

  void svmlal_za16[_f8]_vg1x2(uint32_t slice, svfloat8x2_t zn, svfloat8x2_t zm,
                              uint64_t fpmr) __arm_streaming __arm_shared_za;

  void svmlal_za16[_f8]_vg1x4(uint32_t slice, svfloat8x4_t zn, svfloat8x4_t zm,
                             uint64_t fpmr) __arm_streaming __arm_shared_za; 
```

##### FMOPA

8-bit floating-point sum of outer products and accumulate

``` c
    void svmopa_za16[_f8]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                           svfloat8_t zn, svfloat8_t zm, uint64_t fpmr) __arm_streaming __arm_shared_za;
```

##### SMEF8F32  data-processing instructions

The instructions in this section are available when __ARM_FEATURE_F8F32 is
non-zero.

##### FDOT
Multi-vector 8-bit floating-point dot-product

``` c
  void svdot_lane_za32[_f8]_vg1x2(uint32_t slice, svfloat8x2_t zn,
                                  svfloat8_t zm, uint64_t imm_idx,
                                  uint64_t fpmr) __arm_streaming __arm_shared_za;

  void svdot[_single]_za32[_f8]_vg1x4(uint32_t slice, svfloat8x4_t zn,
                                      svfloat8_t zm, int64_t fpmr)
   __arm_streaming __arm_shared_za;

  void svdot_za32[_f8]_vg1x2(uint32_t slice, svfloat8x2_t zn, svfloat8x2_t zm,
                              uint64_t fpmr) __arm_streaming __arm_shared_za;

  void svdot_za32[_f8]_vg1x4(uint32_t slice, svfloat8x4_t zn, svfloat8x4_t zm,
                               uint64_t fpmr)__arm_streaming __arm_shared_za;
```

##### FVDOTB and FVDOTT

Multi-vector 8-bit floating-point vertical dot-product

``` c
  void svvdot_top_lane_za32[_f8]_vg1x2(uint32_t slice, svfloat8x2_t zn,
                                     svfloat8_t zm, uint64_t imm_idx,
                                     uint64_t fpmr) __arm_streaming __arm_shared_za; 

  void svvdot_bottom_lane_za32[_f8]_vg1x4(uint32_t slice, svfloat8x4_t zn,
                                         svfloat8_t zm, uint64_t imm_idx,
                                         uint64_t fpmr) __arm_streaming __arm_shared_za;
``` 

##### FMLAL

Multi-vector 8-bit floating-point multiply-add long

``` c
  void svmlal_lane_za32[_f8]_vg1x1(uint32_t slice, svfloat8_t zn,
                                  svfloat8_t zm, uint64_t imm_idx,
                                  uint64_t fpmr)__arm_streaming __arm_shared_za;

  void svmlal_lane_za32[_f8]_vg1x2(uint32_t slice, svfloat8x2_t zn,
                                  svfloat8_t zm, uint64_t imm_idx,
                                  uint64_t fpmr)__arm_streaming __arm_shared_za;

  void svmlal_lane_za32[_f8]_vg1x4(uint32_t slice, svfloat8x4_t zn,
                                  svfloat8_t zm, uint64_t imm_idx,
                                  uint64_t fpmr)__arm_streaming __arm_shared_za;

  void svmlal[_single]_za32[_f8]_vg1x1(uint32_t slice, svfloat8_t zn,
                                      float8_t zm, uint64_t fpmr)
  __arm_streaming __arm_shared_za;

  void svmlal[_single]_za32[_f8]_vg1x2(uint32_t slice, svfloat8x2_t zn,
                                      svfloat8_t zm, uint64_t fpmr)
   __arm_streaming __arm_shared_za;

  void svmlal[_single]_za32[_f8]_vg1x4(uint32_t slice, svfloat8x4_t zn,
                                      svfloat8_t zm, uint64_t fpmr) 
  __arm_streaming __arm_shared_za;

  void svmlal_za32[_f8]_vg1x2(uint32_t slice, svfloat8x2_t zn, svfloat8x2_t zm,
                              uint64_t fpmr) __arm_streaming __arm_shared_za;

  void svmlal_za32[_f8]_vg1x4(uint32_t slice, svfloat8x4_t zn, svfloat8x4_t zm,
                              uint64_t fpmr) __arm_streaming __arm_shared_za;
```
##### FMOPA

8-bit floating-point sum of outer products and accumulate

``` c
    void svmopa_za32[_f8]_m(uint64_t tile, svbool_t pn, svbool_t pm,
                            svfloat8_t zn, svfloat8_t zm, uint64_t fpmr)
    __arm_streaming __arm_shared_za;
```
 
# M-profile Vector Extension (MVE) intrinsics
