# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "virtualUbuntu64"

  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.provision :shell, :inline => "sudo apt-get install curl -y" 
  config.vm.provision :shell, :inline => "sudo apt-get install wget -y"

  config.vm.provision :shell, :inline => "curl -s https://get.docker.io/ubuntu/ | sudo sh > /dev/null 2>&1"

  config.vm.provision :shell, :inline => "sudo wget https://github.com/outbrain/zookeepercli/releases/download/v1.0.5/zookeepercli; chmod +x zookeepercli"

  config.vm.forward_port 2181, 2181
end

Vagrant.configure("2") do |config|

	config.vm.provider :virtualbox do |virtualbox|
	            
		virtualbox.customize ["modifyvm", :id, "--memory", "1024"]     
	                 
	end
end
