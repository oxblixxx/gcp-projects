# Google Cloud IAM Roles (Basic vs Service-Specific)

In Google Cloud, roles are used to control what users can access and do.

---

## 1. Basic Roles (Project-Level)

Google Cloud provides three main **basic roles**:

| Role | Description |
|------|------------|
| Viewer | Read-only access to all resources in the project |
| Editor | Can read and modify most resources |
| Owner | Full control of the project, including IAM management |

### Key points:
- Applied at **project level**
- Grants **broad access across all services**
- Includes Console visibility and navigation
- Not recommended for least-privilege setups

---

## 2. Service-Specific IAM Roles (Fine-Grained Access)

Google Cloud also provides roles limited to specific services like Cloud Storage:

### Common Cloud Storage roles:

| Role | Description |
|------|------------|
| Storage Object Viewer | Read-only access to objects |
| Storage Object Admin | Full control of objects |
| Storage Admin | Full control of buckets and objects |

### Key points:
- Applied at **service or resource level**
- Does NOT grant full project access
- Follows **least-privilege principle**
- More secure and recommended for production

---

## 3. Example Scenario

A user is given only:

```sh
Cloud Storage > Storage Object Viewer
```

#### What they can do:
- Access and read objects in Cloud Storage
- Run CLI commands like:

```sh
gcloud storage ls gs://YOUR_BUCKET_NAME
```

#### What they CANNOT do:
- Access other Google Cloud services
- Fully browse resources in the Console
- View project-wide resources

#### To set this
- Navigate to IAM from the console with user1
- Highlight and copy the user2 principal also note the the existing role, if they have `viewer`. 
- Click on the pencil icon to edit, then delete and save. 
- Then click on Grant access, put in the principal name, search for the relevant service, for this lab `storage viewer`. 
- Then create.

---

## 4. Console vs CLI Behavior

With the above access granted, user2 won't see buckets properly in the Google Cloud Console
Console requires additional project-level permissions

This happens because the Console needs permissions to:

- List project resources
- Load service metadata


To allow both:

✅ Console access + Storage access

Assign:

- Basic Role: Viewer (project-level visibility)
- Storage Object Viewer (Cloud Storage access)

Follow the steps above, but with a step ahead, add `basic role: viewer`
