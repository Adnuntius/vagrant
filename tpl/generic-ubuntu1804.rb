# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'

Vagrant.configure(2) do |config|
  config.vm.boot_timeout = 1800
  config.vm.synced_folder ".", "/vagrant", type: "nfs"
  config.nfs.verify_installed = false

  config.vm.box_check_update = true

  config.vm.provider :libvirt do |v, override|
    v.disk_bus = "scsi"
    v.driver = "kvm"
    v.video_vram = 256
    v.memory = 2048
    v.cpus = 2
  end
end

