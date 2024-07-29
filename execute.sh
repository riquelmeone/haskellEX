#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Clean the build artifacts
echo "Cleaning the project..."
cabal clean

# Build the project
echo "Building the project..."
cabal build

# Run the project
echo "Running the project..."
cabal run
