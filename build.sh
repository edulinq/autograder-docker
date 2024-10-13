#!/bin/bash

# Build all the docker images in this directory.
# The images are build in lexicographic order.

readonly THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

readonly BASE_IMAGE_NAME='grader'
readonly IMAGE_REPO='edulinq'

function main() {
    trap exit SIGINT
    set -e

    for dockerfile in $(ls "${THIS_DIR}"/*/*/Dockerfile | sort) ; do
        local buildDir=$(dirname "${dockerfile}")
        local os=$(basename "${buildDir}")
        local subImageName=$(basename $(dirname "${buildDir}") | sed 's/^[0-9]\+-//')

        local imageName="${IMAGE_REPO}/${BASE_IMAGE_NAME}.${subImageName}-${os}:local"

        echo "Building '${imageName}' ..."
        docker build --build-arg BASE_TAG=local --tag "${imageName}" --file "${dockerfile}" "${buildDir}" $@
    done

    exit 0
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "$@"
