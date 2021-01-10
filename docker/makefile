build:
	@docker-compose -p jenkins build
up:
	@docker-compose -p jenkins up -d jnginx jmaster jproxy
down:
	@docker-compose -p jenkins down
clean-data: 
	@docker-compose -p jenkins down -v
clean-images:
	@docker rmi $(shell docker images -q -f "dangling=true")
master-log:
	@docker-compose -p jenkins exec jmaster tail -f /var/log/jenkins/jenkins.log
getAdminPass:
	@docker-compose -p jenkins exec jmaster cat /var/jenkins_home/secrets/initialAdminPassword