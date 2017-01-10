.PHONY: all apply

all: apply

apply:
	sudo puppet apply site.pp --modulepath ./

refreshkeys:
	sudo pacman-key --populate archlinux
	sudo pacman-key --refresh-keys

