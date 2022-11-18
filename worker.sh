#!/bin/bash

sudo apt install -y nfs-common
sudo mount 10.10.10.100:/var/lib/docker/volumes/web/_data /var/lib/docker/volumes/web/_data

    docker swarm join --token SWMTKN-1-3qx58ppq5suojcdzwnf5ryenn2fkmp10qql3lrlahdufw4ax21-1rg6wsxhd7qwy23ui2uckwvv0 10.10.10.100:2377
