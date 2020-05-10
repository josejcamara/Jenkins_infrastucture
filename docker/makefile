# Usage:
# make        # show help
# make clean  # remove ALL objects

.PHONY = default build run start stop clean

IMAGE_NAME := "jenkins-master"
IMAGE_TAG := "myjenkins" # "$IMAGE_NAME:v1"
JENKINS_PORT := "8080"

default: help

help:
	@echo "Help not available yet"

build:
	docker build -t ${IMAGE_TAG} .

run: cleansecret
	@echo "### Credentials for the Admin user: "
	@read -p "Admin username: " adminUser; \
	echo "$$adminUser" | docker secret create jenkins-user -
	@read -p "Admin password: " adminPass; \
	echo "$$adminPass" | docker secret create jenkins-pass -
	docker run --name ${IMAGE_NAME} -p ${JENKINS_PORT}:8080 -p 50000:50000 -d ${IMAGE_TAG}

start:
	docker start ${IMAGE_NAME}

stop:
	@echo "### Stopping..."
	docker stop ${IMAGE_NAME}

clean: cleansecret stop
	@echo "### Cleaning..."
	docker rm -v ${IMAGE_NAME}

log: 
	@docker exec ${IMAGE_NAME} tail -f /var/log/jenkins/jenkins.log
	# if the container is stopped, we can still get it by:
	# docker cp ${IMAGE_NAME}:/var/log/jenkins/jenkins.log jenkins.log
	# cat jenkins.log

cleansecret:
	@echo "### Removing credentials (if exists)..."
	@docker secret rm jenkins-user || true
	@docker secret rm jenkins-pass || true

checkOPT:
	@echo "### Checking the Java and Jenkins options..."
	docker exec ${IMAGE_NAME} ps -ef | grep java