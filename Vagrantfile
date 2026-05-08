Vagrant.configure("2") do |config|

  config.vm.box = "perk/ubuntu-2204-arm64"

  config.vm.network "forwarded_port", guest: 8080, host: 9090

  config.vm.provider "vmware_desktop" do |v|
    v.vmx["memsize"] = "2048"
    v.vmx["numvcpus"] = "2"
  end

  config.vm.provision "shell", path: "scripts/setup.sh"

  config.vm.synced_folder ".", "/vagrant"

end