# Requesting an SSL Certificate for a Website

We will be using an SSL certificate granted by [Let's Encrypt](https://letsencrypt.org).

To request an SSL certificate for a domain using your shell access, we will be using the [Certbot](https://certbot.eff.org) ACME client. Visit https://certbot.eff.org and follow the instructions presented there (choose Nginx server on Ubuntu 20 to get the correct guide). Remember to request a wildcard certificate for `*.thecodinglad.com` instead of a default one so that we won't have to request multiple certificates for all of our subdomains.
