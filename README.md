Dockerfile:

To create docker image for node we use dockerfile
docker build --name node ./

Notes:
Docker compose will trigger the docker file unless it is registered in docker hub.

Dev:
docker-compose up 

Staging:
docker-compose -f docker-compose-production.yml up

Production:
docker-compose -f docker-compose-production.yml up

