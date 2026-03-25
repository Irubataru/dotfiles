function venv --description "Activate nearest .venv (fish) up to project root, deactivating existing venv"
    # Deactivate any currently active venv
    if set -q VIRTUAL_ENV
        if functions -q deactivate
            deactivate
        else if test -n "$VIRTUAL_ENV"
            # Fallback: try sourcing deactivate if present
            if test -f "$VIRTUAL_ENV/bin/deactivate.fish"
                source "$VIRTUAL_ENV/bin/deactivate.fish"
            end
        end
        return 0
    end

    set dir (pwd)

    while true
        set has_pyproject (test -f "$dir/pyproject.toml"; and echo 1; or echo 0)
        set has_git (test -d "$dir/.git"; and echo 1; or echo 0)

        # If this is a project root and there's no .venv here, stop
        if test $has_pyproject -eq 1 -o $has_git -eq 1
            if not test -d "$dir/.venv"
                echo "No .venv found up to project root ($dir)"
                return 1
            end
        end

        # If .venv exists here, try to activate it
        if test -d "$dir/.venv"
            if test -f "$dir/.venv/bin/activate.fish"
                source "$dir/.venv/bin/activate.fish"
                return 0
            else
                echo "Found $dir/.venv but no activate.fish"
                return 1
            end
        end

        # Move one directory up; stop at filesystem root
        set parent (dirname "$dir")
        if test "$parent" = "$dir"
            echo "No .venv found up to filesystem root"
            return 1
        end
        set dir "$parent"
    end
end
