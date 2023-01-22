# Docker on the Cloud Server

Configurations for Docker on the cloud Linux server.

The configurations contained in this folder corresponds to `~/services` on the server.

## Spinning Up and Shutting Down Services

To start containers on the server:

- SSH to the server with `ssh <username>@<server_ip_address>`

- Navigate to the directory mentioned above with `cd ~/services`

- Make sure the configurations are up-to-date (same as those in this folder)

- Start the services:

```sh
docker compose up --detach
```

To stop containers on the server:

```sh
docker compose down
```

## Accessing DigitalOcean Private Docker Registry

1. Retrieve the personal access token

- Go to https://cloud.digitalocean.com/account/api/tokens
- Retrieve the token value for `registry_digitalocean_token`
- Copy the token to your clipboard and move on to Step 2

2. Authentication

Start the authentication process:

```sh
docker login
```

You will be prompted to enter the credentials. Simply paste the token you copied in Step 1 into both username and password fields.

If authentication succeeds, you are good to go! Now you can pull/push your Docker images from/to DigitalOcean Container Registry.
