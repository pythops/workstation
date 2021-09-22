<div align="center">
    <h1> 💻  Workstation Setup 💻 </h1>
</div>

### 📜 Summary

**OS**: [Arch Linux](https://wiki.archlinux.org/title/Arch_Linux)

**Window Manager**: [i3](https://github.com/i3/i3)

**Terminal emulator**: [alacritty](https://github.com/alacritty/alacritty)

**Terminal multiplexer**: [tmux](https://github.com/tmux/tmux)

**Editor**: [NeoVim](https://github.com/neovim/neovim)

**Dev environments**: [Python]() and [Rust]()

<br/>

### 🛠️ Requirements

#### 1. Install Ansible
```
$ pip install --user ansible
$ ansible-galaxy collection install community.general
```

#### 2. Install Xephyr (needed for preview, optional)
```
$ sudo pacman -Syu xorg-server-xephyr
```

> More infos about Xephyr (https://wiki.archlinux.org/title/Xephyr)

#### 3. Install [docker](https://docs.docker.com/engine/install/) (needed for preview, optional)

<br/>

### 🔬 Usage
```
$ make <target>
```

available tagets:
- all: Install the whole system
- alacritty
- git
- i3
- neovim
- packages
- python
- rust
- tmux
- zsh

<br/>

### 📺 Preview

Build docker image
```
$ make build
```

Run the whole system inside a container
```
$ make run
```

> Pressing Ctrl + Shift should lock/unlock your mouse pointer and your keystrokes inside Xephyr window exclusively.

<br/>

## ⚖️  License
GPLv3
