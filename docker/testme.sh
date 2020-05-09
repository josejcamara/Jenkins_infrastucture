#!/bin/bash

NAME_VERSION="jenkins_master:v1"
IMAGE_NAME="myjenkins"
JENKINS_PORT="8080"

## https://www.jenkins.io/doc/book/managing/system-properties/
JVM_PARAMS="-Dhudson.footerURL=http://mycompany.com "
JVM_PARAMS="$JVM_PARAMS -Djava.util.logging.config.file=/var/jenkins_home/log.properties"

REMOVE_VOLUMES=""
read -p "Remove old volumes? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    REMOVE_VOLUMES="--volumes"
fi
echo "Removing old instances $REMOVE_VOLUMES"
docker stop $IMAGE_NAME || true && docker rm $REMOVE_VOLUMES $IMAGE_NAME || true

echo "Building Jenkins docker"
docker build --no-cache -t $NAME_VERSION .

docker run --name $IMAGE_NAME -p 8080:$JENKINS_PORT -p 50000:50000 --env JAVA_OPTS="$JVM_PARAMS" $NAME_VERSION

echo "Jenkins running on $JENKINS_PORT"