#!/bin/bash

# variables
IMAGE_NAME="final_image"
CONTAINER_NAME="final-container"
VOLUME_NAME="final_data"

docker build -t "$IMAGE_NAME" .
# Create volume
docker volume create "$VOLUME_NAME"

# Run the container
docker run -d \
  --name "$CONTAINER_NAME" \
  -p 5000:4000 \
  -v "$VOLUME_NAME":/app/data \
  "$IMAGE_NAME"
