#!/bin/bash

IMAGE_NAME="my-react-app"
DOCKERFILE="Dockerfile"
BUILD_CONTEXT="."


docker build -t "$IMAGE_NAME" -f "$DOCKERFILE" "$BUILD_CONTEXT"

