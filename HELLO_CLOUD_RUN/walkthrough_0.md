## Enable the Cloud Run API and configure your Shell environment
Enabling the cloud run will be done via the cloud shell, navigate to the cloud shell and open it, the [gcloud service](https://docs.cloud.google.com/sdk/gcloud/reference/services/enable) command will be used to enable the apis. The [app run](https://docs.cloud.google.com/run/docs/reference/rest) and the [artifact registry](https://docs.cloud.google.com/artifact-registry/docs/reference/rest?hl=en&rep_location=global) rest service name can be found here.
Run this command to enable the apis

```sh
gcloud services enable run.googleapis.com artifactregistry.googleapis.com
```

Then set the compute region to be used

```sh
gcloud config set compute/region us-central1
```

Also set the location environment variable, which will be used later in the lab

```
LOCATION="us-central1"
```

## Write the sample application
On the terminal, create a directory to nest the application.

```sh
mkdir hello-world && cd hello-world
```

Create a simple package.json file

```sh
nano package.json
```
paste the content below in the file
```json
{
  "name": "helloworld",
  "description": "Simple hello world sample in Node",
  "version": "1.0.0",
  "main": "index.js",
  "scripts": {
    "start": "node index.js"
  },
  "author": "Google LLC",
  "license": "Apache-2.0",
  "dependencies": {
    "express": "^4.17.1"
  }
}
```
Also create an index.js file

```sh
nano index.js
```

```js
const express = require('express');
const app = express();
const port = process.env.PORT || 8080;

app.get('/', (req, res) => {
  const name = process.env.NAME || 'World';
  res.send(`Hello ${name}!`);
});

app.listen(port, () => {
  console.log(`helloworld: listening on port ${port}`);
});
```


## Create an Artifact Registry repository
Create a docker repository

```sh
gcloud artifacts repositories create my-repository \
    --repository-format=docker \
    --location=$LOCATION \
    --description="Docker repository"
```

Configure Docker to authenticate requests for Artifact Registry in your region:

```sh
gcloud auth configure-docker $LOCATION-docker.pkg.dev
```

## Containerize your app and upload it to Artifact Registry

Create a docker file

```sh
nano dockerfile
```


```dockerfile
# Use the official lightweight Node.js 12 image.
# https://hub.docker.com/_/node
FROM node:20-slim

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure copying both package.json AND package-lock.json (when available).
# Copying this first prevents re-running npm install on every code change.
COPY package*.json ./

# Install production dependencies.
# If you add a package-lock.json, speed your build by switching to 'npm ci'.
# RUN npm ci --only=production
RUN npm install --only=production

# Copy local code to the container image.
COPY . ./

# Run the web service on container startup.
CMD [ "npm", "start" ]
```
Use the docker build to build the dockerfile
```sh
gcloud builds submit --tag $LOCATION-docker.pkg.dev/$GOOGLE_CLOUD_PROJECT/my-repository/helloworld
```

Note the $GOOGLE_CLOUD_PROJECT, that the project id
Cloud Build is a service that executes your builds on Google Cloud. It executes a series of build steps, where each build step is run in a Docker container to produce your application container (or other artifacts) and push it to Artifact Registry, all in one command.

On the terminal run

```sh
docker run -d -p 8080:8080 $LOCATION-docker.pkg.dev/$GOOGLE_CLOUD_PROJECT/my-repository/helloworld
```
Click the preview on the cloud shell, that similar to codespaces preview, to preview the running app


## Deploy to Cloud Run

Run the dockerized application, here the [gcloud run](https://docs.cloud.google.com/sdk/gcloud/reference/run/deploy) command is used

```sh
gcloud run deploy helloworld \
    --image $LOCATION-docker.pkg.dev/$GOOGLE_CLOUD_PROJECT/my-repository/helloworld \
    --allow-unauthenticated \
    --region=$LOCATION
```






