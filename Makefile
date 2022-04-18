SHELL := /bin/bash

all:
	@ansible-playbook configure.yaml -K

alacritty:
	@ansible-playbook configure.yaml -t alacritty -K

dnsmasq:
	@ansible-playbook configure.yaml -t dnsmasq -K

git:
	@ansible-playbook configure.yaml -t git -K

i3:
	@ansible-playbook configure.yaml -t i3 -K

minikube:
	@ansible-playbook configure.yaml -t minikube -K -D

neovim:
	@ansible-playbook configure.yaml -t neovim -K

npm:
	@ansible-playbook configure.yaml -t npm -K

packages:
	@ansible-playbook configure.yaml -t packages -K

containers:
	@ansible-playbook configure.yaml -t containers -K

python:
	@ansible-playbook configure.yaml -t python

rust:
	@ansible-playbook configure.yaml -t rust

tmux:
	@ansible-playbook configure.yaml -t tmux -K

zathura:
	@ansible-playbook configure.yaml -t zathura

zsh:
	@ansible-playbook configure.yaml -t zsh -K

yay:
	@ansible-playbook configure.yaml -t yay -K


run:
	@vagrant up

delete:
	@vagrant destroy -f workstation

provision:
	@vagrant up --provision

stop:
	@vagrant halt
