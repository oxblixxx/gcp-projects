# Set up a Cloud SQL instance
On the Navigation menu, navigate to SQL > Create instance > Choose MySql > Set up name > Set password > Set version > Set edition.
Expand the show configurations options to setup:
- Connections
- Storage
- Machine configurations etc.
  
In connections when you set private ip, for the network, you need to setup [private service connect](https://cloud.google.com/vpc/docs/private-service-connect), setup a cidr range or let google assign automatically. Then click create.

# Connect to CloudSQL VIA Internal IP
If you can host your application in the same region and VPC connected network as your Cloud SQL, you can leverage a more secure and performant configuration using Private IP.By using Private IP, you will increase performance by reducing latency and minimize the attack surface of your Cloud SQL instance because you can communicate with it exclusively over internal IPs. From the navigation menu, navigate to SQL and to the created SQL instance. Copy the private ip address of the SQL instance.

## Steps to Connect Using Service Accounts:
Check here on how to set up a  [service acount](https://github.com/oxblixxx/gcp-projects/blob/main/Exploring%20IAM/walkthrough_0.md)

# Configure a proxy on virtual machine
Google Cloud Platform's Cloud [SQL Auth Proxy](https://cloud.google.com/sql/docs/mysql/sql-proxy) is a utility used to create secure connections to Cloud SQL instances. When your application does not reside in the same VPC connected network and region as your Cloud SQL instance or If you need to connect from local machines or non-Google Cloud environments, use the Cloud SQL Auth Proxy for secure authentication., use a proxy to secure its external connection. Spin up a compute instance with a service account to only read from the MYSQL database.

![cloud_sql](images/cloud_sql_proxy.png)

SSH into the instance, Download the Cloud SQL Proxy and make it executable:

```sh
wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxy && chmod +x cloud_sql_proxy
```

From the MYSQL database console page, fetch the `CONNECTION NAME` and return to the compute engine console. Run the below command to activate the proxy connection to your Cloud SQL database and send the process to the background, press enter:

```sh
export SQL_CONNECTION=[SQL_CONNECTION_NAME]
echo $SQL_CONNECTION
./cloud_sql_proxy -instances=$SQL_CONNECTION=tcp:3306 &
```

Note: `Note: The proxy will listen on 127.0.0.1:3306 (localhost) and proxy that connects securely to your Cloud SQL over a secure tunnel using the machine's external IP address.`

Here is the command to make it listen on your prefferred ip-address and port:

```sh
./cloud-sql-proxy --address 0.0.0.0 --port 1234 INSTANCE_CONNECTION_NAME
```








