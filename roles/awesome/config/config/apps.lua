local terminal_cmd = "alacritty"

return {
  -- The default applications that we will use in keybindings and widgets
  default = {
    -- Default terminal emulator
    terminal = terminal_cmd,
    -- What program to run when opening a new terminal
    run_terminal = function(command)
      return terminal_cmd .. " -e " .. command
    end,
    -- What program to run when opening a new terminal
    open_terminal = terminal_cmd .. " -e tmux",
    -- Default web browser
    web_browser = "vivaldi-stable",
    -- Default text editor
    text_editor = "nvim",
    -- Default file manager
    file_manager = terminal_cmd .. " -e vifmrun",
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
    network_manager = terminal_cmd .. " -e nmtui",
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
    "picom -b --experimental-backends --dbus",
    -- Load X colors
    "xrdb $HOME/.Xresources",
    -- Lockscreen timer
    "xidlehook --not-when-fullscreen --not-when-audio --timer 600 'systemctl suspend' ''",
    -- Change keyboard map to default
    "setxkbmap no -option 'ctr:nocaps'",
    -- Start bluetooth manager
    "blueman-applet",
    -- Start network manager
    "nm-applet"
  },
}
