#!/bin/sh

set -e

# Copy the matcher to the host system; otherwise "add-matcher" can't find it.
cp /yamllint.json .
sh -c "yamllint -f parsable $*"