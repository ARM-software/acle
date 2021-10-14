# Rationale

Contributions are always welcome. We accept [bug fixes](#bugs),
[proposals and new ideas](#proposal), or simply [editorial
improvements](#editorial-improvements).

By submitting a pull request you are implicitly
adhering to the [contribution agreement](#contribution-agreement)

## Bugs

You can report a bug by creating an
[issue](https://github.com/ARM-software/acle/issues). You can also fix
it yourself with a [pull
request](https://github.com/ARM-software/acle/pulls).

## Proposals

We are open to any proposal, including the introduction of new sets of
intrinsics. We _do not_ require copyright assignment to Arm for the
introduction of new parts of the specifications. The original
contributor will retain the copyright.

For adding new intrinsics or preprocessor macros, we recommend
presenting them in a [pull
request](https://github.com/ARM-software/acle/pulls), together with
the following information:

1. A rationale covering why these intrinsics or macros are needed.
2. A design document to keep track of the reasoning that made the
   proposal reach its current state.
3. Some consensus gathering in the ecosystem.

Please note that this information is not a
requirement for submittin proposals. Contributors are trusted to use
their judgment in deciding whether or not the proposal needs such
data. Providing the data is recommended to make it
easier for new ideas to be discussed and possibly accepted, especially
for changes of great impact.

## Editorial improvements

You always check the outcome of your changes by running the script
`tools/generate-pdfs.sh`. Please notice that changes that touch the
intrinsic database in `tools/intrinsic_db` will need to be reflected
in the correspondent specification file by re-running the script
`tools/generate-intrinsics-specs.sh`.

These scripts are run in the CI configuration of the projects - the
PDFs are generated automatically in response to a pull request, and can be downloaded in the
`Actions` tab of a pull request.

# Branches and pull requests.

The branch `main` is the release branch, which contains the code used
to build the PDFs of the [latest official
release](https://github.com/ARM-software/acle/releases/latest).

New development (bug-fixes, proposals, extensions, ...) is done on the
branch `next-release`. Therefore, please submit your PR against the
branch `next-release`.

It is good practice to keep track of the changes in the `Changelog`
section of the document being modified, under the section `Changes for
next release`. Please see [this
PR](https://github.com/ARM-software/acle/pull/19) for an
example.

# Contribution agreement

Contributions to this project are licensed under an inbound=outbound
model such that any such contributions are licensed by the contributor
under the same terms as those in the [LICENSE](LICENSE) file.
