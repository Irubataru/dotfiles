import Gio from "gi://Gio";

const OBJECT_PATH = "/org/gnome/MonitorActions";
const INTERFACE = `
<node>
  <interface name="org.gnome.MonitorActions">
    <method name="FocusOther"/>
    <method name="MoveToOther"/>
  </interface>
</node>`;

export default class MonitorActionsExtension {
  enable() {
    this._dbusImpl = Gio.DBusExportedObject.wrapJSObject(INTERFACE, this);
    this._dbusImpl.export(Gio.DBus.session, OBJECT_PATH);
  }

  disable() {
    this._dbusImpl.unexport();
    this._dbusImpl = null;
  }

  FocusOther() {
    const ws = global.workspace_manager.get_active_workspace();
    const current = global.display.focus_window;
    const currentMonitor = current ? current.get_monitor() : -1;

    const other = ws
      .list_windows()
      .filter(
        (w) =>
          !w.minimized &&
          !w.is_skip_taskbar() &&
          w.get_monitor() !== currentMonitor,
      )[0];

    if (other) {
      other.activate(global.get_current_time());
    }
  }

  MoveToOther() {
    const current = global.display.focus_window;
    if (!current) return;

    const currentMonitor = current.get_monitor();
    const nMonitors = global.display.get_n_monitors();
    const otherMonitor = (currentMonitor + 1) % nMonitors;

    current.move_to_monitor(otherMonitor);
  }
}
