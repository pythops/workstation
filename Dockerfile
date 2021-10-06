FROM archlinux
ENV PATH="/home/pythops/.local/bin:${PATH}"
RUN pacman -Syu --noconfirm python python-pip make sudo zsh && \
    useradd --create-home --shell /usr/sbin/zsh pythops && \
    echo "pythops ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
COPY . /tmp/setup
WORKDIR /tmp/setup
USER pythops
RUN pip install --user ansible && \
    ansible-galaxy collection install community.general
RUN make git
RUN make packages
RUN make python
RUN make npm
RUN make tmux
RUN make neovim
RUN make i3
RUN make alacritty
RUN make zsh
RUN make rust
