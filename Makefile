SHELL := /bin/bash

all:
	@ansible-playbook setup.yaml -K

alacritty:
	@ansible-playbook setup.yaml -t alacritty -K

git:
	@ansible-playbook setup.yaml -t git -K

i3:
	@ansible-playbook setup.yaml -t i3 -K

neovim:
	@ansible-playbook setup.yaml -t neovim -K

npm:
	@ansible-playbook setup.yaml -t npm -K

tmux:
	@ansible-playbook setup.yaml -t tmux -K

packages:
	@ansible-playbook setup.yaml -t packages -K

python:
	@ansible-playbook setup.yaml -t python

rust:
	@ansible-playbook setup.yaml -t rust

zsh:
	@ansible-playbook setup.yaml -t zsh -K

run:
	@vagrant up

delete:
	@vagrant destroy -f workstation

stop:
	@vagrant halt
