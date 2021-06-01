#!/bin/bash

apt update
apt install default-jre -y

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
mkdir /etc/apt/sources.list.d
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

apt update

apt install -y jenkins git-core mc ranger curl wget docker-compose

wget -O - https://get.docker.com | bash -

adduser jenkins docker
usermod -g root jenkins
