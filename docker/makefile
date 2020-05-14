build:
	@docker-compose -p jenkins build
run:
	@docker-compose -p jenkins up -d
stop:
	@docker-compose -p jenkins down
clean-data: 
	@docker-compose -p jenkins down -v
clean-images:
	@docker rm -v $(shell docker ps -a -q -f status=exited)
	@docker rmi $(shell docker images -q -f "dangling=true")
jenkins-log:
	@docker-compose -p jenkins exec jenkins-master tail -f /var/log/jenkins/jenkins.log
