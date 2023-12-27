# Task 1: Create a bucket 

On navigation menu, navigate to storage, then buckets.
Create a bucket, setting the name as a globally unique name, set region as multi-region, then create the bucket
Enforce public access then click on confirm. Upload files to the bucket
(images/gcp_iam-1.png)[gcp]
Check username 2 to see they can view, then remove there viewer role afterwards. Click save.

[gcp_iam]



# Task 2: Add storage access

Create a grant access role for user two, copy the value for there username, 
On the username 1 console, proceed to IAM, click on Grant access, put the username as the principal, then for product, select cloud storage, for role, select object viewer


# Setup service account
On the IAM & ADMIN page, select service accounts. Create service account, set a descriptive name for the service account name
then click on create and continue, click select a role, for service cloud storage>object viewer
Click on the 3 dots. manage permissions. click on grant access. For the principal, uwe will be using an imaginary name,
for products choose	Service Accounts > Service Account User. CLick on save
