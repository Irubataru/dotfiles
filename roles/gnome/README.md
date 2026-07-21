# Gnome

## Searching for conflicting keybinds

Finding conflicting keybinds in Gnome can be quite frustrating. The first
approach would be to inspect `gsettings` for keybinds

```bash
gsettings list-recursively | grep -i "{keybind grep}"
```

If this does not work, then one can do the following

```bash
for schema in $(gsettings list-schemas); do
  result=$(gsettings list-recursively $schema 2>/dev/null | grep -i "{keybind grep}")
  if [ -n "$result" ]; then
    echo "$schema: $result"
  fi
done
```

I have tried to unbind the most annoying keybinds that I use on the role script.

## Monitor actions

Gnome is lacking some of the monitor actions that I like such as switching focus
to the next monitor and moving a window to another monitor. I have made an
extension that adds these two features.

To install the extension

```bash
# Create necessary folders
mkdir -p ~/.local/share/gnome-shell/extensions

# Symlink the extension code to the local gnome-shell extensions folder
ln -s monitor-actions-extension ~/.local/share/gnome-shell/extensions/monitor-actions@local/

# Re-log to restart Wayland

# Enable the extension
gnome-extensions enable monitor-actions@local
```

Then, the actions can be executed as

```bash
# Focus other monitor
gdbus call --session \
  --dest org.gnome.Shell \
  --object-path /org/gnome/MonitorActions \
  --method org.gnome.MonitorActions.FocusOther

# Move window
gdbus call --session \
  --dest org.gnome.Shell \
  --object-path /org/gnome/MonitorActions \
  --method org.gnome.MonitorActions.MoveToOther
```

These can also be bound to e.g. `Ctrl+Super+j` and `Super+o`.
