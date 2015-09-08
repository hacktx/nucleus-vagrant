# Nuclues Vagrant

## Background
Vagrant and Virtualbox is an easy way to develop on projects cross-platform without having to worry about environment 
configuration and setup.

This vagrant file setups up an Ubuntu virtual machine and configures it to run [Nucleus](https://github.com/hacktx/nucleus).

## Usage
To use the vagrant file, you will need to have done the following:

1. Download and Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
1. Download and Install [Vagrant](https://www.vagrantup.com/downloads.html)
1. Open a shell prompt (Terminal app on a Mac) and cd into the folder containing the Vagrantfile
1. Run `vagrant up`

The first time you run `vagrant up`, Vagrant will download the required virtual box image, and then download and install all required packages. Once that is done, it will setup SQL and Nginx as necessary, and then download and setup Nucleus.

Once the VM is running, you can access it with `vagrant ssh`. The project directory is located at `~/nucleus` in the home diretory.

To access the running serice, simply navigate your browser on the host machine to `http://localhost:8391`. This port can be configed in the [Vagrantfile](Vagrantfile).
