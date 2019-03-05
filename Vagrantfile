Vagrant.configure("2") do |config|

config.vm.define "DARKSURGEON" do |cfg|
  cfg.vm.box = "./DARKSURGEON_w10_1809_x64_hyperv.box"
  cfg.vm.hostname = "DARKSURGEON"
  cfg.vm.guest = :windows
  cfg.vm.communicator = "winrm"
  cfg.vm.boot_timeout = 300

  # Disabling Shared Folders
  cfg.vm.synced_folder ".", "/vagrant", disabled: true

  # System Administrator Credentials
  # Recommend Changing These In Production
  cfg.winrm.username = "darksurgeon"
  cfg.winrm.password = "darksurgeon"

  cfg.vm.provider 'hyperv' do |hv|
    hv.ip_address_timeout = 240
    hv.memory = 2048
    end

  cfg.vm.provider "vmware_fusion" do |v, override|
    v.memory = 2048
    v.cpus = 4
    v.gui = true
    end

  cfg.vm.provider "virtualbox" do |vb, override|
    vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", 2048]
    vb.customize ["modifyvm", :id, "--cpus", 2]
    vb.customize ["modifyvm", :id, "--vram", "32"]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["setextradata", "global", "GUI/SuppressMessages", "all" ]
    end  
  end
end
