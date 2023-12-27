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

