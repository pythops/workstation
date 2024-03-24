default:
    @just --list --unsorted

setup:
    uv venv
    source .venv/bin/activate
    uv pip install ansible
    ansible-galaxy collection install community.general ansible.posix community.crypto

configure target:
    @-scripts/configure.sh {{ target }}

clean target:
    @-scripts/clean.sh {{ target }}

start-vm:
    @-scripts/start-vm.sh

stop-vm:
    @-scripts/stop-vm.sh

clean-vm:
    @rm -rf archbox cloudinit

configure-vm:
    ssh \
        -o StrictHostKeyChecking=no \
        -o "UserKnownHostsFile /dev/null" \
        -p 10022 \
        pythops@localhost -t "cd /mnt && SUDO_WITHOUT_PASSWORD=1  just configure all"

ssh-vm:
    ssh \
        -o StrictHostKeyChecking=no \
        -o "UserKnownHostsFile /dev/null" \
        -p 10022 \
        pythops@localhost
