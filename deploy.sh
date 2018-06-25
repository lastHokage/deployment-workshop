#!/bin/bash

HOST="34.243.242.180"
EC2_USER="ec2-user"
KEY_FILE="~/.ssh/devopstest.pem"
CONTAINER="amircontainer"


chmod 700 ~/.ssh
echo "$PKEY" >> $KEY_FILE
chmod 600 $KEY_FILE


ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $HOST -l $EC2_USER -i "$KEY_FILE" "sudo docker pull $DOCKER_USER/deploymentamir:$VERSION && sudo docker stop $CONTAINER && sudo docker rm $CONTAINER && sudo docker run --name $CONTAINER $DOCKER_USER/deploymentamir:$VERSION"