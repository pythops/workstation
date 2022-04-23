default:
  @just --list --unsorted

all ansible_options='':
	@ansible-playbook configure.yaml -K {{ ansible_options }}

alacritty ansible_options='':
	@ansible-playbook configure.yaml -t alacritty -K {{ ansible_options }}

dnsmasq ansible_options='':
	@ansible-playbook configure.yaml -t dnsmasq -K {{ ansible_options }}

git ansible_options='':
	@ansible-playbook configure.yaml -t git -K {{ ansible_options }}

i3 ansible_options='':
	@ansible-playbook configure.yaml -t i3 -K {{ ansible_options }}

minikube ansible_options='':
	@ansible-playbook configure.yaml -t minikube -K {{ ansible_options }}

neovim ansible_options='':
	@ansible-playbook configure.yaml -t neovim -K {{ ansible_options }}

npm ansible_options='':
	@ansible-playbook configure.yaml -t npm -K {{ ansible_options }}

packages ansible_options='':
	@ansible-playbook configure.yaml -t packages -K {{ ansible_options }}

containers ansible_options='':
	@ansible-playbook configure.yaml -t containers -K {{ ansible_options }}

python ansible_options='':
	@ansible-playbook configure.yaml -t python {{ ansible_options }}

rust ansible_options='':
	@ansible-playbook configure.yaml -t rust {{ ansible_options }}

tmux ansible_options='':
	@ansible-playbook configure.yaml -t tmux -K {{ ansible_options }}

zathura ansible_options='':
	@ansible-playbook configure.yaml -t zathura {{ ansible_options }}

zsh ansible_options='':
	@ansible-playbook configure.yaml -t zsh -K {{ ansible_options }}

yay ansible_options='':
	@ansible-playbook configure.yaml -t yay -K {{ ansible_options }}

run:
	@vagrant up

delete:
	@vagrant destroy -f workstation

provision:
	@vagrant up --provision

stop:
	@vagrant halt
