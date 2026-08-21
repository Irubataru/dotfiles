if status is-interactive
    # Load atuin
    set -gx ATUIN_NOBIND true
    atuin init fish | source
end

function __atuin_user_key_bindings
    bind ctrl-r _atuin_search
    bind -M insert ctrl-r _atuin_search
end
