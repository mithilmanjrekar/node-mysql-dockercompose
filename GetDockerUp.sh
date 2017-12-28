docker build -t nodeapp --no-cache --build-arg VERSION=1 ./
docker ps
docker-compose down
docker-compose up 

# to check if it is up or go to browser
# curl -s 'http://localhost:4040/api/tunnels'
# curl -s  'http://localhost:3000'
