#!/usr/bin/env bash

set -e

mkdir -p archbox

if [ ! -f "archbox/arch.qcow2" ]; then
	wget -q -nv --show-progress https://geo.mirror.pkgbuild.com/images/latest/Arch-Linux-x86_64-cloudimg.qcow2 -O archbox/arch.qcow2
fi

if [ ! -f "archbox/cloud-init.iso" ]; then
	mkdir -p cloudinit
	cat <<EOF >cloudinit/user-data
    #cloud-config
    packages:
        - zsh
        - git
        - just
        - ansible
    ssh_pwauth: false
    swap:
      filename: ""
    users:
      - name: pythops
        shell: /usr/bin/zsh
        sudo: ALL=(ALL) NOPASSWD:ALL
        plain_text_passwd: pythops
        lock_passwd: false
        ssh_authorized_keys: $(cat ~/.ssh/id_rsa.pub)
    runcmd:
        - mount -t 9p -o trans=virtio,version=9p2000.L host_share /mnt/
EOF

	touch cloudinit/meta-data
	xorriso -as genisoimage \
		-output archbox/cloud-init.iso \
		-volid CIDATA \
		-joliet \
		-quiet \
		-rock cloudinit/user-data cloudinit/meta-data &>/dev/null
fi

if [ "$(qemu-img info archbox/arch.qcow2 | grep "virtual size" | awk '{print $3}')" -le 10 ]; then
	qemu-img resize archbox/arch.qcow2 +10G
fi

qemu-system-x86_64 \
	-enable-kvm \
	-daemonize \
	-nic user,hostfwd=tcp::10022-:22 \
	-virtfs local,path=.,mount_tag=host_share,security_model=none \
	-m 2G \
	-device VGA,edid=on,xres=1920,yres=1080 \
	-cdrom archbox/cloud-init.iso \
	archbox/arch.qcow2

printf "Waiting for SSH to become available ..."
until ssh \
	-o StrictHostKeyChecking=no \
	-o "UserKnownHostsFile /dev/null" \
	-p 10022 \
	pythops@localhost -t "ls /mnt/Justfile && exit" &>/dev/null; do
	printf "."
	sleep 2
done
printf "\n"

echo "SSH is available. Run the following command to connect:"
printf "ssh \\
    -o StrictHostKeyChecking=no \\
    -o \"UserKnownHostsFile /dev/null\" \\
    -p 10022 \\
    pythops@localhost
"
