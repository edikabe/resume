#!/bin/bash

docker build -t julglotain/resume:latest .
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push julglotain/resume:latest