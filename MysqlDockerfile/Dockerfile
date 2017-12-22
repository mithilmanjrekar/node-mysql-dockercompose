FROM mysql
MAINTAINER Dragster Backend Dev 
#This will put all the data/dump into mysql container while starting it and migrate/seeds it when the container is up.
COPY ./dump/backup.sql /docker-entrypoint-initdb.d/
