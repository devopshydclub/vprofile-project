Vagrant.configure("2") do |config|

  config.vm.define "scriptbox" do |scriptbox|
    scriptbox.vm.box = "geerlingguy/centos7"
	scriptbox.vm.network "private_network", ip: "192.168.10.12"
	scriptbox.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
   end
  end

  config.vm.define "web01" do |web01|
    web01.vm.box = "geerlingguy/centos7"
	web01.vm.network "private_network", ip: "192.168.10.13"
  end
  
  config.vm.define "web02" do |web02|
    web02.vm.box = "geerlingguy/centos7"
	web02.vm.network "private_network", ip: "192.168.10.14"
  end

   config.vm.define "web03" do |web03|
    web03.vm.box = "ubuntu/bionic64"
        web03.vm.network "private_network", ip: "192.168.10.15"
  end
end
