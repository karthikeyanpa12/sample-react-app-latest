#!/bin/bash

 
DOCKER_IMAGE="my-react-app"   
DOCKER_PORT_MAPPING="80:80"   
 
 
docker run -d --name "$DOCKER_IMAGE" -p "$DOCKER_PORT_MAPPING" "$DOCKER_IMAGE"

