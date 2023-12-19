#!/bin/bash

# The main entrypoint for autograder docker images.
# Check for and run any post-submission operations,
# and then run the provided command.

readonly BASE_DIR="/autograder"

readonly INPUT_DIR="${BASE_DIR}/input"
readonly OUTPUT_DIR="${BASE_DIR}/output"
readonly WORK_DIR="${BASE_DIR}/work"
readonly SCRIPTS_DIR="${BASE_DIR}/scripts"

readonly POST_OPERATIONS_PATH="${SCRIPTS_DIR}/post-submission-ops.sh"

function main() {
    if [[ $# -eq 0 ]]; then
        echo "USAGE: $0 command ..."
        return 1
    fi

    trap exit SIGINT

    local exist_status=0

    if [[ -f "${POST_OPERATIONS_PATH}" ]] ; then
        echo "Running post submission operations."

        bash "${POST_OPERATIONS_PATH}"
        exit_status=$?

        if [[ ${exist_status} -ne 0 ]] ; then
            echo "ERROR: Failed to run post submission operations."
            return ${exist_status}
        fi
    else
        echo "Could not find any post submission operations."
    fi

    cd "${WORK_DIR}"

    # Run the main command.
    "$@"
    exit_status=$?

    if [[ ${exist_status} -ne 0 ]] ; then
        echo "ERROR: Failed to run main grader."
        return ${exist_status}
    fi

    return 0
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "$@"
