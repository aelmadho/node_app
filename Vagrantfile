# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# Define Cloud/VM Infrastructure
machines = {
  'web.vm' => ['172.28.128.100', '2', '512', false, 'centos/7'],
}

Vagrant.configure(2) do |config|

  # DNS 
  config.landrush.enabled = true
  config.landrush.tld = "vm"

  # Disable from re-generating SSH keys on every run of "vagrant up"
  config.ssh.insert_key = false

  # Explicit NFS share
  config.vm.synced_folder ".", "/home/vagrant/sync", type: "nfs"

  machines.each do | (name, cfg) |

    # Machine config
    ip, cpu, ram, gui, box = cfg
    
    config.vm.define name do |machine|
      
      # Set generic VM options and allocate static internal IP
      machine.vm.box = box
      machine.vm.hostname = name
      machine.vm.network "private_network", ip: ip

      # Ansible Provisionser
      machine.vm.provision "ansible" do |ansible|
        ansible.verbose = ""
        ansible.playbook = "site.yml"
      end

      # Shell Provisioner - Append IP to $HOME/script.out
      machine.vm.provision "shell", path: "scripts/my_ip.sh", privileged: false

      # Set VM resources
      machine.vm.provider "virtualbox" do |vbox|
        vbox.memory = ram
        vbox.cpus = cpu
        vbox.gui = gui
      end
      
    end

  end
end
