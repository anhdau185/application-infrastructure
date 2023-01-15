# Nginx Configurations

Nginx acts as a reverse proxy for our cloud server. It also redirects traffic to the server in order to enfore HTTPS and ensure site domain coherence.

This folder contains crucial Nginx configurations for sites/applications hosted on our cloud Linux server.

## Directory Mapping

- `nginx/sites-available/*` maps to `/etc/nginx/sites-available/*` on the cloud Linux server.
- `nginx/static-assets/*` maps to `/var/www/*` on the cloud Linux server.

## Domains and subdomains

TBD.

## Steps to add a subdomain to Nginx server

TBD.
