#!/bin/bash

########################################
# put this on a Server
# run chmod +x deploy_app.sh to make the script executable
#
# Execute this script:  ./deploy_app.sh username/imagename:$TAG
#
########################################

set -e

# Check for arguments
if [[ $# -lt 1 ]] ; then
	echo '[ERROR] You must supply a Docker Image to pull'
	exit 1
fi

IMAGE_NAME_WITH_TAG=$1
IMAGE_NAME=$(echo $IMAGE_NAME_WITH_TAG | sed 's/:.*//')
IMAGE_NAME_WITH_LATEST=$IMAGE_NAME:latest
SERVICE_NAME=$(echo $IMAGE_NAME | cut -d "/" -f 2)
BASE_COMPOSE_FILE=/home/selimssevgi/todarch-docs/docker-compose/docker-compose.yml
PROD_COMPOSE_FILE=/home/selimssevgi/todarch-docs/docker-compose/docker-compose.prod.yml

echo "Using compose file: '$DOCKER_COMPOSE_FILE'"
echo "Extracted image name: '$IMAGE_NAME'"
echo "Extracted image name with latest: '$IMAGE_NAME_WITH_LATEST'"
echo "Extracted service name: '$SERVICE_NAME'"

echo "Deploying $IMAGE_NAME_WITH_TAG..."

echo "Pulling the image..."
docker pull $IMAGE_NAME_WITH_TAG

echo "Retagging image to latest..."
docker tag $IMAGE_NAME_WITH_TAG $IMAGE_NAME_WITH_LATEST

docker image ls | grep "$IMAGE_NAME"

echo "Restarting $SERVICE_NAME..."
docker-compose -f $BASE_COMPOSE_FILE -f $PROD_COMPOSE_FILE up -d --no-deps $SERVICE_NAME
