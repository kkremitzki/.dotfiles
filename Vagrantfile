Vagrant.configure("2") do |config|

  config.vm.define :dotfiles do |conf|
    conf.vm.box = "debian/bookworm64"
    conf.vm.hostname = "dotfiles"
    conf.vm.provision "ansible" do |ansible|
      ansible.playbook = "setup.yml"
    end
    conf.vm.provider :libvirt do |libvirt|
      libvirt.cpus = 2
      libvirt.memory = 1024
    end
  end

end
