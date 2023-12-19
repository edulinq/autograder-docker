#!/bin/bash

# Run the standard python grader.

readonly BASE_DIR="/autograder"

readonly OUTPUT_DIR="${BASE_DIR}/output"
readonly WORK_DIR="${BASE_DIR}/work"

readonly GRADER_PATH="${WORK_DIR}/grader.py"
readonly OUTPUT_PATH="${OUTPUT_DIR}/result.json"

function main() {
    if [[ $# -ne 0 ]]; then
        echo "USAGE: $0"
        exit 1
    fi

    trap exit SIGINT

    cd ${BASE_DIR}

    python3 -m autograder.cli.grading.grade-dir \
        --grader "${GRADER_PATH}" \
        --dir "${BASE_DIR}" \
        --outpath "${OUTPUT_PATH}"
    local returnValue=$?

    if [[ ${returnValue} -ne 0 ]] ; then
        echo "Failed to run Python grader."
        exit ${returnValue}
    fi

    exit 0
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "$@"
