.PHONY: all
all: setup submodules health

.PHONY: setup
setup:
	bash scripts/setup.sh

.PHONY: submodules
submodules:
	git submodule update --init --recursive

.PHONY: health
health:
	bash scripts/health.sh
