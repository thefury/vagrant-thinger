# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "debian32"

  # Enable provisioning with chef solo, specifying a cookbooks path (relative
  # to this Vagrantfile), and adding some recipes and/or roles.
  #
  config.vm.forward_port(80, 4567)
  
  config.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = "cookbooks"
  
     chef.add_recipe "build-essential"
     chef.add_recipe "rvm"
     chef.add_recipe "postgresql"
     chef.add_recipe "apache2"
     chef.add_recipe "passenger"
     #
  #   # You may also specify custom JSON attributes:
     chef.json = { :mysql_password => "foo" }
  end
end
