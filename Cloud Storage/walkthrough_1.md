# Generate a Customer-supplied encryption keys (CSEK)
#https://cloud.google.com/docs/security/encryption/customer-supplied-encryption-keys

To generate a key, run the command:

```py
python3 -c 'import base64; import os; print(base64.encodebytes(os.urandom(32)))'
```

Copy the content of the key

```sh
b'tmxElCaabWvJqR7uXEWQF39DhWTcDvChzuCmpHe6sb0=\n'
```

Exclude the `b'` and `\n'`. The encryption controls are contained in a gsutil configuration file named .boto. 
Return to the home directory to access the .boto file:

```sh
cd ~
ls -al
nano .boto
```
If the .boto file is empty, exit using `CTRL X` and run `gsutil config -n` to create a new boto file. Use the `gsutil version -l` to locate the .boto file path.

Open the .boto file, locate the line with `#encyption_keys=`. Uncomment the line, updating the line with the key.

You can verify the keys on google console as customer-managed

# Rotate the keys




