# Google Cloud Storage via CLI

Create a cloud storage bucket with this command:

```sh
gcloud storage buckets create gs://<YOUR-BUCKET-NAME>
```

The bucket name has to be globally unique across Google Cloud Storage.

--- 

With familiarity with Linux commands, the arguments of `gcloud storage` become easier to understand, with commands similar to `ls`, `cp`, `rm`, and so on.

---

## Uploading Files

Upload a file from the current working directory to the bucket:

```sh
gcloud storage cp ada.jpg gs://YOUR-BUCKET-NAME
```

This copies a file located in the present working directory named `ada.jpg` to the bucket.

---

## Downloading Files

Copy a file from the bucket to the current local directory:

```sh
gcloud storage cp -r gs://YOUR-BUCKET-NAME/ada.jpg .
```

This downloads the object from Google Cloud Storage to the terminal's current working directory.

---

## Copying Objects Within a Bucket

Copy an object into another folder inside the same bucket:

```sh
gcloud storage cp gs://YOUR-BUCKET-NAME/ada.jpg gs://YOUR-BUCKET-NAME/image-folder/
```

This copies `ada.jpg` into the `image-folder` directory inside the bucket.

---

## Listing Bucket Contents

List all objects inside a bucket:

```sh
gcloud storage ls gs://YOUR-BUCKET-NAME
```

---

## Viewing Object Metadata

View detailed metadata of an object:

```sh
gcloud storage ls -l gs://YOUR-BUCKET-NAME/ada.png
```

This displays information such as:
- File size
- Creation date
- Storage class
- Object path

---

## Making an Object Public

Update the ACL to make an object publicly accessible:

```sh
gcloud storage objects update gs://YOUR-BUCKET-NAME/ada.jpg --add-acl-grant=entity=allUsers,role=READER
```

This grants public read access to the object.

Once public, the file can be accessed with a URL in this format:

```txt
https://storage.googleapis.com/YOUR-BUCKET-NAME/ada.jpg
```

---

## Important Note About Uniform Bucket-Level Access

If the bucket is configured with **Uniform Bucket-Level Access (UBLA)**:
- Object-level ACLs are disabled
- The command above for updating ACLs will not work
- Public access must instead be granted using IAM permissions

To allow public access in UBLA mode:
- Grant `allUsers`
- The role `Storage Object Viewer`

at the bucket level.

```sh
gcloud storage buckets add-iam-policy-binding gs://YOUR-BUCKET-NAME \
  --member="allUsers" \
  --role="roles/storage.objectViewer"
```

---

## Common `gcloud storage` Commands

| Command | Purpose |
|---|---|
| `cp` | Copy files |
| `ls` | List bucket contents |
| `rm` | Remove objects |
| `mv` | Move or rename objects |
| `rsync` | Synchronize directories |
| `objects update` | Modify object metadata or ACLs |
