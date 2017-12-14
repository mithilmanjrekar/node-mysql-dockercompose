FROM node:8.9.1

# Create app directory
ENV HOME=/home/app

WORKDIR $HOME

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm install --global npm@5.5.1

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "npm", "start" ]


