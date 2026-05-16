This project entails setting google cloud storage via console, uploading an object and setting the object publicly accessible.

## STEP 1
From Google cloud landing page, click on the harmburger icon, towards the top left, navigate to cloud storage(hover), click on buckets, click on create. This are bucket naming rules to take note of.

```sh
Bucket naming rules:

Do not include sensitive information in the bucket name, because the bucket namespace is global and publicly visible.

Bucket names must contain only lowercase letters, numbers, dashes (-), underscores (_), and dots (.). Names containing dots require verification.

Bucket names must start and end with a number or letter.

Bucket names must contain 3 to 63 characters. Names containing dots can contain up to 222 characters, but each dot-separated component can be no longer than 63 characters.

Bucket names cannot be represented as an IP address in dotted-decimal notation (for example, 192.168.5.4).

Bucket names cannot begin with the "goog" prefix. Bucket names cannot contain "google" or close misspellings of "google".*

Also, for DNS compliance and future compatibility, you should not use underscores (_) or have a period adjacent to another period or dash. For example, ".." or "-." or ".-" are not valid in DNS names.
```
- Choose a unique name
- Choose Region for Location type and choose a zone for for Location.
- Choose Standard for Set a default class.
- Choose Uniform for Access control and uncheck Enforce public access prevention on this bucket to turn it off.

## Uniform (Uniform Bucket-Level Access)

**Meaning:**  
Access is controlled only at the bucket level using IAM.

**Key points:**  
- ❌ No object-level permissions (ACLs disabled)  
- ✅ One permission model for the whole bucket  
- 🔐 IAM roles control everything (bucket + all objects)  
- 📦 All objects inherit the same access rules  
- 🚫 You cannot set permissions per file  

## Fine-grained Access (ACL-based)

**Meaning:**  
Access can be controlled at both:

- Bucket level (IAM)  
- Object level (ACLs)  

**Key points:**  
- ✅ Object-level permissions allowed (ACLs enabled)  
- ✅ You can make individual files public/private  
- ⚠️ More complex permission management  
- 🔀 Two systems to manage (IAM + ACL)  

>Unchecking “Public Access Prevention” does NOT make the bucket public, it only allows public access if explicitly configured.  
Your object is still private unless:  
- Grant allUsers the Storage Object Viewer role (IAM), or
- Make the object public via ACL (if enabled)  
- If Uniform Bucket-Level Access is ON, ACL changes won’t work — only IAM controls access.  


A GCS URL like  `https://storage.googleapis.com/bucket/object` and only works if the object is publicly readable or signed.  
If not public, it must use a Signed URL or authenticated access.

## To allow public access to the bucket and create a publicly accessible URL for the image:

- Click the Permissions tab above the list of files.
- Ensure the view is set to View by principals tab. Click Grant access to view the Add principals pane.
- In the New principals box, enter allUsers.
- In the Select a role drop‑down, select Cloud Storage > Storage Object Viewer.
- Click Save.
- In the `Are you sure you want to make this resource public?` window, click Allow public access.
