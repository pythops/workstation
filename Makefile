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

build:
	@docker build -t setup .

run:
	@(\
		Xephyr :1 -ac -br -screen 1024x768 -resizeable -reset -terminate &  \
		docker run --rm -it -e DISPLAY=:1 -v /tmp/.X11-unix:/tmp/.X11-unix  setup zsh \
	)
