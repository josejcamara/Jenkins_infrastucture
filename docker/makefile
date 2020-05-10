# Usage:
# make        # show help
# make clean  # remove ALL objects

.PHONY = default build run start stop clean

IMAGE_NAME := "jenkins-master"
IMAGE_TAG := "myjenkins" # "$IMAGE_NAME:v1"
JENKINS_PORT := 8080

default: help

help:
	@echo "Help not available yet"

build:
	docker build -t ${IMAGE_TAG} .

create-data:
	docker volume create jenkins-data
	docker volume create jenkins-log
create-secrets:
	@echo "### Credentials for the Admin user: "
	@read -p "Admin username: " adminUser; \
	echo "$$adminUser" | docker secret create jenkins-user -
	@read -p "Admin password: " adminPass; \
	echo "$$adminPass" | docker secret create jenkins-pass -

run: create-data
	docker run --name ${IMAGE_NAME} -p ${JENKINS_PORT}:8080 -p 50000:50000 \
		--mount source=jenkins-log,target=/var/log/jenkins \
		--mount source=jenkins-data,target=/var/jenkins_home \
		-d ${IMAGE_TAG}

start:
	docker start ${IMAGE_NAME}

stop:
	docker stop ${IMAGE_NAME}

clean: stop
	@echo "### Cleaning..."
	docker rm -v ${IMAGE_NAME}
clean-data:
	docker volume rm jenkins-data
	docker volume rm jenkins-log
clean-secrets:
	@echo "### Removing credentials (if exists)..."
	@docker secret rm jenkins-user || true
	@docker secret rm jenkins-pass || true
cleanAll: clean clean-data clean-secrets

log: 
	@docker exec ${IMAGE_NAME} tail -f /var/log/jenkins/jenkins.log
	# if the container is stopped, we can still get it by:
	# docker cp ${IMAGE_NAME}:/var/log/jenkins/jenkins.log jenkins.log
	# cat jenkins.log

checkOPT:
	@echo "### Checking the Java and Jenkins options..."
	docker exec ${IMAGE_NAME} ps -ef | grep java