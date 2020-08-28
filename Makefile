.PHONY: update-repos
update-repos:
	sh tools.sh checkout_all
	sh tools.sh pull_all

.PHONY: run
run:
	./run.sh -b

.PHONY: test-whole
test-whole: run

	cd e2e-test-suite && npm i 
	cd e2e-test-suite && npm test || echo "ERROR!!!"
	docker-compose down

.PHONY: help
help:
	@echo 'Usage: make <target>'
	@echo ''
	@echo 'Available targets are:'
	@echo ''
	@grep -E '^\.PHONY: *' $(MAKEFILE_LIST) | cut -d' ' -f2- | sort