FROM archlinux
RUN pacman -Sy just ansible --noconfirm
RUN ansible-galaxy collection install --upgrade community.general ansible.posix community.crypto
WORKDIR /workstation
COPY . /workstation
