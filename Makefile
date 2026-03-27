.PHONY: all
all: setup submodules install health

.PHONY: setup
setup:
	bash scripts/setup.sh

.PHONY: submodules
submodules:
	git submodule update --init --recursive

.PHONY: install
install:
	bash scripts/install.sh

.PHONY: health
health:
	bash scripts/health.sh
