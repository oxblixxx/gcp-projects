# Deploy Hello World App
In this project we will be working with a service called Error reporting which helps you track and understand errors in your applications. It automatically collects and aggregates errors produced by your applications, providing insights into the health of your services. We will be testing with a decoy application.
On the cloud shell console, create an app engine application with the below commands:
```sh
mkdir appengine-hello
cd appengine-hello
gsutil cp gs://cloud-training/archinfra/gae-hello/* .
```

Run the app with the below command:
```sh
dev_appserver.py $(pwd)
```

And use web-preview, alter with `CTRL C` afterwards.

Deploy the application:

```sh
gcloud app deploy app.yaml
```

Choose a region while prompted and respond with Y, verify the deployment and click the link:

```sh
gcloud app browse
```

# Break the code
In the `main.py` it uses an import, break it to detect it in the `error reporting` service:

```sh
sed -i -e 's/webapp2/webapp22/' main.py
```

Verify the changes with:

```sh
cat main.py
```

Redeploy the application, if needed press CTRL C:

```sh
gcloud app deploy app.yml --quiet
gcloud app browse
```


# Exploring Error Reporting Service
On the navigation menu, navigate to `Error Reporting`, there should be the app error there `ImportError: No module named webapp22`





