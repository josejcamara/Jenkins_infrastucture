#!/bin/bash

NAME_VERSION="jenkins_master:v1"
IMAGE_NAME="myjenkins"
JENKINS_PORT="8080"

echo "Removing old instances "
docker stop $IMAGE_NAME || true && docker rm --volumes $IMAGE_NAME || true

# Admin password
# https://technologyconversations.com/2017/06/16/automating-jenkins-docker-setup/
read -p 'Admin Username: ' uservar
read -sp 'Admin Password: ' passvar
echo
docker secret rm jenkins_admin_user || true && printf "$uservar" | docker secret create jenkins_admin_user -
docker secret rm jenkins_admin_pass || true && printf "$passvar" | docker secret create jenkins_admin_pass -

echo "Building Jenkins docker"
docker build -t $NAME_VERSION .

# TODO: docker service create 
docker run --name $IMAGE_NAME \
    -p $JENKINS_PORT:8080 -p 50000:50000 \
    $NAME_VERSION

# TODO:
# echo "Jenkins running on $JENKINS_PORT"
# read -p "Click enter to stop/remove the service " -n 1 -r
# docker service rm $IMAGE_NAME