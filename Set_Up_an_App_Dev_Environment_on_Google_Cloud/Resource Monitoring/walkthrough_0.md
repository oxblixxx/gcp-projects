# Create a Cloud Monitoring workspace
[Cloud monitoring](https://docs.cloud.google.com/monitoring/docs) metrics that depend on the agent (agent.googleapis.com/*) will not appear in Metrics Explorer or Alerting until the agent is installed on a vm. The agent is a daemon.  Without the agent, an example of the below metric can be fetched:

- CPU usage
- Network traffic
- Disk I/O
- VM status/uptime

But you OS-level metrics like below won't be fetched:

- Memory/RAM usage
- Filesystem usage
- Process/service metrics
- Application metrics/logs

To download an [ops-agent](https://docs.cloud.google.com/monitoring/agent/ops-agent/installation) on a VM. Run the below command:

```sh
curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
sudo bash add-google-cloud-ops-agent-repo.sh --also-install
sudo systemctl status google-cloud-ops-agent"*"
q
sudo apt-get update
```

While downloading the above is manual, the ops-agent can be enabled for installation automatically during compute engine creation under `Observalability`. By default, it is enabled!

# Creating Notification Channel

Creating a notification channel allows Google Cloud Monitoring alerts to be sent to preferred platforms such as:

- Email
- Slack
- PagerDuty
- SMS
- Webhooks

Navigate to:

```sh
Monitoring > Alerting
```

Click:

>Edit Notification Channels

Then add your preferred notification channel.

## Creating an Email Notification Channel
Under the Email section, click Add New
Enter:
Display name
Email address
Click Save

Once configured, the notification channel can be attached to alerting policies to receive alerts whenever monitoring conditions are triggered.


---

# Uptime Monitoring
Uptime checks are used to monitor the availability and responsiveness of a service endpoint. A similar opensource tool of this is `UPTIME-KUMA`


## Steps to Create an Uptime Check

1. Go to:

```sh
Monitoring > Uptime checks
```
Click:
- Create Uptime Check


### Configuration

Set the following:

- Protocol: HTTP / HTTPS / TCP
- Resource Type: Select target resource
- Hostname: Enter domain or IP
- Path: (Optional) e.g. /health for backend services
- Check Frequency: Keep default
- Response Validation, Set expected status code (e.g. 200 OK) to confirm service health
- Choose name
- Select an existing notification channel (e.g. email, Slack). 

# Resource grouping
In the left navigation pane under Monitoring, click Groups, then select `+ Create Group`. Enter a name for the group, and in the Criteria section choose the appropriate resource identifier (such as tags or resource type). Click Done, then click Create to complete the group setup.

# Create Alerting
Navigate to Monitoring > Alerting > Create policy
For the `Policy configuration mode`. Builder specifically is UI based and simple, PromQL is based on prometheus query and for broad usage. Here is a list of [available metrics](https://docs.cloud.google.com/monitoring/api/metrics_gcp). To create alerts based on thresholds or specific conditions. Click Create Policy, then select the desired metric. Choose filter (CHOOSE GROUP, if it has been created earlier).

>If needed, uncheck Active—this allows you to include metrics that may not be currently reporting data but still have historical metric streams. When Active is enabled, only metrics that have reported data within the last ~25 hours are shown.


Next, configure the trigger by setting the condition name and defining the threshold. Click Next, then add a notification channel and manage alert notifications.

Finally, set a name for the alert policy and click Create Policy to complete the setup.

# Create monitoring
Metrics collected by Google Cloud Platform Monitoring can be visualized using custom charts and dashboards. In simple terms, Monitoring combines alerting and visualization (widgets).

To create a dashboard, navigate to Operations > Monitoring > Dashboards, then click Create Dashboard. Select Add Widget, and choose the appropriate visualization type based on your metric—for example, for example: Gauge is suitable for CPU utilization, while a Line chart is ideal for network interface metrics.

Next, set a widget title, click Select a Metric, and browse through the available metric categories. Apply any necessary filters (such as instance, zone, or resource type) to refine the data being displayed.

# Logging






