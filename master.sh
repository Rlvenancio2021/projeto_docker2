#!/bin/bash
sudo docker swarm init --advertise-addr=10.10.10.100
sudo docker swarm join-token worker | grep docker >> /vagrant/worker.sh

sudo apt-get install -y zip

wget https://github.com/Rlvenancio2021/site/archive/refs/heads/main.zip
unzip main.zip
sudo cp -R ./site-main/* /var/lib/docker/volumes/web/_data/

apt-get install -y nfs-server

sudo echo "/var/lib/docker/volumes/web/_data *(rw,sync,subtree_check)" >> /etc/exports

sudo exportfs -ar
