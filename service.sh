#!/bin/bash

if [[ $1 = "down" ]] ; then
  echo "Stopping Artifactory services"
  docker rm $(docker stop $(docker ps -a -q --filter="name=artifactory" --filter="name=postgres" --format="{{.ID}}"))
else
  docker-compose -f artifactory.yml up -d
  echo "------- Open http://localhost:9000/artifactory ------"
fi
