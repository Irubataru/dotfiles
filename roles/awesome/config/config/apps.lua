local terminal_cmd = "wezterm"

local run_terminal_cmd = function(command)
  return "wezterm start -- " .. command
end

return {
  -- The default applications that we will use in keybindings and widgets
  default = {
    -- Default terminal emulator
    terminal = terminal_cmd,
    -- What program to run when opening a new terminal
    run_terminal = run_terminal_cmd,
    -- What program to run when opening a new terminal
    open_terminal = terminal_cmd,
    -- Default web browser
    web_browser = "brave",
    -- Default text editor
    text_editor = "nvim",
    -- Default file manager
    file_manager = run_terminal_cmd("vifmrun"),
    -- Default media player
    multimedia = "mpv",
    -- Default game, can be a launcher like steam
    game = "steam",
    -- Default graphics editor
    graphics = "gimp-2.10",
    -- Default sandbox
    sandbox = "virtualbox",
    -- Default IDE
    development = "rider",
    -- Default network manager
    network_manager = run_terminal_cmd("nmtui"),
    -- Default bluetooth manager
    bluetooth_manager = "blueman-manager",
    -- Default power manager
    power_manager = "xfce4-power-manager",
    -- Default locker
    lock = "dm-tool lock",
  },

  -- List of apps to start once on start-up
  run_on_start_up = {
    -- Compositor
    "picom -b --dbus",
    -- Load X colors
    "xrdb $HOME/.Xresources",
    -- Lockscreen timer
    "xidlehook --not-when-fullscreen --not-when-audio --timer 1800 'systemctl suspend' ''",
    -- Change keyboard map to default
    "setxkbmap no -option 'ctr:nocaps'",
    -- Start bluetooth manager
    "blueman-applet",
    -- Start network manager
    "nm-applet",
    -- Unclutter to hide mouse
    "unclutter",
  },
}
