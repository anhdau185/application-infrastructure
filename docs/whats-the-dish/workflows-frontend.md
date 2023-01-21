# What's The Dish (WTD) Frontend Workflows

This doc presents simple, straightforward, easy-to-follow workflows for developing and deploying the WTD web app.

## Local Development

This web app was bootstrapped from [Create React App](https://create-react-app.dev). The development workflow is super simple as you might guess:

- Bring up the development environment by following this guide: [Getting Started](https://github.com/anhdau185/whats-the-dish-web-app#getting-started)
- Make code changes
- Save and wait for watch mode to automatically refresh the app
- Checkout to a new branch, commit, and push to remote
- Create a pull request to `master`
- Review the changes and then merge the pull request

## Production Deployment

Deployment of a React app is just as simple.

1. Clean the old build on the server

SSH to the server with `ssh <username>@<server_ip_address>`, then remove the old build to pave the way for the new build:

```sh
rm -rf /var/www/dish.thecodinglad.com/html/*
```

When the removal completes, log out of the server with `exit`.

2. Build the app

Create a production build of the app:

```sh
yarn build
```

This will produce a `build` folder in the project's root directory.

3. Upload build files to the server

```sh
scp -r ./build/* <username>@<server_ip_address>:/var/www/dish.thecodinglad.com/html
```

When the command above completes, deployment is finished. Since a React app is built of static files that only need a browser, you don’t need any further server-side configurations. Open your web browser and navigate to your domain name, you will find your React app there.

## Read More

Check out this helpful article from DigitalOcean Community: https://www.digitalocean.com/community/tutorials/how-to-deploy-a-react-application-with-nginx-on-ubuntu-20-04
