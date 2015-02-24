# Docker-Zookeeper
Zookeeper in a container. Done and done.

Build: 

        docker build -t <username>/zookeeper . 

Run: 

        docker run -p 2181:2181 -it <username>/zookeeper 


Vagrant: 
	
	vagrant up
	vagrant ssh
	/vagrant/deployZookeeper



>For clustering, use `-p 2181:2181 2888:2888 3888:3888` 
