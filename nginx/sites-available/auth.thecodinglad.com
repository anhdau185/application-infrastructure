# Redirect HTTP traffic to HTTPS
server {
    listen 80;
    listen [::]:80;

    server_name auth.thecodinglad.com;

    return 301 https://$host$request_uri;
}

# Main server block
server {
    listen 443 ssl;
    listen [::]:443 ssl;
    ssl_certificate /etc/letsencrypt/live/thecodinglad.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/thecodinglad.com/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

    server_name auth.thecodinglad.com;

    location / {
        proxy_pass http://127.0.0.1:3000/;
    }
}
