# Synchronize a directory to a bucket

#https://en.wikipedia.org/wiki/Rsync

Create a directory on your baremetal and sub-directories.

```sh
mkdir firstlevel
mkdir ./firstlevel/secondlevel
cp setup.html firstlevel
cp setup.html firstlevel/secondlevel
```

Run this command to rsync the folder directory to the bucket:

```sh
gsutil rsync -r ./firstlevel gs://$BUCKET_NAME_1/firstlevel
```
Check the console to confirm the directory.


# Cross-projcet sharing
To share project across a project, create a service account in project b for an example, with the role setting the least priviledge. After creating the service account, cick on the 3 dots of the service account, click on manage keys, add key, set file type as JSON. This downloads the key. Return to project a, for this project, I authorized the key on a compute engine instance, ssh into the instance, upload the key. Then run this command:

```sh
gcloud auth activate-service-account --key-file <key-file-name>.json
```

Then run commands in the scope of the role assigned to the principal. To edit the principal priviledges, proceed to the project of the 

To download [Google cloud sdk](https://cloud.google.com/sdk/docs/install)
