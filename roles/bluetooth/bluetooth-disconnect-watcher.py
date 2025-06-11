#!/usr/bin/env python3
import dbus
import dbus.mainloop.glib
from gi.repository import GLib
import subprocess

# List of headset MAC addresses to watch
HEADSET_MACS = [
    "60:AB:D2:3D:68:A7", # FlutterComfort
    "EC:66:D1:C3:FA:D0", # Bower & Wilkins Pi6
    "08:C8:C2:D3:6F:59"  # Jabra Elite 8 Active
]


def properties_changed(interface, changed, invalidated, path):
    """Callback function that gets triggered on Bluetooth property changes."""
    if "Connected" in changed and not changed["Connected"]:
        bus = dbus.SystemBus()
        device = bus.get_object("org.bluez", path)
        device_props = dbus.Interface(device, "org.freedesktop.DBus.Properties")
        address = device_props.Get("org.bluez.Device1", "Address")

        if address in HEADSET_MACS:
            print(f"Bluetooth headset {address} disconnected.")
            _ = subprocess.run(["/usr/bin/playerctl", "pause"])

# Set up D-Bus event loop
dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
bus = dbus.SystemBus()

bus.add_signal_receiver(
    properties_changed,
    dbus_interface="org.freedesktop.DBus.Properties",
    signal_name="PropertiesChanged",
    path_keyword="path"
)

loop = GLib.MainLoop()
loop.run()
