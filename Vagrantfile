# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.define:"ansible-server" do |cfg|
    cfg.vm.box = "centos/7"
    cfg.vm.provider:virtualbox do |vb|
      vb.name="Ansible-Server(Udemy-Bloter)"
    end
    cfg.vm.host_name="ansible-server"
    cfg.vm.synced_folder ".", "/vagrant", disabled: true
    cfg.vm.network "public_network", ip: "192.168.1.12" #"public_network는 브릿지 어댑터 사용한다는 뜻"
    cfg.vm.network "forwarded_port", guest: 22, host: 19210, auto_correct: false, id: "ssh"
    cfg.vm.provision "shell", path: "bootstrap.sh"
  end

end