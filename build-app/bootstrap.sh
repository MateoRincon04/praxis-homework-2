#!/usr/bin/env bash

# NECESSARY TOOLS TO EXECUTE THE PROYECT
#Installations using yum and given a positive answer to posible permission requests

# Git installation via yum command
sudo yum install git -y

# Go installation via yum command
sudo yum install golang -y

# npm & NodeJS installation commands
curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
sudo yum install nodejs -y

# Vue cli installation command
yes | npm install -g @vue/cli

# Verify installation
echo vue --version

#CLONING TESTING REPOSITORY
git clone https://github.com/jdmendozaa/vuego-demoapp.git

#Building Go environment for the backend
cd vuego-demoapp/server
go build

# Environment variable PORT injected into the environment where the app will run
echo 'export PORT=4001' >> /etc/profile

# Move the vuego-demoapp binary file to the /shared folder as requested
mv vuego-demoapp /shared/