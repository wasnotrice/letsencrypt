# add DNS out-of-band
#
# - no-encrypt.citizen.io
# - encrypt.citizen.io
#
# ssh into server

# Add user
adduser eric
usermod -aG sudo eric

# Copy public key (from local machine)
#
# ssh-copy-id eric@server_ip

# Disable password login
sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

sudo systemctl reload sshd

# Firewall
sudo ufw app list
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status

# Nginx
sudo apt-get update
sudo apt-get install -y nginx

sudo ufw app list
sudo ufw allow 'Nginx Full'
sudo ufw status

systemctl status nginx

sudo mkdir /var/www/no-encrypt/html
sudo mkdir /var/www/encrypt/html
sudo chown -R $USER:$USER /var/www/no-encrypt/html
sudo chown -R $USER:$USER /var/www/encrypt/html

# Copy index.html from local machine
# rsync -avz index.html encrypt.citizen.io:/var/www/no-encrypt/html/index.html
# rsync -avz index.html encrypt.citizen.io:/var/www/encrypt/html/index.html


sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/no-encrypt
sudo vim /etc/nginx/sites-available/no-encrypt
sudo cp /etc/nginx/sites-available/no-encrypt /etc/nginx/sites-available/encrypt
sudo vim /etc/nginx/sites-available/encrypt

sudo ln -s /etc/nginx/sites-available/no-encrypt /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/encrypt /etc/nginx/sites-enabled/

sudo nginx -t
sudo systemctl restart nginx t
