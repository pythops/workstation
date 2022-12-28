<div align="center">
    <h1> 💻  Workstation Setup 💻 </h1>
</div>

### 📜 Summary

**OS**: [Arch Linux](https://wiki.archlinux.org/title/Arch_Linux)

**Window Manager**: [i3](https://github.com/i3/i3)

**Terminal emulator**: [alacritty](https://github.com/alacritty/alacritty)

**Terminal multiplexer**: [tmux](https://github.com/tmux/tmux)

**Tmux plugins**: [plugins](https://github.com/pythops/workstation/blob/master/roles/configure/files/config/tmux/tmux.conf#L60)

**Zsh configuration framework**: [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)

**Prompt**: [starship](https://github.com/starship/starship)

**Editor**: [NeoVim](https://github.com/neovim/neovim)

**Neovim plugins**: [plugins](https://github.com/pythops/workstation/blob/master/roles/configure/files/config/nvim/plugins.vim)

**Dev environments**: [Python]() and [Rust]()

<br/>

### 🛠️ Requirements

#### 1. Install Ansible
```
$ pip install --user ansible
$ ansible-galaxy collection install community.general ansible.posix community.crypto
```

#### 2. Install `just` command runner
https://github.com/casey/just

#### 3. Install Virtualbox and vagrant (needed for preview, optional)
```
$ sudo pacman -Syu virtualbox vagrant
$ vagrant plugin install vagrant-reload
```

<br/>

### 🔬 Usage
```
$ just <target>
```

available tagets:
- all: Install the whole system
- alacritty
- containers: Container tools (podman, buildah, skopeo)
- dnsmasq
- esp: esp32 s3
- git
- i3
- minikube
- neovim
- npm
- packages
- python
- rust
- starship
- tmux
- yay
- zsh

<br/>

### 📺 Preview

Run an Archlinx VM and provision it
```
$ just run
```

<br/>

## ⚖️  License
GPLv3
