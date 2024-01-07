# Create a virtual environment

Python virtual environments are used to isolate package installation from the system. Install the virtualenv environment:

```sh
sudo apt-get install -y virtualenv
```

Build the virtual environment:

```sh
python3 -m venv venv
```

Activate the virtual environment:

```sh
source venv/bin/activate
```

#  Install the client library
Run the following to install the client library:

```sh
pip install --upgrade google-cloud-pubsub
```

Below is a GitHub repository to python-pubsub client:

```sh
git clone https://github.com/googleapis/python-pubsub.git
```

In the `python-pubsub/samples/snippets` directory are script that demonstrates how to perform basic operations on topics with the Cloud Pub/Sub API. 

Run the publisher script to create Pub/Sub Topic:

```sh
python publisher.py $GOOGLE_CLOUD_PROJECT create MyTopic
```

This command returns a list of all Pub/Sub topics in a given project:

```sh
python publisher.py $GOOGLE_CLOUD_PROJECT list
```

# Create a subscription

Create a Pub/Sub subscription for topic with subscriber.py script:

```sh
python subscriber.py $GOOGLE_CLOUD_PROJECT create MyTopic MySub
```

For information about the subscriber script:

```sh
python subscriber.py -h
```

#  Publish messages

Publish the message "Hello" to MyTopic:

```sh
gcloud pubsub topics publish MyTopic --message "Hello"
```

# View messages

Use MySub to pull the message from MyTopic:

```sh
python subscriber.py $GOOGLE_CLOUD_PROJECT receive MySub
```
