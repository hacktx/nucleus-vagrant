#!/usr/bin/env bash

apt-get update

# install packages
apt-get install git -y
apt-get install nginx -y
apt-get install software-properties-common -y

# setup hhvm
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 -y
add-apt-repository "deb http://dl.hhvm.com/ubuntu $(lsb_release -sc) main" -y
apt-get update -y
apt-get install hhvm -y

# setup mysql
apt-get install debconf-utils -y
debconf-set-selections <<< "mysql-server mysql-server/root_password password Password"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password Password"
apt-get install mysql-server -y

# setup nginx
cp /vagrant/provision/config/nginx_vhost /etc/nginx/sites-available/nginx_vhost > /dev/null
ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-available/default
service nginx restart

# setup mysql
echo "CREATE DATABASE nucleus" | mysql -uroot -pPassword
mysql -uroot -pPassword nucleus < /vagrant/provision/config/schema.sql

# clone nucleus
git clone https://github.com/hacktx/nucleus.git
mkdir /var/www
ln -s $(pwd)/nucleus /var/www/

# setup composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# setup nucleus
cd nucleus
composer install
mkdir build
./vendor/bin/robo build
cp /vagrant/provision/config/config.ini .

# change permissions
cd ..
chown -R vagrant:vagrant nucleus
