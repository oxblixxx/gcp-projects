# Create a GLOBAL VPC

Using the cloudshell create vpc network

```sh
gcloud compute networks create vpc-demo --subnet-mode custom
```

Create two subnets in different region

```sh
gcloud compute networks subnets create vpc-demo-subnet1 \
--network vpc-demo --range 10.1.1.0/24 --region "us-east4"
```

```sh
gcloud compute networks subnets create vpc-demo-subnet2 \
--network vpc-demo --range 10.2.1.0/24 --region us-east1
```

Create a firewall, this firewall allows a range of port which is not best security practices

```sh
gcloud compute firewall-rules create vpc-demo-allow-custom \
  --network vpc-demo \
  --allow tcp:0-65535,udp:0-65535,icmp \
  --source-ranges 10.0.0.0/8
```

Create a firewall rule to allow ssh

```sh
gcloud compute firewall-rules create vpc-demo-allow-ssh-icmp \
    --network vpc-demo \
    --allow tcp:22,icmp
```

Create an instance as well in both subnets

```sh
gcloud compute instances create vpc-demo-instance1 \
--machine-type=e2-medium \
--zone us-east4-a \
--subnet vpc-demo-subnet1
```

```sh
gcloud compute instances create vpc-demo-instance2 \
--machine-type=e2-medium \
--zone us-east1-b \
--subnet vpc-demo-subnet2
```

# Create VPC SIMULATES ON-PREM

Create a VPC 

```sh
gcloud compute networks create on-prem --subnet-mode custom
```

Create a subnet

```sh
gcloud compute networks subnets create on-prem-subnet1 \
--network on-prem --range 192.168.1.0/24 --region us-east4
```

Create a firewall, this firewall allows a range of port which is not best security practices

```sh
gcloud compute firewall-rules create on-prem-allow-custom \
  --network on-prem \
  --allow tcp:0-65535,udp:0-65535,icmp \
  --source-ranges 192.168.0.0/16
```

Create a firewall to accept SSH

```sh
gcloud compute firewall-rules create on-prem-allow-ssh-icmp \
    --network on-prem \
    --allow tcp:22,icmp
```

Create an instance in a zone different from the one used in Global VPC.

```sh
gcloud compute instances create on-prem-instance1 --machine-type=e2-medium --zone us-east4-b --subnet on-prem-subnet1
```


# SETUP HA VPN GATEWAY

Create a HA gateway VPN in the VPC NETWORK 
```sh
gcloud compute vpn-gateways create vpc-demo-vpn-gw1 --network vpc-demo --region us-east4
```

Create a HA gateway VPN in the ON-PREM network

```sh
gcloud compute vpn-gateways create on-prem-vpn-gw1 --network on-prem --region us-east4
```


Verify the HA gateway VPN deployment

```sh
gcloud compute vpn-gateways create vpc-demo-vpn-gw1 --network on-prem --region us-east4
gcloud compute vpn-gateways create on-prem-vpn-gw1 --network on-prem --region us-east4
```

#### https://cloud.google.com/sdk/gcloud/reference/compute/routers
#### https://www.arin.net/resources/guide/asn/
Create Cloud Routers

```sh
gcloud compute routers create vpc-demo-router1 \
    --region us-east4 \
    --network vpc-demo \
    --asn 65001
```

```sh
gcloud compute routers create on-prem-router1 \
    --region us-east4 \
    --network on-prem \
    --asn 65002
``
