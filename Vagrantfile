# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|

  config.vm.box = "archlinux/archlinux"
  config.vm.synced_folder ".", "/workstation"

  config.vm.define "workstation" do |workstation|
  	workstation.vm.hostname = "workstation"
        workstation.vm.provider "virtualbox" do |vb|
		vb.name = "workstation"
		vb.customize ["modifyvm", :id, "--memory", "2048"]
                vb.customize ["modifyvm", :id, "--vram", "256"]
                vb.customize ["modifyvm", :id, "--audio", "pulse", "--audiocontroller", "hda"]
                vb.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
	end
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provision.yaml"
  end
  config.vm.provision :reload

end
