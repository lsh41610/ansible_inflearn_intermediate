# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant_API_Version = "2"

Vagrant.configure(Vagrant_API_Version) do |config|

  #Ansible-Node01
  config.vm.define:"ansible-node01" do |cfg|
    cfg.vm.box = "centos/7"
    cfg.vm.provider:virtualbox do |vb|
      vb.name="Ansible-Node01(Udemy-Bloter)"
      vb.customize ["modifyvm", :id, "--cpus",1]
      vb.customize ["modifyvm", :id, "--memory",512]
    end
    cfg.vm.host_name="ansible-node01"
    cfg.vm.synced_folder ".", "/vagrant", disabled: true
    cfg.vm.network "public_network", ip: "192.168.1.13"
    cfg.vm.network "forwarded_port", guest:22, host: 19211, auto_corret: false, id: "ssh"
    cfg.vm.provision "shell", path: "bash_ssh_conf_4_CentOS.sh" #centos의 /etc/ssh/sshd_config의 PasswordAuthentication값을 yes로 바꾸어 ssh를 가능하게 함.
  end
  
  #Ansible-Node02
  config.vm.define:"ansible-node02" do |cfg|
    cfg.vm.box = "centos/7"
    cfg.vm.provider:virtualbox do |vb|
      vb.name="Ansible-Node02(Udemy-Bloter)"
      vb.customize ["modifyvm", :id, "--cpus",1]
      vb.customize ["modifyvm", :id, "--memory",512]
    end
    cfg.vm.host_name="ansible-node02"
    cfg.vm.synced_folder ".", "/vagrant", disabled: true
    cfg.vm.network "public_network", ip: "192.168.1.14"
    cfg.vm.network "forwarded_port", guest:22, host: 19212, auto_corret: false, id: "ssh"
    cfg.vm.provision "shell", path: "bash_ssh_conf_4_CentOS.sh" #centos의 /etc/ssh/sshd_config의 PasswordAuthentication값을 yes로 바꾸어 ssh를 가능하게 함.
  end

  #Ansible-Node03
  config.vm.define:"ansible-node03" do |cfg|
    cfg.vm.box = "ubuntu/trusty64"
    cfg.vm.provider:virtualbox do |vb|
      vb.name="Ansible-Node03(Udemy-Bloter)"
      vb.customize ["modifyvm", :id, "--cpus",1]
      vb.customize ["modifyvm", :id, "--memory",512]
    end
    cfg.vm.host_name="ansible-node03"
    cfg.vm.synced_folder ".", "/vagrant", disabled: true
    cfg.vm.network "public_network", ip: "192.168.1.15"
    cfg.vm.network "forwarded_port", guest: 22, host: 19213, auto_correct: false, id: "ssh"
  end

  #Ansible-Node04
  config.vm.define:"ansible-node04" do |cfg|
    cfg.vm.box = "ubuntu/trusty64"
    cfg.vm.provider:virtualbox do |vb|
      vb.name="Ansible-Node04(Udemy-Bloter)"
      vb.customize ["modifyvm", :id, "--cpus",1]
      vb.customize ["modifyvm", :id, "--memory",512]
    end
    cfg.vm.host_name="ansible-node04"
    cfg.vm.synced_folder ".", "/vagrant", disabled: true
    cfg.vm.network "public_network", ip: "192.168.1.16"
    cfg.vm.network "forwarded_port", guest: 22, host: 19214, auto_correct: false, id: "ssh"
  end
  
  #Ansible-Node05 (Windows2012R2)
  config.vm.define:"ansible-node05" do |cfg|
    cfg.vm.box ="opentable/win-2012r2-standard-amd64-nocm"
    cfg.vm.provider:virtualbox do |vb|
      vb.name="Ansible-Node05(Udemy-Bloter)"
      vb.customize ["modifyvm", :id, "--cpus,2"]
      vb.customize ["modifyvm", :id, "--memory",2048]
    end
    cfg.vm.host_name="ansible-node05"
    cfg.vm.synced_folder ".", "/vagrant", disabled: true
    cfg.vm.network "public_network", ip: "192.168.1.17"
    cfg.vm.network "forwarded_port", guest: 22, host: 19215, auto_correct: false, id: "ssh"
    cfg.vm.provision "shell", inline: "netsh firewall set opmode disable"
  end

  #Ansible-Server
  config.vm.define:"ansible-server" do |cfg|
    cfg.vm.box = "centos/7"
    cfg.vm.provider:virtualbox do |vb|
      vb.name="Ansible-Server(Udemy-Bloter)"
    end
    cfg.vm.host_name="ansible-server"
    cfg.vm.synced_folder ".", "/vagrant", disabled: true
    cfg.vm.network "public_network", ip: "192.168.1.12" #"public_network는 브릿지 어댑터 사용한다는 뜻"
    cfg.vm.network "forwarded_port", guest: 22, host: 19210, auto_correct: false, id: "ssh"
    cfg.vm.provision "shell", path: "bootstrap.sh" #path: shell 호출시 파일 전송 및 실행
    cfg.vm.provision "file", source: "Ansible_env_ready.yml", destination: "Ansible_env_ready.yml"
    cfg.vm.provision "shell", inline: "ansible-playbook Ansible_env_ready.yml" #inline: shell 호출시 명령어만 실행
    cfg.vm.provision "shell", path: "add_ssh_auth.sh", privileged: false # root가 아닌 유저 권한(이 경우에는 vagrant 유저의 권한)으로 add_ssh_auth.sh전송 및 실행
    cfg.vm.provision "file", source: "Ansible_ssh_conf_4_CentOS.yml", destination: "Ansible_ssh_conf_4_CentOS.yml"
    cfg.vm.provision "shell", inline: "ansible-playbook Ansible_ssh_conf_4_CentOS.yml"

  end

end