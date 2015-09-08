Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, path: "provision/bootstrap.sh"

  config.vm.synced_folder "./", "/var/www", create: true, group: "www-data", owner: "www-data"
  config.vm.network :forwarded_port, guest: 80, host: 8931, auto_correct: true
end
