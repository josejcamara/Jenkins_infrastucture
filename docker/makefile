# Usage:
# make        # show help
# make clean  # remove ALL objects

.PHONY = default build run start stop clean

MASTER_NAME := "jenkins-master"
MASTER_TAG := "myjenkins"

NGINX_NAME := "jenkins-nginx"
NGINX_TAG := "myjenkinsnginx"

default: help

help:
	@echo "Help not available yet"

build:
	@docker build -t ${MASTER_TAG} jenkins-master/.
	@docker build -t ${NGINX_TAG} jenkins-nginx/.

create-data:
	@docker volume create jenkins-data
	@docker volume create jenkins-log
create-secrets:
	@echo "### Credentials for the Admin user: "
	@read -p "Admin username: " adminUser; \
	echo "$$adminUser" | docker secret create jenkins-user -
	@read -p "Admin password: " adminPass; \
	echo "$$adminPass" | docker secret create jenkins-pass -
create-network:
	-docker network create --driver bridge jenkins-network

run: create-network create-data
	docker run --name ${MASTER_NAME} -p 50000:50000 \
		--mount source=jenkins-log,target=/var/log/jenkins \
		--mount source=jenkins-data,target=/var/jenkins_home \
		--network jenkins-network \
		-d ${MASTER_TAG}
	docker run --name=${NGINX_NAME} -p 80:80 \
		--network jenkins-network \
		-d ${NGINX_TAG}
	@echo "Your IP: "
	@ip route get 1 | awk '{print $(NF-2);exit}'

start:
	docker start ${MASTER_NAME}

stop:
	-docker stop ${MASTER_NAME}
	-docker stop ${NGINX_NAME}

clean: stop
	-docker rm -v ${MASTER_NAME}
	-docker rm -v ${NGINX_NAME}
clean-data:
	-docker volume rm jenkins-data
	-docker volume rm jenkins-log
clean-network: clean
	-docker network rm jenkins-network
clean-images:
	@docker rmi `docker images -q -f "dangling=true"`
clean-secrets:
	-docker secret rm jenkins-user
	-docker secret rm jenkins-pass
cleanAll: clean clean-data clean-secrets clean-network

log: 
	@docker exec ${MASTER_NAME} tail -f /var/log/jenkins/jenkins.log
	# if the container is stopped, we can still get it by:
	# docker cp ${MASTER_NAME}:/var/log/jenkins/jenkins.log jenkins.log
	# cat jenkins.log

checkOPT:
	@echo "### Checking the Java and Jenkins options..."
	docker exec ${MASTER_NAME} ps -ef | grep java