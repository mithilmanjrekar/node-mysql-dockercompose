#!/usr/bin/env bash

START_SEC=$(date +'%s')

set -e

# This will initialize the docker swarm.
docker swarm init --advertise-addr $(hostname -I) --listen-addr $(hostname -I):2377

# This will give the docker swarm join token.
TOKEN=$( docker swarm join-token -q worker)

# Join Nodes to the swarm.
eval $(docker-machine env node2)
docker swarm join  --token $TOKEN $(hostname -I):2377 # This is the command copied from docker swarm init command's output

eval $(docker-machine env node3)
docker swarm join  --token $TOKEN $(hostname -I):2377 # This is the command copied from docker swarm init command's output

eval $(docker-machine env node1)

echo ""
echo ">> The Swarm Cluster is set up!"

# Deploy the stack on the server where swarm is setup
git pull origin branch-name

docker stack deploy -c docker-stack.yml dragsters_app

docker stack ls 

docker stack services dragsters_app

# See how long does it take.
echo "Done in $(($(date +'%s') - $START_SEC)) seconds"