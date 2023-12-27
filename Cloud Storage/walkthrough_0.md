# Create a storage bucket
On the Navigation Menu > Storage > Buckets. Click on Create bucket.

* Enter a globally unique name, have the name handy for use.
* Choose how to access control = fine grained
* Uncheck public access prevention

Copy a file to the bucket.
  
  
 # Setup access control list
Get the acl of the object in an acl

```sh
gsutil acl get gs://$BUCKET_NAME_1/<file_name>  > acl.txt
cat acl.txt
```
Here is the content of the acl.txt
```sh
[
  {
    "entity": "project-owners-484126842692",
    "projectTeam": {
      "projectNumber": "484126842692",
      "team": "owners"
    },
    "role": "OWNER"
  },
  {
    "entity": "project-editors-484126842692",
    "projectTeam": {
      "projectNumber": "484126842692",
      "team": "editors"
    },
    "role": "OWNER"
  },
  {
    "entity": "project-viewers-484126842692",
    "projectTeam": {
      "projectNumber": 
```
Setup the acl to private, run the:

```sh
gsutil acl set private gs://$BUCKET_NAME_1/setup.html
gsutil acl get gs://$BUCKET_NAME_1/setup.html  > acl2.txt
cat acl2.txt
```
Verify the content

```sh
[
  {
    "email": "student-02-776de84d4ec0@qwiklabs.net",
    "entity": "user-student-02-776de84d4ec0@qwiklabs.net",
    "role": "OWNER"
  }
]
```

Set the acl to public, run:

```sh
gsutil acl ch -u AllUsers:R gs://$BUCKET_NAME_1/setup.html
gsutil acl get gs://$BUCKET_NAME_1/setup.html  > acl3.txt
cat acl3.txt
```

Here is the content of acl3.txt

```sh
[
  {
    "email": "student-02-776de84d4ec0@qwiklabs.net",
    "entity": "user-student-02-776de84d4ec0@qwiklabs.net",
    "role": "OWNER"
  },
  {
    "entity": "allUsers",
    "role": "READER"
  }
]
```


