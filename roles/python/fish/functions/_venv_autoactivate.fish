function _venv_autoactivate --on-variable PWD
    set -l venv_bin
    set -l paths (string split -n '/' "$PWD")
    while test -n "$paths"
        set venv_bin /(string join / $paths)/.venv
        test -e "$venv_bin/bin/activate.fish"; and break
        set paths $paths[..-2]
    end
    test "$VIRTUAL_ENV" != "$venv_bin" -a -n "$VIRTUAL_ENV"
        and type -q deactivate; and deactivate
    test "$VIRTUAL_ENV" != "$venv_bin" -a -e "$venv_bin/bin/activate.fish"
        and PATH=$PATH source "$venv_bin/bin/activate.fish"
    return 0
end
