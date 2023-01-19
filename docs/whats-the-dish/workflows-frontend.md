# What's The Dish (WTD) Frontend Workflows

This doc presents simple, straightforward, easy-to-follow workflows for developing and deploying the WTD web app.

## Local Development

This web app was bootstrapped from [Create React App](https://create-react-app.dev). The development workflow is super simple as you might guess:

- Make code changes
- Save and wait for watch mode to automatically refresh the app
- Checkout to a new branch, commit, and push to remote
- Create a pull request to `master`
- Review the changes and then merge the pull request

## Production Deployment

Deployment of a React app is just as simple.

1. Build the app

Create a production build of the app:

```sh
yarn build
```

This will produce a `build` folder in the project's root directory.

2. Upload build files to the server

```sh
scp -r ./build/* <username>@<server_ip_address>:/var/www/dish.thecodinglad.com/html
```

When the command above completes, deployment is finished. Since a React app is built of static files that only need a browser, you don’t need any further server-side configurations. Open your web browser and navigate to your domain name, you will find your React app there.
