default:
    @just --list --unsorted

configure target:
    @-scripts/configure.sh {{ target }}

start-vm:
    @-scripts/start-vm.sh

stop-vm:
    @-scripts/stop-vm.sh

configure-vm:
    ssh \
        -o StrictHostKeyChecking=no \
        -o "UserKnownHostsFile /dev/null" \
        -p 10022 \
        pythops@localhost -t "cd /mnt && SUDO_WITHOUT_PASSWORD=1  just configure all"

clean:
    rm -rf archbox cloudinit
