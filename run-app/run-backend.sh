#!/usr/bin/env bash

# Explicitly refractoring the PORT environmental variable to 4001
echo 'export PORT=4001' >> /etc/profile

# Executing in the background the binary file 
cd /shared/
nohup ./vuego-demoapp > server.out 2>&1 &