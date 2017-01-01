.PHONY: all apply

all: apply

apply:
	sudo puppet apply site.pp --modulepath ./
