qutebrowser
===========

Installs qutebrowser and links configuration files.

## Notes

In the configuration file I have currently included the line

```py
c.qt.force_software_rendering = "chromium"
```

This is because of [this issue][issue] I was having with performance on
VirtualBox installations. Might think about making it install conditional in the
future.

[issue]: https://github.com/qutebrowser/qutebrowser/issues/5383
