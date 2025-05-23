# canonical-dev-helpers

Little tools I use to make my Canonical work easier.

To use the bash scripts, I just symlink the script to a directory in my `PATH`; e.g., `/usr/local/bin`.

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
