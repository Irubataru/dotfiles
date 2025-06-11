if status is-interactive

    # Load atuin
    set -gx ATUIN_NOBIND true
    atuin init fish | source

    # Keybinds
    bind ctrl-r _atuin_search
    bind -M insert ctrl-r _atuin_search

end
