# -*- mode: ruby -*-
# vi: set ft=ruby :

# A simple vagrant file for setting up an Ubuntu virtualbox.
# Use for testing remote dotfile deployment.

BOX_IP_ZONE = ENV['BOX_IP_ZONE'] || "192.168.111"

Vagrant.configure("2") do |config|
  # Set up multiple servers for different services
  config.vm.define "ubuntu" do |ubuntu|
    ip_end = "227"
    ubuntu.vm.box = "ubuntu/trusty64"
    ubuntu.vm.network :private_network, ip: BOX_IP_ZONE + "." + ip_end
  end

  # TODO: Red Hat
end
