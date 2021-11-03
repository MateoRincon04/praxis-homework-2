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
sudo npm install -g @vue/cli -y
vue --version

#Clone the test repository
git clone https://github.com/jdmendozaa/vuego-demoapp.git

#Build the environment for the back-end of the project that uses Go
cd vuego-demoapp/server
go build
echo 'export PORT=4001' >> /etc/profile

#Make a copy of the binary file called vuego-demoapp and move it to the shared folder
cd /
cp /home/vagrant/vuego-demoapp/server/vuego-demoapp /shared/

# Building the environment fot the front-end of the project that uses Vue cli
cd home/vagrant/vuego-demoapp/spa
sudo npm install
sudo echo 'VUE_APP_API_ENDPOINT="http://localhost:4001/api"' >> /home/vagrant/vuego-demoapp/spa/.env.production.local
npm run build

# Compress the generated folder dist.tar.gz and move it to the shared folder
tar -zcvf dist.tar.gz ./dist
mv dist.tar.gz /shared/