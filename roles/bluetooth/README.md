# Bluetooth

In order to make it so that disconnecting a bluetooth headset also pauses media
playback, I had to write a script that listens for these events for specific
devices and calls pause for playerctl. Which devices (MAC addresses) is
hard-coded in the script. I have the devices I have, so I don't think there is
any need to customize that per install.

To add a new device, simply add its address to the
`bluetooth-disconnect-watcher.py` script. You can find the address by calling

```bash
bluetoothctl devices
```
