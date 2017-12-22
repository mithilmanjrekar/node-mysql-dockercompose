Notes:
Currently we need to build the node 8.9.1 image from the Dockerfile which will be pushed to a registry and the regisrty path will be given in the compose file so the npm and all the dependencies will be installed inside the image itself. Incase the code needs to be changed the updated docker image has to be created from the dockerfile as it copies all the code from the repo while building it.

Files needed to be shifted to the project.

1. Dockerfile
   command: docker build --name node ./
   description: This will create a image named node which is the name written in the dockerfile incase the name is changed                     please reflect the same in the dockerfile.
   
2. docker-compose.yml 
   command: docker-compose up 
   description: This will run the node app and will point to mysql local db the credentials host and all the details need to                   be passed using the .env file or if there is any other file please update it in the compose                                     file.
   
3. docker-compose-staging.yml
   command: docker-compose -f docker-compose-staging.yml up
   description: This will run the node app and will point to mysql local db the credentials host and all the details need to                   be passed using the staging.env file or if there is any other file please update it in the staging compose                     file.
   
4. docker-compose-production.yml
   command: docker-compose -f docker-compose-production.yml up
   description: This will run the node app and will point to rds remote db the credentials host and all the details need to                     be passed using the production.env file or if there is any other file please update it in the production                       compose file. 


The elkdocker-compose:- creates and links elastic logstash and kibana but fails for some reason(need to figure that out)  Jenkinsfile :- Is just a structure and the code needs to be build around it which will automate running docker compose and running it on dev,staging or deploying it to production.  
