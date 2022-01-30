#!/usr/bin/env sh

EXCLUDES=""
if [ -n "${INPUT_EXCLUDES}" ]; then
    echo "Detected input for tfsec checks to skip: ${INPUT_EXCLUDES}"
    EXCLUDES="-e ${INPUT_EXCLUDES}"
fi

COMMAND="/usr/local/bin/tfsec ${EXCLUDES}"
echo "running: ${COMMAND}"
eval "${COMMAND}"