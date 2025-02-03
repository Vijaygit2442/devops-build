#!/bin/bash

# Variables
default_image_name="React-Ecommerce-App"
default_tag="latest"

# Read input arguments
IMAGE_NAME=${1:-$default_image_name}
TAG=${2:-$default_tag}

# Build the Docker image
echo "Building Docker image: $IMAGE_NAME:$TAG"
docker build -t $IMAGE_NAME:$TAG ./build

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "Docker image $IMAGE_NAME:$TAG built successfully."
else
    echo "Failed to build Docker image."
    exit 1
fi
