FROM node:8.9.1

# Create app directory
ENV HOME=/home/DragsterBackendApp

# Set working directory
WORKDIR $HOME

# Install app dependencies

COPY package*.json ./

# Installing this explicitly as the package.json is not added with pm2 
RUN npm install pm2 -g

RUN npm install 

# Copy the app from current directory to /home/DragsterBackendApp of container
COPY . .

# Exposes 5000 port for incoming requests from outside the network
EXPOSE 5000



