# Auth Service Workflows

This doc presents complete, step-by-step, easy-to-follow workflows to develop, deploy, and monitor the Auth Service.

## Local Development

It is recommended that you develop the service using the "local" method, whose setup guide is presented in the section [Getting Started](https://github.com/anhdau185/auth-service#getting-started), over the "Docker" way. This way you can benefit from hot loading, faster development time, and better development experience.

This workflow is very simple and straightforward:

- Make code changes
- Save and wait for watch mode to automatically reload the development server
- Checkout to a new branch, commit, and push to remote
- Create a pull request to `master`
- Review the changes and then merge the pull request

## Production Deployment

Using Docker containers is the way to go when deploying and running a service in a production environment because of the portability and reliability containers bring.

### On the Local Machine

1. Pull the latest code from `master` if necessary

2. Configuration

Prepare a production `.env` file by copying the project's sample file `.env.prod`:

```sh
cp .env.prod .env
```

and fill out all the empty fields in it with your own values.

3. Remove the existing Docker image to avoid a duplicate

Run this command and get the image ID of `anhdau185/auth-service:latest`:

```sh
docker images
```

and then remove that image with the ID you obtained:

```sh
docker rmi <image_ID>
```

4. Build a new image

Rebuild the image under the name `anhdau185/auth-service:latest`:

```sh
docker build --tag anhdau185/auth-service:latest .
```

Run the containers with `docker compose up --detach` and then check if things work as expected.

5. Push the newly built image to your Docker registry, so that your production server can easily pull it from the Internet:

```sh
docker push anhdau185/auth-service:latest
```

### On the Cloud Server

1. SSH to the server with `ssh <username>@<server_ip_address>`

2. Navigate to the directory on the server's file system that contains our Docker configurations with `cd ~/services`

3. We need to stop any containers that are already running on the server before proceeding

```sh
docker compose down
```

4. Copy `.env` and `docker-compose.yml` files from [application-infrastructure/docker](https://github.com/anhdau185/application-infrastructure/tree/main/docker) to this folder on the server

5. Fill out all the empty fields in the `.env` file above with your own values

6. Pull the latest Docker images

```sh
# postgres image
docker pull postgres:13-alpine

# backend app image
docker pull anhdau185/auth-service:latest
```

7. Remove the old image

Run this command and get the ID of the `anhdau185/auth-service` image that's **untagged**:

```sh
docker images
```

and then remove that image with the ID you obtained:

```sh
docker rmi <image_ID>
```

8. Start all services

```sh
docker compose up --detach
```

9. Schema migrations

If you are running the service for the first time or anytime the database schema is changed (which leads to a generation of a new migration file), you will need to run schema migrations before the service becomes actually usable.

To do this with your backend app running inside a Docker container, run the command:

```sh
docker exec auth yarn migration:run
```

10. Final health-check: Check if the Nginx server is active and all containerized services are up

```sh
sudo systemctl status nginx
docker ps
```

If everything are OK, the service has gone live and is ready to serve!

## Monitoring the Production Server and Operational Services

### Server Power & Resources

To get an overview of how your server is operating and how its resources are being utilized:

- Go to https://cloud.digitalocean.com/droplets (and sign in if you haven't)
- Choose the correct droplet on which your services are running
- On the "Power" tab, you'll see your server's power status (turned on/powered off)
- On the "Graphs" tab, you'll see the live graphs of your server resources usage (CPU %, memory, storage, disk I/O, network I/O, etc.)

### Service Stats

To get a closer look at how each containerized service is utilizing the server resources:

- SSH to the server with `ssh <username>@<server_ip_address>`
- Get a list of running containers with `docker ps`, so that we can know the container names exactly
- Check the resource utilization of your target service with:

```sh
docker stats <container_name>
```
