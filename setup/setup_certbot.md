Install certbot
```
cat install_certbot.sh
bash install_certbot.sh
```

Install ACME endpoint

```
# /etc/nginx/sites-available/encrypt

# Add
location ~ /.well-known {
 	allow all;
}
```

Get cert

```
sudo certbot certonly --webroot -w /var/www/encrypt/html -d encrypt.citizen.io
sudo certbot renew --dry-run
```

Config server for https

```
# /etc/nginx/snippets/ssl-encrypt.conf

ssl_certificate /etc/letsencrypt/live/encrypt.citizen.io/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/encrypt.citizen.io/privkey.pem;
```

```
# /etc/nginx/sites-available/encrypt

server {
        listen 80;
        listen [::]:80;

        server_name encrypt.citizen.io;

        return 301 https://$server_name$request_uri;
}

server {
        listen 443 ssl http2;
        listen [::]:443 http2;

        include snippets/ssl-encrypt.conf;

        root /var/www/encrypt/html;
        index index.html;

        location ~ /.well-known {
                allow all;
        }

        location / {
                try_files $uri $uri/ =404;
        }
}
```

Schedule renewal

```
EDITOR=vim sudo crontab -e
```

```
# crontab
27 1 * * * /usr/bin/certbot renew --quiet && systemctl reload nginx
```
