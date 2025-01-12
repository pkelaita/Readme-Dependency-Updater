#!/usr/bin/env bash
# Copyright 2025 Pierce Kelaita
# Licensed under the Apache License, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0

# Update this with the path to your README file or wherever your dependencies are listed.
README_PATH="./README.md"

# Edit and/or add to the below with your dependencies.

PYTHON_CMD="python3 --version"
PYTHON_KEY_START="<!-- python-v -->"
PYTHON_KEY_END="<!-- /python-v -->"

FFMPEG_CMD="ffmpeg -version"
FFMPEG_KEY_START="<!-- ffmpeg-v -->"
FFMPEG_KEY_END="<!-- /ffmpeg-v -->"

DOCKER_CMD="docker --version"
DOCKER_KEY_START="<!-- docker-v -->"
DOCKER_KEY_END="<!-- /docker-v -->"

update_version() {
    local cmd="$1"
    local start_key="$2"
    local end_key="$3"
    
    # XX.YY.ZZ...
    local version="$($cmd | grep -Eo '[0-9]+(\.[0-9]+)+' | head -n 1)"

    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' -e "s|\($start_key\)\(.*\)\($end_key\)|\1$version\3|g" "$README_PATH"
    else
        sed -i "s|\($start_key\)\(.*\)\($end_key\)|\1$version\3|g" "$README_PATH"
    fi
}


# Update the below calls with your dependencies.

update_version "$PYTHON_CMD" "$PYTHON_KEY_START" "$PYTHON_KEY_END"
update_version "$FFMPEG_CMD" "$FFMPEG_KEY_START" "$FFMPEG_KEY_END"
update_version "$DOCKER_CMD" "$DOCKER_KEY_START" "$DOCKER_KEY_END"
