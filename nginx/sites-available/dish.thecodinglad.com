# Redirect HTTP traffic to HTTPS
server {
    listen 80;

    server_name dish.thecodinglad.com;

    return 301 https://$host$request_uri;
}

# Main server block
server {
    listen 443 ssl;
    ssl_certificate /etc/letsencrypt/live/thecodinglad.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/thecodinglad.com/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

    root /var/www/dish.thecodinglad.com/html;
    index index.html;

    server_name dish.thecodinglad.com;

    location = / {
        try_files $uri $uri/ =404;
    }
}
