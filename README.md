# canonical-dev-helpers

Little tools I use to make my Canonical work easier.

To use the bash scripts, I just symlink the script to a directory in my `PATH`; e.g., `/usr/local/bin`.

## redundant-copyright-stanzas

This script helps with `rustc` maintenance by flagging the `d/copyright` stanzas with redundant glob matching patterns.

Keep in mind that this script _will_ produce false positives like `vendor/git2-curl-*/*` being redundant because of `vendor/git2-*/*`- don't blindly delete all stanzas on the list.

## unneeded-copyright-stanzas

This script helps with `rustc` maintenance by flagging the `d/copyright` stanzas with no matching files in the source tree. The stanzas produced by this list can likely be removed from `d/copyright`, but make sure you manually verify things just to be safe.

## win-rustc-prune-list

Helper for maintaining the `rustc` source package. Whenever a new upstream Rust version is released, we must prune all Windows dependencies from the new vendored crates.

This script generates a list of lines within vendored crates which may possibly include an unwanted Windows dependency.

The intended use of this script is to redirect the output of the script to a file and go down the list one-by-one, checking to see if that particular section of code must be pruned.

## sbuild-purge

Intended for use with the `rustc` source package. Un-applies all `quilt` patches, expires all `schroot` sessions, purges anything inside the filesystem of all `sbuild` builds, deletes all Debian source artifacts, and deletes the patch queue folder.

## suppress-rustdoc-ui-warnings

_Currently not working. Included for future fix attempts._

On old versions of Ubuntu, certain `rustdoc-ui` `rustc` tests which perform a byte-for-byte `stderr` assertion can fail locally when benign warnings are emitted. This script takes in a list of failing paths and appends a [compiletest directive](https://rustc-dev-guide.rust-lang.org/tests/directives.html) to suppress the warnings.

I've also included a [patch](https://github.com/maxgmr/canonical-dev-helpers/blob/main/ubuntu-suppress-rustdoc-ui-warnings.patch) which suppresses the warnings on the `rustdoc-ui` tests that fail on my machine.

Note that this should _not_ be used in actual uploaded builds! It's just for testing builds locally. Your `rustc` MUST build properly in a PPA _WITHOUT_ this patch!

## lintian-to-copyright.sh

My machine can't get the `pytoml` module globally so I have to create a temporary virtual environment and install it that way. Drop-in replacement for `debian/lintian-to-copyright.sh` in `rustc`.

## source-changes-file

Automatically extracts the source changes file name from `d/changelog`.

## rustc-quiltrc

The rustc patches used a different format than the standard one. This file simply configures Quilt to use that format when it's passed using the `--quiltrc` option.

## remove-rej

Quilt generates `.rej` files when a failed patch is force-applied. These are useful but annoying to remove on projects with big source trees. This script just recursively deletes all `.rej` files starting in the given directory (current working directory by default).

## mk-sbuild-schroots

Generates `sbuild` schroots for all the Ubuntu releases noninteractively. The Ubuntu release list in the script must be manually updated!

## mk-shm-overlays

Adds schroot profiles which use a RAM-based `/dev/shm` overlay for faster build speeds. These profiles are based off of whatever existing schroots are installed on your system already, so any time you add a new schroot, this script must be re-ran.

## rm-sbuild-schroots

Deletes all `sbuild` schroots on the system- be careful!

## push-remove-windeps

When pruning Windows dependencies `rustc`, I need to `quilt push` a specific patch with a long name a lot. I just made this to do this quickly. It may as well be a shell alias but I put it here just to keep it with everything else.
