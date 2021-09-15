FROM archlinux
ENV PATH="/root/.local/bin:${PATH}"
RUN pacman -Syu --noconfirm python python-pip make sudo && \
    pip install --user ansible && \
    ansible-galaxy collection install community.general
COPY . /setup
WORKDIR /setup
RUN make git
RUN make python
RUN make tmux
RUN make neovim
RUN make i3
