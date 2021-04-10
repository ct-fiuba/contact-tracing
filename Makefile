.PHONY: update-repos
update-repos:
	sh tools.sh checkout_all
	sh tools.sh pull_all

.PHONY: run
run:
	bash ./run.sh -b

.PHONY: run-fresh
run-fresh:
	bash ./run-fresh.sh -b
	cd environment-builder && make run users=$(users) establishments=$(establishments) mobility=$(mobility) days=$(days) n95Mandatory=$(n95Mandatory);

.PHONY: stop-fresh
stop-fresh:
	docker-compose -f docker-compose.fresh.yml down

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
