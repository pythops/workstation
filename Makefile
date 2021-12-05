SHELL := /bin/bash

all:
	@ansible-playbook setup.yaml -K

alacritty:
	@ansible-playbook setup.yaml -t alacritty -K

dnsmasq:
	@ansible-playbook setup.yaml -t dnsmasq -K

docker:
	@ansible-playbook setup.yaml -t docker -K

git:
	@ansible-playbook setup.yaml -t git -K

i3:
	@ansible-playbook setup.yaml -t i3 -K

minikube:
	@ansible-playbook setup.yaml -t minikube -K

neovim:
	@ansible-playbook setup.yaml -t neovim -K

npm:
	@ansible-playbook setup.yaml -t npm -K

packages:
	@ansible-playbook setup.yaml -t packages -K

python:
	@ansible-playbook setup.yaml -t python

rust:
	@ansible-playbook setup.yaml -t rust

tmux:
	@ansible-playbook setup.yaml -t tmux -K

zsh:
	@ansible-playbook setup.yaml -t zsh -K

run:
	@vagrant up

delete:
	@vagrant destroy -f workstation

provision:
	@vagrant up --provision

stop:
	@vagrant halt
