awesome
=======

Installs and configures the awesome window manager.

## Variables

 * `awesome_install_path` (default `~/.config/awesome`)<br/>
   Location of the awesome configuration.

## Issues

### Dropbox icon

There is an issue with the sysicon systems. One possible fix is to run
`snixembed`. This has to be run before dropbox starts, so this can be fixed in
the systemctl configs:

```systemd
# In dropbox.service or dropbox.service.d/overrides.conf

[Unit]
Description=Dropbox
After=snixembed.service
```

Then have the `snixembed.service` file

```systemd
[Unit]
Description=snixembed

[Service]
Type=simple
ExecStart=/usr/bin/snixembed --fork
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure

[Install]
WantedBy=default.target
```
