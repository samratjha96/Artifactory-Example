#!/bin/bash

if [[ $1 = "stop" ]] ; then
  echo "Stopping Artifactory services"
  docker rm $(docker stop $(docker ps -a -q --filter="name=artifactory" --filter="name=postgres" --format="{{.ID}}"))
else
  mkdir -p data
  echo "Starting artifactory services"
  docker-compose -f artifactory.yml up -d
  echo "------- Artifactory should be available at http://localhost:9000/artifactory ------"
fi
