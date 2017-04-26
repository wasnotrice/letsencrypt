```
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install -y certbot

sudo vim /etc/nginx/sites-available/https
```

Install ACME endpoint

```
# /etc/nginx/sites-available/https

# Add
location ~ /.well-known {
 	allow all;
}
```

Get cert

```
sudo certbot certonly --webroot -w /var/www/https/html -d https.citizen.io --email wasnotrice+letsencryptdemo@gmail.com --agree-tos
sudo certbot renew --dry-run
```

Config server for https

```
# /etc/nginx/snippets/ssl-https.conf

ssl_certificate /etc/letsencrypt/live/https.citizen.io/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/https.citizen.io/privkey.pem;
```

```
# /etc/nginx/sites-available/https

server {
        listen 80;
        listen [::]:80;

        server_name https.citizen.io;

        return 301 https://$server_name$request_uri;
}

server {
        listen 443 ssl http2;
        listen [::]:443 http2;

        include snippets/ssl-https.conf;

        root /var/www/https/html;
        index index.html;

        location ~ /.well-known {
                allow all;
        }

        location / {
                try_files $uri $uri/ =404;
        }
}
```
