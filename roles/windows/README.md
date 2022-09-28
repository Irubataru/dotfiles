Windows issues
==============

## Boot manager problems

Windows can be a shit and overwrite the boot manager on updates. It then needs
to be reset which can be done with the following command:

```batch
bcdedit /set {bootmgr} path \EFI\GRUB\grubx64.efi
```

The last bit is the location of the boot loader which will be different for
different systems, but it is where the arch wiki suggests installing it.
