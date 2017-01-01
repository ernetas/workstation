.PHONY: all apply

all: apply

apply:
	puppet apply site.pp --modulepath ./
