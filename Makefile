SHELL := /bin/bash

all:
	@ansible-playbook setup.yaml -K

git:
	@ansible-playbook setup.yaml -t git -K

i3:
	@ansible-playbook setup.yaml -t i3 -K

neovim:
	@ansible-playbook setup.yaml -t neovim -K

redshift:
	@ansible-playbook setup.yaml -t redshift -K

tmux:
	@ansible-playbook setup.yaml -t tmux -K

python:
	@ansible-playbook setup.yaml -t python

build:
	@docker build -t setup .

run:
	@(\
		Xephyr :1 -ac -br -screen 1024x768 -resizeable -reset -terminate &  \
		docker run --rm -it -e DISPLAY=:1 -v /tmp/.X11-unix:/tmp/.X11-unix  setup bash \
	)
