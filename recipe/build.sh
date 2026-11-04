#!/bin/bash

# Set-up the shell to behave more like a general-purpose programming language
set -euo pipefail
export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"

# Configure project
cmake ${CMAKE_ARGS} --fresh -G Ninja -D CMAKE_BUILD_TYPE=Release -D S3_PLUGIN_BUILD_ENV=conda -B build/s3 -S .

# Build
cmake --build build/s3 --target khiopsdriver_file_s3

# Copy binary to conda package
cmake --install build/s3 --prefix $PREFIX
