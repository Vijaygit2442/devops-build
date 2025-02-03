#!/bin/bash

# Variables
default_image_name="React-Ecommerce-App"
default_tag="latest"
container_name="react-ecommerce-container"

# Read input arguments
IMAGE_NAME=${1:-$default_image_name}
TAG=${2:-$default_tag}

# Stop and remove existing container if running
if [ "$(docker ps -q -f name=$container_name)" ]; then
    echo "Stopping existing container: $container_name"
    docker stop $container_name
    docker rm $container_name
fi

# Run the Docker container
echo "Deploying Docker container: $container_name"
docker run -d -p 80:80 --name $container_name $IMAGE_NAME:$TAG

# Check if deployment was successful
if [ $? -eq 0 ]; then
    echo "Docker container $container_name deployed successfully on port 80."
else
    echo "Failed to deploy Docker container."
    exit 1
fi
