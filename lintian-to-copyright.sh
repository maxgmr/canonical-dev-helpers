#!/bin/sh
# Pipe the output of lintian into this.

VENV="$(mktemp -d)"
python3 -m venv "$VENV"
. "$VENV/bin/activate"
"$VENV/bin/pip" install --quiet pytoml

sed -ne 's/.* file-without-copyright-information //p' | cut -d/ -f1-2 | sort -u | while read x; do
    "$VENV/bin/python3" /usr/share/cargo/scripts/guess-crate-copyright "$x"
done

deactivate
rm -rf "$VENV"
