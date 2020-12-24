
default: install

.PHONY: install
install:
	chmod +x ./install.sh && ./install.sh;

.PHONY: test
test:
	source "./git_config.sh";
	@echo "File sourced into this terminal."

