docker -v

echo "172.21.32.12" | docker secret create mysql_root_host -
echo "root" | docker secret create mysql_user -
echo "rootroot" | docker secret create mysql_password -
echo "testnpm" | docker secret create mysql_database -

docker stack deploy -c docker-stack.yml dragsters_overlay
 
docker stack ls
docker network ls
docker secret ls

# docker stack rm dragsters_overlay
# to check if it is up or go to browser
# curl -s 'http://localhost:4040/api/tunnels'
# curl -s  'http://localhost:3000'
