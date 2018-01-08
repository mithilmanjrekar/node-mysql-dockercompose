FROM node:8.9.1
# Create app directory
ENV HOME=/home/DragsterBackendApp
# Set working directory
WORKDIR $HOME
# Copy the app from current directory to /home/DragsterBackendApp of container
COPY . .
# Install app dependencies
RUN npm install 
# Exposes 5000 port for incoming requests from outside the network
EXPOSE 5000



