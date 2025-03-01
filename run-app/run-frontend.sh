#!/usr/bin/env bash

# Move to the front-end compressed file in shared folder
cd /shared/
tar -xzvf dist.tar.gz

# Nginx installation using yum
sudo yum install epel-release -y
sudo yum install nginx -y

# Nginx start running the service
sudo systemctl start nginx
sudo systemctl enable nginx

# Point to the repository where the index.html file is in and save the config, error located in root, it has to be rooted on /shared/dist
cat <<-'default_config' > /etc/nginx/nginx.conf
user  nginx;
worker_processes  1;
error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;
events {
  worker_connections  1024;
}
http {
  include       /etc/nginx/mime.types;
  default_type  application/octet-stream;
  log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for"';
  access_log  /var/log/nginx/access.log  main;
  sendfile        on;
  keepalive_timeout  65;
  server {
    listen       80;
    server_name  localhost;
    location / {
      root   /shared/dist; 
      index  index.html;
      try_files $uri $uri/ /index.html;
    }
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
      root   /usr/share/nginx/html;
    }
  }
} 
default_config

# Restarting Nginx
sudo systemctl reload nginx