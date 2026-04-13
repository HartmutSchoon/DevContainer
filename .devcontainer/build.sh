#!/bin/bash

# Exit on error
set -e

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Get the parent directory (project root)
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
# Get the project folder name for the WORKDIR
PROJECT_NAME=$(basename "$PROJECT_ROOT")
# Use the project root directory name as the image name
IMAGE_NAME=$(basename "$PROJECT_ROOT" | tr '[:upper:]' '[:lower:]')

echo "Building Docker image: $IMAGE_NAME for project: $PROJECT_NAME..."
# Build using the project root as context and the Dockerfile in this directory
docker build -t "$IMAGE_NAME" \
    --build-arg PROJECTNAME="$PROJECT_NAME" \
    -f "$SCRIPT_DIR/Dockerfile" "$PROJECT_ROOT"

echo "Build complete."
