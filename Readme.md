<div align="center">
    <img src="https://img.shields.io/badge/Ansible-000000?style=for-the-badge&logo=ansible&logoColor=white"</img>
    <img src="https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white"</img>
    <img alt="Static Badge" src="https://img.shields.io/badge/GPLv3-License?style=for-the-badge&label=License">
    <h1>My Workstation Setup </h1>
    <img src="assets/cover.png"</img>
</div>

### 📜 Summary

**OS**: [Arch Linux](https://wiki.archlinux.org/title/Arch_Linux)

**Window Manager**: [i3](https://github.com/i3/i3)

**Terminal emulator**: [wezterm](https://github.com/wez/wezterm)

**Terminal multiplexer**: [tmux](https://github.com/tmux/tmux)

**Tmux plugins**: [plugins](https://github.com/pythops/workstation/blob/master/roles/configure/files/config/tmux/tmux.conf#L60)

**Shell**: [fish](https://github.com/fish-shell/fish-shell)

**Prompt**: [starship](https://github.com/starship/starship)

**Editor**: [NeoVim](https://github.com/neovim/neovim)

**Neovim plugins**: [plugins](https://github.com/pythops/workstation/blob/master/roles/configure/files/config/nvim/lua/plugins/)

**Dev environments**: [Python](https://github.com/pythops/workstation/blob/master/roles/configure/tasks/python.yaml), [Rust](https://github.com/pythops/workstation/blob/master/roles/configure/tasks/rust.yaml), [Go](https://github.com/pythops/workstation/blob/master/roles/configure/tasks/go.yaml)

<br>

### 🛠️ Requirements

- [just](https://github.com/casey/just) command runner.
- [uv](https://github.com/astral-sh/uv) python package installer.
- Qemu (Optional, used for the preview only)

<br>

### 🚀 Setup

```
$ just setup
```

<br>

### 🔬 Usage

```
$ just configure <target>
```

Available targets:

- all
- audio
- bluetooth
- containers
- dnsmasq
- esp
- fish
- git
- go
- gpu
- i3
- keyboard
- lua
- minikube
- neovim
- npm
- packages
- python
- rust
- starship
- tmux
- wezterm
- wifi
- yay

<br>

### 📺 Preview

Create an Archlinux VM

```
$ just start-vm
```

Configure the whole VM

```
$ just configure-vm
```

Connect to the VM using a VNC client (tigervnc in this example)

```
 $ vncviewer :5900
```

The credentials are:

```
login: pythops
password: pythops
```

<br>

## ⚖️ License

GPLv3
