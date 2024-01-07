Google Cloud Pub/Sub is an asynchronous global messaging service. There are three terms in Pub/Sub that appear often: topics, publishing, and subscribing.

A topic is a shared string that allows applications to connect with one another through a common thread.

Publishers push (or publish) a message to a Cloud Pub/Sub topic.

Subscribers make a "subscription" to a topic where they will either pull messages from the subscription or configure webhooks for push subscriptions. Every subscriber must acknowledge each message within a configurable window of time.

To sum it up, a producer publishes messages to a topic and a consumer creates a subscription to a topic to receive messages from it.

# Pub/Sub topics
Run the following command to create a topic called myTopic, For good measure, create two more topics:
```sh
gcloud pubsub topics create myTopic
```

To see the three topics you just created, run the following command:

```sh
gcloud pubsub topics list
```

You can use the `delete` verb to delete:

```sh
gcloud pubsub topics delete <topic-name>
```

# Pub/Sub subscriptions
Run the following command to create a subscription called mySubscription to topic myTopic:

```sh
gcloud  pubsub subscriptions create --topic myTopic mySubscription
```

Run the following command to list the subscriptions to myTopic:

```sh
gcloud pubsub topics list-subscriptions myTopic
```

To delete the subscriptions. Run the following command:

```sh
gcloud pubsub subscriptions delete <subscription-name>
```

Run the list-subscriptions command to see the available subscriptions:

```sh
gcloud pubsub topics list-subscriptions myTopic
```

# Pub/Sub publishing and pulling a single message

Run the following command to publish the message "hello" to the topic you created previously (myTopic), this generates a unique `messageIds`:

```sh
gcloud pubsub topics publish myTopic --message "Hello"
```

Use the pull command to get the messages from your topic. The pull command is subscription based, meaning it should work because earlier you set up the subscription mySubscription to the topic myTopic.

```sh
gcloud pubsub subscriptions pull mySubscription --auto-ack
```

Using the pull command without any flags will output only one message, even if you are subscribed to a topic that has more held in it. Once an individual message has been outputted from a particular subscription-based pull command, you cannot access that message again with the pull command.

# Pub/Sub pulling all messages from subscriptions

Add a flag to your command so you can output all three messages in one request.

```sh
gcloud pubsub subscriptions pull mySubscription --auto-ack --limit=3
```

