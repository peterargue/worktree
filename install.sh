#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ALIASES="${SCRIPT_DIR}/aliases"

RC_FILE="${HOME}/.$(basename $SHELL)rc"
if [ ! -f "${RC_FILE}" ]; then
    echo "RC file not found"
    exit 1
fi

if grep -q "${ALIASES}" "${RC_FILE}"; then
    echo "Aliases already installed in ${RC_FILE}"
    exit 0
fi

echo "[ -f ${ALIASES} ] && source ${ALIASES}" >> ${RC_FILE}