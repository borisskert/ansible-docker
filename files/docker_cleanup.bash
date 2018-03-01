#!/bin/bash

echo "--------------------------------------------------------------------------------------"
date
echo "Starting docker-cleanup..."

# delete exited containers
echo "Searching for existed containers..."
EXITED_DOCKER_CONTAINERS=`docker ps -a | grep "Exited ([0-9][0-9]*)"`

if [ -z "$EXITED_DOCKER_CONTAINERS" ]
then
  echo "No exited containers found."
else
  echo "Exited containers found:"
  echo ${EXITED_DOCKER_CONTAINERS}

  echo "Deleting containers with id:"
  echo ${EXITED_DOCKER_CONTAINERS} | awk '{print $1}' | xargs --no-run-if-empty docker rm
fi

# delete untagged images
echo "Searching for untagged images..."
UNTAGGED_DOCKER_IMAGES=`docker images | grep "<none>"`

if [ -z "$UNTAGGED_DOCKER_IMAGES" ]
then
  echo "No untagged images found."
else
  echo "Untagged images found:"
  echo ${UNTAGGED_DOCKER_IMAGES}

  echo "Deleting images:"
  echo ${UNTAGGED_DOCKER_IMAGES} | awk '{print($3)}' | xargs --no-run-if-empty docker rmi
fi

echo "docker-cleanup done."
date
echo "--------------------------------------------------------------------------------------"
