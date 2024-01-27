#!/bin/bash

# Define variables
IMAGE_NAME="my-react-app"
DOCKERFILE="Dockerfile"
BUILD_CONTEXT="."

# Build the Docker image
docker build -t "$IMAGE_NAME" -f "$DOCKERFILE" "$BUILD_CONTEXT"

