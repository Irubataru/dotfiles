gpg
===

Installs gpg software and adds my public key.

## Using the yubikey

In order to register the yubikey as the signing agent it has to first be
imported, to do that run:

```
gpg --card-edit
fetch
```

If I get a no such device message then either restart the agent with

```
gpgconf --kill gpg-agent
```

or continue reading [yubico's troubleshooting
guide](https://support.yubico.com/support/solutions/articles/15000014892-troubleshooting-gpg-no-such-device).
