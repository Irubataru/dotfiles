# .Net

## Developer certificates

Getting developer certificates to work on Arch seems to still be a bit of a
struggle. What I did was to install and run the
[`linux-dev-certs`](https://github.com/tmds/linux-dev-certs) dotnet tool

```sh
dotnet tool update -g linux-dev-certs
dotnet linux-dev-certs install
```

Then in Vivaldi I had to go to `chrome://settings/certificates` and add the
certificate (it is located in
`/etc/ca-certificates/trust-source/anchors/aspnet-dev-[username].crt`). For some
reason I couldn't add it to certificates, but I could add it to anchors and
select "Trust this certificate for identifying websites".
