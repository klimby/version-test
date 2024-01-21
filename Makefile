#!/usr/bin/make
SHELL = /bin/sh

.DEFAULT_GOAL := help

.PHONY: help
help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: generate-config
generate-config: ## Patch version
	./version generate --config-file

.PHONY: patch
patch: ## Patch version
	./version next --patch

.PHONY: minor
minor: ## Minor version
	./version next --minor

.PHONY: major
major: ## Major version
	./version next --major

.PHONY: task-before
task-before: ## Test task before VERSION variable
	$(eval V := $(or $(VERSION),'unknown'))
	@echo "Run task before. Get parameter VERSION=$(V)"
