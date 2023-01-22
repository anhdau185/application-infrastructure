# Requesting an SSL Certificate for a Website

We will be using an SSL certificate granted by [Let's Encrypt](https://letsencrypt.org).

To request an SSL certificate for a domain with shell access, follow instructions presented in https://certbot.eff.org (choose Nginx server on Ubuntu 20). Remember to request a wildcard certificate so that we won't have to request multiple certificates for our subdomains.
