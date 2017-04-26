#!/bin/bash
set -e

sudo /usr/bin/certbot certonly --webroot -n \
  -w /var/www/encrypt/html \
  -d encrypt.citizen.io \
  --email wasnotrice+letsencryptdemo@gmail.com \
  --agree-tos

