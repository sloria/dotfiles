# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant configuration file, simplified from:
# https://github.com/pjan/the-ansibles/blob/master/contrib/vagrant/Vagrantfile
BOX_IP_ZONE = ENV['BOX_IP_ZONE'] || "192.168.111"
BOX_FORWARDED_PORT = ENV['BOX_FORWARDED_PORT'] || 22

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Set up multiple servers for different services
  config.vm.define "ubuntu" do |ubuntu|
    ip_end = "227"
    ubuntu.vm.box = "ubuntu/trusty64"
    ubuntu.vm.network :private_network, ip: BOX_IP_ZONE + "." + ip_end
  end
end
