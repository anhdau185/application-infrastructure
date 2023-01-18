# Docker on the Cloud Server

Configurations for Docker on the cloud Linux server.

The configurations contained in this folder corresponds to `~/services` on the server.

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
