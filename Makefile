.PHONY: update-repos
update-repos:
	sh tools.sh checkout_all
	sh tools.sh pull_all

.PHONY: run
run:
	bash ./run.sh -b

.PHONY: run-fresh
run-fresh:
	./run-fresh.sh -b
	cd environment-builder && make run users=$(users) establishments=$(establishments)

.PHONY: stop-fresh
stop-fresh:
	docker-compose -f docker-compose.fresh.yml down

.PHONY: test-whole
test-whole:
	./run-fresh.sh -b
	cd e2e-test-suite && npm i
	cd e2e-test-suite && npm test -- $(features) || echo "ERROR!!!"
	docker-compose -f docker-compose.fresh.yml down

.PHONY: help
help:
	@echo 'Usage: make <target>'
	@echo ''
	@echo 'Available targets are:'
	@echo ''
	@grep -E '^\.PHONY: *' $(MAKEFILE_LIST) | cut -d' ' -f2- | sort
