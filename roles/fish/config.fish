# Disable the fish greeting
function fish_greeting
end

# Add paths
fish_add_path ~/.local/bin

# Abbreviations
abbr -a ... '../..'
abbr -a .... '../../..'

# Commands to run in interactive sessions
if status is-interactive

  # Set theme
  fish_config theme choose "kanagawa"

end
