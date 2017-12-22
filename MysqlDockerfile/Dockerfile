FROM mysql
MAINTAINER Dragster Backend Dev 
#This will put all the data/dump into mysql container while starting it and migrate/seeds it when the container is up do not use this image if pointing to local or remote for mysql..
COPY ./dump/backup.sql /docker-entrypoint-initdb.d/
