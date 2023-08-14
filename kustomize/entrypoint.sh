#!/bin/sh

set -e

BUILD_PATH=""
if [ -n "${INPUT_BUILD_PATH}" ]; then
    echo "Detected input for kustomize path to check: ${INPUT_BUILD_PATH}"
    BUILD_PATH="${INPUT_BUILD_PATH}"
fi

COMMAND="/usr/local/bin/kustomize build ${BUILD_PATH}"
echo "running: ${COMMAND}"
eval "${COMMAND}"