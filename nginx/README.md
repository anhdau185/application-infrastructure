# Nginx Configurations

Nginx acts as a reverse proxy for our cloud server. It also redirects traffic to the server in order to enfore HTTPS and ensure site domain coherence.

This folder contains crucial Nginx configurations for sites/applications hosted on the cloud Linux server.

## Directory Mapping

- `nginx/sites-available/*` corresponds to `/etc/nginx/sites-available/*` on the cloud Linux server.
- `nginx/static-assets/*` corresponds to `/var/www/*` on the cloud Linux server.

## Domains and subdomains

- https://thecodinglad.com: Personal website and blog by Anh Dau
- https://dish.thecodinglad.com: What's The Dish - A web app to set aside your favorite dishes and recipes.
- https://auth.thecodinglad.com: Centralized, dedicated authentication server for all consumer apps and microservices.

## Steps to add a subdomain to Nginx server

Make sure you own a domain name (e.g. _example.com_) and that domain name has been added to DigitalOcean beforehand.

1. Add the subdomain to your DigitalOcean droplet

- Navigate to https://cloud.digitalocean.com/networking/domains and choose a domain.
- Add an A record with your desired hostname and the droplet you want to direct to.
- Hit "Create Record"

2. Set up a new document root directory

Given your subdomain is _sub.example.com_, your document root directory should be `/var/www/sub.example.com/html`. Create it with:

```sh
mkdir -p /var/www/sub.example.com/html
```

(If your Nginx server block is going to direct traffic to a service, not to serve a static page, skip this step.)

3. Create or copy static files of your website to the above folder on the server

By convention, there should be an entrance HTML file named `index.html` among your static files. One example would be a React project's `build` folder, which is built and optimized for production use.

(If your Nginx server block is going to direct traffic to a service, not to serve a static page, skip this step.)

4. Create a server block for the new subdomain

Create a new Nginx server block file:

```sh
touch /etc/nginx/sites-available/sub.example.com
```

Now open this file to add configurations with Vim editor:

```sh
vim /etc/nginx/sites-available/sub.example.com
```

To start, you can refer existing server block files in the same directory (like `dish.thecodinglad.com` or `auth.thecodinglad.com`).

5. Register your new server block(s) to Nginx

```sh
sudo ln -s /etc/nginx/sites-available/sub.example.com /etc/nginx/sites-enabled/
```

6. Apply the changes

First, test to make sure there are no syntax errors in any of your Nginx files:

```sh
sudo nginx -t
```

If no problems were found, restart Nginx to enable your changes:

```sh
sudo systemctl restart nginx
```

Nginx should now be serving your new subdomain.

## Read more

Check out this helpful guide from the DigitalOcean Community: https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04
