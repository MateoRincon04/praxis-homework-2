#!/usr/bin/env bash
echo "Hello world!"

# NECESSARY TOOLS TO EXECUTE THE PROYECT
#Installations using yum and given a positive answer to posible permission requests

# Git installation via yum command
sudo yum install git -y

# Go installation via yum command
sudo yum install golang -y

# npm & NodeJS installation commands
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install nodejs -y

# Vue cli installation command
yes | npm install -g @vue/cli