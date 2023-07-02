#!/bin/bash
#Docker
sudo yum update
sudo yum search docker
sudo yum info docker
sudo yum install docker
sudo usermod -a -G docker ec2-user
id ec2-user
newgrp docker

echo "Docker was successfully installed!"

#Docker-compose
wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)
sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
sudo chmod -v +x /usr/local/bin/docker-compose
echo "Docker compose was successfully installed!"

sudo systemctl enable docker.service
echo "Docker services enabled at AMI boot time."
sudo systemctl start docker.service
echo "Started Docker services."

# Adding docker-compose to PATH
export PATH=$PATH:/usr/local/bin

docker version
docker-compose version

# Git ssh keypair setup!
read -p "Do you want to set up git with present ssh keypair? [y/n]: " answer

if [ "$answer" == "y" ]
then
    mv ./id_rsa ~/.ssh/
    mv ./id_rsa.pub ~/.ssh/
    echo "Keypair is now in ~/.ssh/"
    chmod 600 ~/.ssh/id_rsa
    # eval $(ssh-agent) might be needed if it wasn't started before
    ssh-add -k ~/.ssh/id_rsa
    echo "SSH private key added to the agent"
else
    echo "Git keypair wasn't set up"
fi

echo "Initialization completed."