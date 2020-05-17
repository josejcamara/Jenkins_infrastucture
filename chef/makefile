BUILD_DIR = $(shell pwd)/cookbooks/jenkins-master

create:
	# I can't get kitchen forwarded_port working
	# @cd $(BUILD_DIR) && kitchen create
	@vagrant up

apply:
	# @cd $(BUILD_DIR) && kitchen converge
	@vagrant provision

test:
	@cd $(BUILD_DIR) && kitchen verify

clean:
	@cd $(BUILD_DIR) && kitchen destroy
	@vagrant destroy
