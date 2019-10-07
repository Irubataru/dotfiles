# This script will add the WSL environment to the Windows Defender exclusion
# list so that realtime protection doesn't severely limit performance.
#
# Change the first variables as necessary to adopt to your system.
#
# Script based on this comment:
# https://github.com/Microsoft/WSL/issues/1932#issuecomment-407855346

$windows_user = "JonasGlesaaen"
$linux_user = "glesaaen"
$linux_package = "CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc"
$base_path = "C:\Users\" + $windows_user + "\AppData\Local\Packages\" + $linux_package + "\LocalState\rootfs"

$bin_dirs = $(
  "\bin",
  "\sbin",
  "\usr\bin",
  "\usr\sbin",
  "\usr\local\bin",
  "\home\" + $linux_user + "\.local\bin",
  "\home\" + $linux_user + "\.gem\ruby\2.5.0\bin"
)

$bin_dirs | ForEach { Add-MpPreference -ExclusionProcess ($base_path + $_ + "\*") }
Add-MpPreference -ExclusionPath $base_path
