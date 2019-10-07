Windows subsystems for linux
============================

The script sets the correct umask for WSL, and otherwise contains files
necessary to configure my Windows install.

## Windows Defender

Windows defender has a severe impact on performance in WSL due to its constant
monitoring of executable activities. Until they fix this, one should add all
every `$PATH` to the Windows Defender exclusion list. There is a powershell
script in this repo which does that, edit to fit the system you are installing
on.

## Clipboard

Clipboard support is achieved through [win32yank][win32yank]. First download the
latest release and place it somewhere on Windows, for example in 
`C:\Program Files`. Then in the WSL terminal, create a symbolic link to this
executable somewhere in your path. For neovim to recognise it as a clipboard
provider it must be names `win32yank.exe` with the filetype suffix.

## Keyboard layout

There are two things that seems to have to be done to get keyboard layouts
working, fixing the registry and installing the custom layout. The second is
pretty easy, but the first one needs some explanation.

### Fixing the registry

Which keyboard layouts are available to the user is stored in the
`Keyboard Layout\Preload` registry key. There are two sets that should be of
interest:

```
HKEY_CURRENT_USER\Keyboard Layout\Preload
HKEY_USERS\.DEFAULT\Keyboard Layout\Preload
```

Both of these should have a two values to begin with

```
(Default): (no value)
1: 00000809 #Norwegian
```

There should also be a key in `\Substitutes` signalling that the Norwegian
keyboard layout is registered under UK locale, which is how I prefer my system.

When this has been verified it is time to set the key permissions. This should
be set on the parent `\Keyboard Layout` key doing the following:

1. Right click and choose Permissions, then Advanced
2. Disable inheritance
3. Choose the `SYSTEM` access and change it to be a read only
4. Add a new rule that is a deny rule, and choose all of the write permissions

Repeat this for both keys, then verify that the subkeys are set to enable
inheritance.

## Fonts

## Terminal colours

Use [ColorTool][colortool] with the included itermcolors file.

## Git and CRLF

Remember to enable automatic crlf correction on all of your development that
mixes WSL and Windows, for example VBA development. This is configured on a
per-repo basis with the command

```
git config core.autocrlf true
```

[win32yank]: https://github.com/equalsraf/win32yank
[colortool]: github.com/Microsoft/console/releases
