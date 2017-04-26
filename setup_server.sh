# add DNS out-of-band
#
# - http.citizen.io
# - https.citizen.io
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

sudo mkdir /var/www/http/html
sudo mkdir /var/www/https/html
sudo chown -R $USER:$USER /var/www/http/html
sudo chown -R $USER:$USER /var/www/https/html

# Copy index.html from local machine
# rsync -avz index.html http.citizen.io:/var/www/http/html/index.html

cp /var/www/http/html/index.html /var/www/https/html/index.html
sed -i.bak 's/HTTP/HTTPS/' /var/www/https/html/index.html
sed -i.bak 's/No/Yes/' /var/www/https/html/index.html
sed -i.bak 's/no/yes/' /var/www/https/html/index.html
sed -i.bak 's/ not\./\. Good job\!/' /var/www/https/html/index.html
sed -i.bak 's/<body>/<body class="https">/' /var/www/https/html/index.html
rm -f index.html.bak

sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/http
sudo vim /etc/nginx/sites-available/http
sudo cp /etc/nginx/sites-available/http /etc/nginx/sites-available/https
sudo vim /etc/nginx/sites-available/https

sudo ln -s /etc/nginx/sites-available/http /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/https /etc/nginx/sites-enabled/

sudo nginx -t
sudo systemctl restart nginx t
