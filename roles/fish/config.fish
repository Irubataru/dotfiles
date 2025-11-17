# Disable the fish greeting
function fish_greeting
end

# Abbreviations
abbr -a ... '../..'
abbr -a .... '../../..'

# Commands to run in interactive sessions
if status is-interactive

  # Set theme
  fish_config theme choose "kanagawa"

end
