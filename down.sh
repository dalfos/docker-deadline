#!/usr/bin/env bash
pushd `dirname $0` > /dev/null
DIRNAME=`pwd -P`

# This directory is available from within each Deadline slave
export SHARE=$DIRNAME/share

# Default image used with Docker Compose, defaults to a vanilla session
# You can override the image by setting an environment variable.
# E.g. IMAGE=deadline-client-maya ./up
export IMAGE=${IMAGE:-deadline-client-maya}

docker-compose down

popd > /dev/null