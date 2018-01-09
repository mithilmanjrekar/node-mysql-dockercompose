#!/bin/bash

# If you have completed the tutorial you will have a swarm cluster that looks like : 

#docker-machine ls
# NAME              ACTIVE      DRIVER      STATE     URL                        SWARM                      DOCKER    ERRORS
#manager1   * (swarm)   amazonec2   Running   tcp://52.40.9.5:2376     manager1 (master)   v1.11.2   
#swarm-node-tc-1   -           amazonec2   Running   tcp://52.40.4.21:2376    manager1            v1.11.2   
#swarm-node-tc-2   -           amazonec2   Running   tcp://52.40.23.18:2376   manager1            v1.11.2   
#swarm-node-tc-3   -           amazonec2   Running   tcp://52.39.9.21:2376    manager1            v1.11.2   
#swarm-node-tc-4   -           amazonec2   Running   tcp://52.40.13.12:2376   manager1            v1.11.2   

#This script depends on this cluster existing.
#This script will connect to each node and perform the following :

# Install glusterfs-server
# Append to /etc/hosts
# Run peer probe to detect nodes in glusterfs
# Create volume called ${volume_name}
# Mount Volume in each node

function usage {

echo "Please provide the name of the shared volume you wish to create."
exit 0

}

if [ $# -ne 1 ];then
	usage
else
    	volume_name="$1"
fi

echo "Install glusterfs-server on each Swarm Node"

for node in `docker-machine ls -q |grep swarm`;
do 
	echo "Installing glusterfs-server on ${node}" 
	docker-machine ssh ${node} sudo apt-get install glusterfs-server -y
done

echo "Create swarm.hosts file containing Swarm Nodes ip and hostname"

if [ -f swarm.hosts ];then
	rm -rf swarm.hosts
fi

for node in `docker-machine ls -q |grep swarm`; 
do 
	echo "Adding ${node} to swarm.hosts"
	ip=`docker-machine ip ${node}`
	echo "${ip} ${node}" >> swarm.hosts
done

echo "Append swarm.hosts to /etc/hosts in each Swarm Node"

for node in `docker-machine ls -q |grep swarm`; 
do 
	echo "Appending swarm.hosts to /etc/hosts"
	docker-machine scp swarm.hosts ${node}:/tmp/swarm.hosts
	docker-machine ssh ${node} "sudo cat /tmp/swarm.hosts >> /etc/hosts"
done

echo "Run Gluster Peer Probe on manager1"

for node in `docker-machine ls -q |grep swarm`; 
do 
	docker-machine ssh manager1 "sudo gluster peer probe ${node}"
done

echo "Checking Peer Status on manager1"
docker-machine ssh manager1 "sudo gluster peer status"

echo "Creating Volume called : ${volume_name}"

docker-machine ssh manager1 "sudo gluster volume create ${volume_name} replica 5 transport tcp  manager1:/data/${volume_name} swarm-node-tc-1:/data/${volume_name} swarm-node-tc-2:/data/${volume_name} swarm-node-tc-3:/data/${volume_name} swarm-node-tc-4:/data/${volume_name} force"

echo "Starting Volume"

docker-machine ssh manager1 "sudo gluster volume start ${volume_name}"

echo "Mounting volume ${volume_name} on each Swarm Node"
 
for node in `docker-machine ls -q |grep swarm`; 
do 
	docker-machine ssh ${node} "sudo mkdir /home/${volume_name}; \
	echo \"Command : sudo mount -t glusterfs ${node}:${volume_name} /home/${volume_name}\"; \
	sudo mount -t glusterfs ${node}:${volume_name} /home/${volume_name}; \
	echo \"Creating file ${node} in  /home/${volume_name}\"; \
	sudo touch /home/${volume_name}/${node}; \
	ls /home/${volume_name}"
done