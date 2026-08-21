function fish_user_key_bindings
    bind ctrl-y end-of-line
    bind ctrl-n history-prefix-search-forward
    bind ctrl-n history-prefix-search-backward

    functions -q __atuin_user_key_bindings; and __atuin_user_key_bindings
end
