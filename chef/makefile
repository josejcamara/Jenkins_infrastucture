BUILD_DIR = $(shell pwd)/jenkins-master

create:
	@cd $(BUILD_DIR) && kitchen create

apply:
	@cd ${BUILD_DIR} && berks install
	@cd $(BUILD_DIR) && kitchen converge

test:
	@cd $(BUILD_DIR) && kitchen verify

clean:
	@cd $(BUILD_DIR) && kitchen destroy
