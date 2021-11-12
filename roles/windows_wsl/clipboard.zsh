clipcopy() {
  clip.exe < "${1:-/dev/stdin}"
}

clippaste () {
  powershell.exe -noprofile -command Get-Clipboard
}
