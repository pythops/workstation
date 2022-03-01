SHELL := /bin/bash

all:
	@ansible-playbook setup.yaml -K

alacritty:
	@ansible-playbook setup.yaml -t alacritty -K

dnsmasq:
	@ansible-playbook setup.yaml -t dnsmasq -K

git:
	@ansible-playbook setup.yaml -t git -K

i3:
	@ansible-playbook setup.yaml -t i3 -K

minikube:
	@ansible-playbook setup.yaml -t minikube -K -D

neovim:
	@ansible-playbook setup.yaml -t neovim -K

npm:
	@ansible-playbook setup.yaml -t npm -K

packages:
	@ansible-playbook setup.yaml -t packages -K

containers:
	@ansible-playbook setup.yaml -t containers -K

python:
	@ansible-playbook setup.yaml -t python

rust:
	@ansible-playbook setup.yaml -t rust

tmux:
	@ansible-playbook setup.yaml -t tmux -K

zathura:
	@ansible-playbook setup.yaml -t zathura

zsh:
	@ansible-playbook setup.yaml -t zsh -K

run:
	@vagrant up

yay:
	@ansible-playbook setup.yaml -t yay -K


delete:
	@vagrant destroy -f workstation

provision:
	@vagrant up --provision

stop:
	@vagrant halt
