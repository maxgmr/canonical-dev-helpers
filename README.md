# canonical-dev-helpers

Little tools I use to make my Canonical work easier.

## source-changes-file

Automatically extracts the source changes file name from `d/changelog`.

I just symlink the script to a directory in my `PATH`; e.g., `/usr/local/bin`.

## rustc-quiltrc

The rustc patches used a different format than the standard one. This file simply configures Quilt to use that format when the `--quiltrc <path/to/this/file>` option is used.
