<div align="center">
    <h1> 💻 </h1>
    <h1>My Workstation Setup </h1>
</div>

### 📜 Summary

**OS**: [Arch Linux](https://wiki.archlinux.org/title/Arch_Linux)

**Window Manager**: [i3](https://github.com/i3/i3)

**Terminal emulator**: [wezterm](https://github.com/wez/wezterm)

**Terminal multiplexer**: [tmux](https://github.com/tmux/tmux)

**Tmux plugins**: [plugins](https://github.com/pythops/workstation/blob/master/roles/configure/files/config/tmux/tmux.conf#L60)

**Zsh configuration framework**: [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)

**Prompt**: [starship](https://github.com/starship/starship)

**Editor**: [NeoVim](https://github.com/neovim/neovim)

**Neovim plugins**: [plugins](https://github.com/pythops/workstation/blob/master/roles/configure/files/config/nvim/plugins.vim)

**Dev environments**: [Python]() and [Rust]()

<br>

### 🛠️ Requirements

1. Ansible

```
$ pip install --user ansible
$ ansible-galaxy collection install community.general ansible.posix community.crypto
```

2. [just](https://github.com/casey/just) command runner

3. Qemu (Optional)

<br>

### 🔬 Usage

```
$ just configure <target>
```

Available tagetes:

- all
- containers
- dnsmasq
- esp
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
- wezterm
- yay
- zsh

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

login: pythops

password: pythops

<br>

## ⚖️ License

GPLv3
