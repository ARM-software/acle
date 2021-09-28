<div align="center">
   <img src="Arm_logo_blue_RGB.svg" />
</div>

![Continuous Integration](https://github.com/ARM-software/acle/actions/workflows/ci.yml/badge.svg)

# Arm C Language Extensions

The specifications in this document are in experimental format.
[Official Release](https://github.com/ARM-software/acle/releases/latest).

This repository contains the source material form which the
specifications for the Arm C Language Extensions (ACLE) is derived.
For the published documents please see the [Arm developer ACLE
page](https://developer.arm.com/architectures/system-architectures/software-standards/acle)

## Contributing

The branch ``main`` is the release branch, whose tip contains the
latest release. Therefore, please submit your PR against the branch
``next-release``.

## Defect reports

Please report defects in or enhancements to the specifications in this folder to
the [issue tracker page on
GitHub](https://github.com/ARM-software/acle/issues).

For reporting defects or enhancements to documents that currenlty are not yet
included in this repo and are thus only hosted on developer.arm.com, please send
an email to arm.acle@arm.com.

## Transitioning the ACLE specifications

This is a work in progress. The document added to the repository will
be referenced in this README file when added.

## List of documents

Document sources                                                           | Latest official release
---                                                                        | ---
[Arm C Language Extensions](main/acle.rst)                                 | [2021Q2](https://github.com/ARM-software/acle/releases/latest)
[Morello Supplement to the Arm C Language Extensions](morello/morello.rst) | [01alpha](https://github.com/ARM-software/acle/releases/latest)
[Arm MVE Intrinsics](mve_intrinsics/mve.rst)                               | [2021Q2](https://github.com/ARM-software/acle/releases/latest)
[Arm Neon Intrinsics Reference](neon_intrinsics/advsimd.rst)               | [2021Q2](https://github.com/ARM-software/acle/releases/latest)

# License

All the ACLE documents themselves are not dependent on any assets
outside of their own directory and all have their own license file
included in the directory. Currently all the ACLE documents are
licenced under the Creative Commons Attribution-ShareAlike 4.0
International License + grant of Patent License. Contributions to
these files are accepted under the same license.

The files in the sub-directories of the tools directory are provided
under the Apache 2.0 license. Contributions to these files are
accepted under the same license.
