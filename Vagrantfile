Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, path: "provision/setup.sh"

  config.vm.network :forwarded_port, guest: 80, host: 8931, auto_correct: true

  config.vm.synced_folder "./nucleus", "/var/www/nucleus", create: true, group: "www-data", owner: "www-data"
end
