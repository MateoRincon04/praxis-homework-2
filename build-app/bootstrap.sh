#!/usr/bin/env bash

# NECESSARY TOOLS TO EXECUTE THE PROYECT
#Installations using yum and given a positive answer to posible permission requests

# Git installation via yum command
sudo yum install git -y
git --version

# Go installation via yum command
sudo yum install golang -y
go version

# npm & NodeJS installation commands
curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
sudo yum install nodejs -y

node --version
npm --version

# Vue cli installation command
echo "aqui"
# cd /
# cd /home/vagrant/
# touch package.json
echo "removing package-lock"
rm package-lock.json
echo "removed package-lock"
rm -rf node_modules
echo "removing modules"
npm config set registry https://registry.npmjs.org/
echo "config registry"
npm config set strict-ssl false
echo "config strict-ssl"
sudo npm install -g @vue/cli -y

# Verify installation